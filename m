Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6FD1578A29
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jul 2018 07:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w637LWZv017978
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 3 Jul 2018 00:21:32 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 3 Jul 2018 00:21:31 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 3 Jul 2018 15:21:20 +0800
Message-ID: <1530602486-4522-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
References: <1530602486-4522-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-networking][PATCH 2/8] open-isns: upgrade 0.97 -> 0.98
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
X-List-Received-Date: Tue, 03 Jul 2018 07:21:31 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-util.h-endian.h-is-available-on-musl-on-linux.patch          | 4 ++--
 .../open-isns/{open-isns_0.97.bb => open-isns_0.98.bb}                | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/open-isns/{open-isns_0.97.bb => open-isns_0.98.bb} (96%)

diff --git a/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
index 825e2bf..fbdc4e9 100644
--- a/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
+++ b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
@@ -13,10 +13,10 @@ include/libisns/util.h:114:12: fatal error: sys/endian.h: No such file or direct
  #  include <sys/endian.h>
             ^~~~~~~~~~~~~~
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
 Upstream-Status: Submitted
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  include/libisns/util.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.98.bb
similarity index 96%
rename from meta-networking/recipes-support/open-isns/open-isns_0.97.bb
rename to meta-networking/recipes-support/open-isns/open-isns_0.98.bb
index abfa751..5e64f89 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.98.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/open-iscsi/open-isns \
            file://0001-util.h-endian.h-is-available-on-musl-on-linux.patch \
            "
 
-SRCREV ?= "09954404e948e41eb0fce8e28836018b4ce3d20d"
+SRCREV = "e84374ce7d1f5fc58a4c0fc751e075b2cc752c34"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


