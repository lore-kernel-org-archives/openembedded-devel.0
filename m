Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC16741CF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2015 06:48:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6D6msWf003265
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2015 23:48:54 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 12 Jul 2015 23:48:53 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Jul 2015 14:43:03 +0800
Message-ID: <1436769783-20950-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] libxml-libxml-perl: update from 2.0116 to 2.0121
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
X-List-Received-Date: Mon, 13 Jul 2015 06:48:56 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

update to 2.0121 and clean unused logic:

  - do_configure_prepend() {
  -        rm -rf ${S}/.pc/*
  - }

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...{libxml-libxml-perl_2.0116.bb => libxml-libxml-perl_2.0121.bb} | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)
 rename meta-perl/recipes-perl/libxml/{libxml-libxml-perl_2.0116.bb => libxml-libxml-perl_2.0121.bb} (87%)

diff --git a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
similarity index 87%
rename from meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
rename to meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
index 2a6dbc2..8997a04 100644
--- a/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0116.bb
+++ b/meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0121.bb
@@ -26,8 +26,8 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/XML-LibXML-${PV}.
 "
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=75e021e35a906347f46c9ff163653e2a \
 			file://LICENSE;md5=97871bde150daeb5e61ad95137ff2446"
-SRC_URI[libxml.md5sum] = "a53a743bf053a0cb4afb41513fb8a684"
-SRC_URI[libxml.sha256sum] = "b154f2dad3033b30d22ac81b8985b69ad35450b0c552db394cd03bb36845812a"
+SRC_URI[libxml.md5sum] = "1544ab9ac110f5da296015346561ce02"
+SRC_URI[libxml.sha256sum] = "ec431011cb37a04640fd2316f64d0405a274eece2c6f3847f7fbd336eb1c0dc9"
 
 S = "${WORKDIR}/XML-LibXML-${PV}"
 
@@ -40,8 +40,4 @@ BBCLASSEXTEND = "native"
 CFLAGS += " -D_GNU_SOURCE "
 BUILD_CFLAGS += " -D_GNU_SOURCE "
 
-do_configure_prepend() {
-	rm -rf ${S}/.pc/*
-}
-
 FILES_${PN}-dbg =+ "${libdir}/perl/vendor_perl/*/auto/XML/LibXML/.debug/"
-- 
1.9.1


