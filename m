Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE0F87E731
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:31:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x621UpFQ024168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Jul 2019 18:31:01 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Jul 2019 18:30:40 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Mon, 1 Jul 2019 21:29:12 -0400
Message-ID: <20190702012913.7163-11-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190702012913.7163-1-kai.kang@windriver.com>
References: <20190702012913.7163-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 10/11] xfwm4: 4.13.2 -> 4.13.3
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
X-List-Received-Date: Tue, 02 Jul 2019 01:31:25 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
index 6075977f2..3dd870471 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
@@ -8,8 +8,8 @@ inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "aee4a8375beeae09715e77479610ff02"
-SRC_URI[sha256sum] = "7be8a63e92077e42e6cc064a1dfdae608ab99fdc730adbd5200802dbdd86d5a9"
+SRC_URI[md5sum] = "e53081e5928d401604d158429716e699"
+SRC_URI[sha256sum] = "12ad274f6662c8afee35fd9b9310e73bd462c423578d448b2d7353e3c8eda6c1"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.20.0


