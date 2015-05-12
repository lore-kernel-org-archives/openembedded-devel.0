Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id ACF0760138
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 03:50:15 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so91693561igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 20:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vHpqhSKZw/UiBVTBJwTKx2d4b6Y6WERBWs2y9Ni3KMM=;
	b=epyca5Y+AJ0hBjMo/AzKADjWXSZppsVvJmxUxPGgidQG7IAPkKKnN4setTHJ83hGOS
	ptyh7ND+rC+pXNHLqoUe7AuUZBQEyFvJzLjerYjWLzeXxlCHwy8KoRsXsOcEDoBKc7JI
	SpYKf8preWvz+ZMmJiYfqTyFXPVuUH5eXeHWdG6r8KivRjrRGZg7ldfgKE5BlDVecZP7
	SKLv7fGtfEOYaBxK/FojuY/y2jO+Qx1s99THjc34g4JciUZ+V6hmxgYsJSf+2TyfbQfl
	NmSTNWNZfTbmFFNJ3AxNVPpvWRODvyINALcVKuFwOCML1WgkueoDnzGObfWLnF06JKeA
	fcrw==
X-Received: by 10.107.12.158 with SMTP id 30mr16570883iom.61.1431402617174;
	Mon, 11 May 2015 20:50:17 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id f11sm11186678iod.7.2015.05.11.20.50.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 May 2015 20:50:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 May 2015 20:50:05 -0700
Message-Id: <1431402605-31587-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: Qt 5.4.1 loading libGLESv2.so directly and ignoring soname
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 May 2015 03:50:17 -0000

I'm seeing Qt 5.4.1 apps which use the eglfs platform plug-in exit soon
after startup with the following error:

  Failed to load libGLESv2

The issue seems to be that Qt 5.4.1 tries to dlopen "libGLESv2.so" at
runtime, but due to OE's packaging rules the libGLESv2.so symlink isn't
available.

As a temporary workaround I'm using the mesa patch below to force the
libGLESv2.so symlink out of libgles2-mesa-dev and into libgles2-mesa.

Strace shows:

 | ...
 | open("/usr/lib/libGLESv2.so.2", O_RDONLY|O_CLOEXEC) = 3
 | read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0\3\0\1\0\0\0\0`\36D4\0\0\0"..., 512) = 512
 | fstat64(3, {st_mode=S_IFREG|0755, st_size=50368, ...}) = 0
 | mmap2(0x441e6000, 51276, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x441e6000
 | mmap2(0x441f2000, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb000) = 0x441f2000
 | close(3)                                = 0
 | ...

ie the dynamic linker initially succeeds by using the soname, but then later:

 | ...
 | open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 20
 | fstat64(20, {st_mode=S_IFREG|0644, st_size=10354, ...}) = 0
 | mmap2(NULL, 10354, PROT_READ, MAP_PRIVATE, 20, 0) = 0xb76fb000
 | close(20)                               = 0
 | open("/lib/libGLESv2.so", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | open("/usr/lib/libGLESv2.so", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | munmap(0xb76fb000, 10354)               = 0
 | open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 20
 | fstat64(20, {st_mode=S_IFREG|0644, st_size=10354, ...}) = 0
 | mmap2(NULL, 10354, PROT_READ, MAP_PRIVATE, 20, 0) = 0xb76fb000
 | close(20)                               = 0
 | open("/lib/libGLESv2", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | open("/usr/lib/libGLESv2", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | munmap(0xb76fb000, 10354)               = 0
 | open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 20
 | fstat64(20, {st_mode=S_IFREG|0644, st_size=10354, ...}) = 0
 | mmap2(NULL, 10354, PROT_READ, MAP_PRIVATE, 20, 0) = 0xb76fb000
 | close(20)                               = 0
 | open("/lib/GLESv2.so", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | open("/usr/lib/GLESv2.so", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | munmap(0xb76fb000, 10354)               = 0
 | open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 20
 | fstat64(20, {st_mode=S_IFREG|0644, st_size=10354, ...}) = 0
 | mmap2(NULL, 10354, PROT_READ, MAP_PRIVATE, 20, 0) = 0xb76fb000
 | close(20)                               = 0
 | open("/lib/GLESv2", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | open("/usr/lib/GLESv2", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
 | munmap(0xb76fb000, 10354)               = 0
 | write(2, "Failed to load libGLESv2\n", 25Failed to load libGLESv2
 | ) = 25
 | rt_sigprocmask(SIG_UNBLOCK, [ABRT], NULL, 8) = 0
 | tgkill(438, 438, SIGABRT)               = 0
 | --- SIGABRT {si_signo=SIGABRT, si_code=SI_TKILL, si_pid=438, si_uid=0} ---
 | +++ killed by SIGABRT +++
 | Aborted


diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1857f3c..e2fad05 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -162,7 +162,17 @@ FILES_mesa-megadriver = "${libdir}/dri/*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
-FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
+
+# ------------------------------------------------------------------------------
+# Move the /usr/lib/libGLESv2.so symlink into the runtime package as workaround
+# for issues seem with Qt 5.4.1, which seems to try to dlopen libGLESv2.so using
+# a hardcoded filename (instead of relying on the dynamic linker and therefore
+# loading libGLESv2.so via it's soname).
+# ------------------------------------------------------------------------------
+FILES_libgles2-mesa = "${libdir}/libGLESv2.so.* ${libdir}/libGLESv2.so"
+FILES_SOLIBSDEV_libgles2-mesa = ""
+INSANE_SKIP_libgles2-mesa += "dev-so"
+
 FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"


