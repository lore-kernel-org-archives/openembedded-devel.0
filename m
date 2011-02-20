Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pr6We-0001Xd-0f
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 11:28:24 +0100
Received: by bwz10 with SMTP id 10so1052398bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 02:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=CbjT5oiUeR1xQxZu6a0b32PQaTT6/qHSUp8UVYVbAbE=;
	b=RgRmPqxE2sii16Aw0cJ++Jmm0hwU2it9xlWHQXYyNCnUA42h5z45B0o5a1yLXGJKoN
	0Io6FmnVi6ZesZKGaMPx+JUd/Fu7WfcG3Q3UnW2IcAOaoaLPtI6qj8Yx4BKBGZarHN1Q
	/5iC10G/CZFJZNvV52Ei11+eNescuhdqAxf9Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=E8yfq1m4X7AgaWCLK083sfcp8iX3nm+n3ycbrYCJe1+9k02fMHu341SILXH6H5N7H0
	lRJURMYSYebdW/KN+8dTt6Bk0NSrkuN5970jPyspfv3YkEKF3lJUyG2jkzF2ity5XfHh
	0Su9mBXUViytEgrTaWU29G9qhnOrAztZRjY6E=
Received: by 10.204.65.83 with SMTP id h19mr213048bki.101.1298197625097;
	Sun, 20 Feb 2011 02:27:05 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id f20sm2853890bkf.4.2011.02.20.02.27.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Feb 2011 02:27:04 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 11:27:00 +0100
Message-Id: <1298197620-22313-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTim8Ati0-iYJwm6ePhHxU6+-iFhe9-zM_pAJcP_4@mail.gmail.com>
References: <AANLkTim8Ati0-iYJwm6ePhHxU6+-iFhe9-zM_pAJcP_4@mail.gmail.com>
Subject: [PATCHv4] package_deb.bbclass/apt: armel architecture name for eabi systems.
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
X-List-Received-Date: Sun, 20 Feb 2011 10:28:24 -0000

For dpkg EABI system architecture is called armel, not arm.
Reference: http://wiki.debian.org/ArmEabiPort

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    2 ++
 recipes/apt/apt_0.7.20.2.bb |   21 ++++++++++++---------
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 60e759d..87f31fa 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -15,6 +15,8 @@ DPKG_ARCH_i486 ?= "i386"
 DPKG_ARCH_i586 ?= "i386"
 DPKG_ARCH_i686 ?= "i386"
 DPKG_ARCH_pentium ?= "i386"
+DPKG_ARCH_linux-gnueabi ?= "armel"
+DPKG_ARCH_linux-uclibceabi ?= "armel"
 
 python package_deb_fn () {
     bb.data.setVar('PKGFN', bb.data.getVar('PKG',d), d)
diff --git a/recipes/apt/apt_0.7.20.2.bb b/recipes/apt/apt_0.7.20.2.bb
index 5c932a5..ca0787c 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -7,21 +7,24 @@ SRC_URI += "file://no-doxygen.patch \
             file://no-ko-translation.patch \
             file://fix-gcc-4.4-compile.patch \
             file://use-host.patch "
-PR = "r3"
+PR = "r4"
 
 require apt-package.inc
 
 FILES_${PN} += "${bindir}/apt-key"
 
-do_stage() {
-	install -d ${STAGING_LIBDIR} ${STAGING_INCDIR}/apt-pkg
-	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER-6 ${STAGING_LIBDIR}/
-	ln -sf libapt-pkg$GLIBC_VER-6.so ${STAGING_LIBDIR}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER-6 ${STAGING_LIBDIR}/
-	ln -sf libapt-inst$GLIBC_VER-6.so ${STAGING_LIBDIR}/libapt-inst.so
+fix_eabi_architecture() {
+	sed -i \
+	's:^#define COMMON_ARCH "arm"$:#define COMMON_ARCH "armel":' \
+		${S}/include/config.h
+}
+
+do_configure_append_linux-gnueabi() {
+	fix_eabi_architecture
+}
 
-	install -m 0644 include/apt-pkg/*.h ${STAGING_INCDIR}/apt-pkg/
+do_configure_append_linux-uclibceabi() {
+	fix_eabi_architecture
 }
 
 SRC_URI[md5sum] = "e6ee1b594f6ed5fab5cb593ee46cfc21"
-- 
1.7.1



