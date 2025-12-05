Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4E9D3399B
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 17:11:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27.1764954702400530280
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 09:11:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sr90lE81;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so16398715e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 09:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764954701; x=1765559501; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kVBlZwutzG1mgzUCdE0Zdi8rxoVQiwk6pfRD94mVxM=;
        b=Sr90lE81gDCURkVnGQvrLw2Eg1TLXjj+oI45M6DaHXyRVgY6ra5EJypIbOSJI2oQu/
         AvqupHStc2/GKGKQdEPILbZ7d1RFHDd/fngew4N1I5M99LZnDqktFLTHaMlhTDtC2mTC
         XPvYhuvNdaUGVqdZCqzjqhiUfyeYpXITu5MCTC86htVYo/IOEHunmrl/eWpaAXN5o7FO
         LfwqEA7Pw6o5bBbcoH88ALtZKVP6D9QCJFtULrRqhJ9MJcTepuFuXpapCuR+ZmMXAJ6u
         m7Ejjq9tzUcvz18sfd3XhH2IaBXE/HDYNGpIZsPmLqTBlzD7wa0ICSou4ZWFjnV7C0M0
         p79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764954701; x=1765559501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6kVBlZwutzG1mgzUCdE0Zdi8rxoVQiwk6pfRD94mVxM=;
        b=N6lSOdFlCxLd3kQJO/L/DOI3P8pPOPZL5alF1k+FAz/WpMJircSanATUcMz0+X36Q2
         ZjxpEMTWeeUGRSaNJzDb2c7wvXfaWOmdEUb6DPTPzuuMinnZQv5pY9Bs0bU9OqYUMM7f
         vjaPHK8mKxp2aVg7ayQljfY5e6YCsn7f6HbtzrHCRWl/YPwrTILnzJBpgzKsf5F1SG7q
         rf1DHjGymY6JqmvJDxUXJBh7YbpE7+B4045VCOu87BI9gk14Y1xI035hFbJFoT2E9jjJ
         vvMyivYWO1A/s7L/hYNb2EoYtaLi2W2ZpdNw9NAn4Co/Ixy2DY4tw+hkK4POzdzF9YLP
         6ydQ==
X-Gm-Message-State: AOJu0YwHbMppr3PTtfibDjiPvASsXaZS0dxvzdM38NwCoxnNtY1uWMAu
	SohdIX/iHAnVCuDsR8cgcJXAWK6Y27QMwpOJ7m4CpoK53Vl0qUSM3meLeV2CHw==
X-Gm-Gg: ASbGnct9ZLhUWJlpGLP390z2X2ZIx3/QVF9YbDiRhEU+2AgTF/MjGQap3plRja3ndzt
	BF6yJoNrG4UAy9sxzIL0UkwrON+oEYNcagy0Dgk4gB9fj7iHfzsYvTrf0wyX6PO58NQfPrkyn/F
	TEFWDFJbTSW/Htp/w9OzTyhm0AB79zM/+BNGmCis+iV/GA6SGdlZke3kAUoIY3FrCK7dMWkXKBO
	jexnIGlTkAQsfU6H4Kczk/isBtUoNkKd0OityAJgNm7pKEYHF6CAeyB1s9r66aqhIZ7cThzEKkm
	3RzpPwJmDFcugkmZeQEx5AODQOWq3oM0LWci5q3RjWaRMLQcOFH7lKHyinAr05I3ONOQroy8SUu
	BDcHiv33KlgbUio7evlfeECc9qgMlyPZNv2acu0rMXelorV68YoYafWMPnoy2gCqgPIRhi9D6J3
	b+/VsDIph4
X-Google-Smtp-Source: AGHT+IH47z3nmaqs3bbKm0yuJ/+GTMQ4rCLLofFrjLOqB3qWHSAF1u3b2CRV3ORVEwOAz0EquOCJaQ==
X-Received: by 2002:a05:600c:c84:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-4792f39d92cmr77413025e9.34.1764954700652;
        Fri, 05 Dec 2025 09:11:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479310a6db3sm98563435e9.1.2025.12.05.09.11.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 09:11:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 08/10] xrdp: patch CVE-2022-23483
Date: Fri,  5 Dec 2025 18:11:32 +0100
Message-ID: <20251205171134.1346494-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205171134.1346494-1-skandigraun@gmail.com>
References: <20251205171134.1346494-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 17:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122354

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23483

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23483.patch            | 65 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
new file mode 100644
index 0000000000..7172a8264c
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
@@ -0,0 +1,65 @@
+From 35cca701c753db65d3c05b7ea4fff9bd09e76661 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:21:41 +0000
+Subject: [PATCH] CVE-2022-23483
+
+Sanitise channel data being passed from application
+
+Avoids OOB read if the size field is incorrect.
+
+CVE: CVE-2022-23483
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/35cca701c753db65d3c05b7ea4fff9bd09e76661]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ xrdp/xrdp_mm.c | 33 +++++++++++++++++++++------------
+ 1 file changed, 21 insertions(+), 12 deletions(-)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..64ae229e01 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -676,22 +676,31 @@ xrdp_mm_trans_send_channel_setup(struct xrdp_mm *self, struct trans *trans)
+ static int
+ xrdp_mm_trans_process_channel_data(struct xrdp_mm *self, struct stream *s)
+ {
+-    int size;
+-    int total_size;
++    unsigned int size;
++    unsigned int total_size;
+     int chan_id;
+     int chan_flags;
+-    int rv;
+-
+-    in_uint16_le(s, chan_id);
+-    in_uint16_le(s, chan_flags);
+-    in_uint16_le(s, size);
+-    in_uint32_le(s, total_size);
+-    rv = 0;
++    int rv = 0;
+ 
+-    if (rv == 0)
++    if (!s_check_rem_and_log(s, 10, "Reading channel data header"))
++    {
++        rv = 1;
++    }
++    else
+     {
+-        rv = libxrdp_send_to_channel(self->wm->session, chan_id, s->p, size, total_size,
+-                                     chan_flags);
++        in_uint16_le(s, chan_id);
++        in_uint16_le(s, chan_flags);
++        in_uint16_le(s, size);
++        in_uint32_le(s, total_size);
++        if (!s_check_rem_and_log(s, size, "Reading channel data data"))
++        {
++            rv = 1;
++        }
++        else
++        {
++            rv = libxrdp_send_to_channel(self->wm->session, chan_id,
++                                         s->p, size, total_size, chan_flags);
++        }
+     }
+ 
+     return rv;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
index db191d5645..4902990272 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.18.1.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
+           file://CVE-2022-23483.patch \
            "
 
 SRC_URI[sha256sum] = "f76aa16034689bb8997e56fd554db29ba57caa1bab228a6eda28be4389dedeb9"

