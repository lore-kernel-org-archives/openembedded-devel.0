Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8854974739
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2018 23:56:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5NNuQsg026969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jun 2018 16:56:27 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Sat, 23 Jun 2018 16:56:26 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sat, 23 Jun 2018 16:56:26 -0700
Message-ID: <20180623235626.228940-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/1] metacity: allow for warnings during compilation
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
X-List-Received-Date: Sat, 23 Jun 2018 23:56:26 -0000
Content-Type: text/plain

Add a PACKAGECONFIG option which lets us permit warnings during
compilation until warnings from new compiler versions are
dealt with.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
index ce97a80..948c2f1 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.28.0.bb
@@ -23,6 +23,11 @@ SRCREV = "c0d4b2fc0fcd6f2d3c37da935923f9e9ed5eb99f"
 
 EXTRA_OECONF += "--disable-xinerama"
 
+PACKAGECONFIG ?= ""
+
+# enable as neccessary until new warnings are dealt with
+PACKAGECONFIG[noWerror] = "--disable-Werror,,,"
+
 do_configure_prepend() {
     cd ${S}
     aclocal --install || exit 1
-- 
2.7.4


