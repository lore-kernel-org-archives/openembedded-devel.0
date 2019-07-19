Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 932597D771
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 10:08:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6JA82qK030841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 03:08:17 -0700
Received: from localhost (128.224.162.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 19 Jul 2019 03:07:53 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jul 2019 18:07:47 +0800
Message-ID: <1563530867-20806-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563530867-20806-1-git-send-email-yi.zhao@windriver.com>
References: <1563530867-20806-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.195]
Subject: [meta-networking][PATCH 2/2] samba: upgrade 4.10.5 -> 4.10.6
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
X-List-Received-Date: Fri, 19 Jul 2019 10:08:26 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.10.5.bb => samba_4.10.6.bb}                    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.10.5.bb => samba_4.10.6.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.6.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.10.5.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.10.6.bb
index c34ac92..7c77a16 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.10.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.10.6.bb
@@ -32,8 +32,8 @@ SRC_URI_append_libc-musl = " \
            file://0001-samba-fix-musl-lib-without-innetgr.patch \
           "
 
-SRC_URI[md5sum] = "7d20c01ae35b08bc850442a0c303bca5"
-SRC_URI[sha256sum] = "6c10266d5e8c44ce1ea17dc993ace67a83607b4d9a830959c75e3188c6af6375"
+SRC_URI[md5sum] = "9782cac8ef06049942be5f5c93b954be"
+SRC_URI[sha256sum] = "9efbeb52db1203dc779b118f1c48c161e569f7a6af5101e745497ee6296eef42"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.10(\.\d+)+).tar.gz"
 
@@ -309,7 +309,7 @@ RDEPENDS_${PN}-client = "\
     winbind \
     registry-tools \
     ${PN}-pidl \
-    " 
+    "
 
 ALLOW_EMPTY_${PN}-client = "1"
 
@@ -317,7 +317,7 @@ RDEPENDS_${PN}-server = "\
     ${PN} \
     winbind \
     registry-tools \
-    " 
+    "
 
 ALLOW_EMPTY_${PN}-server = "1"
 
-- 
2.7.4


