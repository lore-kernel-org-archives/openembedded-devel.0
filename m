Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id A855E7708A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2016 08:28:28 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aNcVg-0002wr-98 from Awais_Belal@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2016 00:28:28 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-02.mgc.mentorg.com ([137.202.0.106]) with mapi id
	14.03.0224.002; Mon, 25 Jan 2016 08:28:27 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] mplayer2: fix building with gcc 5.x
Thread-Index: AQHRUfnsKMqE01ObOk+5/p9/aHAxv58L8Lg6
Date: Mon, 25 Jan 2016 08:28:26 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB80B33@EU-MBX-02.mgc.mentorg.com>
References: <1453126128-17005-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1453126128-17005-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] mplayer2: fix building with gcc 5.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jan 2016 08:28:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Monday, January 18, 2016 7:08 PM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] [meta-oe][PATCH] mplayer2: fix building with gcc 5.x=0A=
=0A=
This patch works around a potential problem in the theora=0A=
glue code where it assumes that the compiler will=0A=
somehow find a function which is not exported explicitly=0A=
through the libtheora library. Due to this problem the=0A=
build fails with gcc-5.x compiler.=0A=
The included patch essentially backports a commit which=0A=
updates the glue code to use the Theora 1.0 API to=0A=
eliminate this problem and PNBLACKLIST is cleared=0A=
for mplayer2.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 ...artially-port-libtheora-glue-code-to-Theo.patch | 136 +++++++++++++++++=
++++=0A=
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |   4 +-=0A=
 2 files changed, 137 insertions(+), 3 deletions(-)=0A=
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_=
ogg-partially-port-libtheora-glue-code-to-Theo.patch=0A=
=0A=
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-par=
tially-port-libtheora-glue-code-to-Theo.patch b/meta-oe/recipes-multimedia/=
mplayer/mplayer2/0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.=
patch=0A=
new file mode 100644=0A=
index 0000000..b4d9841=0A=
--- /dev/null=0A=
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2/0001-demux_ogg-partially-=
port-libtheora-glue-code-to-Theo.patch=0A=
@@ -0,0 +1,136 @@=0A=
+From 0571bb4f1a6e1934ee7e093ce7aa517b9bac8e6a Mon Sep 17 00:00:00 2001=0A=
+From: Awais Belal <awais_belal@mentor.com>=0A=
+Date: Sun, 17 Jan 2016 14:46:10 +0500=0A=
+Subject: [PATCH] demux_ogg: partially port libtheora glue code to Theora 1=
.0=0A=
+ API=0A=
+=0A=
+This partially backports the following commit to allow building=0A=
+with gcc-5.x and otherwise fails to find the definition of=0A=
+the _ilog function the way it is used.=0A=
+=0A=
+https://github.com/pigoz/mplayer-svn/commit/85e51408cd00979fc209da8e3a39b6=
f0e7f325bc=0A=
+=0A=
+Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
+---=0A=
+ libmpdemux/demux_ogg.c | 52 ++++++++++++++++++++++++++-------------------=
-----=0A=
+ 1 file changed, 27 insertions(+), 25 deletions(-)=0A=
+=0A=
+diff --git a/libmpdemux/demux_ogg.c b/libmpdemux/demux_ogg.c=0A=
+index 9eea061..9144426 100644=0A=
+--- a/libmpdemux/demux_ogg.c=0A=
++++ b/libmpdemux/demux_ogg.c=0A=
+@@ -50,8 +50,7 @@=0A=
+ #endif=0A=
+=0A=
+ #ifdef CONFIG_OGGTHEORA=0A=
+-#include <theora/theora.h>=0A=
+-int _ilog (unsigned int); /* defined in many places in theora/lib/ */=0A=
++#include <theora/theoradec.h>=0A=
+ #endif=0A=
+=0A=
+ #define BLOCK_SIZE 4096=0A=
+@@ -62,9 +61,10 @@ int _ilog (unsigned int); /* defined in many places in =
theora/lib/ */=0A=
+  */=0A=
+ #ifdef CONFIG_OGGTHEORA=0A=
+ typedef struct theora_struct_st {=0A=
+-    theora_state   st;=0A=
+-    theora_comment cc;=0A=
+-    theora_info    inf;=0A=
++    th_setup_info *tsi;=0A=
++    th_dec_ctx    *tctx;=0A=
++    th_comment     tc;=0A=
++    th_info        ti;=0A=
+ } theora_struct_t;=0A=
+ #endif=0A=
+=0A=
+@@ -117,7 +117,7 @@ typedef struct ogg_stream {=0A=
+     float   samplerate; /// granulpos 2 time=0A=
+     int64_t lastpos;=0A=
+     int32_t lastsize;=0A=
+-    int     keyframe_frequency_force;=0A=
++    int     keyframe_granule_shift;=0A=
+=0A=
+     // Logical stream state=0A=
+     ogg_stream_state stream;=0A=
+@@ -300,11 +300,10 @@ static unsigned char *demux_ogg_read_packet(ogg_stre=
am_t *os, ogg_packet *pack,=0A=
+            have theora_state st, until all header packets were passed to =
the=0A=
+            decoder. */=0A=
+         if (!pack->bytes || !(*data&0x80)) {=0A=
+-            int keyframe_granule_shift =3D _ilog(os->keyframe_frequency_f=
orce - 1);=0A=
+-            int64_t iframemask =3D (1 << keyframe_granule_shift) - 1;=0A=
++            int64_t iframemask =3D iframemask =3D (1 << os->keyframe_gran=
ule_shift) - 1;=0A=
+=0A=
+             if (pack->granulepos >=3D 0) {=0A=
+-                os->lastpos  =3D pack->granulepos >> keyframe_granule_shi=
ft;=0A=
++                os->lastpos  =3D pack->granulepos >> os->keyframe_granule=
_shift;=0A=
+                 os->lastpos +=3D pack->granulepos & iframemask;=0A=
+                 *keyframe =3D (pack->granulepos & iframemask) =3D=3D 0;=
=0A=
+             } else {=0A=
+@@ -888,14 +887,15 @@ int demux_ogg_open(demuxer_t *demuxer)=0A=
+ #ifdef CONFIG_OGGTHEORA=0A=
+         } else if (pack.bytes >=3D 7 && !strncmp (&pack.packet[1], "theor=
a", 6)) {=0A=
+             int errorCode =3D 0;=0A=
+-            theora_info inf;=0A=
+-            theora_comment cc;=0A=
++            th_info ti;=0A=
++            th_comment tc;=0A=
++            th_setup_info *tsi =3D NULL;=0A=
+=0A=
+-            theora_info_init (&inf);=0A=
+-            theora_comment_init (&cc);=0A=
++            th_info_init (&ti);=0A=
++            th_comment_init (&tc);=0A=
+=0A=
+-            errorCode =3D theora_decode_header (&inf, &cc, &pack);=0A=
+-            if (errorCode) {=0A=
++            errorCode =3D th_decode_headerin(&ti, &tc, &tsi, &pack);=0A=
++            if (errorCode < 0) {=0A=
+                 mp_msg(MSGT_DEMUX, MSGL_ERR,=0A=
+                        "Theora header parsing failed: %i \n", errorCode);=
=0A=
+             } else {=0A=
+@@ -904,30 +904,32 @@ int demux_ogg_open(demuxer_t *demuxer)=0A=
+                 sh_v->bih =3D calloc(1, sizeof(*sh_v->bih));=0A=
+                 sh_v->bih->biSize        =3D sizeof(*sh_v->bih);=0A=
+                 sh_v->bih->biCompression =3D sh_v->format =3D FOURCC_THEO=
RA;=0A=
+-                sh_v->fps =3D ((double)inf.fps_numerator) / (double)inf.f=
ps_denominator;=0A=
+-                sh_v->frametime =3D ((double)inf.fps_denominator) / (doub=
le)inf.fps_numerator;=0A=
+-                sh_v->disp_w =3D sh_v->bih->biWidth  =3D inf.frame_width;=
=0A=
+-                sh_v->disp_h =3D sh_v->bih->biHeight =3D inf.frame_height=
;=0A=
++                sh_v->fps =3D ((double)ti.fps_numerator) / (double)ti.fps=
_denominator;=0A=
++                sh_v->frametime =3D ((double)ti.fps_denominator) / (doubl=
e)ti.fps_numerator;=0A=
++                sh_v->i_bps  =3D ti.target_bitrate / 8;=0A=
++                sh_v->disp_w =3D sh_v->bih->biWidth  =3D ti.frame_width;=
=0A=
++                sh_v->disp_h =3D sh_v->bih->biHeight =3D ti.frame_height;=
=0A=
+                 sh_v->bih->biBitCount  =3D 24;=0A=
+                 sh_v->bih->biPlanes    =3D 3;=0A=
+                 sh_v->bih->biSizeImage =3D ((sh_v->bih->biBitCount / 8) *=
 sh_v->bih->biWidth * sh_v->bih->biHeight);=0A=
+                 ogg_d->subs[ogg_d->num_sub].samplerate               =3D =
sh_v->fps;=0A=
+                 ogg_d->subs[ogg_d->num_sub].theora                   =3D =
1;=0A=
+-                ogg_d->subs[ogg_d->num_sub].keyframe_frequency_force =3D =
inf.keyframe_frequency_force;=0A=
++                ogg_d->subs[ogg_d->num_sub].keyframe_granule_shift   =3D =
ti.keyframe_granule_shift;=0A=
+                 ogg_d->subs[ogg_d->num_sub].id                       =3D =
n_video;=0A=
+                 n_video++;=0A=
+                 mp_msg(MSGT_DEMUX, MSGL_INFO,=0A=
+                        "[Ogg] stream %d: video (Theora v%d.%d.%d), -vid %=
d\n",=0A=
+                        ogg_d->num_sub,=0A=
+-                       (int)inf.version_major,=0A=
+-                       (int)inf.version_minor,=0A=
+-                       (int)inf.version_subminor,=0A=
++                       (int)ti.version_major,=0A=
++                       (int)ti.version_minor,=0A=
++                       (int)ti.version_subminor,=0A=
+                        n_video - 1);=0A=
+                 if (mp_msg_test(MSGT_HEADER, MSGL_V))=0A=
+                     print_video_header(sh_v->bih, MSGL_V);=0A=
+             }=0A=
+-            theora_comment_clear(&cc);=0A=
+-            theora_info_clear(&inf);=0A=
++            th_comment_clear(&tc);=0A=
++            th_info_clear(&ti);=0A=
++            th_setup_free(tsi);=0A=
+ #endif /* CONFIG_OGGTHEORA */=0A=
+         } else if (pack.bytes >=3D 4 && !strncmp (&pack.packet[0], "fLaC"=
, 4)) {=0A=
+             sh_a =3D new_sh_audio_aid(demuxer, ogg_d->num_sub, n_audio);=
=0A=
+--=0A=
+1.9.1=0A=
+=0A=
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mplayer2_git.bb=0A=
index 2f0369a..9df4e74 100644=0A=
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb=0A=
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb67346=
3ab874e80d47fae504"=0A=
=0A=
 SRC_URI =3D "git://repo.or.cz/mplayer.git \=0A=
     file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch=
 \=0A=
+    file://0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch=
 \=0A=
 "=0A=
=0A=
 SRCREV =3D "2c378c71a4d9b1df382db9aa787b646628b4e3f9"=0A=
@@ -153,6 +154,3 @@ do_install() {=0A=
     install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/=0A=
     [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib=0A=
 }=0A=
-=0A=
-# | libmpdemux/demux_ogg.o:demux_ogg.c:function demux_ogg_read_packet: err=
or: undefined reference to '_ilog'=0A=
-PNBLACKLIST[mplayer2] ?=3D "BROKEN, fails to build with gcc-5"=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

