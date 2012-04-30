Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOoFO-0003tC-5g
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 12:54:26 +0200
Received: by wgbds1 with SMTP id ds1so2151092wgb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xGg2Fv1iqi0bWBPYx/CayGUCuu5mEtBE2TJxblpyGio=;
	b=KXNfhGmIik38GcwAU2IgFXRsFCXHAUmoyTnv/5Fp4+1/D8gFFtgfO/n/wiIoNfSc36
	YDr6o2kqpgARGJwwlHjO94TK9gkVqPAVCEIihaOtsC0XQLz9OEwM0zpSxHqD7bfJ4o07
	Ng3IvAttE2XyTuIRANMdatmo5AMoEGARG8lJhmXHmoLJOOWyCskY89XxhQt6PEuI1BR5
	8TnuBlahK62KFQZQnOFuQZcUS1T1rsHReZOgBvoXDUjbdQ1F47CmvD2+yBAdurqVtcZo
	1VF6LRf8HffP6NU0J7ezzziLsT/dlD180O2LZuSJyGR6xjpZCAbTj6WxMbQKkxbyIOEu
	P6Ag==
Received: by 10.180.104.137 with SMTP id ge9mr16555396wib.20.1335782684541;
	Mon, 30 Apr 2012 03:44:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e6sm27650646wix.8.2012.04.30.03.44.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 03:44:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 12:44:37 +0200
Message-Id: <1335782677-14226-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335766581.git.Martin.Jansa@gmail.com>
References: <cover.1335766581.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 7/7] gtkmathview: fix build with gcc-4.7
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
X-List-Received-Date: Mon, 30 Apr 2012 10:54:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../mml-widget/gtkmathview/mathview-gcc47x.diff    |   48 ++++++++++++++++++++
 .../mml-widget/gtkmathview_0.8.0.bb                |    3 +-
 2 files changed, 50 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff

diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff b/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff
new file mode 100644
index 0000000..11b7260
--- /dev/null
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview/mathview-gcc47x.diff
@@ -0,0 +1,48 @@
+../../../src/frontend/common/TemplateBuilder.hh:50:113: warning: 'linkerAssoc' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
+../../../src/frontend/common/TemplateBuilder.hh:50:113: note: declarations in dependent base 'custom_reader_Builder' are not found by unqualified lookup
+../../../src/frontend/common/TemplateBuilder.hh:50:113: note: use 'this->linkerAssoc' instead
+../../../src/frontend/common/TemplateBuilder.hh:54:111: error: redeclaration of 'SmartPtr<BoxMLDecorElement> elem'
+../../../src/frontend/common/TemplateBuilder.hh:50:49: error: 'SmartPtr<BoxMLDecorElement> elem' previously declared here
+../../../src/frontend/common/TemplateBuilder.hh:55:2: warning: 'linkerAdd' was not declared in this scope, and no declarations were found by argument-dependent lookup at the point of instantiation [-fpermissive]
+../../../src/frontend/common/TemplateBuilder.hh:55:2: note: declarations in dependent base 'custom_reader_Builder' are not found by unqualified lookup
+../../../src/frontend/common/TemplateBuilder.hh:55:2: note: use 'this->linkerAdd' instead
+
+--- gtkmathview-0.8.0.orig/src/frontend/common/TemplateBuilder.hh	2007-08-17 12:02:34.000000000 +0200
++++ gtkmathview-0.8.0/src/frontend/common/TemplateBuilder.hh	2012-04-30 11:45:07.000000000 +0200
+@@ -47,12 +47,13 @@
+   SmartPtr<typename ElementBuilder::type>
+   getElement(const typename Model::Element& el) const
+   {
+-    if (SmartPtr<typename ElementBuilder::type> elem = smart_cast<typename ElementBuilder::type>(linkerAssoc(el)))
++    SmartPtr<typename ElementBuilder::type> elem = NULL;
++    if (elem = smart_cast<typename ElementBuilder::type>(this->linkerAssoc(el)))
+       return elem;
+     else
+       {
+-	SmartPtr<typename ElementBuilder::type> elem = ElementBuilder::type::create(ElementBuilder::getContext(*this));
+-	linkerAdd(el, elem);
++	elem = ElementBuilder::type::create(ElementBuilder::getContext(*this));
++	this->linkerAdd(el, elem);
+ 	return elem;
+       }
+   }
+--- gtkmathview-0.8.0.orig/mathmlsvg/main.cc	2012-04-30 11:35:19.000000000 +0200
++++ gtkmathview-0.8.0/mathmlsvg/main.cc	2012-04-30 11:51:19.000000000 +0200
+@@ -20,6 +20,7 @@
+ 
+ #include <cassert>
+ #include <fstream>
++#include <unistd.h>
+ #include <string.h>
+ #include <popt.h>
+ 
+--- gtkmathview-0.8.0.orig/mathmlps/main.cc	2012-04-30 11:35:19.000000000 +0200
++++ gtkmathview-0.8.0/mathmlps/main.cc	2012-04-30 11:50:57.000000000 +0200
+@@ -20,6 +20,7 @@
+ 
+ #include <cassert>
+ #include <fstream>
++#include <unistd.h>
+ #include <string.h>
+ #include <popt.h>
+ 
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index c8e611a..67cb325 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -4,10 +4,11 @@ DEPENDS = "t1lib gtk+ popt libxslt libxml2"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://helm.cs.unibo.it/mml-widget/sources/${P}.tar.gz \
            file://mathview-gcc43x.diff \
+           file://mathview-gcc47x.diff \
 	  "
 SRC_URI[md5sum] = "b53564e553728d4b69f7d366dfeb5299"
 SRC_URI[sha256sum] = "1dc30175da6a3c560a7d62d1abe1c2f9829d988e6f1a7c5e766544575c558c43"
-- 
1.7.8.6



