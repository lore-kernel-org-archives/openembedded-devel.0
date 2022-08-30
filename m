Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EEEC6FA83
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:33 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.8933.1661843672631382275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ImWpxmLg;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id 145so10129476pfw.4
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=z3LYKuV4/9Peg0dsYl7OggiQ7tSn7HaGyIY+Uhn4AuA=;
        b=ImWpxmLgq9FWh+iYHJCT+I/gxTbnM+AV8/QV4ecbE/m+ZciFEYPL5faRa9MQgy9TyQ
         tsZxDd7k2du6C4HjFDOuULfyQ2uSUka4HSaUTJfhCPxTon+oXDblgYS9R4uzSl6601YM
         YV3QarfuEmBdASmhkv/XeXK5K0EPliq74QWAXbjWQ65IhYQUPhQfcTvdUrJqh6BCK8iS
         LoZ3jYy9Yhra7UOnYnwAR9mZvQ2V0Rw2cFk0HHnH9euPzb7ECo8v07qC6+TVMD3CEhZe
         v0NEaE1X5ZbhTgY6Ri5NUFa4r4pQN2uVXwi4WcktVsljTwtfKC+FMEVuT0b8XYSetem7
         Szng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=z3LYKuV4/9Peg0dsYl7OggiQ7tSn7HaGyIY+Uhn4AuA=;
        b=B1nhQ/5EfEC9HOAp0OcMnu5mErTDkZBzwvA0KrcOWhlzDtkQtSzoPIpL3AepjzpKvJ
         b2JsMnudVfVcqVkCidx3HOHNTwgiNbm5adcmFgHjCtS9ZTBx2mKgkzSeiNGGcpH5x8AY
         B00msHxl+ZcWoedUNDGBQeBihkQXBC9pFS8aKsw6S4oxe4vZum1LXosDVfKqJczS6vkH
         8aJg5zAiM52Y+sfuRdyoxo9x9gH42U6gAdxXZ1rRb4rZG1REeLgF4YapbjO6CLnoSQBL
         hNYBILvsKKmsj1axP2BZDlf7of9bc9QOICwVCn8ArWrpJPV1GFdmtJEQilYbetH3ZEdR
         kCgw==
X-Gm-Message-State: ACgBeo1/sQCXGa41zYV9zHa+uvbD7QNdrv/wxU1jmhxZCRhG2rmMAaAZ
	2+nb9RVKwtJXo/sCbfp7RRk+WLh7Ccwspw==
X-Google-Smtp-Source: 
 AA6agR40kxuFDazjKyw0okqZLyEoh7p/vClHMjO70iVec3YCI4WuzSDwCNSfoDqLwsJAkma7lz1ZHA==
X-Received: by 2002:a63:fb56:0:b0:429:983f:b91e with SMTP id
 w22-20020a63fb56000000b00429983fb91emr17111754pgj.399.1661843671912;
        Tue, 30 Aug 2022 00:14:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 18/21] ettercap: Pass -D_GNU_SOURCE
Date: Tue, 30 Aug 2022 00:14:10 -0700
Message-Id: <20220830071413.3887189-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98555

Fixes build on musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index 99fcacd3ef..7d37f41096 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -32,6 +32,7 @@ EXTRA_OECMAKE = " \
     -DENABLE_GTK=OFF \
 "
 
+CFLAGS += "-D_GNU_SOURCE"
 # Replaces default encoding set (ISO-8859-1) with UTF-8 in ettercap
 # configuration file installed by the package.
 # It ensures that all characters are properly decoded and avoids
-- 
2.37.2


