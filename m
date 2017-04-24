Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9836572F05
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 08:04:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3O84ofZ007668
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 01:04:53 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 24 Apr 2017 01:04:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Apr 2017 16:06:42 +0800
Message-ID: <1493021203-30755-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493021203-30755-1-git-send-email-Qi.Chen@windriver.com>
References: <1493021203-30755-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/3] cryptsetup: DEPENDS on libdevmapper instead of lvm2
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
X-List-Received-Date: Mon, 24 Apr 2017 08:04:52 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

When 'cryptsetup' PACKAGECONFIG is enabled for systemd, there would
be circular dependency issue among 'systemd', 'cryptsetup' and 'lvm2'.

To fix this problem, we've separated libdevmapper into a new recipe.
Let cryptsetup depend on libdevmapper instead of lvm2 to fix the issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
index 38470ac..9075127 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.7.2.bb
@@ -9,7 +9,7 @@ SECTION = "console"
 LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 
-DEPENDS = "util-linux lvm2 popt libgcrypt"
+DEPENDS = "util-linux libdevmapper popt libgcrypt"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz"
 SRC_URI[md5sum] = "a11a140cea496961222170944db01fc1"
-- 
2.1.0


