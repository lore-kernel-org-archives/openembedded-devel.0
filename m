Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDF6CCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 05:40:25 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.8257.1761889220006646521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Oct 2025 22:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout12.t-online.de (Postfix) with SMTP id F0F47EA5E
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 06:40:17 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.34.215]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vEhrv-0xcaSf0; Fri, 31 Oct 2025 06:40:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] fluidsynth: update 2.4.5 -> 2.4.8
Date: Fri, 31 Oct 2025 06:39:59 +0100
Message-ID: <20251031054006.1901920-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1761889211-8BFFCA4B-A8A879A9/0/0 CLEAN NORMAL
X-TOI-MSGID: 80eda054-760a-4ebd-bcdb-5d4571cda151
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 05:40:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121223

- Remove 0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
  It doesn't apply anymore and following the according pull request the
  issue seems to be fixed
---
 ...te_float-Allow-zero-pointer-for-left.patch | 178 ------------------
 ...luidsynth_2.4.5.bb =3D> fluidsynth_2.4.8.bb} |   3 +-
 2 files changed, 1 insertion(+), 180 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsy=
nth/0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.4.5.b=
b =3D> fluidsynth_2.4.8.bb} (93%)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/000=
2-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch b/meta-multi=
media/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid_synth_nwrite_fl=
oat-Allow-zero-pointer-for-left.patch
deleted file mode 100644
index f7debc5ad4..0000000000
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/0002-fluid=
_synth_nwrite_float-Allow-zero-pointer-for-left.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 300977537b6056bdbbba9df9100fa6e891ca1f44 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Mon, 17 Dec 2018 14:08:45 +0100
-Subject: [PATCH 2/2] fluid_synth_nwrite_float: Allow zero pointer for
- left/right and zero pointer in arrays
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-With this modification a client can define exactly what it wants to get =
into
-buffers to avoid useless copying of data. On weak machines this leads to=
 measurable
-performance wins.
-
-Upstream-Status: Submitted [1]
-
-[1] https://github.com/FluidSynth/fluidsynth/pull/490
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- src/synth/fluid_synth.c | 69 ++++++++++++++++++++++++++++-------------
- 1 file changed, 48 insertions(+), 21 deletions(-)
-
-diff --git a/src/synth/fluid_synth.c b/src/synth/fluid_synth.c
-index 1eb5d737..6c876efa 100644
---- a/src/synth/fluid_synth.c
-+++ b/src/synth/fluid_synth.c
-@@ -3628,10 +3628,10 @@ fluid_synth_program_reset(fluid_synth_t *synth)
-  *
-  * @param synth FluidSynth instance
-  * @param len Count of audio frames to synthesize
-- * @param left Array of float buffers to store left channel of planar a=
udio (as many as \c synth.audio-channels buffers, each of \c len in size)
-- * @param right Array of float buffers to store right channel of planar=
 audio (size: dito)
-- * @param fx_left Since 1.1.7: If not \c NULL, array of float buffers t=
o store left effect channels (as many as \c synth.effects-channels buffer=
s, each of \c len in size)
-- * @param fx_right Since 1.1.7: If not \c NULL, array of float buffers =
to store right effect channels (size: dito)
-+ * @param left Array of float buffers to store left channel of planar a=
udio (as many as \c synth.audio-channels buffers, each of \c len in size)=
. Since 2.0.3: NULL allowed / NULL allowed for array entry
-+ * @param right Array of float buffers to store right channel of planar=
 audio (size: dito). Since 2.0.3: NULL allowed / NULL allowed for array e=
ntry
-+ * @param fx_left Since 1.1.7: If not \c NULL, array of float buffers t=
o store left effect channels (as many as \c synth.effects-channels buffer=
s, each of \c len in size). Since 2.0.3: NULL allowed for array entry
-+ * @param fx_right Since 1.1.7: If not \c NULL, array of float buffers =
to store right effect channels (size: dito). Since 2.0.3: NULL allowed fo=
r array entry
-  * @return #FLUID_OK on success, #FLUID_FAILED otherwise
-  *
-  * First effect channel used by reverb, second for chorus.
-@@ -3719,15 +3719,27 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
-         for(i =3D 0; i < synth->audio_channels; i++)
-         {
- #ifdef WITH_FLOAT
--            FLUID_MEMCPY(left[i], &left_in[i * FLUID_BUFSIZE * FLUID_MI=
XER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
--            FLUID_MEMCPY(right[i], &right_in[i * FLUID_BUFSIZE * FLUID_=
MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
-+            if(left !=3D NULL && left[i] !=3D NULL)
-+            {
-+                FLUID_MEMCPY(left[i], &left_in[i * FLUID_BUFSIZE * FLUI=
D_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
-+            }
-+            if(right !=3D NULL && right[i] !=3D NULL)
-+            {
-+                FLUID_MEMCPY(right[i], &right_in[i * FLUID_BUFSIZE * FL=
UID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
-+            }
- #else //WITH_FLOAT
-             int j;
-=20
-             for(j =3D 0; j < num; j++)
-             {
--                left[i][j] =3D (float) left_in[i * FLUID_BUFSIZE * FLUI=
D_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
--                right[i][j] =3D (float) right_in[i * FLUID_BUFSIZE * FL=
UID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
-+                if(left !=3D NULL && left[i] !=3D NULL)
-+                {
-+                    left[i][j] =3D (float) left_in[i * FLUID_BUFSIZE * =
FLUID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
-+                }
-+                if(right !=3D NULL && right[i] !=3D NULL)
-+                {
-+                    right[i][j] =3D (float) right_in[i * FLUID_BUFSIZE =
* FLUID_MIXER_MAX_BUFFERS_DEFAULT + j + synth->cur];
-+                }
-             }
-=20
- #endif //WITH_FLOAT
-@@ -3737,12 +3749,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
-         {
- #ifdef WITH_FLOAT
-=20
--            if(fx_left !=3D NULL)
-+            if(fx_left !=3D NULL && fx_left[i] !=3D NULL)
-             {
-                 FLUID_MEMCPY(fx_left[i], &fx_left_in[i * FLUID_BUFSIZE =
* FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
-             }
-=20
--            if(fx_right !=3D NULL)
-+            if(fx_right !=3D NULL && fx_right[i] !=3D NULL)
-             {
-                 FLUID_MEMCPY(fx_right[i], &fx_right_in[i * FLUID_BUFSIZ=
E * FLUID_MIXER_MAX_BUFFERS_DEFAULT + synth->cur], bytes);
-             }
-@@ -3750,7 +3762,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
- #else //WITH_FLOAT
-             int j;
-=20
--            if(fx_left !=3D NULL)
-+            if(fx_left !=3D NULL && fx_left[i] !=3D NULL)
-             {
-                 for(j =3D 0; j < num; j++)
-                 {
-@@ -3758,7 +3770,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
-                 }
-             }
-=20
--            if(fx_right !=3D NULL)
-+            if(fx_right !=3D NULL && fx_right[i] !=3D NULL)
-             {
-                 for(j =3D 0; j < num; j++)
-                 {
-@@ -3789,15 +3801,30 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
-         for(i =3D 0; i < synth->audio_channels; i++)
-         {
- #ifdef WITH_FLOAT
--            FLUID_MEMCPY(left[i] + count, &left_in[i * FLUID_BUFSIZE * =
FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
--            FLUID_MEMCPY(right[i] + count, &right_in[i * FLUID_BUFSIZE =
* FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
-+            if(left !=3D NULL && left[i] !=3D NULL)
-+            {
-+                FLUID_MEMCPY(left[i] + count, &left_in[i * FLUID_BUFSIZ=
E * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
-+            }
-+            if(right !=3D NULL && right[i] !=3D NULL)
-+            {
-+                FLUID_MEMCPY(right[i] + count, &right_in[i * FLUID_BUFS=
IZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
-+            }
- #else //WITH_FLOAT
-             int j;
-=20
--            for(j =3D 0; j < num; j++)
-+            if(left !=3D NULL && left[i] !=3D NULL)
-+            {
-+                for(j =3D 0; j < num; j++)
-+                {
-+                    left[i][j + count] =3D (float) left_in[i * FLUID_BU=
FSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
-+                }
-+            }
-+            if(right !=3D NULL && right[i] !=3D NULL)
-             {
--                left[i][j + count] =3D (float) left_in[i * FLUID_BUFSIZ=
E * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
--                right[i][j + count] =3D (float) right_in[i * FLUID_BUFS=
IZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
-+                for(j =3D 0; j < num; j++)
-+                {
-+                    right[i][j + count] =3D (float) right_in[i * FLUID_=
BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT + j];
-+                }
-             }
-=20
- #endif //WITH_FLOAT
-@@ -3807,12 +3834,12 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, i=
nt len,
-         {
- #ifdef WITH_FLOAT
-=20
--            if(fx_left !=3D NULL)
-+            if(fx_left !=3D NULL && fx_left[i] !=3D NULL)
-             {
-                 FLUID_MEMCPY(fx_left[i] + count, &fx_left_in[i * FLUID_=
BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
-             }
-=20
--            if(fx_right !=3D NULL)
-+            if(fx_right !=3D NULL && fx_right[i] !=3D NULL)
-             {
-                 FLUID_MEMCPY(fx_right[i] + count, &fx_right_in[i * FLUI=
D_BUFSIZE * FLUID_MIXER_MAX_BUFFERS_DEFAULT], bytes);
-             }
-@@ -3820,7 +3847,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
- #else //WITH_FLOAT
-             int j;
-=20
--            if(fx_left !=3D NULL)
-+            if(fx_left !=3D NULL && fx_left[i] !=3D NULL)
-             {
-                 for(j =3D 0; j < num; j++)
-                 {
-@@ -3828,7 +3855,7 @@ fluid_synth_nwrite_float(fluid_synth_t *synth, int=
 len,
-                 }
-             }
-=20
--            if(fx_right !=3D NULL)
-+            if(fx_right !=3D NULL && fx_right[i] !=3D NULL)
-             {
-                 for(j =3D 0; j < num; j++)
-                 {
---=20
-2.14.5
-
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4=
.5.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.8.bb
similarity index 93%
rename from meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.=
5.bb
rename to meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.8.=
bb
index b8396209c5..9d76546641 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.5.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.4.8.bb
@@ -8,10 +8,9 @@ DEPENDS =3D "glib-2.0"
=20
 SRC_URI =3D " \
     git://github.com/FluidSynth/fluidsynth.git;branch=3Dmaster;protocol=3D=
https \
-    file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.pat=
ch \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.pat=
ch \
 "
-SRCREV =3D "9f2edaa3cbd456997cb420fb68b6f960faaafd12"
+SRCREV =3D "70a10b365c707c73bd340e28970601d52d425d8c"
=20
=20
 inherit cmake pkgconfig lib_package
--=20
2.51.0


