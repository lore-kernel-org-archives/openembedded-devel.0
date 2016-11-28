Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6760E71A6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 22:12:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uASMCwsg020583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 14:12:58 -0800 (PST)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 28 Nov 2016 14:12:58 -0800
From: Joe Slater <jslater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 28 Nov 2016 14:12:58 -0800
Message-ID: <1480371178-5052-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] ntp: update to version 4.8p9
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
X-List-Received-Date: Mon, 28 Nov 2016 22:12:58 -0000
Content-Type: text/plain

This fixes two CVE defects.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ntp/{ntp_4.2.8p8.bb => ntp_4.2.8p9.bb}         |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/ntp/{ntp_4.2.8p8.bb => ntp_4.2.8p9.bb} (97%)

diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb b/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
similarity index 97%
rename from meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
rename to meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
index 202d1a3..9d74c96 100644
--- a/meta-networking/recipes-support/ntp/ntp_4.2.8p8.bb
+++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p9.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.g
            file://ntpd.list \
 "
 
-SRC_URI[md5sum] = "4a8636260435b230636f053ffd070e34"
-SRC_URI[sha256sum] = "2ab3d0b5f0456e6311dda1cc27ab75da108762773a19e46abd938bd9407b97ee"
+SRC_URI[md5sum] = "857452b05f5f2e033786f77ade1974ed"
+SRC_URI[sha256sum] = "b724287778e1bac625b447327c9851eedef020517a3545625e9f652a90f30b72"
 
 inherit autotools update-rc.d useradd systemd pkgconfig
 
-- 
1.7.9.5


