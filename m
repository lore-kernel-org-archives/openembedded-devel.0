Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7336071993
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 03:13:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA13D0cf014704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Oct 2018 20:13:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 31 Oct 2018 20:13:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Nov 2018 11:12:46 +0800
Message-ID: <1541041968-19942-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
References: <1541041968-19942-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netcat-openbsd: update SRC_URI
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
X-List-Received-Date: Thu, 01 Nov 2018 03:13:24 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

update SRC_URI since previous is not valid now

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
index 74f5c9f..defc05c 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.190.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=f39e60ae4ea9fdb559c833be2e59de99
 DEPENDS += "glib-2.0 libbsd"
 do_patch[depends] = "quilt-native:do_populate_sysroot"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
-           ${DEBIAN_MIRROR}/main/n/netcat-openbsd/netcat-openbsd_${PV}-2.debian.tar.xz;name=netcat-patch;subdir=${BP} \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/netcat-openbsd/1.190-2/netcat-openbsd_${PV}.orig.tar.gz;name=netcat \
+           https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/netcat-openbsd/1.190-2/netcat-openbsd_${PV}-2.debian.tar.xz;name=netcat-patch;subdir=${BP} \
            file://0001-bundle-own-base64-encode-decode-functions.patch \
            "
 
-- 
2.7.4


