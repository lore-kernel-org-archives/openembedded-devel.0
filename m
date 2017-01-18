Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 11A9D7197B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 22:59:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0IMxQj7001734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 14:59:26 -0800
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 14:59:25 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jan 2017 14:59:25 -0800
Message-ID: <1484780365-11240-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 1/1] netdata: derive PV from SRCPV
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
X-List-Received-Date: Wed, 18 Jan 2017 22:59:27 -0000
Content-Type: text/plain

Currently, PV is "git" and contains no version information.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../recipes-webadmin/netdata/netdata_git.bb        |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
index 317ddcc..bd43cea 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=747afe070ea9d6c2be0a31353609a35b"
 
 SRC_URI = "git://github.com/firehol/netdata.git;protocol=https"
 SRCREV = "36c1304e37094174ea51001903058e65053107ca"
+PV = "git+${SRCPV}"
 
 # patch to disable timeout because timeout are not available with actual version
 # of core-utils
-- 
1.7.9.5


