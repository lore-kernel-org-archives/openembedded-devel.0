Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RK6G7-0006fd-Em
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Oct 2011 12:35:27 +0200
Received: by mail-fx0-f47.google.com with SMTP id s16so4799631faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Oct 2011 03:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QTZa1M1UQx0HuZV1ZbiXOyPU7ZDGs/p0waMBdED5DoE=;
	b=HgRRsrGUQrF5yVAQ7H+JX5rcCdhuZStVZNBofrOdnvqRMgt5D8aSdwR9mFP0D8XeOe
	GL6dOj/Ob3M8uCZOd7g0qmEScu2scuHOZpAH5e4R3/kcTYVNCLNwk5p6nEuVMlZyaEOj
	UKfmmMsvkE0HyGifP9TKmVI1nvU1Nw3bcvSc0=
Received: by 10.223.91.68 with SMTP id l4mr12960181fam.16.1319884167379;
	Sat, 29 Oct 2011 03:29:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j5sm23343245faf.14.2011.10.29.03.29.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 29 Oct 2011 03:29:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Oct 2011 12:28:58 +0200
Message-Id: <ead11c69e964463ef96baa7c4ed058d4da719fed.1319884094.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
References: <eeffc3b2de8e5277ef3184874b88e4e382fa72c8.1319884094.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1319884094.git.Martin.Jansa@gmail.com>
References: <cover.1319884094.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 02/12] xserver-common_1.34: patch Xserver to add support for gta04
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
X-List-Received-Date: Sat, 29 Oct 2011 10:35:27 -0000

From: Klaus Kurzmann <mok@fluxnetz.de>

Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-common-1.34/Xserver.gta04.patch        |   32 ++++++++++++++++++++
 .../xserver-common/xserver-common_1.34.bb          |    1 +
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
new file mode 100644
index 0000000..8a17c9a
--- /dev/null
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common-1.34/Xserver.gta04.patch
@@ -0,0 +1,32 @@
+From 95d741d6849a2faddf8c1e930c7250ead90e7bed Mon Sep 17 00:00:00 2001
+From: Klaus Kurzmann <mok@fluxnetz.de>
+Date: Thu, 20 Oct 2011 09:05:43 +0200
+Subject: [PATCH] gta04
+
+Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
+---
+ X11/xserver-common |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/X11/xserver-common b/X11/xserver-common
+index 448b262..208bbfd 100644
+--- a/X11/xserver-common
++++ b/X11/xserver-common
+@@ -161,6 +161,14 @@ else
+                 ARGS="$ARGS -dpi ${DPI} -nocursor"
+             fi
+             ;;
++        "gta04")
++            DPI="280"
++            if [ "$XSERVER" != "Xorg" ] ; then
++                ARGS="$ARGS -screen ${SCREEN_SIZE}"
++            else
++                ARGS="$ARGS -dpi ${DPI} -nocursor"
++            fi
++            ;;
+         "motorola_ezx_platform")
+             ARGS="$ARGS -screen 240x320"
+             DPI="170" ;;
+-- 
+1.7.7
+
diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 6e4fe2e..4f99a90 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -22,6 +22,7 @@ SRC_URI_append = " \
                    file://Xserver.n900.patch \
                    file://Xserver.nexuss.patch \
                    file://Xserver.nexusone.patch \
+                   file://Xserver.gta04.patch \
 "
 
 
-- 
1.7.7.1



