Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 467516079F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 07:00:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3N70AFT010787
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Apr 2019 00:00:10 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 23 Apr 2019 00:00:09 -0700
From: <mingli.yu@windriver.com>
To: <bunk@stusta.de>, <raj.khem@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Apr 2019 00:00:09 -0700
Message-ID: <20190423070009.24930-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190423064653.GA31039@localhost>
References: <20190423064653.GA31039@localhost>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] hwdata: Upgrade to 0.322
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
X-List-Received-Date: Tue, 23 Apr 2019 07:00:13 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Correct the PV to reflect the real release version.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/hwdata/hwdata_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/hwdata/hwdata_git.bb b/meta-oe/recipes-support/hwdata/hwdata_git.bb
index 8e8dbf5c8..58a060706 100644
--- a/meta-oe/recipes-support/hwdata/hwdata_git.bb
+++ b/meta-oe/recipes-support/hwdata/hwdata_git.bb
@@ -5,8 +5,8 @@ SECTION = "System/Base"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
-PV = "0.316+git${SRCPV}"
-SRCREV = "803819aef862ded2ce0737cd3cf642c633b68c35"
+PV = "0.322"
+SRCREV = "a65d28807d8f2446faa4734c758d1607f0a56ded"
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


