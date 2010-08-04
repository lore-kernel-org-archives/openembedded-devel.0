Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgeOC-0007H9-8l
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 15:52:36 +0200
Received: by fxm12 with SMTP id 12so2472827fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=6afGlOpo5J7GYaHyc85XtT4TgJ05Y0DB9rDSGFI0f1w=;
	b=tFYsDG76yn0b9HWJIrm86xm2YsRwYXQvIeCZvOpeFtGngUOJ+mzx0jd4vEb/gTj4ia
	AE02FeaIUfKkUB25us7RfwSbJPBLRw/lBpmMwdDRhHG26aZY9+7wT7cvoxfM4ode8tpt
	DljeLrZWDVbwQfM54Yrx/KWrj+tBmLo1Dd26s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=ocdcrGkqFq33QlLS3kEbpI7uMScqqpktGzq/JgQRIrStXZYZbzZSKFTmomz6mS/Itw
	FVFCOP6uL2eJgrs2/CaWlQYHPc4o0GMZQexuHzXdqsUkd+adAwOx0uC4VYiFc4DTcdc2
	JQG08U+mRT2vN/AKQAn04Om5c3SZ+qT5LTlM8=
Received: by 10.223.119.131 with SMTP id z3mr8976498faq.61.1280929928307;
	Wed, 04 Aug 2010 06:52:08 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id f11sm2970073fak.20.2010.08.04.06.52.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 06:52:05 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OgeO0-0006Dw-4d; Wed, 04 Aug 2010 15:52:00 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 15:51:56 +0200
Message-Id: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/3] perl: honour DISTRO_FEATURE largefile
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
X-List-Received-Date: Wed, 04 Aug 2010 13:52:40 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 recipes/perl/perl-native_5.8.8.bb |    4 ++--
 recipes/perl/perl_5.8.8.bb        |    6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native_5.8.8.bb
index fe1bc84..41a85bc 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "virtual/db-native gdbm-native"
-PR = "r20"
+PR = "r21"
 NATIVE_INSTALL_WORKS = "1"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
@@ -44,7 +44,7 @@ do_configure () {
         -Duseshrplib \
         -Dusethreads \
         -Duseithreads \
-        -Duselargefiles \
+        ${@base_contains("DISTRO_FEATURES", "largefile", "-Duselargefiles", "-Uuselargefiles", d)} \
 	-Dnoextensions=ODBM_File \
         -Ud_dosuid \
         -Ui_db \
diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index ed489f4..5400e69 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r35"
+PR = "r36"
 
 # Major part of version
 PVM = "5.8"
@@ -66,7 +66,9 @@ do_configure() {
                  ${WORKDIR}/config.sh-${SITEINFO_BITS}-${SITEINFO_ENDIANNESS}; do
             cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
         done
-
+	uselargefiles="${@base_contains("DISTRO_FEATURES", "largefile", "define", "undef", d)}"
+	sed -i -e "s,^\(uselargefiles=\).*,\1'$uselargefiles',g" \
+		    config.sh-${TARGET_ARCH}-${TARGET_OS}
         # Fixups for uclibc
         if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
                 sed -i -e "s,\(d_crypt_r=\)'define',\1'undef',g" \
-- 
1.7.1



