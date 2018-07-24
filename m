Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B473F75114
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:34:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6O2YFtp024653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:34:15 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 23 Jul 2018 19:34:14 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Jul 2018 10:34:08 +0800
Message-ID: <1532399648-7226-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-filesystems][PATCH] yaffs2-utils: update to latest master
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
X-List-Received-Date: Tue, 24 Jul 2018 02:34:13 -0000
Content-Type: text/plain

License-Update: Modify the line number for mkyaffs2image.c license.
                Add license for mkyaffsimage.c since it also be built.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 317965e..9ca6d9b 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -5,7 +5,9 @@ SECTION = "base"
 HOMEPAGE = "http://www.yaffs.net"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=12;endline=14;md5=5f5464f9b3e981ca574e65b00e438561"
+LIC_FILES_CHKSUM = "file://utils/mkyaffs2image.c;beginline=11;endline=13;md5=5f5464f9b3e981ca574e65b00e438561 \
+                    file://utils/mkyaffsimage.c;beginline=10;endline=12;md5=5f5464f9b3e981ca574e65b00e438561 \
+                    "
 
 PV = "0.0+git${SRCPV}"
 
@@ -17,7 +19,7 @@ SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
            file://0001-define-loff_t-if-not-already-defined.patch \
            "
 
-SRCREV = "bc76682d93955cfb33051beb503ad9f8a5450578"
+SRCREV = "0065378b27638ee07352282b51b596fabcac26e4"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.7.4


