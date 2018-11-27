Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 113C96D245
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 09:37:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wAR9bt46023934
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2018 01:37:55 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 27 Nov 2018 01:37:54 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 27 Nov 2018 17:37:16 +0800
Message-ID: <1543311437-292979-4-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
References: <1543311437-292979-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/4] c-ares: upgrade to 1.15
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
X-List-Received-Date: Tue, 27 Nov 2018 09:37:54 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-support/c-ares/{c-ares_1.14.0.bb => c-ares_1.15.0.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/c-ares/{c-ares_1.14.0.bb => c-ares_1.15.0.bb} (88%)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
similarity index 88%
rename from meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
rename to meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
index b31543d..d437529 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.14.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.15.0.bb
@@ -5,13 +5,13 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
-PV = "1.14.0+gitr${SRCPV}"
+PV = "1.15.0+gitr${SRCPV}"
 
 SRC_URI = "\
     git://github.com/c-ares/c-ares.git \
     file://cmake-install-libcares.pc.patch \
 "
-SRCREV = "17dc1b3102e0dfc3e7e31369989013154ee17893"
+SRCREV = "e982924acee7f7313b4baa4ee5ec000c5e373c30"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.7.4


