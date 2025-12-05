Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F88BD339A6
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31.1764954698784810593
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kUwNixhi;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477770019e4so23808435e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954697; x=1765559497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNS8rslF+xEAEEsFQJUK4QEYchWzE8+moUTl2z3NyOA=;
        b=kUwNixhizhwLsoeGsYRe/Ne7DcgTKUons2Wi/n36naoAgCL5if7RHRTV/zpeSFTg+r
         QfjDfsV4x2yViL7DelAjr9o77nDBhuyCg3Un58YjdfEgeRm3TMOGtojmsW0lBbtwE3iW
         WVOD4wQxz0ueyMGWxmX8059qEw5fEvJZl9bCiTzAlDMZND8oeKZFYpbJd5msjjoho9/o
         eOIynFGIkTWrmD5EBw1EiOggXasNsQUEcU5tPKU0ptHvTzneOkgnmBvD1p6ZM6jjVhuG
         u3Y34TmYE5Jh2kLopDjZ0RSYljVLN0KxbbuCplHGbtNJJuE1GBi1wiP5LBnoYJJcDoZE
         dtBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954697; x=1765559497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DNS8rslF+xEAEEsFQJUK4QEYchWzE8+moUTl2z3NyOA=;
        b=F/FR5vlyZuWbvPT0f0B27DbyC1Pl8DPUkveq7EKNSCN2vOPQFuL1Z3hTwo7TZdVzZG
         JMJ3nLC9FWlRIE60Lbhqywhy4qzYmYlA2cDD2U2FmxI2jKecqJyhk5nu/ESm8+xS6eQD
         grwNrVKH1ZydUQMtUWn4svuqEYagLsVc9Feqtq0ykbbugOPSdCS+YuR+SN3xFw4gDG6j
         d0WpCPph1hzenIu4i7wunbl0qm6qomlZha6cAw1RE2XVQQuBeez5jq7qjMO6Oq9Jb3Rr
         dj2kf2Lqce2Ic0GznyK7VrULy7GNOGneKf/xd/5kjfK/h6H/i/1KwdMASjgnn6Ej4ixl
         p/jw==
X-Gm-Message-State: AOJu0YyYxj2k/I7Xu3na16+i3usGjyEfGicOe1zhosGmRvJkIvJTCg1k
	yoGb6Nx7kBzKePhHZeeUhBwi2p9WVfAz01GUs2PI8DTlQ/IXeymfc+VRQawYsg==
X-Gm-Gg: ASbGncuN8jOOzKn8EtzHD4R4AEkr/C7s7c+KF5HuHbpYehV/zNyet3b7rtKGMcvpaOD
	UAKiGbplLomyQ3s326QPhej56xQ4XmwbCbQG/3NwYAgN7+sfEO9npwmIr7r3D52Y9v3eMl2e8zK
	OMGkmdhDlbxoiiYtSYxpt7YQmA2lNe3AuSgr9zRqrcrUIMDKggckl52+tc0QMIWCxOKODL4OV0k
	uEdp2KhvzmuWIaqoPjm/KBtklZBaN7D73qGYAzWvSRVpvrlyE6uFxdphLg8MrtFlvtrEChJ2weK
	6dG8sJyae7vL/nCWeGBSALgWdXi5bxbBZ0pOU1KfB5EiEJAzhlKzIx+OHvQQfjMqn47vqv2KS5v
	vsUklgpy7LCQkLnuOAXtVCHEQjAh2SIno7NfOXsivWBr9wb7jCwRAD+ArCgsOBhXVt23SN5wW3W
	if9rBLMvPxNcxd0KaG5gU=
X-Google-Smtp-Source: AGHT+IFhHukJOWbwljY787BXxA+oG5QMEhlNRRejupo7t6WbwQiPpSYRZwP0dxGTg4NsX0QhT/Fi0A==
X-Received: by 2002:a05:600c:45d1:b0:471:1435:b0ea with SMTP id 5b1f17b1804b1-4792f38d501mr81116675e9.24.1764954697072;
        Fri, 05 Dec 2025 09:11:37 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:36 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 04/10] xrdp: patch CVE-2022-23478
Date: Fri,  5 Dec 2025 18:11:28 +0100
Message-ID: <20251205171134.1346494-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122350

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23478

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23478.patch            | 85 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
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
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index 546741969a..12918e1a1d 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://0001-arch-Define-NO_NEED_ALIGN-on-ppc64.patch \
            file://CVE-2022-23468.patch \
            file://CVE-2022-23477.patch \
+           file://CVE-2022-23478.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

