Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TB02C-0005c6-AU
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 11:12:00 +0200
Received: by eaad12 with SMTP id d12so681471eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2012 01:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=tdYx+igMiJUf1ch1ck074zy7nHoS/1U0qQ9BF05wdus=;
	b=q59O+8Rk0uOwZ6JIlBKDs0JumKtmdROxKwuPPNdVrby6I3tZOZyHn1WgWD24E4VMoh
	YOUnE3WPNtyO/hS701IH+vMC2a1kaJGVd1AQr32SWCjq+WInDjkT6QEYJ22a9QrMU2TQ
	W024gQ+YLX1BCj1P74GXF6d8GexiFyU5WsdL2kDAghWkXTTglMAuDnfzbSePdM0DZuC2
	xDiDk5hnpf5WmbS0g2KhzKKLqeyDrkcwgGdI6itlkd1tIa55PJ2aiMgC0jcpI7sgNuP/
	NR6+BUJ0FfTQRnlAZeo8Y0Wtjes1YDKDq+VVFZBg9Zv+8z/+zZJPQu2Ojxn//FWacRpf
	7nXQ==
Received: by 10.204.129.4 with SMTP id m4mr3423563bks.55.1347267570882;
	Mon, 10 Sep 2012 01:59:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm6295346bkc.3.2012.09.10.01.59.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 01:59:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2012 10:59:24 +0200
Message-Id: <1347267564-25036-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Subject: [meta-oe][meta-efl][PATCH] meta-efl: enjoy: Fix SHR bug #2058
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
X-List-Received-Date: Mon, 10 Sep 2012 09:12:00 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

The bug is located here:
  http://www.shr-project.org/trac/ticket/2058

The patch will probably be sent upstream by its author.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
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



