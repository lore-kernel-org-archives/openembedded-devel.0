Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Bernhard.Guillon@opensimpad.org>) id 1PM7eA-0001Xn-LF
	for openembedded-devel@lists.openembedded.org;
	Sat, 27 Nov 2010 00:24:07 +0100
Received: from localhost (95-90-74-25-dynip.superkabel.de [95.90.74.25])
	by dd20204.kasserver.com (Postfix) with ESMTP id C7C591805A69B;
	Sat, 27 Nov 2010 00:22:51 +0100 (CET)
From: Bernhard.Guillon@opensimpad.org
To: openembedded-devel@lists.openembedded.org
Date: Sat, 27 Nov 2010 00:22:50 +0100
Message-Id: <1290813770-5958-1-git-send-email-Bernhard.Guillon@opensimpad.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
References: <AANLkTi=SB9wuO4wcTXz3M5fYb2WyO09_pK3ooA+i4xgo@mail.gmail.com>
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: Bernhard.Guillon@opensimpad.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] x264-r2245: add a hack for uclibc - replace log2f(x) with logf(x)/logf(2)
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
X-List-Received-Date: Fri, 26 Nov 2010 23:24:07 -0000

From: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>


Signed-off-by: Bernhard Guillon <Bernhard.Guillon@opensimpad.org>
---
 recipes/vlc/x264-r2245/uclibc_log2f_fix.HACK.patch |   61 ++++++++++++++++++++
 recipes/vlc/x264_r2245.bb                          |    6 +-
 2 files changed, 64 insertions(+), 3 deletions(-)
 create mode 100644 recipes/vlc/x264-r2245/uclibc_log2f_fix.HACK.patch

diff --git a/recipes/vlc/x264-r2245/uclibc_log2f_fix.HACK.patch b/recipes/vlc/x264-r2245/uclibc_log2f_fix.HACK.patch
new file mode 100644
index 0000000..874a0ca
--- /dev/null
+++ b/recipes/vlc/x264-r2245/uclibc_log2f_fix.HACK.patch
@@ -0,0 +1,61 @@
+diff -Nur x264-snapshot-20100531-2245.vanilla/encoder/analyse.c x264-snapshot-20100531-2245/encoder/analyse.c
+--- x264-snapshot-20100531-2245.vanilla/encoder/analyse.c	2010-05-31 22:45:11.000000000 +0200
++++ x264-snapshot-20100531-2245/encoder/analyse.c	2010-08-20 02:52:11.505161943 +0200
+@@ -251,7 +251,7 @@
+     for( int i = 0; i <= 2*4*2048; i++ )
+     {
+         h->cost_mv[lambda][-i] =
+-        h->cost_mv[lambda][i]  = lambda * (log2f(i+1)*2 + 0.718f + !!i) + .5f;
++        h->cost_mv[lambda][i]  = lambda * ( (logf(i+1)/logf(2))*2 + 0.718f + !!i) + .5f;
+     }
+     x264_pthread_mutex_lock( &cost_ref_mutex );
+     for( int i = 0; i < 3; i++ )
+diff -Nur x264-snapshot-20100531-2245.vanilla/encoder/encoder.c x264-snapshot-20100531-2245/encoder/encoder.c
+--- x264-snapshot-20100531-2245.vanilla/encoder/encoder.c	2010-05-31 22:45:11.000000000 +0200
++++ x264-snapshot-20100531-2245/encoder/encoder.c	2010-08-20 02:53:58.516661776 +0200
+@@ -479,8 +479,8 @@
+     if( h->param.rc.i_rc_method == X264_RC_CQP )
+     {
+         float qp_p = h->param.rc.i_qp_constant;
+-        float qp_i = qp_p - 6*log2f( h->param.rc.f_ip_factor );
+-        float qp_b = qp_p + 6*log2f( h->param.rc.f_pb_factor );
++        float qp_i = qp_p - 6*(logf(h->param.rc.f_ip_factor)/logf(2));
++        float qp_b = qp_p + 6*(logf(h->param.rc.f_pb_factor)/logf(2));
+         h->param.rc.i_qp_min = x264_clip3( (int)(X264_MIN3( qp_p, qp_i, qp_b )), 0, 51 );
+         h->param.rc.i_qp_max = x264_clip3( (int)(X264_MAX3( qp_p, qp_i, qp_b ) + .999), 0, 51 );
+         h->param.rc.i_aq_mode = 0;
+diff -Nur x264-snapshot-20100531-2245.vanilla/encoder/ratecontrol.c x264-snapshot-20100531-2245/encoder/ratecontrol.c
+--- x264-snapshot-20100531-2245.vanilla/encoder/ratecontrol.c	2010-05-31 22:45:11.000000000 +0200
++++ x264-snapshot-20100531-2245/encoder/ratecontrol.c	2010-08-20 02:55:26.752661912 +0200
+@@ -549,8 +549,8 @@
+         rc->last_non_b_pict_type = SLICE_TYPE_I;
+     }
+ 
+-    rc->ip_offset = 6.0 * log2f( h->param.rc.f_ip_factor );
+-    rc->pb_offset = 6.0 * log2f( h->param.rc.f_pb_factor );
++    rc->ip_offset = 6.0 * (logf( h->param.rc.f_ip_factor )/logf(2));
++    rc->pb_offset = 6.0 * (logf( h->param.rc.f_pb_factor )/logf(2));
+     rc->qp_constant[SLICE_TYPE_P] = h->param.rc.i_qp_constant;
+     rc->qp_constant[SLICE_TYPE_I] = x264_clip3( h->param.rc.i_qp_constant - rc->ip_offset + 0.5, 0, 51 );
+     rc->qp_constant[SLICE_TYPE_B] = x264_clip3( h->param.rc.i_qp_constant + rc->pb_offset + 0.5, 0, 51 );
+@@ -1154,7 +1154,7 @@
+             if( zone->b_force_qp )
+                 q += zone->i_qp - rc->qp_constant[SLICE_TYPE_P];
+             else
+-                q -= 6*log2f( zone->f_bitrate_factor );
++                q -= 6*(logf( zone->f_bitrate_factor )/logf(2));
+         }
+     }
+ 
+diff -Nur x264-snapshot-20100531-2245.vanilla/encoder/set.c x264-snapshot-20100531-2245/encoder/set.c
+--- x264-snapshot-20100531-2245.vanilla/encoder/set.c	2010-05-31 22:45:11.000000000 +0200
++++ x264-snapshot-20100531-2245/encoder/set.c	2010-08-20 02:58:19.400661820 +0200
+@@ -234,7 +234,7 @@
+         sps->vui.i_max_bytes_per_pic_denom = 0;
+         sps->vui.i_max_bits_per_mb_denom = 0;
+         sps->vui.i_log2_max_mv_length_horizontal =
+-        sps->vui.i_log2_max_mv_length_vertical = (int)log2f( X264_MAX( 1, param->analyse.i_mv_range*4-1 ) ) + 1;
++        sps->vui.i_log2_max_mv_length_vertical = (int)(logf( X264_MAX( 1, param->analyse.i_mv_range*4-1 ))/logf(2))  + 1;
+     }
+ }
+ 
diff --git a/recipes/vlc/x264_r2245.bb b/recipes/vlc/x264_r2245.bb
index f533bfc..f685c63 100644
--- a/recipes/vlc/x264_r2245.bb
+++ b/recipes/vlc/x264_r2245.bb
@@ -1,10 +1,12 @@
 DESCRIPTION = "H.264 encoder"
 LICENSE = "GPL"
-PR = "r7"
+PR = "r8"
 
 X264PV = "snapshot-20100531-2245"
 
 SRC_URI = "http://download.videolan.org/pub/videolan/x264/snapshots/x264-${X264PV}.tar.bz2"
+SRC_URI_append_libc-uclibc = "file://uclibc_log2f_fix.HACK.patch" 
+
 SRC_URI[md5sum] = "d1ccb8122bd418291a9576a2bffdf662"
 SRC_URI[sha256sum] = "929e946947701a0b3a336a4b9cfe65daf4c52480f45d4363335ae2a3d5596fa9"
 
@@ -24,5 +26,3 @@ X264_DISABLE_ASM_x86 = ""
 DEPENDS_x86 = "yasm-native"
 
 EXTRA_OECONF = '--enable-shared ${X264_DISABLE_ASM} --extra-cflags="${X264_ECFLAGS}"'
-
-
-- 
1.7.1



