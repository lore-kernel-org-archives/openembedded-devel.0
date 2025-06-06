Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D872C61CE7
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:58:33 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.35605.1749221911269235771
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LrKXf98W;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-70e4043c5b7so19925677b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221910; x=1749826710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHnyUjMJw4A2sSTeoH60BXIB0RdmrKKvMwGvxywJ/h8=;
        b=LrKXf98WPZraWexvdm25cX9OtIl8nUh8+4H0hrShQYta6nbDHG1862ishUyki9uOO2
         S+iQVXZo0MIHKHATw9ru6yOS3jVam1w/Bsk0kfnMfKR/Pcni4qJJeIl91jDOXpw9pm9+
         4gvQbUxkxE6PvFKf2WZNHjdpNxCkle+fm/WIcMcggfIawxXK89u3Uix8xAwXdMnYQroA
         ekOA4DRqBJOGOAdSUZHWUSPSZhX9qTop4OJ3maQh+t+SO2r7E7JuUZI68F0EHzHkBvzN
         VbF0Dgsgu+JMfubK0t/SGjBZ04Gp24+yTQRIdFPB7uTQkSN9XgCoXwVvPiXeSzUWdpqK
         scUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221910; x=1749826710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHnyUjMJw4A2sSTeoH60BXIB0RdmrKKvMwGvxywJ/h8=;
        b=R1AsWnC7zMFGdqGjvproKBDr5NFZ93P1cCleijl/Z4fMV2kMYqJTc7/fqcOI4NQQDM
         Zj9YEyXu6k/GKWhixY4nK9I4PAa8nGWKJOa/IGi+STV3b1syeqqPXhlcaOxpPksMMSjR
         13QLLqjLLyaH4kpjW2a8Bi87MHaPEoyQVJfndnMBMQt5bM0fucmIOWe0rJ/SDoOM/jIP
         TozpujuzvzCyvfsUOhvoYVL5gRuuOKAaoXcbIeouTmBh5JNsfdrGi6jTmnUcGYd166lE
         pilRUZ4opL2fE0InLYXNYxabKZQa2/2d+IYU9HQrWvf6xzUIxiMmrLJN6dcs8z00sBS6
         +Q2Q==
X-Gm-Message-State: AOJu0Yx0CaAz9lVQ9HYNWrlELHBGjsL7mJ2xd/BoFJE2/xo4pj5qY+Xc
	5ZNPjz3id69Mdx/zpmqIIQqq1x82uM8eKC2mPmr4gZFeZgFXA7SETVSd74eJfjxl
X-Gm-Gg: ASbGncsBh8CBWJPZq1yyurZ6gMUJbcfIR4OI6iie+7t/B0sGZWKjvSybUaBIj5kG3GG
	8PsrvrQK63UYRVnNN5Na7iOGDrGoC2+M+fiZNSv6nM0u8z8/gCcgeFcHuvsnmK+KiOkMDTq7xcV
	LVTAWjijQgbX7biqTyoYuzJbDGB5XII3CnmLgQNbPAj79MhSyWKtlOoqXi1ujahQ7IwxEIAGKoY
	i8bZpdtbXPOrOm6PWmtFq404hrhM92fvrf1p6qyLRicMxJJEOS+/0icibiqYQzD0psF9/9karNJ
	BC3/87Z+3h8PkFHN2VduZMybmjPNv/efZMf/NQfQkBn9rmn2TdseRDXH+v6TwtCipaqzBeKM4g8
	YQJAQmXScGgmPk+qr7MTA
X-Google-Smtp-Source: AGHT+IEFn9d86eZVGyFJXqzWuGxBRvMgOpUu/DYziPVii9V/SiEcF9rcKcsuiY9fBhbc2TyxBGOhTw==
X-Received: by 2002:a05:690c:6e07:b0:70e:7882:ea91 with SMTP id 00721157ae682-710f77360e7mr55425827b3.35.1749221909757;
        Fri, 06 Jun 2025 07:58:29 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e80dfsm2831417b3.62.2025.06.06.07.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:58:29 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 3/6] xfce4-places-plugin: upgrade 1.8.3 -> 1.8.4
Date: Fri,  6 Jun 2025 10:58:02 -0400
Message-ID: <20250606145805.164173-3-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250606145805.164173-1-schonm@gmail.com>
References: <20250606145805.164173-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117767

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-places-plugin/-/tags/xfce4-places-plugin-1.8.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...fce4-places-plugin_1.8.3.bb => xfce4-places-plugin_1.8.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/places/{xfce4-places-plugin_1.8.3.bb => xfce4-places-plugin_1.8.4.bb} (84%)

diff --git a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.4.bb
similarity index 84%
rename from meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
rename to meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.4.bb
index 753dcae91e..4fe293898d 100644
--- a/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.3.bb
+++ b/meta-xfce/recipes-panel-plugins/places/xfce4-places-plugin_1.8.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b6952d9a47fc2ad0f315510e1290455f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "f11d0e6d03f22ab02c2e6b507d365b5a918532e8819e50647ee1860eca60c743"
+SRC_URI[sha256sum] = "ba766a5d31580fad043fbd1fd66b811cbda706229473d24a734a590d49ef710e"
 
 PACKAGECONFIG ??= "notify"
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.43.0


