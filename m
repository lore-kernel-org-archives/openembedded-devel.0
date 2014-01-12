Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 85E706B5DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2014 17:54:23 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id o10so2862909eaj.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jan 2014 09:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=koippfj4IbVNgm8j/iXHf1il9fjybkPHOh0ECcYDJdk=;
	b=I3ZWnSbc+7M2KFRyR8AWFx2y9GGyh5PoqXwHJ2A3dC5PEWwWM88lylGSCHrDAeoIzZ
	9glir0AnzLca22FRo8i7z1NPRGJ/lEayAeMv5+YcoZvk9nIRKcKHsXqqu+5KqEB3gzzy
	hJtSZN/3dIZoX/aTRK5HSdm5WemFV7KDMVRL4NIoXgrXK+8kaxqnQpyW8WzpMhnFlFQS
	FSJrVFDILJ8W+6iMO7OPSjNtt070CTC5DGNt+tzVYhKoSiicHfitx37YuWWu7kvanDJV
	iBxTmKCqw9W4omzWECF8llrK2TzafNhhWYYlATQidWddu/GEmflsloWP3ssU34m3ZgP7
	zvDA==
X-Received: by 10.15.42.133 with SMTP id u5mr22412110eev.47.1389549264191;
	Sun, 12 Jan 2014 09:54:24 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm32834879een.13.2014.01.12.09.54.23
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Jan 2014 09:54:23 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Jan 2014 18:54:35 +0100
Message-Id: <1389549275-4775-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <1389549275-4775-1-git-send-email-Martin.Jansa@gmail.com>
References: <1389549275-4775-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-efl][WIP][PATCH 3/3] enjoy: Upgrade to version from git
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
X-List-Received-Date: Sun, 12 Jan 2014 17:54:24 -0000

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


