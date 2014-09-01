Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 37EEA6FCA3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon,  1 Sep 2014 15:18:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s81FIiqZ029623
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 1 Sep 2014 08:18:44 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 1 Sep 2014 08:18:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Sep 2014 08:18:33 -0700
Message-ID: <76dbc052fe60d5e4e5ba929e8e274cdf5c7572e2.1409584344.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1409584344.git.liezhi.yang@windriver.com>
References: <cover.1409584344.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/13] sdparm: add bash to RDEPENDS_sdparm
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
X-List-Received-Date: Mon, 01 Sep 2014 15:18:43 -0000
Content-Type: text/plain

Bash scripts:
packages-split/sdparm/usr/bin/sas_disk_blink:#!/bin/bash
packages-split/sdparm/usr/bin/scsi_ch_swp:#!/bin/bash

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/sdparm/sdparm_1.08.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
index 713e451..be46b96 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
@@ -15,3 +15,5 @@ SRC_URI[md5sum] = "be5786f37499018ef44f409597c92d42"
 SRC_URI[sha256sum] = "376b78a414b1a9c47f3f13dbeb963e7a3ec7be126f83927d6856b5f7ac425e57"
 
 inherit autotools
+
+RDEPENDS_${PN} += "bash"
-- 
1.7.9.5


