Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB00CCF9EC
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 14:16:15 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.33909.1761574566354639043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 07:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BVUUXlUB;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42420c7de22so2370275f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 07:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761574564; x=1762179364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+Rg0txVYKuHnBj2xyPjzFn/J/2+oLsFdXyCaeknPJY=;
        b=BVUUXlUBtAL0myl6Mr8//H174Pf3YU911KkSn8QzgGB1FKEpNTMKaFWGFJAF8QuUM3
         DUrUIhW3C9P46EVD2bm1yadQh5kXB94ybFzDa+8HpHWGcT7ebTqCZOnZ8lndCVdfV7qw
         y2oV3ggyyXVRNLqEK4SWXriLLfl/E3nmcamyBrUqz9LppNPYwzzkXB8RXtFFHlSAVcaX
         NUn38YetgNahTxR4C7yOM53AMd43N4IEewB0sez3d1rx7u7FsoPrBvA+P1PpoTmo2vSr
         6rigMGVq7M8wFRjKpRZkQZbG9NEKWRpaRn7SlSzgflxnTB6RMMJq/5Z7MCXx9PFmMT97
         GoyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761574564; x=1762179364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+Rg0txVYKuHnBj2xyPjzFn/J/2+oLsFdXyCaeknPJY=;
        b=ScmN1NnoDmacRmWu1y45d8yOvW1WfXzywQ0fkRYhvb+0vQxwBuZ/SNusTnViIFrr1U
         mNlVgPrD9H5LVLvNIiV9ylt+9DGJPMyZi86yNXnXOhQkf9L0qwzD5QM+G5dG4GurEpxa
         kiAMsjCrByuhhw29rfdiTG0uOBhlZAOfYO+91U+/wQZhMr7F94l9+QXuAcwcw6rbOUMN
         OPWw7XITuxrwihrcH0ICHqLT2tl2VpLrXlodC1/phgcQNqqc4n3LQjRmYDQw3moIjJdL
         y75/IVBDs0C2H5nLkexGOu82kAuoPFgZ3jlJwcyr95ZC8731XC4QIGOeOMPUe4fgkLPP
         1XeA==
X-Gm-Message-State: AOJu0YyOTZOQ9tvBHwvg+9ot6th+cpzXkgDEMnmUEuiW/6W0GUEUwP6y
	znD0tYK5ksKV3FTXDVVwEbb14go8yEAObxkCwbFSEyehpZM61N2ykGTEuucOzQ==
X-Gm-Gg: ASbGnctw+nyx5D6S6ItmG25IWy9RMtQfMBTtY6LD+7JAuUUkost4CpCOAqTG2KatZRR
	LHImuypfAEwANOc/kExZ8vwr9TXJ1gXZY1sNfsjDHSbY2jPdf1gndaTgQP7/iN/8/SR8zCmWvk8
	umH+tu4QRrucj3TWbpDciG08SHN9amyQUgrE2Bx/piX668cQr3tAbww9ilMJzgUkVI+fehsmx6K
	Jz1LRhuhFy/GJJ6A8nBnMuMc0AjYT4/JUvV4Ey1FMV7PPM1+kRvoB5jQnAZ4LrhzYjOsLXK+oGr
	WPxu8bzf+3bcMznglgBDwF2ZrIlbF3LuuMmqgIVqV8c3PO2iscu1LZtpeIPRvJszzPTNrbknYVG
	HtEQQGGVQpmT/3jG/5CLZw3t8wBm7w4bzebTZq4HCwueKHsAYPIMmtzRzGsMYfUsAZiCkGfKplA
	==
X-Google-Smtp-Source: AGHT+IF02rYEbgI+lSHKYWZDENlDSRwy8l2gvFVoMSLtGYuqTT+1ORYrmhztNFReqx+JKq8p81/0pA==
X-Received: by 2002:adf:e18d:0:b0:427:6c6:4e31 with SMTP id ffacd0b85a97d-42706c64e42mr30324263f8f.22.1761574564457;
        Mon, 27 Oct 2025 07:16:04 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db80fsm14164067f8f.31.2025.10.27.07.16.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 07:16:03 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 05/10] evince: Update status for CVE-2011-0433 and CVE-2011-5244
Date: Mon, 27 Oct 2025 15:15:52 +0100
Message-ID: <20251027141557.1893563-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251027141557.1893563-1-skandigraun@gmail.com>
References: <20251027141557.1893563-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 14:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121045

From: Alexandre Truong <alexandre.truong@smile.fr>

The current version 46.0 is not affected by the issues.
Both issues have been fixed in commit [0].
The fix is in effect since early versions of evince (3.1.2).
Thus, both can be safely ignored.

[0]: https://gitlab.gnome.org/GNOME/evince/-/commit/efadec4ffcdde3373f6f4ca0eaac98dc963c4fd5

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 492b1b1adc1c546efd10b659d220a810736cc04a)

Reworked for Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gnome/evince/evince_42.3.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.3.bb b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
index 5f35d5b33b..7b6170a2f8 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
@@ -51,3 +51,7 @@ FILES:${PN} += "${datadir}/dbus-1 \
                 ${datadir}/thumbnailers \
 "
 FILES:${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
+
+CVE_PRODUCT = "evince"
+# fixed-version: No action required. The current version (42.3) is not affected by the CVE which has been patched since version 3.1.2
+CVE_CHECK_IGNORE += "CVE-2021-0433 CVE-2011-5244"

