Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id F1D916EEF5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Mar 2014 12:11:26 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,669,1389740400"; d="scan'208";a="42797583"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 17 Mar 2014 13:11:26 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Mon, 17 Mar 2014 13:11:25 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 17 Mar 2014 13:11:25 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 17 Mar 2014 13:04:11 +0100
Message-ID: <1395057851-21823-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] ttf-dejavu: fix license warnings
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
X-List-Received-Date: Mon, 17 Mar 2014 12:11:29 -0000
Content-Type: text/plain

Fix LICENSE value to drop warning messages:
WARNING: ttf-dejavu: No generic license file exists for: Bitstream in any provider
WARNING: ttf-dejavu: No generic license file exists for: Vera in any provider

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
index e4363e2..2b73b1e 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-dejavu_2.23.bb
@@ -2,7 +2,7 @@ require ttf.inc
 
 SUMMARY = "DejaVu font - TTF Edition"
 HOMEPAGE = "http://dejavu.sourceforge.net/wiki/"
-LICENSE = "Bitstream Vera"
+LICENSE = "BitstreamVera"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/dejavu-fonts-ttf-${PV}/LICENSE;md5=9f867da7a73fad2715291348e80d0763"
 
 # all subpackages except ${PN}-common itself rdepends on ${PN}-common
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/dejavu/dejavu-fonts-ttf-${PV}.tar.bz2 \
 
 S = "${WORKDIR}/dejavu-fonts-ttf-${PV}/ttf"
 
-do_install_append () { 
+do_install_append () {
     install -d ${D}${sysconfdir}/fonts/conf.d/
     install -m 0644 ${WORKDIR}/30-dejavu-aliases.conf ${D}${sysconfdir}/fonts/conf.d/
 }
-- 
1.8.5.4


