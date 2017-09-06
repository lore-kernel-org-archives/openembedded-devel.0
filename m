Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3783577D67
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v86JTjo2032253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:45 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:45 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:14 -0500
Message-ID: <1504725809-12825-17-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 16/31] open-vm-tools: only build if meta-networking and meta-filesystems is available
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:45 -0000
Content-Type: text/plain

libdnet - meta-networking
fuse - meta-filesystems

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index f7746c8..5e809ac 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -93,3 +93,10 @@ do_configure_prepend() {
     export CUSTOM_DNET_NAME=dnet
     export CUSTOM_DNET_LIBS=-L${STAGING_LIBDIR}/libdnet.so
 }
+
+python() {
+    if 'networking-layer' not in d.getVar('BBFILE_COLLECTIONS').split() or \
+	'filesystems-layer' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-networking and meta-filesystems to be present.')
+}
+
-- 
1.8.3.1


