Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B0437710C7
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIf7G026596
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:41 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:32 -0700
Message-ID: <7d88ac510c59a39e2c5235d70958024f94555723.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/13] sg3-utils: add bash to RDEPENDS_sg3-utils
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:39 -0000
Content-Type: text/plain

Bash scripts:
sg3-utils/usr/bin/scsi_stop:#!/bin/bash
sg3-utils/usr/bin/scsi_mandat:#!/bin/bash
sg3-utils/usr/bin/scsi_logging_level:#! /bin/bash
sg3-utils/usr/bin/scsi_temperature:#!/bin/bash
sg3-utils/usr/bin/scsi_start:#!/bin/bash
sg3-utils/usr/bin/scsi_satl:#!/bin/bash
sg3-utils/usr/bin/scsi_readcap:#!/bin/bash
sg3-utils/usr/bin/scsi_ready:#!/bin/bash

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-support/sg3-utils/sg3-utils_1.38.bb    |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
index 36c13a4..5ce11b6 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.38.bb
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "d7d3a8b4b698e2c17c8f16bb876946720260d4d659d471c5d7c12ce652
 inherit autotools-brokensep
 
 S = "${WORKDIR}/sg3_utils-${PV}"
+
+RDEPENDS_${PN} += "bash"
-- 
1.7.9.5


