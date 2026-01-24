Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 712EBD715D3
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:13 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14205.1769236212049280040
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iiCvrN1h;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so20740895e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236210; x=1769841010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWbX+zrOA+bu7yOLZ4H/aXfF4jz6fjR6P2jrTzyOTSY=;
        b=iiCvrN1hv2wif8ARWT0ozsGtLbYnydXORueROdjbgMRR896DiD2QZuzY0c7DUzJZL3
         V+DFfNNW4Izl9KZQoqnQFLkvtOeflxS3LjHjgFMkgJ+7jXB9b5Mi1/JNabAhSD6KeUO/
         g5UcluAB1VtYJm35e+3p6quF4OuWd6nh7DGxrH72jQ5+FnfbsdaPIsCADHE2GioNqa4Y
         SqwUOMhi+AAgk0pFFvydWv2fBWnMoBKBFDQn+QHTugweobRkA5ypozNidowXdzvLrpBL
         wp3F0HvIcymaxjrX/9QI80YlBjo4dR6uvSy4rJyqE4nnjqsUDqqTCZfQYpqDa04oLNqU
         0mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236210; x=1769841010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bWbX+zrOA+bu7yOLZ4H/aXfF4jz6fjR6P2jrTzyOTSY=;
        b=o1qKEXfuT1z9w/PqYv+JQjZ9kOZaivg4z4HZ1I5upxiOUFhW/mxXHImGAYfmwtXwKj
         p4K0cQ74xC/NPkZiEuxyePJJfYQlpttkQ7sHpzTV7t4ejh4t2t+uEEBH04EbMHjD8fQ6
         Va0+5HCUZyEgctjc6U9zMXcWqlzItRWDz3VjU8C6A0RsDUiplbTvxVcftX2R2kGtwsaT
         NeOXrUHWmPuKx+nX75S8InEsFz40nERKatbkoJWNaQdMChDvD0DiQO3BCr46x33VqfUX
         J8TDqVyB/FN0g55H/nYGP0qh9p3FNqfEMSYqLURiCjYhE5foLS5TeTPRfLzPQwPvgzsF
         xYgA==
X-Gm-Message-State: AOJu0YzqysfqXkSmfsquVE9ucxxWhDhKnACmlYsfknRvz2Jjw7IiPa3L
	HN0T6W8c3khr9LHVVv7raoL0kV2U/XX8+pXt9S+ugDZvxrsQy7ZhwQoBL34waA==
X-Gm-Gg: AZuq6aKJRBX8nOjlgeo3PZ0X4F2JDe8wdhNvmilaq/2JXqQK4p+XLAdSOIBl15Pp4JP
	Sq7s2XIyPOdaCj3n5kXJKLADOjkFXKzXvXCBMb0XCbo0vCbUQQ1yDm2ygxOeZELHMTRNioT4tSw
	+o2Wus/Q1iQZ+UBRbEES3TsA03v7P7cl1o3F8/+or828AkM5P9Qj+ij+R4RRRsJJMWs+x+T9n/W
	XrUyjx0q1if8thWMIfIrle4nn0W/6rmFCEWjbAimV+8WoZ6EpDw4EwtJgmd5vjx95gixUW5KiyL
	u8Ka+HZueMDG24kIvs14qmtydXD3QCYyf43S3SLwJ9ukD5BdHaQ/F8F7T0VOOfhbtZggCcgzmTG
	3OtrvdLefeNyom0Dgf9n11IOwL23cLsPErqBfeeXMlWCmOqL7QdVFZOhFhWlHl0WapdXPR1gEu/
	gUfv8hrqEb
X-Received: by 2002:a05:600c:3b0d:b0:47b:deb9:f8a with SMTP id 5b1f17b1804b1-4804c9b736dmr74444175e9.30.1769236210388;
        Fri, 23 Jan 2026 22:30:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 04/13] xrdp: patch CVE-2022-23478
Date: Sat, 24 Jan 2026 07:29:58 +0100
Message-ID: <20260124063007.28313-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123810

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23478

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 63b5fff9755a5849a0bbfba5447e117130efcf54)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23478.patch            | 85 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
new file mode 100644
index 0000000000..de4f773332
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
@@ -0,0 +1,85 @@
+From 6cb54a1c26b53617e1c79a0abc96d03c4add1eb8 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 11:12:42 +0000
+Subject: [PATCH] CVE-2022-23478
+
+Fix potential OOB write if invalid chansrv channel opened
+
+Also removed an unnecessary dynamic memory allocation
+
+CVE: CVE-2022-23478
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/6cb54a1c26b53617e1c79a0abc96d03c4add1eb8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..c91e03ab56 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -1360,7 +1360,7 @@ xrdp_mm_trans_process_drdynvc_channel_open(struct xrdp_mm *self,
+     int error;
+     int chan_id;
+     int chansrv_chan_id;
+-    char *name;
++    char name[1024 + 1];
+     struct xrdp_drdynvc_procs procs;
+ 
+     if (!s_check_rem(s, 2))
+@@ -1368,33 +1368,32 @@ xrdp_mm_trans_process_drdynvc_channel_open(struct xrdp_mm *self,
+         return 1;
+     }
+     in_uint32_le(s, name_bytes);
+-    if ((name_bytes < 1) || (name_bytes > 1024))
+-    {
+-        return 1;
+-    }
+-    name = g_new(char, name_bytes + 1);
+-    if (name == NULL)
++    if ((name_bytes < 1) || (name_bytes > (int)(sizeof(name) - 1)))
+     {
+         return 1;
+     }
+     if (!s_check_rem(s, name_bytes))
+     {
+-        g_free(name);
+         return 1;
+     }
+     in_uint8a(s, name, name_bytes);
+     name[name_bytes] = 0;
+     if (!s_check_rem(s, 8))
+     {
+-        g_free(name);
+         return 1;
+     }
+     in_uint32_le(s, flags);
+     in_uint32_le(s, chansrv_chan_id);
++    if (chansrv_chan_id < 0 || chansrv_chan_id > 255)
++    {
++        LOG(LOG_LEVEL_ERROR, "Attempting to open invalid chansrv channel %d",
++            chansrv_chan_id);
++        return 1;
++    }
++
+     if (flags == 0)
+     {
+         /* open static channel, not supported */
+-        g_free(name);
+         return 1;
+     }
+     else
+@@ -1410,13 +1409,11 @@ xrdp_mm_trans_process_drdynvc_channel_open(struct xrdp_mm *self,
+                                      &chan_id);
+         if (error != 0)
+         {
+-            g_free(name);
+             return 1;
+         }
+         self->xr2cr_cid_map[chan_id] = chansrv_chan_id;
+         self->cs2xr_cid_map[chansrv_chan_id] = chan_id;
+     }
+-    g_free(name);
+     return 0;
+ }
+ 
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index a953342910..bffed4c265 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-mark-count-with-unused-attribute.patch \
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
+           file://CVE-2022-23478.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

