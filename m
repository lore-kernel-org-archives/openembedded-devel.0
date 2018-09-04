Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10B2E74AF1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 07:45:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w847jrhT020198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Sep 2018 00:45:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 4 Sep 2018 00:45:52 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 4 Sep 2018 15:07:38 +0800
Message-ID: <20180904070738.13171-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] lvm2: fix install file conflict with multilib
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
X-List-Received-Date: Tue, 04 Sep 2018 07:45:52 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable multilib and both lvm2 and multilib lvm2 such as lib32-lvm2
are installed to image, it causes install file conflict.

| file /etc/lvm/lvm.conf conflicts between attempted installs of
| lib32-lvm2-2.02.180-r0.x86 and lvm2-2.02.180-r0.core2_64

Inherit multilib_script to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
index 5b9b2f7ec..9da0f5ec9 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
@@ -7,6 +7,10 @@ SRC_URI += "file://0001-explicitly-do-not-install-libdm.patch"
 
 DEPENDS += "autoconf-archive-native"
 
+inherit multilib_script
+
+MULTILIB_SCRIPTS = "${PN}:${sysconfdir}/lvm/lvm.conf"
+
 CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
 
 do_install_append() {
-- 
2.18.0


