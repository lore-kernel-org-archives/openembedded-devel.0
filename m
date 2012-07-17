Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr7Da-0004nv-BG
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 14:49:34 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so224907bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yWqC7T/hYH6WRTgp0QDCxoJ5B8vpCVRgWc/OsTOQBJQ=;
	b=Sy4afGFguSnE8UKGX/MJwUgyLSHJMw+y/L+qeW6Q1b07zS/u1sicTe7dnLS6BgcCxU
	+EcG4STzzhN5DGFb1D8ISGQYmmRQ8lsKXGH7ySzc/JFJ1Gtu/5r7he8Dy/avY1ulUaJ/
	hbLbKa5p0v4X83HX+BQ325ZccZRVPkfxm8JEQ5vyo7rdhH9yxcdBEzVrROeGcrtpsUTa
	CjvDEPeezkZfzAEUGKoVj9t7BllCC2+E13HA86LIEeWjYLhEOsZoXdevO7J1oO2h0SyF
	3r8F9IekeL22ijM+JBk6M7BhBa28Va0Qt8PvgLIdHaOKqTpwB50wejyzNLRc+5Pu7X3D
	CAXQ==
Received: by 10.204.152.211 with SMTP id h19mr1130058bkw.45.1342528697267;
	Tue, 17 Jul 2012 05:38:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n5sm5243062bkv.14.2012.07.17.05.38.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 05:38:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jul 2012 14:37:57 +0200
Message-Id: <1342528680-6336-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
References: <20120716175038.GL3729@jama.jama.net>
	<1342528680-6336-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: [meta-oe][PATCH 4/7] kernel.bbclass: add non-santized kernel provides
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 12:49:34 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

If the kernel version string uses characters or symbols that
need to be santized for the package name, we can end up with a
mismatch between module requirements and what the kernel
provides.

The kernel version is pulled from utsrelease.h, which contains
the exact string that was passed to the kernel build, not
one that is santized, this can result in:

 echo "CONFIG_LOCALVERSION="\"MYVER+snapshot_standard\" >> ${B}/.config

 <build>

 % rpm -qp kernel-module-uvesafb-3.4-r0.qemux86.rpm --requires
update-modules
kernel-3.4.3-MYVER+snapshot_standard
 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

At rootfs assembly time, we'll have a dependency issue with the kernel
providing the santizied string and the modules requiring the utsrelease.h
string.

To not break existing use cases, we can add a second provides to the
kernel packaging with the unsantized version string, and allowing the
kernel module packaging to be unchanged.

   RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"

 % rpm -qp kernel-3.4.3-myver+snapshot-standard-3.4-r0.qemux86.rpm --provides
kernel-3.4.3-MYVER+snapshot_standard
kernel-3.4.3-myver+snapshot-standard = 3.4-r0

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/classes/kernel.bbclass |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 4a6f660..de43550 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -262,6 +262,7 @@ RDEPENDS_kernel = "kernel-base"
 RDEPENDS_kernel-base ?= "kernel-image"
 PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
 PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
+RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
-- 
1.7.8.6



