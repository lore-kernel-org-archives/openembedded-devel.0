Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QeaSi-0008Cz-U7
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 00:20:53 +0200
Received: by yib18 with SMTP id 18so199502yib.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2J4shhOKf3LEHlvRgjPhFw3AT4bHLnjfmLXv+5AQ6kQ=;
	b=ceZOKWOTD2sxRLkijf9NzL2FkLE/cGuB8Aw8Eh4Ep1CeQy8vLcE2ddU8CptMhJKQWe
	B64WESIttZ+lFYt3fiMSpBnz3XxrdUz3P6XarmkwhbG0BhqiLmGXG4yJ3Iu3HYoRQ31W
	AcbpU8OShox3FeomUrfOUQeAfPfnNOH5LrCd0=
Received: by 10.236.77.66 with SMTP id c42mr92747yhe.481.1309990621812;
	Wed, 06 Jul 2011 15:17:01 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id h70sm5970583yhk.1.2011.07.06.15.17.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jul 2011 15:17:01 -0700 (PDT)
From: Joel A Fernandes <agnel.joel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Jul 2011 17:14:07 -0500
Message-Id: <1309990447-4283-1-git-send-email-agnel.joel@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: joelagnel@ti.com, Joel A Fernandes <agnel.joel@gmail.com>, jdk@ti.com,
	k-kooi@ti.com
Subject: [PATCH v2] libxml: Deleted patch that is already applied in source tarball
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2011 22:20:53 -0000

* Deleted a patch that appears to be already applied to the checked out source and is causing do_patch in libxml2 to fail

Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
---
Changes since previous patch:
 Update commit summary to be more relevant.

Not sure if should bump the PR in this case? If not, please ignore this note

 .../0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch |   29 --------------------
 recipes/libxml/libxml2_2.7.8.bb                    |    1 -
 2 files changed, 0 insertions(+), 30 deletions(-)
 delete mode 100644 recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch

diff --git a/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch b/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch
deleted file mode 100644
index f94350d..0000000
--- a/recipes/libxml/libxml2-2.7.8/0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0cbeb50ee03ce582a0c979c70d8fbf030e270c37 Mon Sep 17 00:00:00 2001
-From: Daniel Veillard <veillard@redhat.com>
-Date: Mon, 15 Nov 2010 11:06:29 +0000
-Subject: Fix a potential memory access error
-
-in case of a previus allocation error
----
-diff --git a/xpath.c b/xpath.c
-index 4d6826d..81e33f6 100644
---- a/xpath.c
-+++ b/xpath.c
-@@ -3575,13 +3575,13 @@ xmlXPathNodeSetAdd(xmlNodeSetPtr cur, xmlNodePtr val) {
-     } else if (cur->nodeNr == cur->nodeMax) {
-         xmlNodePtr *temp;
- 
--        cur->nodeMax *= 2;
--	temp = (xmlNodePtr *) xmlRealloc(cur->nodeTab, cur->nodeMax *
-+	temp = (xmlNodePtr *) xmlRealloc(cur->nodeTab, cur->nodeMax * 2 *
- 				      sizeof(xmlNodePtr));
- 	if (temp == NULL) {
- 	    xmlXPathErrMemory(NULL, "growing nodeset\n");
- 	    return;
- 	}
-+        cur->nodeMax *= 2;
- 	cur->nodeTab = temp;
-     }
-     if (val->type == XML_NAMESPACE_DECL) {
---
-cgit v0.8.3.1
diff --git a/recipes/libxml/libxml2_2.7.8.bb b/recipes/libxml/libxml2_2.7.8.bb
index 1a71c2b..7d0c451 100644
--- a/recipes/libxml/libxml2_2.7.8.bb
+++ b/recipes/libxml/libxml2_2.7.8.bb
@@ -1,7 +1,6 @@
 require libxml2.inc
 
 SRC_URI += "\
-  file://0cbeb50ee03ce582a0c979c70d8fbf030e270c37.patch \
   file://df83c17e5a2646bd923f75e5e507bc80d73c9722.patch \
   file://fec31bcd452e77c10579467ca87a785b41115de6.patch \
   file://00819877651b87842ed878898ba17dba489820f0.patch \
-- 
1.7.0.4



