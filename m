Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE2AD6C1D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:48:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7S5mRmv029302
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 22:48:27 -0700 (PDT)
Received: from localhost (128.224.162.136) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 27 Aug 2019 22:48:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Aug 2019 13:48:24 +0800
Message-ID: <1566971304-27868-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.136]
Subject: [meta-networking][PATCH] samba: upgrade 4.10.6 -> 4.10.7
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
X-List-Received-Date: Wed, 28 Aug 2019 05:48:29 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/samba/{samba_4.10.6.bb => samba_4.10.7.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.6.bb => samba_4.10.7.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.6.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.6.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
index 7c77a16..d13a6b4 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.6.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.7.bb
@@ -32,8 +32,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "9782cac8ef06049942be5f5c93b954be"
-SRC_URI[sha256sum] = "9efbeb52db1203dc779b118f1c48c161e569f7a6af5101e745497ee6296eef42"
+SRC_URI[md5sum] = "05472d0dd943b3ccbc3be5032a9eb563"
+SRC_URI[sha256sum] = "34f30494b6b63700f54be22be636e8a6e0430577166a76a017075e11c02a1ebb"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
-- 
2.7.4


