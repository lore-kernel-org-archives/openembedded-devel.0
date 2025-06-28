Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76596C7EE2A
	for <webhook@archiver.kernel.org>; Sat, 28 Jun 2025 00:27:20 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.751.1751070431930073842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 17:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X1Che32y;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso2471038276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 17:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751070431; x=1751675231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQUKEO3poe3AEAVLeMBmMGfevTp8+7bNuEfyy7izlaw=;
        b=X1Che32yXp52rzXlu9STenVm/fEQDLukMpasNV2MRrrdy0UiuvX+OnKNKhaNtA6S/v
         IbbmTwF0VsZ8943qgDknJh2EjmX9l7ESfAmBK1HB3cwu0drwvptIFLhJYBdr2TnngN7b
         GCz0Ra5PuYt+6Ab4tT3EHc8OrsEjh+vC1wmQwAsTZhvFeUKp+HSSsGE+xpOWo6Qf+cdY
         OQxPq/HhqtyqLLDzX4FUINV1rljgZB5pwurvEmaL4drTUn0jdLoV5JHHF7vwSqN3U+8Q
         ArykBM/w94GipbzwJsq+kZr3A+2R5VE/iMnw5/k9kbDkQpRDP20xzER1byIhuM6PGZuG
         wWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751070431; x=1751675231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQUKEO3poe3AEAVLeMBmMGfevTp8+7bNuEfyy7izlaw=;
        b=amokQaUCLRre4vBYxzo/KbgN843p6tOBdeVy1Pf5RWS5PMCnawU/9Jlq3yCfofV8Hi
         32No7lPI3QQ4fyyJPbqAcnuDLKDvzksy7T+YsNCib2fWYzSdElXvxFya6m5+RPf9TXfo
         66tb3pTAzTjl4tqqgy59AWHWLkq07c76sOZWtTTV6CstPvbwVJItRSnfwWR3ozcmKPCQ
         7TFRItOrIiMONxwUSAFSPY6dLss/kQ7ObFJzTDNAzdk5qjwGgUNEmuSU4BES77pl9iZY
         kGWty1F/YYlqH/8Zh89NUz60IEu72TUeQ1qL3IjLlzxQ5L48s4uDkWYs3acttK1kkhmD
         DTNQ==
X-Gm-Message-State: AOJu0YwLbumYcg9GG9Wh/tJ6damJgfQzqTqxmwaalnRFSj0z+05gQlAU
	fE08VhGymDKGZpPTPBPKLyX8VaroFxZLB9qxhulm8LAAiupxxcKh4MGVRohO+t0g
X-Gm-Gg: ASbGncv0vhNVwH5d6fGFx0KzXOk4tbFXj1MaIliFQwc6oXG2i1GQ8jyFECcUUmSsbK/
	OrGbnObwNeRnPHA42mRGcByiKV5Lb8j/ZgO7XwZ1A/pvCcd2/4JLiNF0962GM6JuYf7wAcMvNzt
	P16JWGND98bvvmgu7Z1G8Na50miVi6qrdbx8SG9VvMwvrP7MkKOrHn7obhsiCd3srGrmQcbA9Js
	bKtF3IntZvkUJv/WuLg9OE941C2fUsAKaj83JMhq1JReQ0/ITVoYmwtj5tRteBoJULVH9Ya9TGF
	eSIabGJxTR0aWrPKne6Tz8WN7Uu82/wLoHicIqTyeno5tQ7/990XKo1SrKqFBVA/NHhePLh5vbZ
	ZHayabdOeQnzpdwYA9rnYNgbyHkSny2Y=
X-Google-Smtp-Source: AGHT+IEiPocmoxSpkKqt/p0mLiqJ5qFTtGGoe3EToqRfn6GlidxcFshDgyd5w2IWotQIaWren2WBAg==
X-Received: by 2002:a05:6902:102c:b0:e85:fe89:7f83 with SMTP id 3f1490d57ef6-e87a7bd9793mr7250646276.45.1751070430563;
        Fri, 27 Jun 2025 17:27:10 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e87a6b4c3ecsm873774276.2.2025.06.27.17.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:27:10 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-terminal: upgrade 1.1.0 -> 1.1.4
Date: Fri, 27 Jun 2025 20:27:04 -0400
Message-ID: <20250628002705.36360-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Jun 2025 00:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118159

Changelog: https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.1.4

Changelog: https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.1.3

Changelog: https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.1.2

Changelog: https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.1.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-terminal_1.1.0.bb => xfce4-terminal_1.1.4.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_1.1.0.bb => xfce4-terminal_1.1.4.bb} (70%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.0.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb
similarity index 70%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.0.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb
index 718e684d88..50adacbcb1 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Terminal emulator for the Xfce desktop environment"
+HOMEPAGE = "https://docs.xfce.org/apps/xfce4-terminal/start"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui gtk-doc-native"
@@ -10,6 +11,6 @@ FILES:${PN} += " \
     ${datadir}/gnome-control-center \
 "
 
-SRC_URI[sha256sum] = "40823377242b9b09749f5d4a550f41d465153c235c31f34052f804d3453ad4a3"
+SRC_URI[sha256sum] = "873c921da1f4b986ffb459d4960789c9c063af98648c9f0ca146dc6f6f5b71b7"
 
 RRECOMMENDS:${PN} += "vte-prompt"
-- 
2.43.0


