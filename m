Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PqwHg-0002gh-2M
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 00:32:16 +0100
Received: by bwz10 with SMTP id 10so881270bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Feb 2011 15:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=bWFMdokY/DDokUSxdHA6L8QGSSBV+ID2iJHhPVwv6Jk=;
	b=cNVEvlXRhRg/5hthMk3rya1cM2uHKXd2IAA5/jgPqwStVkKjVQhiEgDrBxfNvfKu7L
	nLDw77BxH0piQkPUXSoToTCSpAjxYUKx2p03tDdw4iBpbKyMgGqG0lxttmJkBiD2HbXb
	uPcDdDYNoy85P3p/4RMFnIAbMr53VvCkQ8vyg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=VH0WYSn9MSrFLeL3+yjc+g0/k88nyCYXgOawcf6sNd5FTreBWr7uDlPv7XMl928C8a
	+/TVnN55h4G/4Okdwapr88nUZbo3xdY5EqWuJ3njNsSSJAjK7K+fTthit8aoGz54/XUA
	bHXOeAU7sdcRrxXSGk5C0qKgPxZBX1QguXcT4=
Received: by 10.204.4.212 with SMTP id 20mr2051060bks.172.1298158259979;
	Sat, 19 Feb 2011 15:30:59 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id b6sm2608923bkb.10.2011.02.19.15.30.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Feb 2011 15:30:59 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 00:30:49 +0100
Message-Id: <1298158249-10217-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1298063776-2260-1-git-send-email-filip.zyzniewski@gmail.com>
Subject: [PATCHv2] package_deb.bbclass/apt: armel architecture name for eabi systems.
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
X-List-Received-Date: Sat, 19 Feb 2011 23:32:16 -0000

For dpkg EABI system architecture is called armel, not arm.
Reference: http://wiki.debian.org/ArmEabiPort

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    2 ++
 recipes/apt/apt_0.7.20.2.bb |   13 ++++++++++++-
 2 files changed, 14 insertions(+), 1 deletions(-)

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
index 5c932a5..c8a3516 100644
--- a/recipes/apt/apt_0.7.20.2.bb
+++ b/recipes/apt/apt_0.7.20.2.bb
@@ -7,12 +7,23 @@ SRC_URI += "file://no-doxygen.patch \
             file://no-ko-translation.patch \
             file://fix-gcc-4.4-compile.patch \
             file://use-host.patch "
-PR = "r3"
+PR = "r4"
 
 require apt-package.inc
 
 FILES_${PN} += "${bindir}/apt-key"
 
+do_configure_append_linux-gnueabi() {
+	sed -i \
+	's:^#define COMMON_ARCH "arm"$:#define COMMON_ARCH "armel":' \
+		${S}/include/config.h
+}
+
+do_configure_append_linux-uclibceabi() {
+	do_configure_append_linux-gnueabi()
+}
+
+
 do_stage() {
 	install -d ${STAGING_LIBDIR} ${STAGING_INCDIR}/apt-pkg
 	eval `cat environment.mak | grep ^GLIBC_VER | sed -e's, = ,=,'`
-- 
1.7.1



