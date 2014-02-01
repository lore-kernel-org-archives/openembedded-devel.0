Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id F360E6EB37
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:32 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id b15so2620517eek.18
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=TUSiqn06/g6lVY1bumF5631E/SV5cSvw/S+1gHFElG8=;
	b=m+WOdOWghvNcblQgvPbvbwSMwMdu+cfh8xHVY3vWkLG0c7P73QmeOZO9elIkNyNyOz
	6bnl+fclM+1c5LLgoU4ABSzrk46cGbo4KqW9OakeOlNs4NAAxYD6HwHCgbyIf5eT7y+q
	Iee0BT+ue93YjkfOwPrEnOj09r+5fc7CiUb3ki2FK00XyTlQV9sAg7icg09kcUokCPV7
	LLWIIFTBZYY+4TLhsYxm1kRmXyj+8Ve2HFikineCKCssVtCKPyJRGck/KDgCW760kEeY
	IPFdZvEBYTa+SUr9pbQMvQqrbCrKCD+Enh8dkU1RlH2FmvxU7ONTCiwxh7EPWhMzwEIO
	ytng==
X-Received: by 10.14.32.67 with SMTP id n43mr29948434eea.17.1391240073433;
	Fri, 31 Jan 2014 23:34:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id x2sm46265638eeo.8.2014.01.31.23.34.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:32 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:34:08 +0100
Message-Id: <b46a34319c6cab245085f497d34a36f93880b89d.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 12/20] enjoy: switch from svn to newer git and update dependency from edbus2 to eldbus
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:33 -0000

* edbus2 was renamed to eldbus and is now included in efl source tree

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ays-use-position-as-percent-and-define-a-1-second.patch | 14 +++++++-------
 meta-efl/recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb}    | 12 +++++-------
 2 files changed, 12 insertions(+), 14 deletions(-)
 rename meta-efl/recipes-efl/e17/{enjoy_svn.bb => enjoy_git.bb} (88%)

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
similarity index 88%
rename from meta-efl/recipes-efl/e17/enjoy_svn.bb
rename to meta-efl/recipes-efl/e17/enjoy_git.bb
index 2e1a8a2..c9ff070 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_git.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Enjoy music player"
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary emotion lightmediascanner edbus2 gst-plugins-good"
-SRCREV = "${EFL_SRCREV}"
-PV = "0.0+svnr${SRCPV}"
+DEPENDS = "evas ecore edje elementary emotion lightmediascanner eldbus gst-plugins-good"
 
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
1.8.5.3


