Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78748C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:17 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.23538.1668873490902736845
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RI+3WqqP;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id p8so4684616qvn.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=udapmnW/GVwl0UXWWt/KXtDXFrzN1QLq8PRCrKlRMB8=;
        b=RI+3WqqPO5jqMuwSshjkknUeE/m4zhCtgScu5OX5UgJsRtbvPRGC0XeIB57t9j4m8R
         bx8p92UkWcjAfWy7wpl1+aAl4qr9JeH4puOb2iDmyc3oCxNZByF4zgvaRCNNG9GZOz1C
         ljBfWnCSacMI9Uk1RKe1hKKrsWnwQns/iTkkCAT54VG//EBOWPDtTjSAtgI6pY2JaYOH
         zZ/WCp7N9pVM1t4EPE3EoVLGd2pVSs/770Q5Nkxse0SMAdbsTkX+k0+x6zhbop+L3Dd4
         34NLTbFoR+50KGxDIzzfslWLtNKufQEONvgv5+vYNdcjzOGneZFz8Wkn9CZO9sDdwgOs
         GRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udapmnW/GVwl0UXWWt/KXtDXFrzN1QLq8PRCrKlRMB8=;
        b=A+SuoJdBPjAUCUdcM02Rm/acCdvzlNCoL8POFiP23nxgTcTjiuRQe1AtQugl/DkmQx
         HiK3c7g9ei3uOAiy/4AjolUrbnhjBeWVnfRoHDFE+yKJqv6zV2fIZ1IVfyB/KbQxLCzL
         Y2j3x53dWEu0wsR6kZKkKqXQGNaLFlaCw7qZsXP+/9c7tWZgFVO1KUY1tn+nQkUQ1ThR
         6hKZEuckT860ifrDWC0HF9OtYkMpP6kY0DAgAcnBVT3Ku6C3rFXFzUNKXnvZoqhC7lTG
         ZdI4EKetcVB+48faGJJTcyeuY7/gKI653vaqQPL+y1uX2pg5Td4kJI1CDVkiXmdQ9KPE
         shyg==
X-Gm-Message-State: ANoB5pkfFhY10tM5wUmrEkIC8NYNdKxP5kDgey0j0tTOVNk5s5YcXG3c
	OGh3QVlsF310n1jbZNuY9PPsdBmtHZfbFQ==
X-Google-Smtp-Source: AA0mqf5ep4xr/V01P8jT+2a2/QXVjwji5mTnN+pF6G6V3j/GhDlpeV0H7i5IqwJsBMI2EJmBVyCI+Q==
X-Received: by 2002:a05:6214:131:b0:4b1:92ca:9cd7 with SMTP id w17-20020a056214013100b004b192ca9cd7mr1930989qvs.103.1668873489547;
        Sat, 19 Nov 2022 07:58:09 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 05/35] bats: upgrade 1.8.0 -> 1.8.2
Date: Sat, 19 Nov 2022 10:57:29 -0500
Message-Id: <3018bb81d91b6eac51fb53a91ed4164f6c688276.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99644

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8dd9faa5c6f214414b4776e05e87eb33a0080203)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-test/bats/{bats_1.8.0.bb => bats_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.8.0.bb => bats_1.8.2.bb} (95%)

diff --git a/meta-oe/recipes-test/bats/bats_1.8.0.bb b/meta-oe/recipes-test/bats/bats_1.8.2.bb
similarity index 95%
rename from meta-oe/recipes-test/bats/bats_1.8.0.bb
rename to meta-oe/recipes-test/bats/bats_1.8.2.bb
index 4b90dcc579..74e683e589 100644
--- a/meta-oe/recipes-test/bats/bats_1.8.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.8.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
   "
 
 # v1.7.0
-SRCREV = "e9b286bb39ad7b0cb7b7d2e819d44d1aff387522"
+SRCREV = "e8c840b58f0833e23461c682655fe540aa923f85"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


