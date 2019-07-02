Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B01C07E9EC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 01:58:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x621wEE3010326
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Jul 2019 18:58:15 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Mon, 1 Jul 2019 18:58:14 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 2 Jul 2019 09:58:06 +0800
Message-ID: <1562032691-128301-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562032691-128301-1-git-send-email-changqing.li@windriver.com>
References: <1562032691-128301-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/6 V2] waf-samba: switch to python3
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
X-List-Received-Date: Tue, 02 Jul 2019 01:58:13 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

refer this link:
https://github.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314#diff-ddc0f7d4ad007f8ee36297b5887dcd24

waf will support python3 by default, so switch to python3

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-networking/classes/waf-samba.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/classes/waf-samba.bbclass
index 1632c3c..9c32952 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -1,9 +1,9 @@
 # waf is a build system which is used by samba related project.
 # Obtain details from https://wiki.samba.org/index.php/Waf
 #
-inherit qemu pythonnative
+inherit qemu python3native
 
-DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python"
+DEPENDS += "qemu-native libxslt-native docbook-xsl-stylesheets-native python3"
 
 CONFIGUREOPTS = " --prefix=${prefix} \
                   --bindir=${bindir} \
@@ -111,7 +111,7 @@ do_configure() {
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 do_compile () {
-    python ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
+    python3 ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)}
 }
 
 do_install() {
-- 
2.7.4


