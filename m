Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EA1D1BDF0
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 21:30:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27241.1764797398638170772
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 13:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KgsCZLHr;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42e2e2eccd2so193407f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 13:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764797397; x=1765402197; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2nuIga+F26K9UDDl4BEbrHVmKCoDmjU9KlwWNukMKQ=;
        b=KgsCZLHrxw/sXNgLxTKwlVStQWpflKqs3EPGXtpDsbofzBcEgb7ZFoXaLWevdkFcOQ
         1Uye0PW85bu9oveSKqA39DcYQ7Bq0UEhJctY0vL7iDTGOPULr0NV4gjC44hgHOr77AUJ
         LW0iRTy3cimlfHQsw97mSG5fcLhYk/Ckov32YqECjmXzrl8rxTcbUoarUiwTLl54ewzY
         x3YHjcO+Ju6b0lSKo8LHC9y/pmiJ6HCEe8RUx6DfvyMNLyD68dETNy9Kps2KL4o4+hae
         9o3tSyYr2CEQnt4vupS+RBY7prsPWanQm+qpAFxM0jZz5futPf8thuQkx4WU8H7I6KHv
         tj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764797397; x=1765402197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K2nuIga+F26K9UDDl4BEbrHVmKCoDmjU9KlwWNukMKQ=;
        b=DOgiom2vCZ4a2Ts1PIr9t9qkGu9BEHEZ9eASetrzW2wljSAUPnvGBEJmuU6opNiOIj
         t17z2SzWRhCQeMxeslyjnKTdZWBbElqsLESPYrz/t/zUPnZTbSjsKNGcW51k3XRh4SXC
         ouNrVD5z2jTPhQva0CPZVYZZlLNM9xhTTHVUZR99cpLq8vuOU2x2ROeqKZtwBH/q581N
         yAeCnX6j0CHUlVd7IT9NCg9otjO2gBZEEHsmiL1wZjubsgLSBHOsB/sNR02aRrjyQ7hS
         dUYfBfi8bMnshZjY4Pprz3OPvwPWtCBzYWZAGeBBkfh9zoBav8Oi6FIbMVwX536CBcnE
         WlLw==
X-Gm-Message-State: AOJu0YwV7gcZ2YbL0u/NGILQVXlswF+IUMCkvKyjH7W7OrCS7F2uKSx+
	7UiPGph+8rhs5qEFC1aasWVtUG9epfrDKFeigbVouc4JO3GaHxsRQGyhLxkg6w==
X-Gm-Gg: ASbGncuAEnvAkEcnOrQ7+dBGRBTqHB8VhVIrVlFt2A+f6CtYLrE9rORX+vdoPURNG6Y
	W126AbzulnLKunEcgb8bDS0yMYXkckg1MWqbZqqTkm/JAF4JjfmplEgTkGEbTZdiazLCBdf3VLM
	SiMJZWdNVEfiVEhzbZVdnAsI7eDBduFJxp13CoRggfkpJl6OmO4x4IrBbT3umT90hCwrQ9y6BxR
	zB1Q4tIffNULwzoPunWOZxJytJReICk08T1J/bS1WTkzX4GLz+jVkHoI65r6JvXBYyYBWDqcunC
	JKCr421OYX/DBTOppH3hcWpK7Z9jiuvz4VRRXcAN1SDrbaSGpK/v1NZh4ADEsSHXq5W5HGLUoru
	lE3lZ1Ay625zKchpAxttDb3Rmutb7LyhQ8o38WHwiYOSY01ts6nCRoMaqwFF/b4Jq533yZjDheB
	FgNElDj4mo
X-Google-Smtp-Source: AGHT+IGlA23M5jjIeWGeNpgX3lyd9Ndl1m06vB4Lv5iF00/GLj/iWTS9G6I4pG2gIg8ZDksecL72ww==
X-Received: by 2002:a05:6000:2dca:b0:429:8bfe:d842 with SMTP id ffacd0b85a97d-42f731678d3mr3958507f8f.4.1764797396951;
        Wed, 03 Dec 2025 13:29:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f6ffa18ffsm10722885f8f.5.2025.12.03.13.29.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:29:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 10/12] xrdp: patch CVE-2022-23493
Date: Wed,  3 Dec 2025 22:29:47 +0100
Message-ID: <20251203212949.4046524-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203212949.4046524-1-skandigraun@gmail.com>
References: <20251203212949.4046524-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 21:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122288

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23493

Pick the patch that mentions this vulnerability explicitly.

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
index a9107a0e26..f3d11522ac 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23482.patch \
            file://CVE-2022-23483.patch \
            file://CVE-2022-23484.patch \
+           file://CVE-2022-23493.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

