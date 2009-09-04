Received: from [209.85.211.187] (helo=mail-yw0-f187.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mji6k-0002zA-L3
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 01:22:18 +0200
Received: by ywh17 with SMTP id 17so2088267ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 16:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NjLOVIw67INUEYALN1ff1SGJ30Tjyu8ApvzgigtQVdM=;
	b=VYJ94IaB6asOum42sQjYUV6QOxe1yxbJZx6BEIotvfr4mnaRTZ7g9P48VeNmCnPkdP
	go/UM+be5R1NzYHadvcCEd4KNGHWsaK7ivtJjey56CQQ7Jv+gjsfAx6YzshRNq+In7fW
	Cbq4fOQV/gZ7Vn9OZZLyB3+2LsoO5jGO6bY3M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=dEOIggky5bouDcNx9z7bdtte3oLWIYEuPUQywAkJQCRLBF/61h7rhfJ0pzk+wQ5NAa
	Arhx4UUlbbUz0T85Utwi9EHEu5eFLvYW8tlEcKi3HodVit9cuaaBoLMd6GejaoP6OgTd
	FmoE1/4rrl8+x3fOf8i154MWVOUJCJ4KhvTI0=
Received: by 10.91.191.17 with SMTP id t17mr8599582agp.51.1252105396836;
	Fri, 04 Sep 2009 16:03:16 -0700 (PDT)
Received: from localhost (adsl-71-146-28-171.dsl.pltn13.sbcglobal.net
	[71.146.28.171])
	by mx.google.com with ESMTPS id 39sm752169agd.46.2009.09.04.16.03.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Sep 2009 16:03:16 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Sep 2009 16:03:10 -0700
Message-Id: <1252105390-3800-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] perl_5.8.8.bb: Fix compilation when bindir is not /usr/bin
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
X-List-Received-Date: Fri, 04 Sep 2009 23:22:18 -0000

* Right now default perl installation happens in /usr prefix
  This patch tries to depend upong layout_prefix to decide on
  where to install. This is required for distros like micro
  who flatten the install tree and do not use /usr prefix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/perl/perl_5.8.8.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
index 8d97199..8f6b72b 100644
--- a/recipes/perl/perl_5.8.8.bb
+++ b/recipes/perl/perl_5.8.8.bb
@@ -5,7 +5,7 @@ LICENSE = "Artistic|GPL"
 PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native grep-native"
-PR = "r27"
+PR = "r28"
 
 # Major part of version
 PVM = "5.8"
@@ -81,6 +81,7 @@ do_configure() {
         sed -i -e 's,@DESTDIR@,${D},g' \
                -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
                -e "s%/usr/include/%${STAGING_INCDIR}/%g" \
+	       -e 's,/usr/,${layout_exec_prefix}/,g' \
             config.sh-${TARGET_ARCH}-${TARGET_OS}
 
         if test "${MACHINE}" != "native"; then
@@ -103,10 +104,9 @@ do_compile() {
         oe_runmake perl LD="${TARGET_SYS}-gcc"
 }
 do_install() {
-        oe_runmake install
-
+	oe_runmake install
         # Add perl pointing at current version
-        ln -sf perl${PV} ${D}/usr/bin/perl
+        ln -sf perl${PV} ${D}${bindir}/perl
 
         # Fix up versioned directories
         mv ${D}/${libdir}/perl/${PVM} ${D}/${libdir}/perl/${PV}
-- 
1.6.3.3



