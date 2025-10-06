Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13323CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 15:52:20 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.37401.1759765931995563238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SBYEFrOA;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71d71bcab6fso51711097b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 08:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759765931; x=1760370731; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LkxXQL3NGTVqFmfmj6mE+/yQDYsV8BWHOIGqP24FlU=;
        b=SBYEFrOAh58WzniJCf0qQjsN1BT3ON3VthJEOGEvnqENGaHVjNecy8WEpyf+4VOusq
         u0YsSYhBSbNzAa0ETpizL74oPJ2Bwlk6BpJJU86A0brckpPU7rKVARJ7xU91GOd3ifRh
         IsY7VS0UDwzw1j9fjwIRZeyrN9L5nTBhoNPPUKKGheH1n+QYHC6sytre5BQvPEh8IU3L
         wGD/0qAmMEVj1Ks6xUhIh4xnwd+lcjVXWm9uGD137Wz8GIpMFRBaUpLnrPS46xyCwj14
         /m7iJ/D1atkwmwmKZbv8JgRQNG0mQ3QyQX3PDoxGcd3qlxIYLO1QdoFQkQzpoQgPZB+h
         nrFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759765931; x=1760370731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LkxXQL3NGTVqFmfmj6mE+/yQDYsV8BWHOIGqP24FlU=;
        b=INLbC2dB2aV/3UsoEVebY9uAob/8mKmBgIxXL9S/1XyrL78eGU5LmLK4PqZOuwY2ca
         BscLiZTIgI4s76GKOPvSPU4DJH3H1gWVylttuFceATjpE/mf4JvxKjt0EECrdxIwhA/2
         I3FeVXjDU5G3kpV/uSiKezojpdckzbWTgMgK9zEhZyE7vVXhAZMxUEU33sBQ/rI/p6Xp
         dr/qexUPVnv946yH0D9PMDHWxSH42m9pj0juIv0yXfIL32/qKaSklwxjlNy7H6kuPg+o
         QabzhNr2ibJiT9wkpch6+jsfckAypUvoVjGDXDsBdhcTb3jKrlFqIYzGzoYwDT+79sMp
         Kqqw==
X-Gm-Message-State: AOJu0Yz9p4I5aBz6f49E49ze30xeMoYdEspMJ9HhIMdxPoAlO2TMG03P
	7trF5QMSwWi4QNhzdj/qRo3waHE5HLyS+rD1ktaRvnmPFFWQDQlCQJN9hlybvZhL
X-Gm-Gg: ASbGncsK2YDCsAZWqymH3rSabFBP7UTk3WlMeNlWTdgk+sqkCPAI1YKEeHkVV/r73nU
	Y8lcpuQbB/ju5ze7aeOaqBKZrWQCoMSrxv06ERyQvKcnh66PCzaicqBi3IB5IpZA+d24j5fSiuY
	3Y8y2XgxAukSY5xQlnCY6NeAjlS1YtmRgjtrMruPvHQ5Xmgn7pHDL1op45rMqA0u92aVtWqaCpd
	1SsgYrYarPtt4sofwTVv5+hSGvBB/550UJgCmVyxEZ5Axli1h9rMyTpeSggQCEQaayU3kZaQ74k
	8Mdg5x7kmcCvLPhCt2GG/9THMUvoTpkLGaBAcIeEqCGTWlbEeBMDficDdOafs10SR/r2cbDeMXG
	xJx3OdpOxk0WtgHKVIP1qQejo45f9v6Yy/+2Z6I1PiCu/5e6kPAb+
X-Google-Smtp-Source: AGHT+IHmiV9WbacAKQXjB6SF7qm+N1MWaLLBnCPEi28d5MBoptvwAXKjs3WDud4a3zo6Zm0KX38YwQ==
X-Received: by 2002:a05:690c:d91:b0:770:bb4:85ef with SMTP id 00721157ae682-77f94630799mr184521907b3.33.1759765930511;
        Mon, 06 Oct 2025 08:52:10 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-77f81c34d7esm44294397b3.21.2025.10.06.08.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 08:52:10 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 06/10] xfce4-time-out-plugin: upgrade 1.1.4 -> 1.2.0
Date: Mon,  6 Oct 2025 11:51:42 -0400
Message-ID: <20251006155146.416335-6-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006155146.416335-1-schonm@gmail.com>
References: <20251006155146.416335-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 15:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120297

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-time-out-plugin/-/tags/xfce4-time-out-plugin-1.2.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ime-out-plugin_1.1.4.bb => xfce4-time-out-plugin_1.2.0.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.1.4.bb => xfce4-time-out-plugin_1.2.0.bb} (72%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.4.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.2.0.bb
similarity index 72%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.4.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.2.0.bb
index f68b051e4f..c700ef4a9d 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.4.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.2.0.bb
@@ -4,6 +4,8 @@ SECTION = "x11/application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
+XFCE_COMPRESS_TYPE = "xz"
+
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "b6b708900d7fd0cc3d8a045514962db94b60d959c266049aa2cff768fc381726"
+SRC_URI[sha256sum] = "e344d9f82a8acd23d44e7cf9b2efe9599ffff856d9ba1a9be0e67b022c0d2eb2"
-- 
2.43.0


