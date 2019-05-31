Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1F3F7E552
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2019 08:45:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4V8jvQI007326
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 31 May 2019 01:45:57 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 31 May 2019 01:45:57 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 31 May 2019 04:44:20 -0400
Message-ID: <20190531084423.172617-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190531084423.172617-1-kai.kang@windriver.com>
References: <20190531084423.172617-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 07/10] xfwm4: 4.13.1 -> 4.13.2
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
X-List-Received-Date: Fri, 31 May 2019 08:45:57 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.1.bb => xfwm4_4.13.2.bb} (89%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.1.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
similarity index 89%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.1.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
index 64ad9f64e..6075977f2 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.1.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
@@ -8,8 +8,8 @@ inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "1a78bcc2100c03f6fea0dbce0ca813cf"
-SRC_URI[sha256sum] = "75ebc20d313cff4905e76fc320254c30461dbfa985461b8e75dca04770cedf12"
+SRC_URI[md5sum] = "aee4a8375beeae09715e77479610ff02"
+SRC_URI[sha256sum] = "7be8a63e92077e42e6cc064a1dfdae608ab99fdc730adbd5200802dbdd86d5a9"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.20.0


