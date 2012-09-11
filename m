Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBRVb-0006s5-33
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 16:32:11 +0200
Received: by eaad12 with SMTP id d12so272023eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kUfUGjKcemBU2CEbkAxGNo52M9xwqfftN8ogTBJvNFs=;
	b=eLiXGVNLyvgL5Kta151qR62YqPLE26I98scBoDlDR/PeJ3pKEBGPjnmyp30HVmrGKE
	vZZZWmnCT0TgBX3O/g3pXVSyRddNqSdTDTvZKSmbP5Gf41zu+m6K/VbLqaM9oetqgPts
	z1XgdrqpPe5whB15hIR+4btxJjvnzrxmPcK12yZ13NkCLvSKbzk5jUYVBcZ3Afl9ANGE
	nrD+tQEn5fXhZYqO7p+BxyCZRHmM9RVKUN+WmJGB7wn4+3xg+tyKr3SHK7rTYAb6YwP+
	fSfNKMNREyzk3wonW62Dw+m00x/otyZps6vjJOHY/AYaXGzAtsdZLi/fWlVxlMhoODYJ
	kD9w==
Received: by 10.205.126.13 with SMTP id gu13mr4772752bkc.79.1347373177001;
	Tue, 11 Sep 2012 07:19:37 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hs2sm9792082bkc.1.2012.09.11.07.19.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 07:19:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Sep 2012 16:19:02 +0200
Message-Id: <fac9e9c8b523ae617f348a0a3c8a9e31f55a1c0d.1347363666.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1347363666.git.Martin.Jansa@gmail.com>
References: <cover.1347363666.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 4/5] meta-efl: enjoy: fix scrolling
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
X-List-Received-Date: Tue, 11 Sep 2012 14:32:11 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

* [SHR bug #2058] http://www.shr-project.org/trac/ticket/2058
* [EFL bug #1477] http://trac.enlightenment.org/e/ticket/1477

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...position-as-percent-and-define-a-1-second.patch | 133 +++++++++++++++++++++
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |   7 +-
 2 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch

diff --git a/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch b/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
new file mode 100644
index 0000000..45f02b7
--- /dev/null
+++ b/meta-efl/recipes-efl/e17/enjoy/0001-always-use-position-as-percent-and-define-a-1-second.patch
@@ -0,0 +1,133 @@
+From ac4c8a57e8a042acd4b8ff803d3d3574b0e7a7fb Mon Sep 17 00:00:00 2001
+From: Alban Browaeys <prahal@yahoo.com>
+Date: Wed, 5 Sep 2012 02:58:26 +0000
+Subject: [PATCH] always use position as percent and define a 1 seconds
+ tolerance.
+
+Fix "reverb" effect: ie loop between setting the slider to match
+the position and handling slider to position (seek).
+---
+ data/themes/default.edc |    8 +++-----
+ src/bin/win.c           |   28 ++++++++++++++++++++++------
+ 2 files changed, 25 insertions(+), 11 deletions(-)
+
+diff --git a/data/themes/default.edc b/data/themes/default.edc
+index 65efddf..27bb9e4 100644
+--- a/data/themes/default.edc
++++ b/data/themes/default.edc
+@@ -186,7 +186,6 @@ collections {
+    group {
+       name: "nowplaying";
+       script {
+-         public cur_length;
+          public mute;
+ 
+          public get_time_str(Float:time, time_str[6])
+@@ -201,16 +200,15 @@ collections {
+                new Float:position = getfarg(2);
+                new Float:length = getfarg(3);
+                if (length > 0)
+-                  external_param_set_float(PART:"progress.slider", "value", position / length * 100);
++                  external_param_set_float(PART:"progress.slider", "value", position * 100);
+                else
+                   external_param_set_float(PART:"progress.slider", "value", 0);
+ 
+                new time_str[6];
+-               get_time_str(position, time_str);
++               get_time_str(position * length, time_str);
+                set_text(PART:"ejy.text.current_time", time_str);
+                get_time_str(length, time_str);
+                set_text(PART:"ejy.text.total_time", time_str);
+-               set_float(cur_length, length);
+             } else if (type == MSG_INT && id == MSG_SHUFFLE) {
+                external_param_set_bool(PART:"buttons.shuffle", "state", getarg(2));
+             } else if (type == MSG_INT && id == MSG_LOOP) {
+@@ -687,7 +685,7 @@ collections {
+             source: "progress.slider";
+             signal: "changed";
+             script {
+-               send_message(MSG_FLOAT, MSG_POSITION, (external_param_get_float(PART:"progress.slider", "value") * get_float(cur_length) / 100));
++               send_message(MSG_FLOAT, MSG_POSITION, (external_param_get_float(PART:"progress.slider", "value") / 100));
+             }
+          }
+          program {
+diff --git a/src/bin/win.c b/src/bin/win.c
+index 63951db..ad93ab5 100644
+--- a/src/bin/win.c
++++ b/src/bin/win.c
+@@ -194,8 +194,8 @@ _win_play_eval(Win *w)
+ {
+    Edje_Message_Float_Set *mf;
+ 
+-   w->play.position = emotion_object_position_get(w->emotion);
+    w->play.length = emotion_object_play_length_get(w->emotion);
++   w->play.position = emotion_object_position_get(w->emotion) / w->play.length;
+ 
+    if ((w->song) && (w->song->length != (int)w->play.length))
+       db_song_length_set(w->db, w->song, w->play.length);
+@@ -542,8 +542,14 @@ _win_edje_msg(void *data, Evas_Object *o __UNUSED__, Edje_Message_Type type, int
+          else
+            {
+               Edje_Message_Float *m = msg;
++
++              if ((((m->val - w->play.position) * w->play.length) < 1.0)
++                  && (((w->play.position - m->val) * w->play.length) < 1.0))
++                  return;
++
+               w->play.position = m->val;
+-              emotion_object_position_set(w->emotion, w->play.position);
++              emotion_object_position_set(w->emotion, w->play.position
++                                                            * w->play.length);
+               ecore_event_add(ENJOY_EVENT_POSITION_CHANGE, NULL, NULL, NULL);
+            }
+         break;
+@@ -617,16 +623,21 @@ enjoy_control_seek(uint64_t position)
+ {
+    Win *w = &_win;
+    double seek_to;
++   double new_pos = w->play.length / ((double)position / 1e6);
+ 
+    if (!w->db) return;
+-   seek_to = w->play.position + w->play.length / ((double)position / 1e6);
++
++   if ((((new_pos - w->play.position) * w->play.length) < 1.0)
++       && (((w->play.position - new_pos) * w->play.length) < 1.0)) return;
++
++   seek_to = w->play.position + new_pos;
+    if (seek_to <= 0.0)
+      seek_to = 0.0;
+    else if (seek_to >= 1.0)
+      seek_to = 1.0;
+ 
+    w->play.position = seek_to;
+-   emotion_object_position_set(w->emotion, w->play.position);
++   emotion_object_position_set(w->emotion, w->play.position * w->play.length);
+    ecore_event_add(ENJOY_EVENT_POSITION_CHANGE, NULL, NULL, NULL);
+ }
+ 
+@@ -692,15 +703,20 @@ EAPI void
+ enjoy_position_set(int32_t position)
+ {
+    Win *w = &_win;
++   double new_pos = w->play.length / ((double)position / 1e6);
+ 
+    if (!w->db) return;
+-   w->play.position = w->play.length / ((double)position / 1e6);
++
++   if ((((new_pos - w->play.position) * w->play.length) < 1.0)
++       && (((w->play.position - new_pos) * w->play.length) < 1.0)) return;
++
++   w->play.position = new_pos;
+    if (w->play.position < 0.0)
+      w->play.position = 0.0;
+    else if (w->play.position > 1.0)
+      w->play.position = 1.0;
+ 
+-   emotion_object_position_set(w->emotion, w->play.position);
++   emotion_object_position_set(w->emotion, w->play.position * w->play.length);
+    ecore_event_add(ENJOY_EVENT_POSITION_CHANGE, NULL, NULL, NULL);
+ }
+ 
+-- 
+1.7.7
+
diff --git a/meta-efl/recipes-efl/e17/enjoy_svn.bb b/meta-efl/recipes-efl/e17/enjoy_svn.bb
index 06998cf..cfeb001 100644
--- a/meta-efl/recipes-efl/e17/enjoy_svn.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_svn.bb
@@ -21,9 +21,14 @@ RDEPENDS += "\
        "
 
 inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
+SRC_URI = " \
+  ${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep \
+  file://0001-always-use-position-as-percent-and-define-a-1-second.patch \
+"
 S = "${WORKDIR}/${SRCNAME}"
 
+PR = "r1"
+
 FILES_${PN} += "${datadir}/icons/"
 
 EXTRA_OECONF = "\
-- 
1.7.12



