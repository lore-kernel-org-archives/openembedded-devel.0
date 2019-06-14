Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C04347E8FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2019 01:26:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5E1QLFS002947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jun 2019 18:26:21 -0700 (PDT)
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 13 Jun 2019 18:26:20 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Jun 2019 09:26:16 +0800
Message-ID: <1560475578-28568-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-filesystems][PATCH 1/3] fuse: upgrade 2.9.8 -> 2.9.9
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
X-List-Received-Date: Fri, 14 Jun 2019 01:26:23 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse_2.9.8.bb => fuse_2.9.9.bb} (94%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
similarity index 94%
rename from meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
rename to meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index caa75c7..c83e7f6 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.8.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -16,8 +16,8 @@ SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse.conf \
 "
-SRC_URI[md5sum] = "f365e848a82504edb0b7a33df790ca78"
-SRC_URI[sha256sum] = "5e84f81d8dd527ea74f39b6bc001c874c02bad6871d7a9b0c14efb57430eafe3"
+SRC_URI[md5sum] = "8000410aadc9231fd48495f7642f3312"
+SRC_URI[sha256sum] = "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
 
 UPSTREAM_CHECK_URI = "https://github.com/libfuse/libfuse/releases"
 UPSTREAM_CHECK_REGEX = "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
-- 
2.7.4


