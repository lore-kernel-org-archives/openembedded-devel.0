Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8C1078E00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 01:49:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L1nYrD005935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 18:49:34 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 20 Aug 2018 18:49:33 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Aug 2018 09:49:31 +0800
Message-ID: <1534816171-23333-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH] multipath-tools: disable the systemd service start automatically
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
X-List-Received-Date: Tue, 21 Aug 2018 01:49:33 -0000
Content-Type: text/plain

We don't offer /etc/multpath.conf but an example configure file
/etc/multipath.conf.example. When the servcie start by default, it will
get the error: /etc/multipath.conf was not met
So disable the service by default.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb
index 213ce15..5cc1546 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.7.7.bb
@@ -63,7 +63,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http \
            file://0030-Always-use-devmapper.patch \
            file://0031-Always-use-devmapper-for-kpartx.patch \
            "
-          
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 SRCREV = "386d288b5595fc2c01dffe698b6eb306c6674908"
@@ -73,6 +73,7 @@ S = "${WORKDIR}/git"
 inherit systemd pkgconfig
 
 SYSTEMD_SERVICE_${PN} = "multipathd.service"
+SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.7.4


