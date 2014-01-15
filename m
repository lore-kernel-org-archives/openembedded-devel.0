Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id EE8446E372
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 17:17:50 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so899664eek.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2014 09:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=koippfj4IbVNgm8j/iXHf1il9fjybkPHOh0ECcYDJdk=;
	b=M7URZGp/hRD9+gTemwwTrZXGedZ+WEOyA18NfOYHBCzWEwWsyGw/amm6XkOxtxOqoD
	aFYGk/Ls0Vy7JOnPOOl8vFCyr5tuWISlTCEj1THZHCAa6Twp4BIkvxl9eXvcwuBWHBzo
	On0aFQttlGDiezbQMP2xh6K/QnCGuFPTaJ29D6gWnCT5oC6VylvqRs6K+X08HfJoxLiv
	xd7CzGFkrE8i0Q9pnbeMs40sBrBBRzVnogl1TdzshNbo7bzTJWonLuvXet0LRq9oUcIB
	CaQCuGQzUEK7bRvwMJMNb9nLKfS/PWQ+AWJgY947Ad28RxXDscjhea6af2I4qIIAjLff
	oi1g==
X-Received: by 10.15.54.72 with SMTP id s48mr5225895eew.3.1389806270326;
	Wed, 15 Jan 2014 09:17:50 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 4sm11751978eed.14.2014.01.15.09.17.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Jan 2014 09:17:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2014 18:17:53 +0100
Message-Id: <dabf67fe7720722885251ef69cfb7d390183d9d4.1389805976.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389805976.git.Martin.Jansa@gmail.com>
References: <cover.1389805976.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCHv2 3/7] enjoy: Upgrade to version from git
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
X-List-Received-Date: Wed, 15 Jan 2014 17:17:51 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ays-use-position-as-percent-and-define-a-1-second.patch | 14 +++++++-------
 meta-efl/recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb}    | 10 ++++------
 2 files changed, 11 insertions(+), 13 deletions(-)
 rename meta-efl/recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb} (90%)

diff --git a/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch b/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
index 45f02b7..0962450 100644
--- a/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
+++ b/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
@@ -1,4 +1,4 @@
-From ac4c8a57e8a042acd4b8ff803d3d3574b0e7a7fb Mon Sep 17 00:00:00 2001
+From 751505501e0db31cf766ec0ae95a6968b4d1eb93 Mon Sep 17 00:00:00 2001
 From: Alban Browaeys <prahal@yahoo.com>
 Date: Wed, 5 Sep 2012 02:58:26 +0000
 Subject: [PATCH] always use position as percent and define a 1 seconds
@@ -7,12 +7,12 @@ Subject: [PATCH] always use position as percent and define a 1 seconds
 Fix "reverb" effect: ie loop between setting the slider to match
 the position and handling slider to position (seek).
 ---
- data/themes/default.edc |    8 +++-----
- src/bin/win.c           |   28 ++++++++++++++++++++++------
+ data/themes/default.edc |  8 +++-----
+ src/bin/win.c           | 28 ++++++++++++++++++++++------
  2 files changed, 25 insertions(+), 11 deletions(-)
 
 diff --git a/data/themes/default.edc b/data/themes/default.edc
-index 65efddf..27bb9e4 100644
+index ebf8ba4..7a906b1 100644
 --- a/data/themes/default.edc
 +++ b/data/themes/default.edc
 @@ -186,7 +186,6 @@ collections {
@@ -42,7 +42,7 @@ index 65efddf..27bb9e4 100644
              } else if (type == MSG_INT && id == MSG_SHUFFLE) {
                 external_param_set_bool(PART:"buttons.shuffle", "state", getarg(2));
              } else if (type == MSG_INT && id == MSG_LOOP) {
-@@ -687,7 +685,7 @@ collections {
+@@ -689,7 +687,7 @@ collections {
              source: "progress.slider";
              signal: "changed";
              script {
@@ -52,7 +52,7 @@ index 65efddf..27bb9e4 100644
           }
           program {
 diff --git a/src/bin/win.c b/src/bin/win.c
-index 63951db..ad93ab5 100644
+index 2f65953..428e268 100644
 --- a/src/bin/win.c
 +++ b/src/bin/win.c
 @@ -194,8 +194,8 @@ _win_play_eval(Win *w)
@@ -129,5 +129,5 @@ index 63951db..ad93ab5 100644
  }
  
 -- 
-1.7.7
+1.8.5.2
 
diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_git.bb
similarity index 90%
rename from meta-efl/recipes-efl/e17/enjoy_svn.bb
rename to meta-efl/recipes-efl/e17/enjoy_git.bb
index aa99898..c9ff070 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_git.bb
@@ -2,9 +2,9 @@ DESCRIPTION = "Enjoy music player"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 DEPENDS = "evas ecore edje elementary emotion lightmediascanner eldbus gst-plugins-good"
-SRCREV = "${EFL_SRCREV}"
-PV = "0.0+svnr${SRCPV}"
 
+SRCREV = "aa8fec69e885eec048a849c2b34059ec58404e02"
+PV = "0.1.0+gitr${SRCPV}"
 
 #1st needed for all formats
 #2nd needed for mp3 playback
@@ -20,12 +20,10 @@ RDEPENDS_${PN} += "\
 
 inherit e gettext
 SRC_URI = " \
-    ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+    git://git.enlightenment.org/apps/enjoy.git \
     file://0001-always-use-position-as-percent-and-define-a-1-second.patch \
 "
-S = "${WORKDIR}/${SRCNAME}"
-
-PR = "r1"
+S = "${WORKDIR}/git"
 
 FILES_${PN} += "${datadir}/icons/"
 
-- 
1.8.5.2


