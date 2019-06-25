Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 192AD7E514
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 13:14:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5PDECPK027925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Jun 2019 06:14:12 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 25 Jun 2019 06:14:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 25 Jun 2019 21:14:05 +0800
Message-ID: <1561468448-24834-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
References: <1561468448-24834-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 2/5] xfce-polkit: add required distro feature check to polkit
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
X-List-Received-Date: Tue, 25 Jun 2019 13:14:12 -0000
Content-Type: text/plain

The xfce-polkit depends polkit, it should do required distro
feature check to polkit

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
index 54bf7c7..62d8d6d 100644
--- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
+++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.2.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=758b03f872a88c99fc36d50c5932091c"
 
 DEPENDS = "libxfce4ui polkit"
 
-inherit xfce-app
+inherit xfce-app distro_features_check
+REQUIRED_DISTRO_FEATURES = "polkit"
 
 SRC_URI = " \
     git://github.com/ncopa/${BPN}.git \
-- 
2.7.4


