Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E1DD1D88A
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38416.1764835001964821257
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XsOGCfoV;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47774d3536dso5827675e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835000; x=1765439800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCJ3jEbfEkYMjxyOgPGINNeFdo0g0y2SksI96euDRxw=;
        b=XsOGCfoVuGmif2+amtg1V6kFezNDXaVA6tHKEC7f2dNBJ583OFIiPlDiqQIgxiw5bW
         M9HciGNJFUK/QTj0N/vqiZdoPthoZucPPG22uquzRfRwlAq3vEsZy9Y5olMOkbPxfnjy
         DrOF7O0MgzaNm1S1xv8pgpfPG4NeWspZNFwacW6lLHPlk8RXRfxeSo3aakL/gAEPrEbH
         njdHPqNAhQP/Rq8bb61BVxmm+suXz5bof2YbSBu+REKLfwPY3N6JZq+3Qq0BdkMDO1v8
         qa9LAJZQdUe72dY+lBJLc9ZVRhpcWnG0+IONKHGn+JEkrFMv4cfxAFlXa356e81ayjxo
         5y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835000; x=1765439800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LCJ3jEbfEkYMjxyOgPGINNeFdo0g0y2SksI96euDRxw=;
        b=hkqLPrjUQqEwAxkyOILiSyh1HFYuoHLLTvni5yfToYDITXgIQFEnZ6FpxPgm0t0Shc
         2ygVNY+y7XJgmLn/qBZ7/BmsWE16oKm1WpsqtSOKA0TeqwwqJPpf05lM4aZShFN5Kktq
         33t0Mj+LOVV+4vmCxnThlNA3EgoKKP3u7m4egjcejmBU66wtphbwvC9NghcKe55RB38m
         NeTejl0EY2XVoxvNcjdgU5yO7/QckefdPCGC3O2hNbyfM4gp61RGt0G46PX0RlT+/LSx
         ICKMWgL+CVijT0MxiqPjsfkiJk4d98lNHSODSA2js+RKb2wQcmF3TlSS12pKL0gXs9z6
         ZU9A==
X-Gm-Message-State: AOJu0Yyl0eHfwwsI0re0WMRhZFci4mFt26LmVOewBqVS2pCSh+OeNKUA
	XBWYb5wCTP/XSLRtsZ/juCSYQZ9zFZYKVrwcNaCDna7tiG7QLNSpqbsmi7SK/w==
X-Gm-Gg: ASbGncvISy3QFNtVRNttWW2A9qCXnARqKRSDRvdnOZgOYrtdRWcIjZojZmV6u9123PZ
	YDakLVwtPcYI5qIkMdywkNjQDVixdedMBZGOSAuSBH8reYHIeYUYIL1BfoGuDXQplYNZUgfyOYG
	dU+6CViLTHp64zLsokHb4iY7eTrD+wXK2M3vXqfIrEPR1xW10DbN/8VabpuJFOfZH7pT41aYZLL
	jTFyk1SolZHsb4jh273e4P21STqWeMej53sPjPkZvmHRmA8MIS7W0bx7BNUqOz+i36U9or1B2p6
	b2sTRH5tciWwFim/8ol3neP/auaMeC1/H7GUnBg9qUGPx1bg64orbKVtaS/+2NAH5QTG/3BrdEt
	Kb9gI0PEfhKdvgktWpaw5GM41OXH5C1wlq6trNsgY8C+/GePSmTt3WuR3CRcOJjAUIZYWkzRJpN
	8uuA2LOnNR
X-Google-Smtp-Source: AGHT+IHNNa8SuNXPXG4yQjix+gjvXa8HIRs8hNFeEfZ7oH7BpyONyLbaaCsjeNmoYrZf060QE/1/lw==
X-Received: by 2002:a05:600c:2f97:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-4792eb1a02emr15057155e9.8.1764835000256;
        Wed, 03 Dec 2025 23:56:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 07/12] xrdp: patch CVE-2022-23482
Date: Thu,  4 Dec 2025 08:56:30 +0100
Message-ID: <20251204075635.1088007-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122309

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23482

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

 .../xrdp/xrdp/CVE-2022-23482.patch            | 69 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 70 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
new file mode 100644
index 0000000000..ef99baa8cf
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
@@ -0,0 +1,69 @@
+From bb9766c79f24a0238644e273bbcdcb2c9d2df1bf Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 11:05:46 +0000
+Subject: [PATCH] CVE-2022-23482
+
+Check minimum length of TS_UD_CS_CORE message
+
+CVE: CVE-2022-23482
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/bb9766c79f24a0238644e273bbcdcb2c9d2df1bf]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_sec.c | 23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/libxrdp/xrdp_sec.c b/libxrdp/xrdp_sec.c
+index 691d4f04f3..084fca6b8d 100644
+--- a/libxrdp/xrdp_sec.c
++++ b/libxrdp/xrdp_sec.c
+@@ -1946,6 +1946,17 @@ xrdp_sec_send_fastpath(struct xrdp_sec *self, struct stream *s)
+ static int
+ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+ {
++#define CS_CORE_MIN_LENGTH \
++    (\
++     4 +            /* Version */ \
++     2 + 2 +        /* desktopWidth + desktopHeight */ \
++     2 + 2 +        /* colorDepth + SASSequence */ \
++     4 +            /* keyboardLayout */ \
++     4 + 32 +       /* clientBuild + clientName */ \
++     4 + 4 + 4 +    /* keyboardType + keyboardSubType + keyboardFunctionKey */ \
++     64 +           /* imeFileName */ \
++     0)
++
+     int version;
+     int colorDepth;
+     int postBeta2ColorDepth;
+@@ -1956,7 +1967,12 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+ 
+     UNUSED_VAR(version);
+ 
+-    /* TS_UD_CS_CORE requiered fields */
++    /* TS_UD_CS_CORE required fields */
++    if (!s_check_rem_and_log(s, CS_CORE_MIN_LENGTH,
++                             "Parsing [MS-RDPBCGR] TS_UD_CS_CORE"))
++    {
++        return 1;
++    }
+     in_uint32_le(s, version);
+     in_uint16_le(s, self->rdp_layer->client_info.width);
+     in_uint16_le(s, self->rdp_layer->client_info.height);
+@@ -1994,6 +2010,10 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+               clientName);
+ 
+     /* TS_UD_CS_CORE optional fields */
++    if (!s_check_rem(s, 2))
++    {
++        return 0;
++    }
+     in_uint16_le(s, postBeta2ColorDepth);
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_UD_CS_CORE "
+               "<Optional Field> postBeta2ColorDepth %s",
+@@ -2138,6 +2158,7 @@ xrdp_sec_process_mcs_data_CS_CORE(struct xrdp_sec *self, struct stream *s)
+               "<Optional Field> desktopOrientation (ignored)");
+ 
+     return 0;
++#undef CS_CORE_MIN_LENGTH
+ }
+ 
+ /*****************************************************************************/
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index ff14cf8397..29245f3747 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
            file://CVE-2022-23481.patch \
+           file://CVE-2022-23482.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

