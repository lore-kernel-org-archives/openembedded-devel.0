Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265EECF34D6
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 23:15:00 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.9979.1727996604513185248
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 16:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d/+Poea8;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e260b266805so1449818276.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 16:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727996603; x=1728601403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AP0lvSb/jWlwG2Y44kNfwjwe8pIwvNgy6m9PlFZoGOc=;
        b=d/+Poea8lLc74l651fuYFpXBg2EXpS15MIa2nIQcnhntL/8QS7Gn/f2DJ68puWy3SE
         lhIj4snZI8QLcgSenePE3FtfR3icTAPc6HioRvE7rnIQxXKQPYFjfUa+AUDBlIOfySmK
         ATGf/ORfzFcn6YEpj5CDFv0vW3y39yGtZPZc/bsx4sPBaWWoSp/04fb9kxaYapGV1wmh
         jBSZ9LoKyAybUIfA45wOTDlbQnfrKcHgOHemME7qVou1UW3vj8BWnhnYi1M7IhlBF8SL
         xTRx2lNAS7gJ+g1gQMPKHTt+FMNYJpfSgQoLvEA7XzBtrwqv9hJwGvQICyVWYBJjgRyK
         /aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727996603; x=1728601403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP0lvSb/jWlwG2Y44kNfwjwe8pIwvNgy6m9PlFZoGOc=;
        b=SyrFo1PDQ0Nx/zGDA73SRJkBCpwkUDZvtCpL27DdCtwGl2G6Yk4byRL43Rj3OyflWL
         M1rG7AIshz19YMBVbvxw4gdsNNx9nD0zYeHvhD/YMG6ogTkbNijdmVyc5Jftg2q3Q2l9
         KWRYMHM2GkblUnBbpZ8qdckr58B5jGUZ6TrTSDs45tEioyPosv+fEFgH0eJWsi5nFaU8
         NTyoGE7vdna6/Ta7LNqdtEpp2jg7v1NLSEqxSKL9QiQcaY8pxb9sEF8988TrJr25U1Rr
         um0jfceSjUckObx3SlYjvTOrW+QdQV/UvSkDdL789fhYmw00E4KNd6RmWsbjZUkVCJLY
         lqCg==
X-Gm-Message-State: AOJu0YypLY+QhkYRLwPbReTlMgAN3Dd6a490AlAAXjGn4qcOvdyW3f7V
	eYAQCnFD00RfzsUMFOrDU1f2oxlKUf2iMkWVLmpKJ1WW/vBoKf3kJ43vnw==
X-Google-Smtp-Source: AGHT+IHd5sp2Up4eer3LXf7w3+xBX0+V7ZdQHijPZDee5ZyyPufW9vRHWIAhaY0f3+LpoosERcswzQ==
X-Received: by 2002:a05:690c:6706:b0:6d6:aa50:9267 with SMTP id 00721157ae682-6e2c729fc4cmr11870827b3.39.1727996603117;
        Thu, 03 Oct 2024 16:03:23 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbbb77e8sm4261707b3.8.2024.10.03.16.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 16:03:22 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-panel: upgrade 4.18.4 -> 4.18.5
Date: Thu,  3 Oct 2024 19:02:51 -0400
Message-ID: <20241003230251.5098-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 23:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112653

Change log found at https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.18.5

- pager: Do not adapt upper value of spin button in viewport mode
- pager: Update workspace layout also on window manager change
- pager: Fix aspect ratio for viewport (V2)
- actions: Fix memory leak
- pager: Delay GdkScreen signal handlers
- panel: Do not scale background image when UI scale > 1
- popup-command: Do not block autohide when popped up at pointer
- Fix memory leaks when using gtk_css_provider_new()
- panel: Clear item list before repopulating item dialog
- panel: Remove autosave timer for plugins
- wrapper: Really ensure we don't call gtk_main_quit() twice
- panel: Block autohide when the panel has input focus
- clock: Fix sync timeout for seconds display
- clock: Implement ConsoleKit sleep monitor
- Add/Sharpen icons at 48-128px
- Adjust 32px icon margins, new separator icon
- Sharpen icons at 16px and 32px
- Increase margins for 24px icons
- Make 24px icons sharper
- icons: Fix wrong exported sizes
- Translation Updates:
  Basque, Catalan, Danish, Estonian, French, Italian, Kazakh, Polish,
  Russian, Slovenian, Spanish

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-panel_4.18.4.bb => xfce4-panel_4.18.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.18.4.bb => xfce4-panel_4.18.5.bb} (94%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
similarity index 94%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
index c9fb65477..8e4e4966c 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.18.5.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
 "
-SRC_URI[sha256sum] = "32304f82094ea3779741f968dc851032d8790eb78f3aa01676520b96cfacfb54"
+SRC_URI[sha256sum] = "b20e0d10cc5149a601d8eee07373efb446ea3e179dd032ed8ddb5782e3f9e7cb"
 
 EXTRA_OECONF += "--disable-vala"
 
-- 
2.43.0


