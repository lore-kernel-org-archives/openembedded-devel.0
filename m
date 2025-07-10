Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29CAC83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:39 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.70.1752180877398437431
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 13:54:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZB/wZEJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e5d953c0bso17227797b3.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752180876; x=1752785676; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LnqL/brzVwcsqvgTd3XLT14I6wm2JA/BZI+/7F6SEc=;
        b=kZB/wZEJ2iG4oJhAF7ngB+Pv7a1g+AsJVnbIhZWGraZaMO5Wrr6VaE1h+JF/gNjZJD
         RFkubZI7kAVhT+dnDhPi+V3tIVy06NJefaJcLmjoiGSmbr3NenDRnObFlEToatPr0jqN
         AALKIvhGW/hZre4hwz774AGw4fpDgZobKf6Bq4BOLcpn+eZLFmIeCloFyC8OUuNB8BO8
         mdyAojnaYPHMtHiCO+7+uWB6VI+OLNEImVUAFGLzC6hRXkR3xMGOQq+NWu9NIs4q0VmE
         XbTwhEWm7KqYXtnUMUP8cCgpSs31EJa95lUMbe1SaSKxgc5ksUR1UtqYizAbexPUW5if
         eGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752180876; x=1752785676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0LnqL/brzVwcsqvgTd3XLT14I6wm2JA/BZI+/7F6SEc=;
        b=sjWFgdYjYNOQSn4qCFO+FoaM6B3z8I7b524Z6BxZSJAR9RWxuoEE7anQGeJyO1ywEh
         nv9InrNhNTFCUS11h4FK6Hf4MVMVD8Ynmz0o6nAD5aG1UncBQIyoAMrpiVaq8VH3U7S8
         Zb8WrNKQqW8D4ZRsPjbeN1jLz7HhnvpuObPzLlIFg6COGviTlSiicPPsWw5SCmyz6C+U
         GEHamkglcio3mNCA4a53sEkm0cDZHV6QnDfu/WAn8JsCFtnWIZ8ks1OjFC87xp0tzbCF
         hQaayZqZa8Bo3W4r5bVfw2Cg+hcqRzP2FcVcbKD618qvECG1kGMn1KD2XonyOmySseUq
         7ddw==
X-Gm-Message-State: AOJu0YwhIj4Bgxhb3HTpO9Stywq2YLxaAENg+uiyN9tvhUaNlQ0p21UG
	igBC+reM2zPP3gAu8wdWML4e1m9pWXeIcEvoKOCBAkZ+jbafD8HLP9NNnqKLB/Rt
X-Gm-Gg: ASbGncto+xKpnfakeK1E3iPk4CFgUjRrKYOeUGFeEG1ixsy7rd0u+U+pfEYmX6CY7uB
	NuYDYiMqrf8L8xpVK+OMh8C6jNuk5hoX8auAKXc7CwL6fQh8GD/zhWs5CemIpnNeHtRNLeL1G6W
	72/cI4cv1WRy6NgT5jeZDhilDTbRhbpHwrcswUjdy5Mg5p3dE37VT94mua1987hIxxjEdKjej00
	yompddKMR30SKZ2fEXdCylDGn60mk+wjRMSozVi6DPugJ9e+pkwvmI91EzSmy5iKGgvLjN+SYoU
	YBEfu/2YblfcU5gCrPjojonH3bRo4gnQLz06dSSp3IDIrsnhcmFmeiipWizUywDGgAZmZlXy0vA
	ubUfutmSvuoWrIeGkHUWC143uVhmSA8iTSpbevmOf03x0DLeTZ60NsxKp
X-Google-Smtp-Source: AGHT+IFhEa+rLeZIgPnd2vW6KtHNPQP08GV/B62YfdwZSALwpLpolvnOke7qLOfLSoTcA+wsLboCHg==
X-Received: by 2002:a05:690c:660d:b0:711:9770:161f with SMTP id 00721157ae682-717d5b77e0bmr20411447b3.2.1752180873460;
        Thu, 10 Jul 2025 13:54:33 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4cf6sm4515407b3.68.2025.07.10.13.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:54:33 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 1/3] xfce4-clipman-plugin: upgrade 1.6.3 -> 1.6.7
Date: Thu, 10 Jul 2025 16:54:10 -0400
Message-ID: <20250710205412.788186-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 20:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118423

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin/-/tags/xfce4-clipman-plugin-1.6.7

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin/-/tags/xfce4-clipman-plugin-1.6.6

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin/-/tags/xfce4-clipman-plugin-1.6.5

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-clipman-plugin/-/tags/xfce4-clipman-plugin-1.6.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-clipman-plugin_1.6.3.bb => xfce4-clipman-plugin_1.6.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.6.3.bb => xfce4-clipman-plugin_1.6.7.bb} (83%)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.3.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb
similarity index 83%
rename from meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.3.bb
rename to meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb
index e1eed88098..a54abe184f 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.3.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb
@@ -8,7 +8,7 @@ inherit xfce-panel-plugin
 
 DEPENDS += "xfconf xorgproto libxtst"
 
-SRC_URI[sha256sum] = "e11c1f976217fc959cee98ecfb934058ae485cb363d2c25c7ddede44394c9a10"
+SRC_URI[sha256sum] = "9bae27808a50e959e0912b7202ea5d651ed7401a6fc227f811d9bdaf2e44178c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-- 
2.43.0


