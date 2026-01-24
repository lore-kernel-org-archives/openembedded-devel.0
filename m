Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6BAD715D9
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14210.1769236216714258965
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L+UNejRM;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso14344715e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236215; x=1769841015; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=suoezuSfjL92Sl6M7WWpi31eHAvjvZwYLjzH6XnDSrg=;
        b=L+UNejRMzIgdsk3DTs+gYWBUpAPX0RK8hJ14K1h/vkSWK14QGXZ+e4wREmOZTlJHAx
         0+kHCp5TLFEqZUWKxWXbZzUU/HuueHkl2F/1XqGM4netX7HxhyzYq8wMWKvUDOHdhjNn
         6UjsSaTVNAxoqLnLWxNRSMnLME80eExTxDABwspIWjf1erXi2D3MJVAYXJpc3Ha446Gc
         relVtkyUnQkTnHfURqLR8oAcOm1b30EXj8KwTYG6lUtnacgiBnRMv9q54TIprq16apoL
         aE0pv52a5AF8nUbVQE1yaCYhtkfEti2v4AfVqTp/PnSuGdkimsvnkND+n+ZnuKiFoivr
         X+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236215; x=1769841015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=suoezuSfjL92Sl6M7WWpi31eHAvjvZwYLjzH6XnDSrg=;
        b=gQHUwZVIFc6gctYgeHD9R1lA8cq0gZqPOy0hSaIBFMnjxDRhiiasEnyd1VsoTVmgRz
         u7/CUCkVczQMlkXxe7uwZsMUu1fkXxYGGeHMQxGJ4Gt4DcDKpzQ1AlhJaWe3ahwmY+AZ
         yufNZvkFXgJihj3ehV9qy/2T01UpL8eUWnJR5n0B3s7PShaf6IIuGxW4EfXPUnKx66dt
         uzO+h114pnCzVYm7azv4sbZZggD3LFxg6C4lo/UgHaHjfTlyOABR2XAhaxpG2vhhfZtM
         whnaEqG4nT2W4BrmdQH3QemcXfSDERckbF/yWVOCZq3np6rJaCmIbwutavxa8k2xPMrp
         SWWA==
X-Gm-Message-State: AOJu0YyHJSXpBEOt27aHBoyzI48DJGpudQRQ/6Ir/d6sbyvOSqGRE3Rh
	3OQ8X5Uqwpwcd0dlmRKJH4nq9mLygpyWvCYFjXq3XeL0JxJn1yblT067J7Tu/g==
X-Gm-Gg: AZuq6aKHlZfYrF/yDrELEtYi5mQfmI17S1/EHXfF5wwWIJH6t4Q9kVu1BFWBLbvBgpv
	r436A6kIIXwA2BiJKwp8cPjYnSX0aJ5yoN/eMyadi7w/kKRF+FlV3taAcLLboHLHKwq8tNc14Je
	nxjgH5BgZxuouEYwX146z1l0MiBpS/E4FxfzlyZ0xuXVYIOfldcKDXRBo57+80URv6dql3BUMnV
	IEKy7IXj4TiE43CJI4bnKMUWj6zH3injNmpwXnkxkxGASMrNHI9XWb8f3/A5AiG4pFadhxnbQo1
	1XdJFrTmAyW+K2pKXX8vmJ0zv/rxVigT/qvcemwaFQlgu8YQEDW2tWYUfbXixl5UKNLUl//fQui
	yERyHL/Yx+ccEvqO975lHZIm7bYhO0VgTgsZyNfhMIYL2UKvqZPfc1gYKwdsepDnOYA6Iv5bKz7
	Wru92ehbPd5C3zCE9uKfM=
X-Received: by 2002:a05:600c:1c17:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-4804c9418f3mr102784165e9.7.1769236215050;
        Fri, 23 Jan 2026 22:30:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 11/13] xrdp: patch CVE-2022-23493
Date: Sat, 24 Jan 2026 07:30:05 +0100
Message-ID: <20260124063007.28313-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123817

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23493

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit f81041bb39d0fb10bbf3c0edcae47a65c573088c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23493.patch            | 33 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
new file mode 100644
index 0000000000..de3f7a42f3
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
@@ -0,0 +1,33 @@
+From 030db5524be7616967ae9e7d26b3d4477cf6082d Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:49:06 +0000
+Subject: [PATCH] CVE-2022-23493
+
+Check chansrv channel ID on a channel close
+
+Prevent OOB read if an invalid channel ID is sent.
+
+CVE: CVE-2022-23493
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/030db5524be7616967ae9e7d26b3d4477cf6082d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..068424885e 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -1435,6 +1435,12 @@ xrdp_mm_trans_process_drdynvc_channel_close(struct xrdp_mm *self,
+         return 1;
+     }
+     in_uint32_le(s, chansrv_chan_id);
++    if (chansrv_chan_id < 0 || chansrv_chan_id > 255)
++    {
++        LOG(LOG_LEVEL_ERROR, "Attempting to close invalid chansrv channel %d",
++            chansrv_chan_id);
++        return 1;
++    }
+     chan_id = self->cs2xr_cid_map[chansrv_chan_id];
+     /* close dynamic channel */
+     error = libxrdp_drdynvc_close(self->wm->session, chan_id);
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index c67f2e83d8..663ee9297a 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23482.patch \
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
+           file://CVE-2022-23493.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

