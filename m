Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08A186FCA3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIj0l026602
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:45 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:34 -0700
Message-ID: <a5a4fc284e27f5d59618d14482ff52870ad1a7c8.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] bonnie: add perl to RDEPENDS_bonnie-scripts
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:45 -0000
Content-Type: text/plain

Perl:
bonnie-scripts/usr/bin/bon_csv2html:#!/usr/bin/perl
bonnie-scripts/usr/bin/bon_csv2txt:#!/usr/bin/perl

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
index f8a23d7..2c1217e 100644
--- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
+++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
@@ -28,3 +28,5 @@ PACKAGES =+ "bonnie-scripts"
 
 FILES_${PN} = "${sbindir}"
 FILES_bonnie-scripts = "${bindir}"
+
+RDEPENDS_bonnie-scripts += "perl"
-- 
1.7.9.5


