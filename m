Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AF4577D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:36 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86JTbFs032244
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:37 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:05 -0500
Message-ID: <1504725809-12825-8-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/31] boinc-client: Add distro flag, requires opengl
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:36 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
index ac5f755..99b43fa 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.6.33.bb
@@ -39,7 +39,9 @@ SRC_URI = "https://github.com/BOINC/boinc/archive/client_release/7.6/${PV}.tar.g
 SRC_URI[md5sum] = "437b4b98e384b4bda4ef7056e68166ac"
 SRC_URI[sha256sum] = "c4b1c29b9655013e0ac61dddf47ad7f30f38c46159f02a9d9dc8ab854e99aa6d"
 
-inherit gettext autotools-brokensep pkgconfig
+inherit gettext autotools-brokensep pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES += "opengl"
 
 S = "${WORKDIR}/${BPN}_release-7.6-${PV}"
 
-- 
1.8.3.1


