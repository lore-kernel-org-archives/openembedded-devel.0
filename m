Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RL9nU-0008NW-0q
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 09:34:16 +0100
Received: by faas16 with SMTP id s16so6983585faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 01:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QTZa1M1UQx0HuZV1ZbiXOyPU7ZDGs/p0waMBdED5DoE=;
	b=kBL98mNbYEzRc9wtHBfXD/LoqV/dMzu8MTnQltmJA/yiZMVxpGWa8rmcIKX73me18C
	Av+sA3Vv/ehwDUqUq1Op3sCP1TIqW54r+GD9eMzfcXCb0u4riSNpM4XrLZ16dYo280sV
	j5i4dIDWLaO7kWiJco7gGJaxbuL0O7iaqqpcM=
Received: by 10.223.81.196 with SMTP id y4mr35501750fak.6.1320136089076;
	Tue, 01 Nov 2011 01:28:09 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a8sm43346471faa.11.2011.11.01.01.28.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 Nov 2011 01:28:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2011 09:27:36 +0100
Message-Id: <71361373f9823de0b82d7a92be782469d5d22b4e.1320135926.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7.1
In-Reply-To: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
References: <58fda822fdf64f38e5d75e75c5cf4a196a37e47e.1320135926.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1320135926.git.Martin.Jansa@gmail.com>
References: <cover.1320135926.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][meta-oe 02/15] xserver-common_1.34: patch Xserver to add support for gta04
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
X-List-Received-Date: Tue, 01 Nov 2011 08:34:16 -0000

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



