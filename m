Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AC0B65D40
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 02:30:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t052UFDp015189
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 4 Jan 2015 18:30:15 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 4 Jan 2015 18:30:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 4 Jan 2015 18:30:10 -0800
Message-ID: <1420425013-19013-2-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
References: <1420425013-19013-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe] [V2 PATCH 2/5] rarpd: use BPN in SRC_URI
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
X-List-Received-Date: Mon, 05 Jan 2015 02:30:19 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
index d69499d..0fe79cf 100644
--- a/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
+++ b/meta-oe/recipes-extended/rarpd/rarpd_ss981107.bb
@@ -9,7 +9,7 @@ You should install rarpd if you want to set up a RARP server on your \
 network."
 SECTION = "System Environment/Daemons"
 
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${PN}/${PN}-${PV}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${PN}-${PV}.tar.gz"
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/be2a88f8ccddf2a40ac484cb3294fedc/${BP}.tar.gz"
 SRC_URI[md5sum] = "be2a88f8ccddf2a40ac484cb3294fedc"
 SRC_URI[sha256sum] = "4d6145d435a5d8b567b9798620f57f9b0a464078a1deba267958f168fbe776e6"
 
@@ -25,7 +25,7 @@ SRC_URI += "file://0001-rarpd.8-add-man-file.patch \
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://rarpd.c;md5=199b20b172ea93121bc613a9c77b6931"
 
-S = "${WORKDIR}/${PN}"
+S = "${WORKDIR}/${BPN}"
 
 do_install() {
     install -d ${D}${sysconfdir}/init.d
-- 
1.7.9.5


