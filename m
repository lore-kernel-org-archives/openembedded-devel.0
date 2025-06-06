Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAF1C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 14:58:33 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.35574.1749221905153348360
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jun 2025 07:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EHg9IMRs;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-70e447507a0so18037887b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749221904; x=1749826704; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQlahu/gMhg64DZLWhVNOAxCOjQH1i0E3Ib0I/csWiY=;
        b=EHg9IMRsk344X45E41u1D0Aji/N+Gvx0KNp+PgKZ9+uhyynRx/pWxIELLPcsplGaGT
         KwhAT8sQLUtJ1ZGZR9x//oYt+Q43gWgZtg5cmxqEnJw4nJ45gkQ2CPH21TgQgXh1FrqH
         TVYxSXqnd5WAfI9NxAhyTWa4Js1Pj2rYL1WZuUdoRhAIk9/OYrckuUFZUllEdLYb06vo
         Tu7JYivXmiGkmvpLWnFgulJrtO9eX+p5qiKnCxeBmx9Fm8j1HUrd2WJiP2UCym9kjM4Y
         1OmB/8MuxKjpokWvOqDK5dEWYGcQTgaKw0NSKr7+UQXwjln/9pW/5b+7TAVMWvnPMYXX
         ZDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749221904; x=1749826704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZQlahu/gMhg64DZLWhVNOAxCOjQH1i0E3Ib0I/csWiY=;
        b=FIoAcpm3GJjv2RyqjHKa9me0P8ZWZbQ5gYdKviQxOCHRZ0D/voSue52dgM8OVPoeWA
         5WvSyqncnUS3bVBpIcERBtsURehaffpBj8dEhGbdE9A0rcfBetXoT0V3kXxvEgl/hOrp
         qsfwhB/ptieTGJlYSeqdVJeU2/sksbil0zNgQt8BXFlM5sZMh0kSS9iQflnKi2DVc6Or
         nmmxWiHiolKknB6uG04bybdvfJdeIl1gf9XZnBUVpvxA9fKYfKdW5wPOHdgwEQPVYH8G
         pasFgGcZlfuS/ce/wIoN+w2NVHb+sdji1A5jrC1xaC4bCJZ5Hj+gS6BjtSDFSpN+pUO6
         ltLA==
X-Gm-Message-State: AOJu0YyO2mp9lbLdFPnWg/tdIkHDebpRN+PEGsAPkJxBXIDYMEGfZP23
	uMpOnabFiMm8WnGzsuoZOF8Iz4vjyrVm/aXP6ToC8hbdYd7ynNgBABRTWGK68eP0
X-Gm-Gg: ASbGncu4Egh7vKRW0P5cCeMLNz/AvxOz09nppBPGZo9dCEHwoYhrlfsDqNuIMhWqRbE
	/OYrh7uzDD/8GHMGBFMgYCIY+ywX8oiXt2lO8KOWvjYCTdBg4G09N7awEM5hpUvkY6T2POyQLNT
	iQq0oaLHNbuk7JcZEfWW3B7QR6uP2CCznBEZ1jg4wWrUGDoYleyy62MiSwd8aHRou1ddqit4Y6C
	pv8GIpvJSUO4x1865uAXVeNmCX+ymXxs0PR79F0xOL5YorLY80QgZqkZ9DAwB3xCxlnGn5NH7Gx
	Td3+1Yued60HNmr82CtezgTVXHAKTgAcq6a3hPbLbUW/Ns/lKjE45SFqCpRcLKiGIINMoifv8r8
	tr7HTCKKrPFe/p87unNlH
X-Google-Smtp-Source: AGHT+IEi76NmtbDDfN5IAaLlXa7lkN5Sq7bHLRJPSyaRqfjqzIV+/q+AfYg61cn/7AmhHIAINAqtng==
X-Received: by 2002:a05:690c:a87:b0:70e:fa4:a84e with SMTP id 00721157ae682-710f765d294mr57854607b3.15.1749221903485;
        Fri, 06 Jun 2025 07:58:23 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-710f99e80dfsm2831417b3.62.2025.06.06.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:58:23 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/6] xfce4-mailwatch-plugin: upgrade 1.3.1 -> 1.3.2
Date: Fri,  6 Jun 2025 10:58:00 -0400
Message-ID: <20250606145805.164173-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jun 2025 14:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117765

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-mailwatch-plugin/-/tags/xfce4-mailwatch-plugin-1.3.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...ailwatch-plugin_1.3.1.bb => xfce4-mailwatch-plugin_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/mailwatch/{xfce4-mailwatch-plugin_1.3.1.bb => xfce4-mailwatch-plugin_1.3.2.bb} (82%)

diff --git a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.2.bb
similarity index 82%
rename from meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
rename to meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.2.bb
index d6b367c0da..9ac375999f 100644
--- a/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.1.bb
+++ b/meta-xfce/recipes-panel-plugins/mailwatch/xfce4-mailwatch-plugin_1.3.2.bb
@@ -7,7 +7,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "gnutls"
 
-SRC_URI[sha256sum] = "054964e9fe4ca668486400991ce1ea01d07aac7ba235f4b14d4a8f7d9800046a"
+SRC_URI[sha256sum] = "c4783f1533891cd2e0c34066da859864dce45a23caa6015b58cb9fa9d65a7e44"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
-- 
2.43.0


