Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pr6Q8-0001OT-8y
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 11:21:40 +0100
Received: by bwz10 with SMTP id 10so1050326bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 02:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=lMJqQIi/ZIm5Dmg7LLxw1KXaxcmuUKm8N9nZBe7T0xY=;
	b=p18YDm+V/XhZxShWOEyI8unzEX7rtA7D15+RJ6/NStM8QxO7CwMsU+Wzmh5r3HYkU+
	PmxHCX90wN59lPz74LujjGjmKiplubRdADt1gA4EW51OvwVAwibTjWamGOxCJklBPU19
	nVbmwtgV9/pSaD1EKXACDmojKAqaZnwD438Zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TY8NiDRt3eYEwzX6rPNUOkMJ4zovnk9Ndob8oWQi9vjTNf4wAe/VYGp/VOP3wgLrJX
	i4+GYh8PYgNNA0ed13ZfB629jF0PELVbuJ08F95+FL1wrOFhEy1+eOBGbE7AXkhklvhl
	9I9UN1/do/ffvEpLrm7vWcO63YdR8sQn/fwcs=
Received: by 10.204.54.147 with SMTP id q19mr203436bkg.145.1298197219337;
	Sun, 20 Feb 2011 02:20:19 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id x38sm2846411bkj.13.2011.02.20.02.20.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Feb 2011 02:20:18 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 11:20:12 +0100
Message-Id: <1298197212-22266-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <20110220011124.GA3451@sakrah.homelinux.org>
References: <20110220011124.GA3451@sakrah.homelinux.org>
Subject: [PATCHv3] package_deb.bbclass/apt: armel architecture name for eabi systems.
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
X-List-Received-Date: Sun, 20 Feb 2011 10:21:40 -0000

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
index 5c932a5..e17d593 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -13,15 +13,18 @@ require apt-package.inc
 
 FILES_${PN} += "${bindir}/apt-key"
 
-do_stage() {
-	install -d ${STAGING_LIBDIR} ${STAGING_INCDIR}/apt-pkg
-	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-	oe_libinstall -so -C bin libapt-pkg$GLIBC_VER-6 ${STAGING_LIBDIR}/
-	ln -sf libapt-pkg$GLIBC_VER-6.so ${STAGING_LIBDIR}/libapt-pkg.so
-	oe_libinstall -so -C bin libapt-inst$GLIBC_VER-6 ${STAGING_LIBDIR}/
-	ln -sf libapt-inst$GLIBC_VER-6.so ${STAGING_LIBDIR}/libapt-inst.so
-
-	install -m 0644 include/apt-pkg/*.h ${STAGING_INCDIR}/apt-pkg/
+fix_eabi_architecture() {
+	sed -i \
+	's:^#define COMMON_ARCH "arm"$:#define COMMON_ARCH "armel":' \
+		${S}/include/config.h
+}
+
+do_configure_append_linux-gnueabi() {
+	fix_eabi_architecture
+}
+
+do_configure_append_linux-uclibceabi() {
+	fix_eabi_architecture
 }
 
 SRC_URI[md5sum] = "e6ee1b594f6ed5fab5cb593ee46cfc21"
-- 
1.7.1



