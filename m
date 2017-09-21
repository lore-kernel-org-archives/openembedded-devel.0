Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C94F677E91
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:00:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L70pl6011738
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 00:00:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Sep 2017 00:00:50 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Sep 2017 14:47:21 +0800
Message-ID: <20170921064721.17250-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170921064721.17250-1-kai.kang@windriver.com>
References: <20170921064721.17250-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lvm2: disable thin provisioning support if GPLv3 incompatible
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
X-List-Received-Date: Thu, 21 Sep 2017 07:00:49 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Disable thin provisioning support for lvm2 if it is set GPLv3
incompatible.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index ab8db9cba..9791554a9 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -23,7 +23,7 @@ inherit autotools-brokensep pkgconfig systemd
 LVM2_PACKAGECONFIG = "dmeventd lvmetad"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
-    thin-provisioning-tools \
+    ${@bb.utils.contains('INCOMPATIBLE_LICENSE', 'GPLv3', '', 'thin-provisioning-tools', d)} \
     udev \
 "
 
-- 
2.14.1


