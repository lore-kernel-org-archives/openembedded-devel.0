Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4680C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:12:16 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.70015.1698325929854462797
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Oct 2023 06:12:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X1n4ne24;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-407da05f05aso6538775e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 06:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698325928; x=1698930728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZiiTp+4CEB2xCG6GZSH0kWzB42zlaj3wFVFX3CRq9E=;
        b=X1n4ne24iZUeXqk/CDlaQRuuI9z9MFqi411qdJd5EXVezLP76BX19U2uq3CMF8aN5D
         RqEGZkAxgfSlts7xcZ8MVgVTLHxVnVbWv1rDevrADf+T+GLAqu973DogSIZ+jMCLVZw/
         +CBaNVjaCATnq9NBoFzKb6osm0lsu92NSkM/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698325928; x=1698930728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZiiTp+4CEB2xCG6GZSH0kWzB42zlaj3wFVFX3CRq9E=;
        b=N7f21P03V5fJx43myMUEoJDD3LZsTzz0OdOS/kHJeMOwBC+iNbY2YxaNWQHrUij8iD
         f4e+8v2EV2IGhTzB3HPJizUOW1gkFTQCa6booDXnyxopsLtFH5ccw10yig1jT88mufo5
         BYpTNLVFIe4FCnYNeOlqYU7Rde6RaadjQ/wbhyx5UlbKHD+qdBnNIBxx9y9xEDa3BOLP
         6UxmLLbSlbLJJG6ip609tcimdiLt8045NQpLwJ2sq8QjeFSUCljoKR8I+7bwwTx0xZdT
         wvc7F9nBZbFb18yd8z01YkF/hXuH/nj0f9yZShxwqL7pweh0mx9V9GVx6jMw75xq7rHM
         M3Jg==
X-Gm-Message-State: AOJu0YzWyRO7ge3V1OeN6RJ7NYftvFzcRl3E87eQg3nYjGoLPk6SD2ZB
	1OevcXwib5mBpjH9mjVMHFkQ8c3+EmPmtHZ8GUM=
X-Google-Smtp-Source: AGHT+IF2tDpXLHqvfLgRMzgpto5PuNaZ35zaFFh/LK/YjuaVKO3zwS++2IbxMCNM5jPvPh5Rt/hjXQ==
X-Received: by 2002:a05:600c:4f0f:b0:405:3885:490a with SMTP id l15-20020a05600c4f0f00b004053885490amr13952789wmq.0.1698325928022;
        Thu, 26 Oct 2023 06:12:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:aeb5:bfd7:dc1c:82a3])
        by smtp.gmail.com with ESMTPSA id w11-20020a05600c474b00b004067e905f44sm2591879wmo.9.2023.10.26.06.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 06:12:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded] [dunfell] [PATCH 1/2] ibus: Swith to use main branch instead of master
Date: Thu, 26 Oct 2023 14:12:05 +0100
Message-Id: <20231026131206.1501025-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Oct 2023 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105746

From: Khem Raj <raj.khem@gmail.com>

Upstream has switched to using main for tip of trunk, therefore follow
it here in SRC_URI as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Suggested-by: Fabio Estevam <festevam@gmail.com>
Reported-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-support/ibus/ibus.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index c0c0b3b31..2e03f7c6a 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -10,7 +10,7 @@ PV = "1.5.22"
 DEPENDS = "unicode-ucd"
 
 SRC_URI = " \
-    git://github.com/ibus/ibus.git;branch=master;protocol=https \
+    git://github.com/ibus/ibus.git;branch=main;protocol=https \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
 "
 SRCREV = "e3262f08b9e3efc57808700823b0622ec03a1b5f"
-- 
2.39.2


