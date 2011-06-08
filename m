Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QUBy6-0007m9-9m
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 08:10:18 +0200
Received: by bwz5 with SMTP id 5so160577bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jun 2011 23:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references;
	bh=lBxSAPb5kYsAUSx45obHOoIVdXv7HpNVh8wX60XCv2w=;
	b=l1pPZkk4V1OHCnwtRS8qE37/0KUmtvROnbG7WMnZ5+xzA4sYCkeNQX2SZof7AkKfPH
	4JSAEML3Wvnj6dLnCI4po39zVHywD22sq4F7FNCErt4TaafRTJPzmRPFLSN+o/Uzkz9F
	CL62wzn4XL9flqsn+U38di9xU2jhneLMTXMxg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xtMOTLshyrBi1XUlLjPU7FTTpVC2IpTayj6ZZ+kDq9Mfhs9d+lSXB0cu1w4GwtOCEp
	5uxuoPkDmXh5FsQa8ZtGPqdMm8DkTwpMyYA1rh/Yu2a4np+fH+0UNLAIHobH5XXQvTIi
	Itm2dPAwSQ/aY/xn9/OQggIXtmKa/HtYohfYM=
Received: by 10.204.84.217 with SMTP id k25mr272929bkl.54.1307513212242;
	Tue, 07 Jun 2011 23:06:52 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id 16sm209759bkm.2.2011.06.07.23.06.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 23:06:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2011 08:06:40 +0200
Message-Id: <d2cf15d6df1c555f8647365ee0358cd3b942376a.1307513108.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.3
In-Reply-To: <9b79d5dee5765c2d9e8a1489244eccdfb0870e12.1307513108.git.Martin.Jansa@gmail.com>
References: <9b79d5dee5765c2d9e8a1489244eccdfb0870e12.1307513108.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1307513108.git.Martin.Jansa@gmail.com>
References: <cover.1307513108.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 2/3] eve: update LICENSE fields and remove patch applied upstream
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
X-List-Received-Date: Wed, 08 Jun 2011 06:10:18 -0000

* context menu was removed completely in r59455
* add LIC_FILES_CHKSUM
* fix LICENSE
* add gettext to inherit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...unconditional-ewk_view_context_menu_forwa.patch |   34 --------------------
 meta-efl/recipes-efl/e17/eve_svn.bb                |    7 ++--
 2 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/eve/0001-eve-remove-unconditional-ewk_view_context_menu_forwa.patch

diff --git a/meta-efl/recipes-efl/e17/eve/0001-eve-remove-unconditional-ewk_view_context_menu_forwa.patch b/meta-efl/recipes-efl/e17/eve/0001-eve-remove-unconditional-ewk_view_context_menu_forwa.patch
deleted file mode 100644
index bb86e98..0000000
--- a/meta-efl/recipes-efl/e17/eve/0001-eve-remove-unconditional-ewk_view_context_menu_forwa.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From cff40dddea01d217fc3789c2c8e3337ea2ec34b7 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 21 Feb 2011 10:29:47 +0100
-Subject: [PATCH] eve: remove unconditional ewk_view_context_menu_forward_event call
-
-* ewk_view_context_menu_forward_event is not available in ewebkit lib (only in API)
-  after https://bugs.webkit.org/show_bug.cgi?id=51530
----
- src/bin/view.c |    9 +++++++--
- 1 files changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/src/bin/view.c b/src/bin/view.c
-index d743d75..5493b20 100644
---- a/src/bin/view.c
-+++ b/src/bin/view.c
-@@ -1200,8 +1200,13 @@ _view_smart_mouse_down(Ewk_View_Smart_Data *esd, const Evas_Event_Mouse_Down *ev
-    return EINA_TRUE;
- 
- forward_event:
--   if (ev->button == 3) // forward of context menu event is special
--      return ewk_view_context_menu_forward_event(sd->base.self, ev);
-+   /* https://bugs.webkit.org/show_bug.cgi?id=51530 
-+    * made ewk_view_context_menu_forward_event conditionally available
-+    * but didn't change it in ewk_view.h, so this compiles fine, but later
-+    * linker fails. Remove this part here temporary before proper solution is found
-+    * if (ev->button == 3) // forward of context menu event is special
-+    *   return ewk_view_context_menu_forward_event(sd->base.self, ev);
-+    */
- 
-    /* If we should forward/feed event using parent class method, then
-     * just do it and do NOT create an animator. See _view_smart_mouse_up().
--- 
-1.7.4.1
-
diff --git a/meta-efl/recipes-efl/e17/eve_svn.bb b/meta-efl/recipes-efl/e17/eve_svn.bb
index d324c55..2cec0fd 100644
--- a/meta-efl/recipes-efl/e17/eve_svn.bb
+++ b/meta-efl/recipes-efl/e17/eve_svn.bb
@@ -1,16 +1,17 @@
 DESCRIPTION = " Enlightenment Web Browser"
-LICENSE = "GPL"
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary webkit-efl"
 PV = "0.3.0.0+svnr${SRCPV}"
 PR = "r1"
 SRCREV = "${EFL_SRCREV}"
 
-inherit e
+inherit e gettext
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI += "file://eve-theme-for-smaller-screens.patch \
-            file://0001-eve-remove-unconditional-ewk_view_context_menu_forwa.patch"
+"
 
 EXTRA_OECONF = "\
   --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-- 
1.7.5.3



