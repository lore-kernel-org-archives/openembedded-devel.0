Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F2D715D1
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14212.1769236218221843083
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XQAA75KL;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so20741345e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236217; x=1769841017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aRcbLz+mQiw7K9dQMepmZ5XfgIy/3hdnVhTyEzN3p0=;
        b=XQAA75KLg54zPwTnM485mVBSDbcqctg0aMeB6klhrmssQ2tDA0BJZNiUfHqgJm1U33
         6eIwzoQcjeuqeDfjbTP2//JhRXNXxKmoh+6zAZgk8KuZzdldvZNj6mm5Vb8TlrZnBceu
         GFIswLO410+GGpRhQuz9bY+aPy3emj9EmuMdiIMchMrp0qbfD7bx5JVW56VQoc+KjEoD
         1r/eaplsfI24zCdCnq9szES52siltFtO7olGutst02N7uUbF04+x2Y6SnFXOpQ8c/xaI
         rXA6RRjI4FqT/amyBZLcVQ0oXsvdeOgppVPlyoSILho7EEWiLsIgQcsk5KDl0YMQWOxW
         Zlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236217; x=1769841017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6aRcbLz+mQiw7K9dQMepmZ5XfgIy/3hdnVhTyEzN3p0=;
        b=EBR3PlHk5EgSrrivHZxFPyTLTAwu1Oh+FtASz133+6U3BpQuiav+CtOYvIYJzp9EJU
         lYJbssVd/Usp9TrxIJ2NWdz6PaewaokACRNMJaeL97VpXt2DADvTEFzNFwh+d1uUXPrV
         +JZsJV2oi2uFjIuVhDksyy0d9cDRev53Wypnfydkcwga+CJ+QMaW3nf1U/b8vyq/gylQ
         2tTuo8oT5jAwOTLcgdYUW3aSb5RMjvvQUoNkz2bsaUqSsZkIZI9d6UaOOJBr2J2K+eH8
         GG8Wg7mx/Z7+Gw4LStwgZFgm33ZDI3GFBt79SwN1gtqi3xFXBVTqUma7gfjShT63B3bd
         S9gg==
X-Gm-Message-State: AOJu0YxNVGUdPjLU2472Rz+JlApPHVeMG0puNIY/DQoaVfZBarneXZ/6
	Wy37iX/lEtjDYJb6KsqjYTOiWDsVIEFLYtYpMPfPgeGFjn8T9uMeHox62460jQ==
X-Gm-Gg: AZuq6aL+eZIj14HegV5cJsODOs3VaHAXPbwzIyBtYVPrWDBGKLLX83KYrP1uLRnambi
	5FMEHX4M5WGT9UDVcli0Gz5g/ge0IjsC8+S7pTiQ9twfMKiqJHlP/bNffq5X5oJGNNxlywVpevi
	s7sSb7ubORKEO/Kqxfj0EChlJCMT3AIWwmSqTzEWF+N391yMVl8fawiGM/mZNQONyVSkHDjfUCy
	Pbk+k9ExXbTOXOv3Wkdh/h81UA1qJl8GDIDxmS34x507mpJESNmHtoL8LUZgISVTTwBZxmc+Xfl
	GgfUEHWca81cTpMbBeBsYtDtpa9FMP61sM1I6kKTYOsleldm2EzVKdhfLdnfMl05cBR918fSqal
	Jda8ClQyBEthx9gUAzrfF7F6JJ8iNg78PbSjzQtaTYm3tlJRcUuNOTbv8nvrUQ+oEN7rqGQqWNK
	Nw+T2XCdBROU3VCwVybLY=
X-Received: by 2002:a05:600c:8b09:b0:480:1e9e:f9b with SMTP id 5b1f17b1804b1-4804c960f04mr95213015e9.16.1769236216446;
        Fri, 23 Jan 2026 22:30:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:16 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 13/13] xrdp: patch CVE-2023-42822
Date: Sat, 24 Jan 2026 07:30:07 +0100
Message-ID: <20260124063007.28313-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123819

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-42822

Pick the patch the references the github advisory[1] and the cve ID also from
the nvd report. The patch is a backported version of the patch referenced by
the nvd report.

[1]: https://github.com/neutrinolabs/xrdp/security/advisories/GHSA-2hjx-rm4f-r9hw

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit a9fa1c5c2a83d301aa004cd16d18a516ae383042)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2023-42822.patch            | 304 ++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |   1 +
 2 files changed, 305 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-42822.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-42822.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-42822.patch
new file mode 100644
index 0000000000..2cf7968f3c
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2023-42822.patch
@@ -0,0 +1,304 @@
+From 58c9c1f06aeb5c91386bca20fa1609d68bf37ae0 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Mon, 25 Sep 2023 11:25:04 +0100
+Subject: [PATCH] CVE-2023-42822
+
+- font_items in struct xrdp_font renamed to chars to catch all
+  accesses to it. This name is consistent with the type of
+  the array elements (struct xrdp_font_char).
+- Additional fields added to struct xrdp_font to allow for range
+  checking and for a default character to be provided
+- Additional checks and logic added to xrdp_font_create()
+- New macro XRDP_FONT_GET_CHAR() added to perform checked access
+  to chars field in struct xrdp_font
+
+CVE: CVE-2023-42822
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/fd25fc546a68a94163413ff2cf3989c1e239e762]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp.h         |   9 ++++
+ xrdp/xrdp_font.c    | 113 +++++++++++++++++++++++++++++++++++++-------
+ xrdp/xrdp_painter.c |  10 ++--
+ xrdp/xrdp_types.h   |   8 +++-
+ 4 files changed, 115 insertions(+), 25 deletions(-)
+
+diff --git a/xrdp/xrdp.h b/xrdp/xrdp.h
+index 36d8f87a9a..be008aa227 100644
+--- a/xrdp/xrdp.h
++++ b/xrdp/xrdp.h
+@@ -345,6 +345,15 @@ xrdp_font_delete(struct xrdp_font *self);
+ int
+ xrdp_font_item_compare(struct xrdp_font_char *font1,
+                        struct xrdp_font_char *font2);
++/**
++ * Gets a checked xrdp_font_char from a font
++ * @param f Font
++ * @param c32 Unicode codepoint
++ */
++#define XRDP_FONT_GET_CHAR(f, c32) \
++    (((unsigned int)(c32) >= ' ') && ((unsigned int)(c32) < (f)->char_count) \
++     ? ((f)->chars + (unsigned int)(c32)) \
++     : (f)->default_char)
+ 
+ /* funcs.c */
+ int
+diff --git a/xrdp/xrdp_font.c b/xrdp/xrdp_font.c
+index c089db0075..2b34f36ca6 100644
+--- a/xrdp/xrdp_font.c
++++ b/xrdp/xrdp_font.c
+@@ -65,6 +65,12 @@ static char w_char[] =
+ };
+ #endif
+ 
++// Unicode definitions
++#define UNICODE_WHITE_SQUARE 0x25a1
++
++// First character allocated in the 'struct xrdp_font.chars' array
++#define FIRST_CHAR ' '
++
+ /*****************************************************************************/
+ struct xrdp_font *
+ xrdp_font_create(struct xrdp_wm *wm)
+@@ -74,7 +80,7 @@ xrdp_font_create(struct xrdp_wm *wm)
+     int fd;
+     int b;
+     int i;
+-    int index;
++    unsigned int char_count;
+     int datasize;
+     int file_size;
+     struct xrdp_font_char *f;
+@@ -100,17 +106,39 @@ xrdp_font_create(struct xrdp_wm *wm)
+     }
+ 
+     self = (struct xrdp_font *)g_malloc(sizeof(struct xrdp_font), 1);
++    if (self == NULL)
++    {
++        LOG(LOG_LEVEL_ERROR, "xrdp_font_create: "
++            "Can't allocate memory for font");
++        return self;
++    }
+     self->wm = wm;
+     make_stream(s);
+     init_stream(s, file_size + 1024);
+     fd = g_file_open(file_path);
+ 
+-    if (fd != -1)
++    if (fd < 0)
++    {
++        LOG(LOG_LEVEL_ERROR,
++            "xrdp_font_create: Can't open %s - %s", file_path,
++            g_get_strerror());
++        g_free(self);
++        self = NULL;
++    }
++    else
+     {
+         b = g_file_read(fd, s->data, file_size + 1024);
+         g_file_close(fd);
+ 
+-        if (b > 0)
++        // Got at least a header?
++        if (b < (4 + 32 + 2 + 2 + 8))
++        {
++            LOG(LOG_LEVEL_ERROR,
++                "xrdp_font_create: Font %s is truncated", file_path);
++            g_free(self);
++            self = NULL;
++        }
++        else
+         {
+             s->end = s->data + b;
+             in_uint8s(s, 4);
+@@ -118,11 +146,27 @@ xrdp_font_create(struct xrdp_wm *wm)
+             in_uint16_le(s, self->size);
+             in_uint16_le(s, self->style);
+             in_uint8s(s, 8);
+-            index = 32;
++            char_count = FIRST_CHAR;
+ 
+-            while (s_check_rem(s, 16))
++            while (!s_check_end(s))
+             {
+-                f = self->font_items + index;
++                if (!s_check_rem(s, 16))
++                {
++                    LOG(LOG_LEVEL_WARNING,
++                        "xrdp_font_create: "
++                        "Can't parse header for character U+%X", char_count);
++                    break;
++                }
++
++                if (char_count >= MAX_FONT_CHARS)
++                {
++                    LOG(LOG_LEVEL_WARNING,
++                        "xrdp_font_create: "
++                        "Ignoring characters >= U+%x", MAX_FONT_CHARS);
++                    break;
++                }
++
++                f = self->chars + char_count;
+                 in_sint16_le(s, i);
+                 f->width = i;
+                 in_sint16_le(s, i);
+@@ -139,23 +183,56 @@ xrdp_font_create(struct xrdp_wm *wm)
+                 if (datasize < 0 || datasize > 512)
+                 {
+                     /* shouldn't happen */
+-                    LOG(LOG_LEVEL_ERROR, "error in xrdp_font_create, datasize wrong "
+-                        "width %d, height %d, datasize %d, index %d",
+-                        f->width, f->height, datasize, index);
++                    LOG(LOG_LEVEL_ERROR,
++                        "xrdp_font_create: "
++                        "datasize for U+%x wrong "
++                        "width %d, height %d, datasize %d",
++                        char_count, f->width, f->height, datasize);
+                     break;
+                 }
+ 
+-                if (s_check_rem(s, datasize))
++                if (!s_check_rem(s, datasize))
+                 {
+-                    f->data = (char *)g_malloc(datasize, 0);
+-                    in_uint8a(s, f->data, datasize);
++                    LOG(LOG_LEVEL_ERROR,
++                        "xrdp_font_create: "
++                        "Not enough data for character U+%X", char_count);
++                    break;
+                 }
+-                else
++
++                if ((f->data = (char *)g_malloc(datasize, 0)) == NULL)
+                 {
+-                    LOG(LOG_LEVEL_ERROR, "error in xrdp_font_create");
++                    LOG(LOG_LEVEL_ERROR,
++                        "xrdp_font_create: "
++                        "Allocation error for character U+%X", char_count);
++                    break;
+                 }
++                in_uint8a(s, f->data, datasize);
++
++                ++char_count;
++            }
+ 
+-                index++;
++            self->char_count = char_count;
++            if (char_count <= FIRST_CHAR)
++            {
++                /* We read no characters from the font */
++                xrdp_font_delete(self);
++                self = NULL;
++            }
++            else
++            {
++                // Find a default glyph
++                if (char_count > UNICODE_WHITE_SQUARE)
++                {
++                    self->default_char = &self->chars[UNICODE_WHITE_SQUARE];
++                }
++                else if (char_count > '?')
++                {
++                    self->default_char = &self->chars['?'];
++                }
++                else
++                {
++                    self->default_char = &self->chars[FIRST_CHAR];
++                }
+             }
+         }
+     }
+@@ -178,16 +255,16 @@ xrdp_font_create(struct xrdp_wm *wm)
+ void
+ xrdp_font_delete(struct xrdp_font *self)
+ {
+-    int i;
++    unsigned int i;
+ 
+     if (self == 0)
+     {
+         return;
+     }
+ 
+-    for (i = 0; i < NUM_FONTS; i++)
++    for (i = FIRST_CHAR; i < self->char_count; i++)
+     {
+-        g_free(self->font_items[i].data);
++        g_free(self->chars[i].data);
+     }
+ 
+     g_free(self);
+diff --git a/xrdp/xrdp_painter.c b/xrdp/xrdp_painter.c
+index b02c9072b6..832186ff22 100644
+--- a/xrdp/xrdp_painter.c
++++ b/xrdp/xrdp_painter.c
+@@ -455,7 +455,7 @@ xrdp_painter_text_width(struct xrdp_painter *self, const char *text)
+ 
+     for (index = 0; index < len; index++)
+     {
+-        font_item = self->font->font_items + wstr[index];
++        font_item = XRDP_FONT_GET_CHAR(self->font, wstr[index]);
+         rv = rv + font_item->incby;
+     }
+ 
+@@ -493,7 +493,7 @@ xrdp_painter_text_height(struct xrdp_painter *self, const char *text)
+ 
+     for (index = 0; index < len; index++)
+     {
+-        font_item = self->font->font_items + wstr[index];
++        font_item = XRDP_FONT_GET_CHAR(self->font, wstr[index]);
+         rv = MAX(rv, font_item->height);
+     }
+ 
+@@ -870,7 +870,7 @@ xrdp_painter_draw_text(struct xrdp_painter *self,
+             total_height = 0;
+             for (index = 0; index < len; index++)
+             {
+-                font_item = font->font_items + wstr[index];
++                font_item = XRDP_FONT_GET_CHAR(font, wstr[index]);
+                 k = font_item->incby;
+                 total_width += k;
+                 total_height = MAX(total_height, font_item->height);
+@@ -904,7 +904,7 @@ xrdp_painter_draw_text(struct xrdp_painter *self,
+                                      draw_rect.bottom - draw_rect.top);
+                     for (index = 0; index < len; index++)
+                     {
+-                        font_item = font->font_items + wstr[index];
++                        font_item = XRDP_FONT_GET_CHAR(font, wstr[index]);
+                         g_memset(&pat, 0, sizeof(pat));
+                         pat.format = PT_FORMAT_c1;
+                         pat.width = font_item->width;
+@@ -946,7 +946,7 @@ xrdp_painter_draw_text(struct xrdp_painter *self,
+ 
+     for (index = 0; index < len; index++)
+     {
+-        font_item = font->font_items + wstr[index];
++        font_item = XRDP_FONT_GET_CHAR(font, wstr[index]);
+         i = xrdp_cache_add_char(self->wm->cache, font_item);
+         f = HIWORD(i);
+         c = LOWORD(i);
+diff --git a/xrdp/xrdp_types.h b/xrdp/xrdp_types.h
+index 41b65702f0..b794890b08 100644
+--- a/xrdp/xrdp_types.h
++++ b/xrdp/xrdp_types.h
+@@ -574,7 +574,7 @@ struct xrdp_bitmap
+     int crc16;
+ };
+ 
+-#define NUM_FONTS 0x4e00
++#define MAX_FONT_CHARS 0x4e00
+ #define DEFAULT_FONT_NAME "sans-10.fv1"
+ 
+ #define DEFAULT_ELEMENT_TOP   35
+@@ -594,7 +594,11 @@ struct xrdp_bitmap
+ struct xrdp_font
+ {
+     struct xrdp_wm *wm;
+-    struct xrdp_font_char font_items[NUM_FONTS];
++    // Font characters, accessed by Unicode codepoint. The first 32
++    // entries are unused.
++    struct xrdp_font_char chars[MAX_FONT_CHARS];
++    unsigned int char_count; // # elements in above array
++    struct xrdp_font_char *default_char; // Pointer into above array
+     char name[32];
+     int size;
+     int style;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 4ede3d285c..bcadd03adf 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23484.patch \
            file://CVE-2022-23493.patch \
            file://CVE-2023-40184.patch \
+           file://CVE-2023-42822.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

