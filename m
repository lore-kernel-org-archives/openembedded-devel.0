Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 903B371A5E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jan 2018 06:53:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w056rpUW021709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Jan 2018 22:53:51 -0800 (PST)
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 4 Jan 2018 22:53:51 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jan 2018 14:52:04 +0800
Message-ID: <1515135126-3325-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515135126-3325-1-git-send-email-yi.zhao@windriver.com>
References: <1515135126-3325-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [meta-oe][PATCH 1/3] dialog: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jan 2018 06:53:50 -0000
Content-Type: text/plain

Update the SRC_URI since the upstream server is changed from
ftp://invisible-island.net to ftp://ftp.invisible-island.net

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb b/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
index bff3d97..85dede1 100644
--- a/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
+++ b/meta-oe/recipes-extended/dialog/dialog_1.3-20160828.bb
@@ -8,7 +8,7 @@ DEPENDS = "ncurses"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI = "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
+SRC_URI = "ftp://ftp.invisible-island.net/${BPN}/${BP}.tgz \
           "
 SRC_URI[md5sum] = "a39ec183517bc1feaff017d067300b8c"
 SRC_URI[sha256sum] = "453095abaec288bfbc1ca9faced917e17742cff1ea45ec46210071ac153562f9"
-- 
2.7.4


