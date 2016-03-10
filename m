Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B6FEB6FF6B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2016 06:34:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2A6YbKc002100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Mar 2016 22:34:37 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 9 Mar 2016 22:34:36 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Mar 2016 14:33:10 +0800
Message-ID: <5ff92ad8e8c41034a7880fb0a5210b76c2557f5f.1457591235.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1457591235.git.jackie.huang@windriver.com>
References: <cover.1457591235.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] waf-samba.bbclass: move to meta-networking
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
X-List-Received-Date: Thu, 10 Mar 2016 06:34:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The recipes that are using waf-samba were all
moved to meta-networking, so move the bbclass
and related cross-answers files as well.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 {meta-oe => meta-networking}/classes/waf-samba.bbclass                 | 0
 meta-networking/conf/layer.conf                                        | 3 +++
 {meta-oe => meta-networking}/files/waf-cross-answers/README            | 0
 .../files/waf-cross-answers/cross-answers-aarch64.txt                  | 0
 .../files/waf-cross-answers/cross-answers-arm.txt                      | 0
 .../files/waf-cross-answers/cross-answers-i586.txt                     | 0
 .../files/waf-cross-answers/cross-answers-i686.txt                     | 0
 .../files/waf-cross-answers/cross-answers-mips.txt                     | 0
 .../files/waf-cross-answers/cross-answers-mips64.txt                   | 0
 .../files/waf-cross-answers/cross-answers-powerpc.txt                  | 0
 .../files/waf-cross-answers/cross-answers-powerpc64.txt                | 0
 .../files/waf-cross-answers/cross-answers-x86_64.txt                   | 0
 meta-oe/conf/layer.conf                                                | 1 -
 13 files changed, 3 insertions(+), 1 deletion(-)
 rename {meta-oe => meta-networking}/classes/waf-samba.bbclass (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/README (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-aarch64.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-arm.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-i586.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-i686.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-mips.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-mips64.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-powerpc.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-powerpc64.txt (100%)
 rename {meta-oe => meta-networking}/files/waf-cross-answers/cross-answers-x86_64.txt (100%)

diff --git a/meta-oe/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
similarity index 100%
rename from meta-oe/classes/waf-samba.bbclass
rename to meta-networking/classes/waf-samba.bbclass
diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer.conf
index 63bb07d..5fd636a 100644
--- a/meta-networking/conf/layer.conf
+++ b/meta-networking/conf/layer.conf
@@ -18,3 +18,6 @@ LAYERDEPENDS_networking-layer += "openembedded-layer"
 LAYERDEPENDS_networking-layer += "meta-python"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
+
+# used by waf-samba.bbclass
+WAF_CROSS_ANSWERS_PATH = "${LAYERDIR}/files/waf-cross-answers"
diff --git a/meta-oe/files/waf-cross-answers/README b/meta-networking/files/waf-cross-answers/README
similarity index 100%
rename from meta-oe/files/waf-cross-answers/README
rename to meta-networking/files/waf-cross-answers/README
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-aarch64.txt b/meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-aarch64.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-aarch64.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-arm.txt b/meta-networking/files/waf-cross-answers/cross-answers-arm.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-arm.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-arm.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-i586.txt b/meta-networking/files/waf-cross-answers/cross-answers-i586.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-i586.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-i586.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-i686.txt b/meta-networking/files/waf-cross-answers/cross-answers-i686.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-i686.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-i686.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-mips.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-mips.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-mips.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-mips64.txt b/meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-mips64.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-mips64.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-powerpc.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-powerpc.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-powerpc.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-powerpc64.txt b/meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-powerpc64.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-powerpc64.txt
diff --git a/meta-oe/files/waf-cross-answers/cross-answers-x86_64.txt b/meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
similarity index 100%
rename from meta-oe/files/waf-cross-answers/cross-answers-x86_64.txt
rename to meta-networking/files/waf-cross-answers/cross-answers-x86_64.txt
diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 7237964..3182138 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -30,7 +30,6 @@ LAYERVERSION_openembedded-layer = "1"
 LAYERDEPENDS_openembedded-layer = "core"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-WAF_CROSS_ANSWERS_PATH = "${LAYERDIR}/files/waf-cross-answers"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
   mplayer-common \
-- 
1.9.1


