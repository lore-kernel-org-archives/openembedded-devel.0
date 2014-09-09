Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E7BD0713DF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Sep 2014 16:28:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s89GS2ak005035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 9 Sep 2014 09:28:02 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 09:28:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 9 Sep 2014 09:27:55 -0700
Message-ID: <c8390e3572736cc1913e727854d74cc39591c0ba.1410279874.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410279874.git.liezhi.yang@windriver.com>
References: <cover.1410279874.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/14] sdparm: split sdparm-scripts subpkg
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
X-List-Received-Date: Tue, 09 Sep 2014 16:28:02 -0000
Content-Type: text/plain

Bash scripts:
packages-split/sdparm/usr/bin/sas_disk_blink:#!/bin/bash
packages-split/sdparm/usr/bin/scsi_ch_swp:#!/bin/bash

The sdparm is a ~150K executable so making it pull in bash
at >1000K isn't good for embedded systems.

Neither script appears to be essential, so put them in sdparm-scripts as
Randy suggested.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-oe/recipes-support/sdparm/sdparm_1.08.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
index 713e451..b603a56 100644
--- a/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
+++ b/meta-oe/recipes-support/sdparm/sdparm_1.08.bb
@@ -11,7 +11,13 @@ SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
            file://make-sysroot-work.patch \
            "
 
+PACKAGES =+ "${PN}-scripts"
+RDEPENDS_${PN}-scripts += "bash ${PN}"
+
 SRC_URI[md5sum] = "be5786f37499018ef44f409597c92d42"
 SRC_URI[sha256sum] = "376b78a414b1a9c47f3f13dbeb963e7a3ec7be126f83927d6856b5f7ac425e57"
 
 inherit autotools
+
+# Put the bash scripts to ${PN}-scripts
+FILES_${PN}-scripts = "${bindir}/sas_disk_blink ${bindir}/scsi_ch_swp"
-- 
1.7.9.5


