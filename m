Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA3C27C44
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:38 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.3053.1716315038366411127
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AjOi20rS;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ec69e3dbcfso3613235ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315037; x=1716919837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7wWtSmleGzk/6JDq1E5Gw+Jp/4BWXgclClxrFZ5Sbw=;
        b=AjOi20rS4cx6m7YntqXqb0H/MKmysD3O1fF1w6Yg+k56wutD0wxk2r6SgM9qT5zrcc
         ETPntweZkStYxDaXwnkdsJBh0SMEB/3OHgjyyrzdobLNnzJT+uow9ItX17JRXI6yxW6O
         kwT5+hRY726AbPufk6G4ItMUFR9s2zvxq5qNsafFoS9Sp4h2mYQFUdr/WlZhQMgyX/K3
         TU3is7i3Fr9zR9E4t/dckE9iZaMEsYJBHMi1OlOy7OE25QDb+cn7ihq4Dvq/d5rbqZnB
         zrde+mDLGw2JxQuLFGbY5t1RO6yZ7/Nk5sQfyyoIdsXMNgztuly7mWVhgnxJYAZbHYAL
         sWPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315037; x=1716919837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7wWtSmleGzk/6JDq1E5Gw+Jp/4BWXgclClxrFZ5Sbw=;
        b=mKo/11JC8ri0ZiRKmdyXaksUXcLqAHzJ0jxekHKT2IRJtPHrPdYWNmvSdQzyjaEqTy
         3kGAUwES+2d1+xQhb2PxPGA38D9DnKkRy18SQ70dQjQZqxHkSn14gmyOy7n1S0lI0QAK
         ETD88iNw/t2WqfXJhROIjyK1EjLao6itqSNTAafK7BHjyD7XkFvUyBGb0UcV27N+KY7C
         TMYKFKXcMR5x+VCQb+x+DcfEk6YvaKhLWXAoxXNwoyWxN1szWDJt/sDDczV8QGCde3RE
         HXHa/x6uwKlVpBB/DxYJHUfn/CMnMgy+PCvWtbIaYCXAN9HSyD5pdWWHOMERxMMabkrJ
         jigg==
X-Gm-Message-State: AOJu0YwfBAIJP+m5YRJpfCD0EH7wwZelHz5O7nig+yBjLHZTLyUVr0ce
	wu5Lc2uUp6A2nF02ezCvebdb422/0xEkAELgIq5aMlFAptVRP+1MsP+yPyPkhRU=
X-Google-Smtp-Source: AGHT+IGUMbtWsgtRHZY+OcwiuxOBE54/VD5QhXkf1CGL6H1QHx1/E/TKXiqRadl3eCYfGpwrpGM1Xw==
X-Received: by 2002:a17:902:ea01:b0:1f3:135c:f71e with SMTP id d9443c01a7336-1f3135cf7d6mr15007545ad.20.1716315037250;
        Tue, 21 May 2024 11:10:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][meta-oe][ 11/22] vlc: Backport fixes to enable GCC-14 based builds
Date: Tue, 21 May 2024 11:10:12 -0700
Message-ID: <20240521181024.426176-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110460

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/vlc/vlc/4645.patch     | 179 +++++++++
 .../recipes-multimedia/vlc/vlc/4665.patch     | 377 ++++++++++++++++++
 .../recipes-multimedia/vlc/vlc_3.0.20.bb      |   2 +
 3 files changed, 558 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/4645.patch
 create mode 100644 meta-multimedia/recipes-multimedia/vlc/vlc/4665.patch

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/4645.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/4645.patch
new file mode 100644
index 0000000000..3f2aa60512
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/4645.patch
@@ -0,0 +1,179 @@
+From 1e2918115ca2f5c4ffde00dc02ad89525714f6c2 Mon Sep 17 00:00:00 2001
+From: Thomas Guillem <thomas@gllm.fr>
+Date: Tue, 5 Dec 2023 09:23:35 +0100
+Subject: [PATCH 1/5] input: fix incompatible-pointer-types assignment
+
+Fixes #28441
+Upstream-Status: Backport [https://code.videolan.org/videolan/vlc/-/merge_requests/4645]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/input/input_internal.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/input/input_internal.h b/src/input/input_internal.h
+index d29731edca1b..ea02f39f5add 100644
+--- a/src/input/input_internal.h
++++ b/src/input/input_internal.h
+@@ -117,7 +117,7 @@ typedef struct input_thread_private_t
+ 
+     /* Title infos FIXME multi-input (not easy) ? */
+     int          i_title;
+-    const input_title_t **title;
++    input_title_t * const *title;
+ 
+     int i_title_offset;
+     int i_seekpoint_offset;
+-- 
+GitLab
+
+
+From adcf4e66e2ce2c382bb97957c91bfde040f4f3ca Mon Sep 17 00:00:00 2001
+From: Zhao Zhili <quinkblack@foxmail.com>
+Date: Thu, 1 Mar 2018 14:25:59 +0800
+Subject: [PATCH 2/5] yadif: fix variable type
+
+Signed-off-by: Thomas Guillem <thomas@gllm.fr>
+(cherry picked from commit 77b86f4452be4dbe0d56a9cd1b66da61b116da60)
+Signed-off-by: Thomas Guillem <thomas@gllm.fr>
+---
+ modules/video_filter/deinterlace/yadif.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/modules/video_filter/deinterlace/yadif.h b/modules/video_filter/deinterlace/yadif.h
+index 4bc592ba9307..af16443d0804 100644
+--- a/modules/video_filter/deinterlace/yadif.h
++++ b/modules/video_filter/deinterlace/yadif.h
+@@ -140,10 +140,10 @@ static void yadif_filter_line_c(uint8_t *dst, uint8_t *prev, uint8_t *cur, uint8
+ }
+ 
+ static void yadif_filter_line_c_16bit(uint8_t *dst8, uint8_t *prev8, uint8_t *cur8, uint8_t *next8, int w, int prefs, int mrefs, int parity, int mode) {
+-    uint8_t *dst = (uint8_t *)dst8;
+-    uint8_t *prev = (uint8_t *)prev8;
+-    uint8_t *cur = (uint8_t *)cur8;
+-    uint8_t *next = (uint8_t *)next8;
++    uint16_t *dst = (uint16_t *)dst8;
++    uint16_t *prev = (uint16_t *)prev8;
++    uint16_t *cur = (uint16_t *)cur8;
++    uint16_t *next = (uint16_t *)next8;
+     int x;
+     uint16_t *prev2= parity ? prev : cur ;
+     uint16_t *next2= parity ? cur  : next;
+-- 
+GitLab
+
+
+From 45198e5328ff2b2f4eb2fb76add0789fec26270f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sun, 3 Mar 2019 09:59:10 +0200
+Subject: [PATCH 3/5] swscale: avoid invalid pointer conversion
+
+(cherry picked from commit ab00e6c59d42e05ab08893091783d8b5febc0058)
+Signed-off-by: Thomas Guillem <thomas@gllm.fr>
+---
+ modules/video_chroma/swscale.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/modules/video_chroma/swscale.c b/modules/video_chroma/swscale.c
+index 8993d11ec5dd..11897527355c 100644
+--- a/modules/video_chroma/swscale.c
++++ b/modules/video_chroma/swscale.c
+@@ -588,8 +588,9 @@ static void Convert( filter_t *p_filter, struct SwsContext *ctx,
+ {
+     filter_sys_t *p_sys = p_filter->p_sys;
+     uint8_t palette[AVPALETTE_SIZE];
+-    uint8_t *src[4]; int src_stride[4];
+-    uint8_t *dst[4]; int dst_stride[4];
++    uint8_t *src[4], *dst[4];
++    const uint8_t *csrc[4];
++    int src_stride[4], dst_stride[4];
+ 
+     GetPixels( src, src_stride, p_sys->desc_in, &p_filter->fmt_in.video,
+                p_src, i_plane_count, b_swap_uvi );
+@@ -606,11 +607,14 @@ static void Convert( filter_t *p_filter, struct SwsContext *ctx,
+     GetPixels( dst, dst_stride, p_sys->desc_out, &p_filter->fmt_out.video,
+                p_dst, i_plane_count, b_swap_uvo );
+ 
++    for (size_t i = 0; i < ARRAY_SIZE(src); i++)
++        csrc[i] = src[i];
++
+ #if LIBSWSCALE_VERSION_INT  >= ((0<<16)+(5<<8)+0)
+-    sws_scale( ctx, src, src_stride, 0, i_height,
++    sws_scale( ctx, csrc, src_stride, 0, i_height,
+                dst, dst_stride );
+ #else
+-    sws_scale_ordered( ctx, src, src_stride, 0, i_height,
++    sws_scale_ordered( ctx, csrc, src_stride, 0, i_height,
+                        dst, dst_stride );
+ #endif
+ }
+-- 
+GitLab
+
+
+From 4431076ad4a21fdcabd3f7ef1d61c45891689b0c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sun, 3 Mar 2019 17:20:04 +0200
+Subject: [PATCH 4/5] dynamicoverlay: fix variable shadowing
+
+(cherry picked from commit d42e05d6b2c061ae352c131d5aebf8c8d8aa6d35)
+Signed-off-by: Thomas Guillem <thomas@gllm.fr>
+---
+ modules/spu/dynamicoverlay/dynamicoverlay_commands.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/modules/spu/dynamicoverlay/dynamicoverlay_commands.c b/modules/spu/dynamicoverlay/dynamicoverlay_commands.c
+index a93462925e8a..a85f9aafb0b9 100644
+--- a/modules/spu/dynamicoverlay/dynamicoverlay_commands.c
++++ b/modules/spu/dynamicoverlay/dynamicoverlay_commands.c
+@@ -899,12 +899,11 @@ static const commanddesc_static_t p_commands[] =
+ void RegisterCommand( filter_t *p_filter )
+ {
+     filter_sys_t *p_sys = (filter_sys_t*) p_filter->p_sys;
+-    size_t i_index = 0;
+ 
+     p_sys->i_commands = ARRAY_SIZE(p_commands);
+     p_sys->pp_commands = (commanddesc_t **) calloc( p_sys->i_commands, sizeof(commanddesc_t*) );
+     if( !p_sys->pp_commands ) return;
+-    for( i_index = 0; i_index < p_sys->i_commands; i_index ++ )
++    for( size_t i_index = 0; i_index < p_sys->i_commands; i_index ++ )
+     {
+         p_sys->pp_commands[i_index] = (commanddesc_t *) malloc( sizeof(commanddesc_t) );
+         if( !p_sys->pp_commands[i_index] ) return;
+-- 
+GitLab
+
+
+From fda14fc7c013eb75291df10cc8b88336c51328ad Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Mon, 26 Feb 2018 20:43:03 +0200
+Subject: [PATCH 5/5] dynamicoverlay: fix memory corruption
+
+Font alpha is 8-bits, not 32-bits.
+
+(cherry picked from commit 6f14081af7325d334a53126c4eea52bc30fc08a0)
+Signed-off-by: Thomas Guillem <thomas@gllm.fr>
+---
+ modules/spu/dynamicoverlay/dynamicoverlay_commands.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/modules/spu/dynamicoverlay/dynamicoverlay_commands.c b/modules/spu/dynamicoverlay/dynamicoverlay_commands.c
+index a85f9aafb0b9..7a71c6f2373a 100644
+--- a/modules/spu/dynamicoverlay/dynamicoverlay_commands.c
++++ b/modules/spu/dynamicoverlay/dynamicoverlay_commands.c
+@@ -234,8 +234,12 @@ static int parser_SetTextAlpha( char *psz_command, char *psz_end,
+     skip_space( &psz_command );
+     if( isdigit( (unsigned char)*psz_command ) )
+     {
+-        if( parse_digit( &psz_command, &p_params->fontstyle.i_font_alpha ) == VLC_EGENERIC )
++        int32_t value;
++
++        if( parse_digit( &psz_command, &value ) == VLC_EGENERIC )
+             return VLC_EGENERIC;
++
++        p_params->fontstyle.i_font_alpha = value;
+     }
+     return VLC_SUCCESS;
+ }
+-- 
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc/4665.patch b/meta-multimedia/recipes-multimedia/vlc/vlc/4665.patch
new file mode 100644
index 0000000000..c9ef33358e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc/4665.patch
@@ -0,0 +1,377 @@
+From 770789f265761fc7ab2de69ca105fec4ad93d9e2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Mon, 26 Feb 2018 20:36:29 +0200
+Subject: [PATCH 1/9] chromaprint: missing cast
+
+(cherry picked from commit 7bd5bab3e43ae187f7219db61ed85d06d2ba0547)
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+Upstream-Status: Backport [https://code.videolan.org/videolan/vlc/-/merge_requests/4665]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ modules/stream_out/chromaprint.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/stream_out/chromaprint.c b/modules/stream_out/chromaprint.c
+index 80ec31ba2590..c76cbda3c2bb 100644
+--- a/modules/stream_out/chromaprint.c
++++ b/modules/stream_out/chromaprint.c
+@@ -231,7 +231,7 @@ static int Send( sout_stream_t *p_stream, sout_stream_id_sys_t *id,
+         if ( !p_sys->b_finished && id->i_samples > 0 && p_buf->i_buffer )
+         {
+             if(! chromaprint_feed( p_sys->p_chromaprint_ctx,
+-                                   p_buf->p_buffer,
++                                   (int16_t *)p_buf->p_buffer,
+                                    p_buf->i_buffer / BYTESPERSAMPLE ) )
+                 msg_Warn( p_stream, "feed error" );
+             id->i_samples -= i_samples;
+-- 
+GitLab
+
+
+From 6179d6b843f2a93af6a3d51c4244766e3eba9e77 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>
+Date: Sun, 14 Apr 2019 09:41:38 +0300
+Subject: [PATCH 2/9] win32: wrap {g,s}etsockopt()
+
+char * can alias anything, and Winsock relies on that. Unfortunately,
+the compiler still issues warnings. This works around that.
+
+(cherry picked from commit 36715d9b79f34824e126c2bc3aee2f1c1c16af46)
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+---
+ include/vlc_network.h | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/include/vlc_network.h b/include/vlc_network.h
+index 010454a01c09..e39ffd0bacaa 100644
+--- a/include/vlc_network.h
++++ b/include/vlc_network.h
+@@ -183,6 +183,22 @@ VLC_API int vlc_close(int);
+ 
+ /** @} */
+ 
++#ifdef _WIN32
++static inline int vlc_getsockopt(int s, int level, int name,
++                                 void *val, socklen_t *len)
++{
++    return getsockopt(s, level, name, (char *)val, len);
++}
++#define getsockopt vlc_getsockopt
++
++static inline int vlc_setsockopt(int s, int level, int name,
++                                 const void *val, socklen_t len)
++{
++    return setsockopt(s, level, name, (const char *)val, len);
++}
++#define setsockopt vlc_setsockopt
++#endif
++
+ /* Portable network names/addresses resolution layer */
+ 
+ #define NI_MAXNUMERICHOST 64
+-- 
+GitLab
+
+
+From 3391108f9709f0d77d9297c94371cf9cd30f2cbe Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Thu, 7 Dec 2023 15:43:04 +0100
+Subject: [PATCH 3/9] netsync: use char for temporary local buffer
+
+On Windows recvfrom/revc/sendto expects a char*.
+---
+ modules/control/netsync.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/modules/control/netsync.c b/modules/control/netsync.c
+index 2a6a1a6a2bf8..8c91034d7cf2 100644
+--- a/modules/control/netsync.c
++++ b/modules/control/netsync.c
+@@ -181,7 +181,7 @@ static void *Master(void *handle)
+     intf_sys_t *sys = intf->p_sys;
+     for (;;) {
+         struct pollfd ufd = { .fd = sys->fd, .events = POLLIN, };
+-        uint64_t data[2];
++        char data[16];
+ 
+         if (poll(&ufd, 1, -1) < 0)
+             continue;
+@@ -198,8 +198,8 @@ static void *Master(void *handle)
+         if (master_system < 0)
+             continue;
+ 
+-        data[0] = hton64(mdate());
+-        data[1] = hton64(master_system);
++        SetQWBE(&data[0], mdate());
++        SetQWBE(&data[8], master_system);
+ 
+         /* Reply to the sender */
+         sendto(sys->fd, data, 16, 0,
+@@ -224,7 +224,7 @@ static void *Slave(void *handle)
+ 
+     for (;;) {
+         struct pollfd ufd = { .fd = sys->fd, .events = POLLIN, };
+-        uint64_t data[2];
++        char data[16];
+ 
+         vlc_tick_t system = GetPcrSystem(sys->input);
+         if (system < 0)
+@@ -233,7 +233,7 @@ static void *Slave(void *handle)
+         /* Send clock request to the master */
+         const vlc_tick_t send_date = mdate();
+ 
+-        data[0] = hton64(system);
++        SetQWBE(&data[0], system);
+         send(sys->fd, data, 8, 0);
+ 
+         /* Don't block */
+@@ -244,8 +244,8 @@ static void *Slave(void *handle)
+         if (recv(sys->fd, data, 16, 0) < 16)
+             goto wait;
+ 
+-        const vlc_tick_t master_date   = ntoh64(data[0]);
+-        const vlc_tick_t master_system = ntoh64(data[1]);
++        const vlc_tick_t master_date   = GetQWBE(&data[0]);
++        const vlc_tick_t master_system = GetQWBE(&data[8]);
+         const vlc_tick_t diff_date = receive_date -
+                                   ((receive_date - send_date) / 2 + master_date);
+ 
+-- 
+GitLab
+
+
+From 27e584d7b9add8dbbb82b7227228e1ec1e25a089 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Tue, 3 Jan 2023 13:23:00 +0100
+Subject: [PATCH 4/9] access/dtv: move the lfind() Windows hack in the module
+
+So that we don't have to include search.h each time vlc_fixups.h is used.
+
+The Win32 prototype of lfind() expects an unsigned* for 'nelp', not a size_t*.
+
+(cherry picked from commit 7c43bcba27b6fe256456d93a9d32e10648f08da8)
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+---
+ include/vlc_fixups.h        | 3 +++
+ modules/access/dtv/access.c | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
+index 37f788933779..861cb4cc5063 100644
+--- a/include/vlc_fixups.h
++++ b/include/vlc_fixups.h
+@@ -501,8 +501,11 @@ void *tsearch( const void *key, void **rootp, int(*cmp)(const void *, const void
+ void *tfind( const void *key, const void **rootp, int(*cmp)(const void *, const void *) );
+ void *tdelete( const void *key, void **rootp, int(*cmp)(const void *, const void *) );
+ void twalk( const void *root, void(*action)(const void *nodep, VISIT which, int depth) );
++#ifndef _WIN32
++/* the Win32 prototype of lfind() expects an unsigned* for 'nmemb' */
+ void *lfind( const void *key, const void *base, size_t *nmemb,
+              size_t size, int(*cmp)(const void *, const void *) );
++#endif
+ #endif /* HAVE_SEARCH_H */
+ #ifndef HAVE_TDESTROY
+ void tdestroy( void *root, void (*free_node)(void *nodep) );
+diff --git a/modules/access/dtv/access.c b/modules/access/dtv/access.c
+index d9756c7b4885..c6ca5005883c 100644
+--- a/modules/access/dtv/access.c
++++ b/modules/access/dtv/access.c
+@@ -32,6 +32,11 @@
+ #ifdef HAVE_SEARCH_H
+ #include <search.h>
+ #endif
++#if defined(_WIN32)
++/* the Win32 prototype of lfind() expects an unsigned* for 'nelp' */
++# define lfind(a,b,c,d,e) \
++         lfind((a),(b), &(unsigned){ (*(c) > UINT_MAX) ? UINT_MAX : *(c) }, (d),(e))
++#endif
+ 
+ #include "dtv/dtv.h"
+ 
+-- 
+GitLab
+
+
+From 5a9ca37a95b6e85e6beaaefba9aa4a886a45411c Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Mon, 15 Jul 2019 12:41:29 +0200
+Subject: [PATCH 5/9] vlc_common: fix swab() calls on win32 that don't use
+ const on source pointer
+
+(cherry picked from commit a9e0b1124e19225b903a2926951781e84002c410)
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+---
+ include/vlc_common.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/vlc_common.h b/include/vlc_common.h
+index 8090b277150d..089878581763 100644
+--- a/include/vlc_common.h
++++ b/include/vlc_common.h
+@@ -947,6 +947,11 @@ static inline void SetQWLE (void *p, uint64_t qw)
+ #       define O_NONBLOCK 0
+ #   endif
+ 
++/* the mingw32 swab() and win32 _swab() prototypes expect a char* instead of a
++   const void* */
++#  define swab(a,b,c)  swab((char*) (a), (char*) (b), (c))
++
++
+ #   include <tchar.h>
+ #endif /* _WIN32 */
+ 
+-- 
+GitLab
+
+
+From b758e19479a80604e3feb470b197e4a13a203a85 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Wed, 10 Jul 2019 08:23:45 +0200
+Subject: [PATCH 6/9] avcodec: encoder: fix MPEG4 matrix passed as const
+
+lavc expects a pointer that it will free in avcodec_free_context().
+
+(cherry picked from commit d86c4c87aa78130a4fd00294e25df865d0e2b327)
+Signed-off-by: Steve Lhomme <robux4@ycbcr.xyz>
+---
+ modules/codec/avcodec/encoder.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/modules/codec/avcodec/encoder.c b/modules/codec/avcodec/encoder.c
+index 2b1c3604713d..4919ccf0e0e4 100644
+--- a/modules/codec/avcodec/encoder.c
++++ b/modules/codec/avcodec/encoder.c
+@@ -588,8 +588,14 @@ int InitVideoEnc( vlc_object_t *p_this )
+ 
+         if ( p_sys->b_mpeg4_matrix )
+         {
+-            p_context->intra_matrix = mpeg4_default_intra_matrix;
+-            p_context->inter_matrix = mpeg4_default_non_intra_matrix;
++            p_context->intra_matrix = av_malloc( sizeof(mpeg4_default_intra_matrix) );
++            if ( p_context->intra_matrix )
++                memcpy( p_context->intra_matrix, mpeg4_default_intra_matrix,
++                        sizeof(mpeg4_default_intra_matrix));
++            p_context->inter_matrix = av_malloc( sizeof(mpeg4_default_non_intra_matrix) );
++            if ( p_context->inter_matrix )
++                memcpy( p_context->inter_matrix, mpeg4_default_non_intra_matrix,
++                        sizeof(mpeg4_default_non_intra_matrix));
+         }
+ 
+         if ( p_sys->b_pre_me )
+-- 
+GitLab
+
+
+From 55be3ce60795a09d13861c5637c1fe7aebc5ce8b Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Thu, 7 Dec 2023 14:18:22 +0100
+Subject: [PATCH 7/9] smb: fix potential string to wide string copy
+
+The type of net_resource depends on the UNICODE define.
+---
+ modules/access/smb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/modules/access/smb.c b/modules/access/smb.c
+index 5fe56f0c9dfe..6add2a3e6278 100644
+--- a/modules/access/smb.c
++++ b/modules/access/smb.c
+@@ -524,7 +524,7 @@ static void Win32AddConnection( stream_t *p_access, const char *psz_server,
+                                 const char *psz_pwd, const char *psz_domain )
+ {
+     char psz_remote[MAX_PATH];
+-    NETRESOURCE net_resource;
++    NETRESOURCEA net_resource;
+     DWORD i_result;
+     VLC_UNUSED( psz_domain );
+ 
+@@ -544,7 +544,7 @@ static void Win32AddConnection( stream_t *p_access, const char *psz_server,
+ 
+     net_resource.lpRemoteName = psz_remote;
+ 
+-    i_result = WNetAddConnection2( &net_resource, psz_pwd, psz_user, 0 );
++    i_result = WNetAddConnection2A( &net_resource, psz_pwd, psz_user, 0 );
+ 
+     if( i_result != NO_ERROR )
+     {
+-- 
+GitLab
+
+
+From 5ae924bf212dce64a6424561d92426dbcc2cf3a0 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Wed, 6 Dec 2023 14:45:46 +0100
+Subject: [PATCH 8/9] dxva2: add missing mask initializers
+
+---
+ modules/codec/avcodec/dxva2.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/modules/codec/avcodec/dxva2.c b/modules/codec/avcodec/dxva2.c
+index 18b872fe0fe3..2e6809a05410 100644
+--- a/modules/codec/avcodec/dxva2.c
++++ b/modules/codec/avcodec/dxva2.c
+@@ -84,12 +84,12 @@ DEFINE_GUID(DXVA_Intel_H264_NoFGT_ClearVideo,       0x604F8E68, 0x4951, 0x4c54,
+ 
+ /* XXX Preferred format must come first */
+ static const d3d9_format_t d3d_formats[] = {
+-    { "YV12",   MAKEFOURCC('Y','V','1','2'),    VLC_CODEC_YV12 },
+-    { "NV12",   MAKEFOURCC('N','V','1','2'),    VLC_CODEC_NV12 },
+-    //{ "IMC3",   MAKEFOURCC('I','M','C','3'),    VLC_CODEC_YV12 },
+-    { "P010",   MAKEFOURCC('P','0','1','0'),    VLC_CODEC_P010 },
++    { "YV12",   MAKEFOURCC('Y','V','1','2'),    VLC_CODEC_YV12, 0,0,0 },
++    { "NV12",   MAKEFOURCC('N','V','1','2'),    VLC_CODEC_NV12, 0,0,0 },
++    //{ "IMC3",   MAKEFOURCC('I','M','C','3'),    VLC_CODEC_YV12, 0,0,0 },
++    { "P010",   MAKEFOURCC('P','0','1','0'),    VLC_CODEC_P010, 0,0,0 },
+ 
+-    { NULL, 0, 0 }
++    { NULL, 0, 0, 0,0,0 }
+ };
+ 
+ static const d3d9_format_t *D3dFindFormat(D3DFORMAT format)
+-- 
+GitLab
+
+
+From 08c7a66780740679ba1b0abe9e30e73afc6bc271 Mon Sep 17 00:00:00 2001
+From: Steve Lhomme <robux4@ycbcr.xyz>
+Date: Wed, 6 Dec 2023 07:48:29 +0100
+Subject: [PATCH 9/9] win32/modules: use cast with GetProcAddress function
+ pointers
+
+---
+ src/text/url.c     | 3 ++-
+ src/win32/plugin.c | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/text/url.c b/src/text/url.c
+index b962eb31f849..2eb4b8d10817 100644
+--- a/src/text/url.c
++++ b/src/text/url.c
+@@ -892,7 +892,8 @@ static int IdnToAscii(DWORD flags, LPCWSTR str, int len, LPWSTR buf, int size)
+     int (WINAPI *IdnToAsciiReal)(DWORD, LPCWSTR, int, LPWSTR, int);
+     int ret = 0;
+ 
+-    IdnToAsciiReal = GetProcAddress(h, "IdnToAscii");
++    IdnToAsciiReal = (int (WINAPI *)(DWORD, LPCWSTR, int, LPWSTR, int))
++                     GetProcAddress(h, "IdnToAscii");
+     if (IdnToAsciiReal != NULL)
+         ret = IdnToAsciiReal(flags, str, len, buf, size);
+     else
+diff --git a/src/win32/plugin.c b/src/win32/plugin.c
+index 1a65521fca75..b5c336eb99ca 100644
+--- a/src/win32/plugin.c
++++ b/src/win32/plugin.c
+@@ -45,7 +45,8 @@ static BOOL WINAPI SetThreadErrorModeFallback(DWORD mode, DWORD *oldmode)
+ 
+     BOOL (WINAPI *SetThreadErrorModeReal)(DWORD, DWORD *);
+ 
+-    SetThreadErrorModeReal = GetProcAddress(h, "SetThreadErrorMode");
++    SetThreadErrorModeReal = (BOOL (WINAPI *)(DWORD, DWORD *))
++                              GetProcAddress(h, "SetThreadErrorMode");
+     if (SetThreadErrorModeReal != NULL)
+         return SetThreadErrorModeReal(mode, oldmode);
+ 
+-- 
+GitLab
+
diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
index 21bc408f6d..2a6b27add0 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.20.bb
@@ -25,6 +25,8 @@ SRC_URI = "https://get.videolan.org/${BPN}/${PV}/${BP}.tar.xz \
            file://0006-configure-Disable-incompatible-function-pointer-type.patch \
            file://taglib-2.patch \
            file://0001-taglib-Fix-build-on-x86-32-bit.patch \
+           file://4645.patch \
+           file://4665.patch \
 "
 SRC_URI[sha256sum] = "adc7285b4d2721cddf40eb5270cada2aaa10a334cb546fd55a06353447ba29b5"
 
-- 
2.45.1


