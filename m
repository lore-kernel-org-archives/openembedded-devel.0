Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1038078526
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:06:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA9B6VXm002642
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Nov 2017 03:06:31 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 9 Nov 2017 03:06:30 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 19:04:51 +0800
Message-ID: <44c72811b2c860f7ecf510e8e916a09fb4bfbfe6.1510225386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1510225386.git.jackie.huang@windriver.com>
References: <cover.1510225386.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/3] iscsi-initiator-utils: remove the distro_features_check
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
X-List-Received-Date: Thu, 09 Nov 2017 11:06:30 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

open-isns supports both systemd and sysvinit now, so
remove the distro_features_check.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb            | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
index 16ac19992..50aadb6b6 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb
@@ -27,9 +27,7 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi \
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
 
-inherit update-rc.d systemd autotools distro_features_check
-# open-isns depends on systemd
-REQUIRED_DISTRO_FEATURES = "systemd"
+inherit update-rc.d systemd autotools
 
 EXTRA_OECONF = " \
     --target=${TARGET_SYS} \
-- 
2.11.0


