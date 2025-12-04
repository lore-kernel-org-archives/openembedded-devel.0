Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B94D1D88C
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 07:56:43 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38414.1764835001423804578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 23:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IdxvmNX5;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47778b23f64so3481715e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 23:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764835000; x=1765439800; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c1VkTKNw31ybakSeTtBY97Eo9gVu+PH2V1p2tR7kDsQ=;
        b=IdxvmNX5hOL8mtRRmXvZnhHaKKqWDF80WtOaf2ClktWYfBA2Jvpad8AVzygSPfWUY8
         hwesPlNj3V1sRytsk2TTLtBmBRHbB2VwxxIU8bJ109bXRwsSsgNv/VhXX3x9CggdyOam
         7H7XktWwhh2FzgfSXIF6Gl79yyGQkeIirgIzN0t3hKSvb9od9gU4E9dCwVnU38OqLqEj
         bXEiuM3e0GaACL8EDxbbl8BHl1wD4w9bCCAkmB9YTiJLped12Z/axXmqAQe+jL7/WNjY
         A+dQexltCqHwePy5jbk3h3XVdCy8u4CGUpJdd6yrNxf0mABthxXQIIAu69d/Dw5pn9Mp
         nctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764835000; x=1765439800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c1VkTKNw31ybakSeTtBY97Eo9gVu+PH2V1p2tR7kDsQ=;
        b=RyQOeKrYQZwnkIgm60XFuTNQ5KYIygwYO91CrPptT7+Y18ijWhr7E4jET4pa/uhlRU
         oOYQgt+tap+5828QD6/RzTWU+ofo5rs72gUpcBRH2KF6IuY6A5GhoBoxvQMY0+dtQeU8
         wSs7Y0w1AI0fujj0bc97jfT2mKwBHDiFyZwtKkdGlzJ4yMAsXclfy27B3UhZlnXdBNXB
         8/R7bk7ifZGr2b15xr4g5bEPt6TiVrM+TUlHyCmDPMBgvShGR484jMwMDctOGcL4rTe/
         pxWvSxd/lEXBB3RYsfD90rYZUZkTirH+S6bireJF8s8KFa8eW92534wy4kTo3zUwRq8Y
         1Sfw==
X-Gm-Message-State: AOJu0YxuuVJHCr7sNyJW/Pzt4PLr3N2glm9LSSayzQdwlxzFqD8cdLsC
	8nz6HaVuurd1a+aKlow+UaK6jJWEx36I9sQYflpgz4srTBQx3Y+GCksGP0g0/A==
X-Gm-Gg: ASbGncu5Qj9xa8cZZJujRGpxcQtaRhPjL2XAI+A1bhuM7CskHYFMUDnk4Q6kYI9gfEg
	PLvp+zi+PZneAtJ0WHpnXiPMMq/TKizXKtDn13B33cp9QiM0o0nJuxPQKQCHSfeyN6Vezk9aDj7
	egkvgrOw7WMJvcSiBs1bu0/6Zhd9CfsIm+whJovAzQarw4MAjRUHd2NpoO/JpQ9gJNjF8wNhHzW
	eqfX4roIPVooMCw3XlFiTBCRk301DV5bIZ6mu4uMVw8oqdFxmfEyorz6UZ1SiGQRFzfTD1hiPd0
	GboAbCtF0eBhd/HLJ9z1AtpUcU5oh2Gyy80tjT8zZXUuWAiV8kxy//iD+5hqajl5/U+a65U4J4K
	yOwlbkDwZItACeet1YUKSnXUlFkFU2XjWpLHLCRfRhu2QbA/V+PzUtgo3jdUOb5JKe3pH0MGv3f
	N2Fl4e/hTq
X-Google-Smtp-Source: AGHT+IFY95ygEOCNQv2Z/vmNYM+aoZ5tu5sOS8sHODlxQyT1l2jwZ16LMuQSWPh08y1oJBKh0Kqc6w==
X-Received: by 2002:a05:600c:1f8c:b0:477:aed0:f403 with SMTP id 5b1f17b1804b1-4792aee3561mr46033635e9.8.1764834999591;
        Wed, 03 Dec 2025 23:56:39 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e29sm1730883f8f.32.2025.12.03.23.56.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 23:56:39 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH v2 06/12] xrdp: patch CVE-2022-23481
Date: Thu,  4 Dec 2025 08:56:29 +0100
Message-ID: <20251204075635.1088007-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204075635.1088007-1-skandigraun@gmail.com>
References: <20251204075635.1088007-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 07:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122308

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23481

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: fix upstream-sattus formatting

 .../xrdp/xrdp/CVE-2022-23481.patch            | 46 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
new file mode 100644
index 0000000000..bb2d3c8cfa
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
@@ -0,0 +1,46 @@
+From c77e974080da8267d902f99ca5ab7d22ea02d98c Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:40:25 +0000
+Subject: [PATCH] CVE-2022-23481
+
+Add length checks to client confirm active PDU parsing
+
+CVE: CVE-2022-23481
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c77e974080da8267d902f99ca5ab7d22ea02d98c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libxrdp/xrdp_caps.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/libxrdp/xrdp_caps.c b/libxrdp/xrdp_caps.c
+index 5c5e74a579..ac21cc0a18 100644
+--- a/libxrdp/xrdp_caps.c
++++ b/libxrdp/xrdp_caps.c
+@@ -667,13 +667,27 @@ xrdp_caps_process_confirm_active(struct xrdp_rdp *self, struct stream *s)
+     int len;
+     char *p;
+ 
++    if (!s_check_rem_and_log(s, 10,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header"))
++    {
++        return 1;
++    }
+     in_uint8s(s, 4); /* rdp_shareid */
+     in_uint8s(s, 2); /* userid */
+     in_uint16_le(s, source_len); /* sizeof RDP_SOURCE */
+     in_uint16_le(s, cap_len);
++
++    if (!s_check_rem_and_log(s, source_len + 2 + 2,
++                             "Parsing [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU"
++                             " - header2"))
++    {
++        return 1;
++    }
+     in_uint8s(s, source_len);
+     in_uint16_le(s, num_caps);
+     in_uint8s(s, 2); /* pad */
++
+     LOG_DEVEL(LOG_LEVEL_TRACE, "Received [MS-RDPBCGR] TS_CONFIRM_ACTIVE_PDU "
+               "shareID (ignored), originatorID (ignored), lengthSourceDescriptor %d, "
+               "lengthCombinedCapabilities  %d, sourceDescriptor (ignored), "
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index 55dab2e867..ff14cf8397 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -22,6 +22,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23479.patch \
            file://CVE-2022-23480-1.patch \
            file://CVE-2022-23480-2.patch \
+           file://CVE-2022-23481.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

