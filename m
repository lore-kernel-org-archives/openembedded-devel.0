Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCFA6F923
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 03:40:28 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id lx4so8675068iec.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 20:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ev014V8fypzZBdIWugiFntMzb+2bOgFrdHgwzVWbD1Q=;
	b=PCD/EeDrF2f9xd24I1gFWlDdWgIzXAngL9aSueyj3e0zBO9ygu6ikRSy6FD2cJ2iZA
	5jSonXepKnG4rcTmfWRABDNjF5ffNwYfnp1QOZOaHSApvQh2XhpsESpESyuoIScPxCrK
	qSCQRRM6s/OfVY2CGqWstRjbP2M0YAFclTRshE40nVQNbkAc4zk2CQVJu5BcDohuSuOf
	4Y9UrSPWNaz46T1cR2Pr8bxtiCvdcLuQFH2iULlAYIEWOB+nmiPhOyFLoPnuW5NjZ5lQ
	COoIjfKF8qUN+ehDR+o839wExBQTkutziHk50KXpPoTaaN6C+jkG/2Rwxoousbz6ClV3
	EFRg==
X-Gm-Message-State: ALoCoQnO8eidpgU+YavrY218RVHqSTNKcwCfD838lWL4fgllbuqYzQ5pi/e7xkT+Sfqdrxwougtt
X-Received: by 10.42.33.65 with SMTP id h1mr10355813icd.72.1396323629902;
	Mon, 31 Mar 2014 20:40:29 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id gd5sm29556295igd.5.2014.03.31.20.40.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 20:40:29 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 23:39:27 -0400
Message-Id: <1396323568-18135-4-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-oe][PATCH 3/4] gtkmathview: fix build error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Apr 2014 03:40:30 -0000

When building, I was seeing the following error which this patch fixes:

	../../../src/frontend/common/TemplateElementIterator.hh:46:18: error:
	'valid' was not declared in this scope, and no declarations were found by
	argument-dependent lookup at the point of instantiation [-fpermissive]

Upstream-Status: Submitted [padovani .at. di .dot. unito .dot. it]
Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 .../mml-widget/gtkmathview/qualify-lookup.diff              | 13 +++++++++++++
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb    |  1 +
 2 files changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff b/meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff
new file mode 100644
index 0000000..1d48950
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff
@@ -0,0 +1,13 @@
+Index: gtkmathview-0.8.0/src/frontend/common/TemplateElementIterator.hh
+===================================================================
+--- gtkmathview-0.8.0.orig/src/frontend/common/TemplateElementIterator.hh
++++ gtkmathview-0.8.0/src/frontend/common/TemplateElementIterator.hh
+@@ -43,7 +43,7 @@ protected:
+   findValidNodeForward(const typename Model::Node& p0) const
+   {
+     for (typename Model::Node p = p0; p; p = Model::getNextSibling(p))
+-      if (valid(p)) return Model::asElement(p);
++      if (this->valid(p)) return Model::asElement(p);
+     return typename Model::Element();
+   }
+     
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 61f4b9d..bc4b4cb 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -12,6 +12,7 @@ PR = "r3"
 SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
            file://mathview-gcc43x.diff \
            file://mathview-gcc47x.diff \
+           file://qualify-lookup.diff \
 "
 SRC_URI[md5sum] = "b53564e553728d4b69f7d366dfeb5299"
 SRC_URI[sha256sum] = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43"
-- 
1.9.0


