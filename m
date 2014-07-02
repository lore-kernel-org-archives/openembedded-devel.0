Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCCE65CB1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jul 2014 06:57:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s626vkRB016252
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 1 Jul 2014 23:57:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Jul 2014 23:57:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Jul 2014 23:56:35 -0700
Message-ID: <1404284261-42377-9-git-send-email-liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
References: <1404284261-42377-1-git-send-email-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-gnome] [PATCH 08/74] gcalctool: use BPN in SRC_URI
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
X-List-Received-Date: Wed, 02 Jul 2014 06:57:49 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../nonworking/gcalctool/gcalctool_5.32.0.bb       |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
index f16551f..4812fe3 100644
--- a/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
+++ b/meta-gnome/recipes-gnome/nonworking/gcalctool/gcalctool_5.32.0.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-SRC_URI = "http://download.gnome.org/sources/${PN}/${SHRT_VER}/${PN}-${PV}.tar.gz"
+SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
 
 SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
 SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
-- 
1.7.9.5


