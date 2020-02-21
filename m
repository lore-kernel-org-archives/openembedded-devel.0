Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7663961774
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 18:18:35 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id y11so3074765wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 10:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I5KEECgtKz2bh19/8kpXlUCk/lP8Nzdo2EE0oaFHKzk=;
	b=sidZsxrRaBuDTOg2oHGpDiUdq0NyHr3DV/JhBknDcnkmjoOb6vV7SznKwyLcbcIrLC
	Zg+wK5V9sVPZtT6flYM6MwB4DKWAU67LqNPoz+GmCzF3e5Jxk7YtZ/VKQiaBvskcpuB/
	Uuz+lwFrTR27ZASPqbruQU8zXSvbj6DTAiVwPUC2TT0RI0NjwQhACZs1kW5aUztnK4cO
	h2OUecV+iJqxqF03FrgpxzGG4m6IOKfZFf1BYVYwzg+YEYtJQ4yxMElFC+1Il9EKt8iz
	FnL3pJHYD3MXCWeTiLEQ4FLfqlW+JqVoKovHJnHHN9SKTFn9+AmnBf4oQLaHV+BBB5f+
	d8zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I5KEECgtKz2bh19/8kpXlUCk/lP8Nzdo2EE0oaFHKzk=;
	b=rery0hvcchOxLk325JK/KTw8EqwXtGgU0lt57YHuUlkvF+SyzsFUlc8gMbrM+iAn/H
	V/SVRybxmLrKJjRfhoT/O1+uznYCM8Zj60fHxGcPdaRUefJ0fBCMyK0Pf9kx3jQApy8U
	rkL9DrAQTjYijd3AsJirg7O3Qs6uqUxvDFWZUk6SZHCMxasSA5AXXD1aQqvjGNkTGyEH
	PKuY/9u5eBfIRwlOYwZGrl+6UdQb6egLjH9r2OlAlulPXFWUHEDz+ojhGRn/iDEdoxlC
	DOq17XHPD7N/ar8j1FBkuG/8c/LhAWZQ4d3iYn8mZyY6XpSYpUl4olqZgbk0pN1H3ZOD
	heLQ==
X-Gm-Message-State: APjAAAV14EH4ixzmW6uOczPwBJUUUSdg8iPMFYx4Sfop/R3fdNZywVR+
	yjQdiO4a12XWOUaDfiM930U8D/1a
X-Google-Smtp-Source: APXvYqwxqYy/ZgmCRHcYQD5wPTm1B6dRDXa+bAeKM+cwvc1ELn3GnSgRunD44ybFHn4p9UiF04Oypw==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr50893079wro.263.1582309115708; 
	Fri, 21 Feb 2020 10:18:35 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	f127sm4506001wma.4.2020.02.21.10.18.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 10:18:34 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 18:18:32 +0000
Message-Id: <20200221181832.119222-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ostree: upgrade 2019.6 -> 2020.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2020 18:18:35 -0000

Also expose glib and gpgme in PACKAGECONFIG (which were always on).

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../{ostree_2019.6.bb => ostree_2020.2.bb}    | 28 +++++++++++++++----
 1 file changed, 22 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2019.6.bb => ostree_2020.2.bb} (88%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb b/meta-oe/recipes-extended/ostree/ostree_2020.2.bb
similarity index 88%
rename from meta-oe/recipes-extended/ostree/ostree_2019.6.bb
rename to meta-oe/recipes-extended/ostree/ostree_2020.2.bb
index bcf511b9025d..78f4cf588c64 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2020.2.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = " \
     glib-2.0 \
-    gpgme \
     e2fsprogs \
     libcap \
     zlib \
@@ -26,7 +25,7 @@ SRC_URI = " \
     gitsm://github.com/ostreedev/ostree \
     file://run-ptest \
 "
-SRCREV = "43706202f7de2ce0c829a46caab350ae1656f6ad"
+SRCREV = "c6085ebd5e27da35f43165eb614190665468f13a"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
@@ -36,11 +35,11 @@ inherit autotools bash-completion gobject-introspection gtk-doc manpages pkgconf
 
 # Package configuration - match ostree defaults, but without rofiles-fuse
 # otherwise we introduce a dependendency on meta-filesystems
-#
-# If running with ptest, both soup (for trivial-httpd) and xattr are required
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
+    glib \
+    gpgme \
     soup \
 "
 
@@ -49,6 +48,7 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG_class-native ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     builtin-grub2-mkconfig \
+    gpgme \
     soup \
 "
 
@@ -56,8 +56,10 @@ PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
 PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
+PACKAGECONFIG[glib] = "--with-crypto=glib"
 PACKAGECONFIG[gjs] = "ac_cv_path_GJS=${bindir}/gjs"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
+PACKAGECONFIG[gpgme] = "--with-gpgme, --without-gpgme, gpgme"
 PACKAGECONFIG[libarchive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libmount] = "--with-libmount, --without-libmount, util-linux"
 PACKAGECONFIG[manpages] = "--enable-man, --disable-man, libxslt-native docbook-xsl-stylesheets-native"
@@ -144,9 +146,21 @@ RDEPENDS_${PN} = " \
 RDEPENDS_${PN}-dracut = "bash"
 RDEPENDS_${PN}-mkinitcpio = "bash"
 RDEPENDS_${PN}_class-target = " \
-    gnupg \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gpgme', 'gnupg', '', d)} \
     ${PN}-switchroot \
 "
+
+#
+# Note that to get ptest to pass you also need:
+#
+#   xattr in DISTRO_FEATURES
+#   static ostree-prepare-root (PACKAGECONFIG_append_pn-ostree = " static")
+#   meta-python in your layers
+#   overlayfs in your kernel (KERNEL_EXTRA_FEATURES += "features/overlayfs/overlayfs.scc")
+#   busybox built statically
+#   /var/tmp as a real filesystem (not a tmpfs)
+#   Sufficient disk space (IMAGE_ROOTFS_SIZE = "524288") and RAM (QB_MEM = "-m 1024")
+#
 RDEPENDS_${PN}-ptest += " \
     attr \
     bash \
@@ -157,7 +171,10 @@ RDEPENDS_${PN}-ptest += " \
     grep \
     python3-core \
     python3-multiprocessing \
+    strace \
     tar \
+    util-linux \
+    xz \
     ${PN}-trivial-httpd \
     ${@bb.utils.contains('BBFILE_COLLECTIONS', 'meta-python', 'python3-pyyaml', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'gjs', 'gjs', '', d)} \
@@ -165,7 +182,6 @@ RDEPENDS_${PN}-ptest += " \
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils glibc-localedata-en-us"
 
 RRECOMMENDS_${PN} += "kernel-module-overlay"
-RRECOMMENDS_${PN}-ptest += "strace"
 
 SYSTEMD_SERVICE_${PN} = "ostree-remount.service ostree-finalize-staged.path"
 SYSTEMD_SERVICE_${PN}-switchroot = "ostree-prepare-root.service"
-- 
2.17.1


