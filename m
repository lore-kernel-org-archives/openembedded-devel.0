Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 59B4E783FB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:51 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id p4-v6so6348051wrh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zhP1FWX+5liB3mhRPUDKH5Kz+4i/tWQztUxiqfB3PTg=;
	b=B3cPmuiFU57gfgL+pZNVpWGOb2wJEJAhDX3lY9Bx/Z7kqd07yFQPuIa0gUY+pMmwxr
	DZhVqsRdMEkCGIWS7jD769x12YvS9TA4sHvGht/NB/bQcymOe7nEsZsb4KwM43EDtUvZ
	Awo0eyD2yExjX1Os3JOSdvhjY/W2wiUF++W1rPPPUIbOT4A+nn2tO7OCWlwgw4mMou0y
	L3F/rfO/w2m5DjcVtWbyMJK+nLz2oOLsGqi0fBHT8L0gMLOf2qwU7PLZzNEJ5Y0ropU6
	RqAlcXxNg1mXv2EdSKxEvwGzm7ZFUBwAkEsjGuIPC3bg6Udt+/EO4kGn7Qs1QJMRUVsc
	3LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zhP1FWX+5liB3mhRPUDKH5Kz+4i/tWQztUxiqfB3PTg=;
	b=lsdxqNBLe+1866QJTOLefUeu0VjupTEF0eoha2MDO53tN6GzcHyBCL+gIgDb+Cb+ur
	nmNDojRc3NYe3IWOh454fch+ASAwRCgnqJKZGw+Im8QF3Tp3pzaLo/vW5EWZ4SHHTqke
	LqBJz5KHbq2wwJ7QKVjba8Of0b/piJL2M6hqSa1uHKHGmWia/vaX1x7bKtr3ItSs7kyg
	no/uGoB9ZNbRR/yfEzgGmfPHQ5RtQ4iGesoW1ZCKyNr11Xj8yRKe5rISi605l7k0DZyQ
	xLVHZv0zl4O7VeyTx4DH0ih7+2cOjRmUHBAOpuD4gi4C5+dDOc1cqfMam4haLS0VTJ3m
	VjgQ==
X-Gm-Message-State: ALKqPweZDektG8KNzoF+HnOu9yxZwyhLNOLsk/rbM8G12BFyUwqmIsb6
	6FiXkWxOn5rjyg+xAAdlKoPeHw==
X-Google-Smtp-Source: AB8JxZpnHucENq7nQrt5n+JxMGquExDG1qb2VoORNAvJ2Sok18KxQOQf+XurJUgW3mbnMvRPy+j0vA==
X-Received: by 2002:adf:9aea:: with SMTP id a97-v6mr215613wrc.21.1526066511207;
	Fri, 11 May 2018 12:21:51 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u69-v6sm2038386wma.37.2018.05.11.12.21.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:37 +0000
Message-Id: <20180511192145.7811-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-networking][PATCH 1/9] spice: import from meta-cloud-services
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
X-List-Received-Date: Fri, 11 May 2018 19:21:51 -0000

* http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/recipes-support/spice/spice_git.bb?id=19f0c979abbc72a300c0b1cb92f9328f96728f5a
* will be used by qemu-native to provide a way for headless servers
  to export accelerated (virglrenderer) graphics to remove clients

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...n-printf-to-keep-compatibility-betwe.patch |  72 +++++++++++++
 ...x-BITMAP_FMT_IS_RGB-defined-but-not-.patch |  29 +++++
 .../files/Fix-build-issues-with-gcc-7.patch   |  59 +++++++++++
 ...d-allow-separated-src-and-build-dirs.patch |  62 +++++++++++
 ...d-subdir-objects-to-AM_INIT_AUTOMAKE.patch |  29 +++++
 .../spice/files/spice-fix-CVE-2013-4282.patch | 100 ++++++++++++++++++
 .../recipes-support/spice/spice_git.bb        |  76 +++++++++++++
 7 files changed, 427 insertions(+)
 create mode 100644 meta-networking/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
 create mode 100644 meta-networking/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
 create mode 100644 meta-networking/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
 create mode 100644 meta-networking/recipes-support/spice/files/build-allow-separated-src-and-build-dirs.patch
 create mode 100644 meta-networking/recipes-support/spice/files/configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch
 create mode 100644 meta-networking/recipes-support/spice/files/spice-fix-CVE-2013-4282.patch
 create mode 100644 meta-networking/recipes-support/spice/spice_git.bb

diff --git a/meta-networking/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch b/meta-networking/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
new file mode 100644
index 0000000000..18fa8fade8
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch
@@ -0,0 +1,72 @@
+From 3cb746329ea4846bd9c65e0198e69423379b6f62 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=EC=86=8C=EB=B3=91=EC=B2=A0?= <byungchul.so@samsung.com>
+Date: Thu, 24 Apr 2014 12:26:32 +0000
+Subject: [PATCH] Use PRI macros in printf to keep compatibility between
+ 32/64bit system
+
+gcc's some integer type definitions are different between 32/64bit system.
+This causes platform dependency problem with printf function. However,
+we can avoid this problem by using PRI macros that supports platform
+independent printf.
+---
+ server/mjpeg_encoder.c | 7 ++++---
+ server/red_worker.c    | 4 ++--
+ 2 files changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/server/mjpeg_encoder.c b/server/mjpeg_encoder.c
+index aea4964..f465d88 100644
+--- a/server/mjpeg_encoder.c
++++ b/server/mjpeg_encoder.c
+@@ -23,6 +23,7 @@
+ #include "mjpeg_encoder.h"
+ #include <jerror.h>
+ #include <jpeglib.h>
++#include <inttypes.h>
+ 
+ #define MJPEG_MAX_FPS 25
+ #define MJPEG_MIN_FPS 1
+@@ -66,7 +67,7 @@ static const int mjpeg_quality_samples[MJPEG_QUALITY_SAMPLE_NUM] = {20, 30, 40,
+  * are not necessarily related to mis-estimation of the bit rate, and we would
+  * like to wait till the stream stabilizes.
+  */
+-#define MJPEG_WARMUP_TIME 3000L // 3 sec
++#define MJPEG_WARMUP_TIME 3000LL // 3 sec
+ 
+ enum {
+     MJPEG_QUALITY_EVAL_TYPE_SET,
+@@ -638,7 +639,7 @@ static void mjpeg_encoder_adjust_params_to_bit_rate(MJpegEncoder *encoder)
+ 
+     spice_debug("cur-fps=%u new-fps=%u (new/old=%.2f) |"
+                 "bit-rate=%.2f (Mbps) latency=%u (ms) quality=%d |"
+-                " new-size-avg %lu , base-size %lu, (new/old=%.2f) ",
++                " new-size-avg %"PRIu64" , base-size %"PRIu64", (new/old=%.2f) ",
+                 rate_control->fps, new_fps, ((double)new_fps)/rate_control->fps,
+                 ((double)rate_control->byte_rate*8)/1024/1024,
+                 latency,
+@@ -703,7 +704,7 @@ static void mjpeg_encoder_adjust_fps(MJpegEncoder *encoder, uint64_t now)
+ 
+         avg_fps = ((double)rate_control->adjusted_fps_num_frames*1000) /
+                   adjusted_fps_time_passed;
+-        spice_debug("#frames-adjust=%lu #adjust-time=%lu avg-fps=%.2f",
++        spice_debug("#frames-adjust=%"PRIu64" #adjust-time=%"PRIu64" avg-fps=%.2f",
+                     rate_control->adjusted_fps_num_frames, adjusted_fps_time_passed, avg_fps);
+         spice_debug("defined=%u old-adjusted=%.2f", rate_control->fps, rate_control->adjusted_fps);
+         fps_ratio = avg_fps / rate_control->fps;
+diff --git a/server/red_worker.c b/server/red_worker.c
+index 619f7bc..1871e13 100644
+--- a/server/red_worker.c
++++ b/server/red_worker.c
+@@ -2594,8 +2594,8 @@ static void red_print_stream_stats(DisplayChannelClient *dcc, StreamAgent *agent
+         mjpeg_encoder_get_stats(agent->mjpeg_encoder, &encoder_stats);
+     }
+ 
+-    spice_debug("stream=%ld dim=(%dx%d) #in-frames=%lu #in-avg-fps=%.2f #out-frames=%lu "
+-                "out/in=%.2f #drops=%lu (#pipe=%lu #fps=%lu) out-avg-fps=%.2f "
++    spice_debug("stream=%"PRIdPTR" dim=(%dx%d) #in-frames=%"PRIu64" #in-avg-fps=%.2f #out-frames=%"PRIu64" "
++                "out/in=%.2f #drops=%"PRIu64" (#pipe=%"PRIu64" #fps=%"PRIu64") out-avg-fps=%.2f "
+                 "passed-mm-time(sec)=%.2f size-total(MB)=%.2f size-per-sec(Mbps)=%.2f "
+                 "size-per-frame(KBpf)=%.2f avg-quality=%.2f "
+                 "start-bit-rate(Mbps)=%.2f end-bit-rate(Mbps)=%.2f",
+-- 
+2.10.2
+
diff --git a/meta-networking/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch b/meta-networking/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
new file mode 100644
index 0000000000..ccae5f50f2
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch
@@ -0,0 +1,29 @@
+From 85838d4c9f2322aedb99b38fffd7da95a494d8ed Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 29 Jun 2017 08:26:35 +0000
+Subject: [PATCH] red_parse_qxl: Fix BITMAP_FMT_IS_RGB defined but not used
+
+| ../../git/server/red_parse_qxl.c:367:18: error: 'BITMAP_FMT_IS_RGB'
+defined but not used [-Werror=unused-const-variable=]
+|  static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ server/red_parse_qxl.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/server/red_parse_qxl.c b/server/red_parse_qxl.c
+index 6c0b0658..cfc2da95 100644
+--- a/server/red_parse_qxl.c
++++ b/server/red_parse_qxl.c
+@@ -364,7 +364,6 @@ static int bitmap_consistent(SpiceBitmap *bitmap)
+ 
+ // This is based on SPICE_BITMAP_FMT_*, copied from server/red_worker.c
+ // to avoid a possible unoptimization from making it non static.
+-static const int BITMAP_FMT_IS_RGB[] = {0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1};
+ 
+ static SpiceImage *red_get_image(RedMemSlotInfo *slots, int group_id,
+                                  QXLPHYSICAL addr, uint32_t flags, int is_mask)
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch b/meta-networking/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
new file mode 100644
index 0000000000..7fcafdc7ef
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/Fix-build-issues-with-gcc-7.patch
@@ -0,0 +1,59 @@
+From 9f001b6818ac4baa1df010ccf4200ca56bfb11b2 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Wed, 23 Aug 2017 13:47:29 -0400
+Subject: [PATCH] Fix build issues with gcc 7
+
+gcc 7 checks for when a switch statement doesn't break between
+cases. When a break is not found you will see
+
+| ../../git/server/reds.c: In function 'vdi_port_read_one_msg_from_device':
+| ../../git/server/reds.c:797:31: error: this statement may fall through [-Werror=implicit-fallthrough=]
+|              state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
+|              ~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| ../../git/server/reds.c:798:9: note: here
+|          case VDI_PORT_READ_STATE_GET_BUFF: {
+|          ^~~~
+
+The 'fallthrough' comment will let gcc know this is done on purpose.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ server/inputs_channel.c | 1 +
+ server/reds.c           | 2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/server/inputs_channel.c b/server/inputs_channel.c
+index 931dac1..534ab66 100644
+--- a/server/inputs_channel.c
++++ b/server/inputs_channel.c
+@@ -321,6 +321,7 @@ static int inputs_channel_handle_parsed(RedChannelClient *rcc, uint32_t size, ui
+             activate_modifiers_watch();
+         }
+     }
++        /* fallthrough */
+     case SPICE_MSGC_INPUTS_KEY_UP: {
+         SpiceMsgcKeyDown *key_down = (SpiceMsgcKeyDown *)buf;
+         for (i = 0; i < 4; i++) {
+diff --git a/server/reds.c b/server/reds.c
+index 30d0652..8c80eb6 100644
+--- a/server/reds.c
++++ b/server/reds.c
+@@ -795,6 +795,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_msg_from_device(SpiceCharDe
+             }
+             state->message_recive_len = state->vdi_chunk_header.size;
+             state->read_state = VDI_PORT_READ_STATE_GET_BUFF;
++            /* fallthrough */
+         case VDI_PORT_READ_STATE_GET_BUFF: {
+             if (!(state->current_read_buf = vdi_port_read_buf_get())) {
+                 return NULL;
+@@ -806,6 +807,7 @@ static SpiceCharDeviceMsgToClient *vdi_port_read_one_msg_from_device(SpiceCharDe
+             state->message_recive_len -= state->recive_len;
+             state->read_state = VDI_PORT_READ_STATE_READ_DATA;
+         }
++            /* fallthrough */
+         case VDI_PORT_READ_STATE_READ_DATA:
+             n = sif->read(vdagent, state->recive_pos, state->recive_len);
+             if (!n) {
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-support/spice/files/build-allow-separated-src-and-build-dirs.patch b/meta-networking/recipes-support/spice/files/build-allow-separated-src-and-build-dirs.patch
new file mode 100644
index 0000000000..9cbbff9b64
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/build-allow-separated-src-and-build-dirs.patch
@@ -0,0 +1,62 @@
+From 7d0d0ff080b159e647ebb26c337cb75314d64b52 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 1 May 2014 12:09:16 -0400
+Subject: [PATCH] build: allow separated src and build dirs
+
+We need to expland the list of include dirs to include the build dir since
+generated files will be created there instead of in the src dir.
+
+We also don't want to force using $srcdir for generated files as this will
+allow them to be created in the build dir. We account for the slight
+deviation in the generated files with expanded include paths.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ configure.ac | 2 +-
+ spice-common/common/Makefile.am | 14 +++++++-------
+ 2 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index edda8e9..9151fcb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -165,7 +165,7 @@ dnl =========================================================================
+ dnl Check deps
+ 
+ AC_CONFIG_SUBDIRS([spice-common])
+-COMMON_CFLAGS='-I ${top_srcdir}/spice-common/ -I ${top_srcdir}/spice-common/spice-protocol/'
++COMMON_CFLAGS='-I ${top_srcdir}/spice-common/ -I ${top_srcdir}/spice-common/common/ -I ${top_srcdir}/spice-common/spice-protocol/ -I ${top_builddir}/spice-common/'
+ AC_SUBST(COMMON_CFLAGS)
+ 
+ AC_CHECK_LIBM
+diff --git a/spice-common/common/Makefile.am b/spice-common/common/Makefile.am
+index 45568c6..4c65ac4 100644
+--- a/spice-common/common/Makefile.am
++++ b/spice-common/common/Makefile.am
+@@ -2,16 +2,16 @@ NULL =
+ 
+ # Avoid need for python(pyparsing) by end users
+ CLIENT_MARSHALLERS =					\
+-	$(srcdir)/generated_client_demarshallers.c	\
+-	$(srcdir)/generated_client_demarshallers1.c	\
+-	$(srcdir)/generated_client_marshallers.c	\
+-	$(srcdir)/generated_client_marshallers1.c	\
++	generated_client_demarshallers.c	\
++	generated_client_demarshallers1.c	\
++	generated_client_marshallers.c	\
++	generated_client_marshallers1.c	\
+ 	$(NULL)
+ 
+ SERVER_MARSHALLERS =					\
+-	$(srcdir)/generated_server_demarshallers.c	\
+-	$(srcdir)/generated_server_marshallers.c	\
+-	$(srcdir)/generated_server_marshallers.h	\
++	generated_server_demarshallers.c	\
++	generated_server_marshallers.c	\
++	generated_server_marshallers.h	\
+ 	$(NULL)
+ 
+ BUILT_SOURCES = $(CLIENT_MARSHALLERS) $(SERVER_MARSHALLERS) $(top_srcdir)/spice-protocol/spice/enums.h
+-- 
+1.8.3.2
+
diff --git a/meta-networking/recipes-support/spice/files/configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch b/meta-networking/recipes-support/spice/files/configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch
new file mode 100644
index 0000000000..323ef52f8b
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch
@@ -0,0 +1,29 @@
+From 36efb79076420975f7fa7aa0b03a1fc282291b05 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 25 Mar 2014 15:23:25 -0400
+Subject: [PATCH] configure.ac: add subdir-objects to AM_INIT_AUTOMAKE
+
+Without this you will get subdir-objects error which will cause
+autoreconf to complete successfully.
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ spice-common/configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spice-common/configure.ac b/spice-common/configure.ac
+index b5cb960..78f1360 100644
+--- a/spice-common/configure.ac
++++ b/spice-common/configure.ac
+@@ -13,7 +13,7 @@ AC_CONFIG_AUX_DIR([build-aux])
+ m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
+ 
+ # Checks for programs
+-AM_INIT_AUTOMAKE([1.11 dist-xz no-dist-gzip tar-ustar foreign -Wall -Werror])
++AM_INIT_AUTOMAKE([1.11 dist-xz no-dist-gzip tar-ustar foreign subdir-objects -Wall -Werror])
+ AM_MAINTAINER_MODE
+ AM_SILENT_RULES([yes])
+ LT_INIT
+-- 
+1.8.3.2
+
diff --git a/meta-networking/recipes-support/spice/files/spice-fix-CVE-2013-4282.patch b/meta-networking/recipes-support/spice/files/spice-fix-CVE-2013-4282.patch
new file mode 100644
index 0000000000..1a00a85185
--- /dev/null
+++ b/meta-networking/recipes-support/spice/files/spice-fix-CVE-2013-4282.patch
@@ -0,0 +1,100 @@
+Fix buffer overflow when decrypting client SPICE ticket
+
+commit 8af619009660b24e0b41ad26b30289eea288fcc2     upstream
+
+reds_handle_ticket uses a fixed size 'password' buffer for the decrypted
+password whose size is SPICE_MAX_PASSWORD_LENGTH. However,
+RSA_private_decrypt which we call for the decryption expects the
+destination buffer to be at least RSA_size(link->tiTicketing.rsa)
+bytes long. On my spice-server build, SPICE_MAX_PASSWORD_LENGTH
+is 60 while RSA_size() is 128, so we end up overflowing 'password'
+when using long passwords (this was reproduced using the string:
+'fullscreen=1proxy=#enter proxy here; e.g spice_proxy = http://[proxy]:[port]'
+as a password).
+
+When the overflow occurs, QEMU dies with:
+*** stack smashing detected ***: qemu-system-x86_64 terminated
+
+This commit ensures we use a corectly sized 'password' buffer,
+and that it's correctly nul-terminated so that we can use strcmp
+instead of strncmp. To keep using strncmp, we'd need to figure out
+which one of 'password' and 'taTicket.password' is the smaller buffer,
+and use that size.
+
+This fixes rhbz#999839
+diff --git a/server/reds.c b/server/reds.c
+index 30d0652..6f262b0 100644
+--- a/server/reds.c
++++ b/server/reds.c
+@@ -1931,39 +1931,59 @@ static void reds_handle_link(RedLinkInfo *link)
+ static void reds_handle_ticket(void *opaque)
+ {
+     RedLinkInfo *link = (RedLinkInfo *)opaque;
+-    char password[SPICE_MAX_PASSWORD_LENGTH];
++    char *password;
+     time_t ltime;
++    int password_size;
+ 
+     //todo: use monotonic time
+     time(&ltime);
+-    RSA_private_decrypt(link->tiTicketing.rsa_size,
+-                        link->tiTicketing.encrypted_ticket.encrypted_data,
+-                        (unsigned char *)password, link->tiTicketing.rsa, RSA_PKCS1_OAEP_PADDING);
++    if (RSA_size(link->tiTicketing.rsa) < SPICE_MAX_PASSWORD_LENGTH) {
++        spice_warning("RSA modulus size is smaller than SPICE_MAX_PASSWORD_LENGTH (%d < %d), "
++                      "SPICE ticket sent from client may be truncated",
++                      RSA_size(link->tiTicketing.rsa), SPICE_MAX_PASSWORD_LENGTH);
++    }
++
++    password = g_malloc0(RSA_size(link->tiTicketing.rsa) + 1);
++    password_size = RSA_private_decrypt(link->tiTicketing.rsa_size,
++                                        link->tiTicketing.encrypted_ticket.encrypted_data,
++                                        (unsigned char *)password,
++                                        link->tiTicketing.rsa,
++                                        RSA_PKCS1_OAEP_PADDING);
++    if (password_size == -1) {
++        spice_warning("failed to decrypt RSA encrypted password: %s",
++                      ERR_error_string(ERR_get_error(), NULL));
++        goto error;
++    }
++    password[password_size] = '\0';
+ 
+     if (ticketing_enabled && !link->skip_auth) {
+         int expired =  taTicket.expiration_time < ltime;
+ 
+         if (strlen(taTicket.password) == 0) {
+-            reds_send_link_result(link, SPICE_LINK_ERR_PERMISSION_DENIED);
+             spice_warning("Ticketing is enabled, but no password is set. "
+-                        "please set a ticket first");
+-            reds_link_free(link);
+-            return;
++                          "please set a ticket first");
++            goto error;
+         }
+ 
+-        if (expired || strncmp(password, taTicket.password, SPICE_MAX_PASSWORD_LENGTH) != 0) {
++        if (expired || strcmp(password, taTicket.password) != 0) {
+             if (expired) {
+                 spice_warning("Ticket has expired");
+             } else {
+                 spice_warning("Invalid password");
+             }
+-            reds_send_link_result(link, SPICE_LINK_ERR_PERMISSION_DENIED);
+-            reds_link_free(link);
+-            return;
++            goto error;
+         }
+     }
+ 
+     reds_handle_link(link);
++    goto end;
++
++error:
++    reds_send_link_result(link, SPICE_LINK_ERR_PERMISSION_DENIED);
++    reds_link_free(link);
++
++end:
++    g_free(password);
+ }
+ 
+ static inline void async_read_clear_handlers(AsyncRead *obj)
diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
new file mode 100644
index 0000000000..04e7a25d70
--- /dev/null
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -0,0 +1,76 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+
+SUMMARY = "Simple Protocol for Independent Computing Environments"
+DESCRIPTION = "SPICE (the Simple Protocol for Independent Computing \
+Environments) is a remote-display system built for virtual \
+environments which allows users to view a computing 'desktop' \ 
+environment - not only on its computer-server machine, but also from \
+anywhere on the Internet and using a wide variety of machine \
+architectures."
+
+LICENSE = "BSD & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+PR = "r0"
+PV = "0.12.4"
+
+# Actual versions based on the checkouts below
+# spice = "0.12.4"
+# common = "0.12.6"
+# protocol = "0.12.6"
+SRCREV_spice = "b270fb010a3ddb432dfe6b15e4bdffa6ac086cd0"
+SRCREV_spice-common = "fe93908238196bd632287fc9875e6f2e11105d04"
+SRCREV_spice-protocol = "784407f248e7f99d2bfcc9368f9acd1efb2b9617"
+
+SRCREV_FORMAT = "spice_spice-common_spice-protocol"
+
+SRC_URI = "git://anongit.freedesktop.org/spice/spice;name=spice \
+           git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common \
+           git://anongit.freedesktop.org/spice/spice-protocol;destsuffix=git/spice-common/spice-protocol;name=spice-protocol \
+          "
+
+SRC_URI += " \
+        file://spice-fix-CVE-2013-4282.patch \
+        file://configure.ac-add-subdir-objects-to-AM_INIT_AUTOMAKE.patch \
+        file://build-allow-separated-src-and-build-dirs.patch \
+        file://0001-red_parse_qxl-Fix-BITMAP_FMT_IS_RGB-defined-but-not-.patch \
+        file://0001-Use-PRI-macros-in-printf-to-keep-compatibility-betwe.patch \
+        file://Fix-build-issues-with-gcc-7.patch \
+        "
+
+S = "${WORKDIR}/git"
+
+inherit autotools gettext pythonnative python-dir pkgconfig
+
+DEPENDS += "python-native celt051 python-pyparsing jpeg pixman alsa-lib glib-2.0"
+
+export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
+export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
+
+PACKAGECONFIG ?= "sasl"
+
+PACKAGECONFIG[smartcard] = "--enable-smartcard,--disable-smartcard,libcacard,"
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl,"
+PACKAGECONFIG[client] = "--enable-client,--disable-client,,"
+PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
+PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,,"
+PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
+
+PACKAGES =+ "${PN}-protocol"
+LICENSE_${PN}-protocol = "BSD"
+FILES_${PN}-protocol += "${includedir}/spice-1"
+FILES_${PN}-protocol += "${datadir}/pkgconfig"
+
+do_configure_prepend() {
+	mkdir -p ${S}/spice-common/spice-protocol/m4
+}
+
+do_install_append() {
+	cd ${B}/spice-common/spice-protocol
+	oe_runmake DESTDIR="${D}" install
+	cd -
+}
+
+COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
-- 
2.17.0


