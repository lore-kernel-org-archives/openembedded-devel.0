Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3FFC7EE29
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:48:19 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.15269.1686322073525398321
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 07:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=hqI4Kh6o;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: jhatnedap@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-977d02931d1so280610466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 07:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686322097; x=1688914097;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kC2v1AOfEI0eKrmdSsUsRkebtxztSc6QuuPeJoe23Y0=;
        b=hqI4Kh6oYgOyWuzPQyyFO89q+7cXj8k41671rqO2TL1LelrUB3Jl8IzfndxDR6aKby
         l0kTlNYX/YnSDOwUBhH5s+tDr9o99GTXIImyZO7s1EOQuWzGgv6fEkV8F2P0RWbPdLEP
         nIar1gEa9HNE6PRY+41cxgpT/02G41G2tcXoZSSgGJPk+RY1Y3B3praUG/PVlhPzhHOg
         oCB6pdJoQWK9JUh5k6IkzjqyZIhSnbJH45WIORcU5qWqBb8ALiCvJ4WVp0/IWf3IdkbS
         3MmMQk7IAooiaJsZO9EWgReYXnLWEdJ9mp8PzJBv9hGpKHNjVVzughkYmBJMAGRT/UGc
         +gag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686322097; x=1688914097;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kC2v1AOfEI0eKrmdSsUsRkebtxztSc6QuuPeJoe23Y0=;
        b=WC8MwvfBbeStt4M/tqzNw0T86H4C/KeDVrHnvu7V89VeJejdtG9Wlm0hOT1RrIEL9j
         7sRPfoohOvFfg0aKpO0dXeOUK93bbSFysE+KLU7WVUpvhospJI//yobfy8qD2GlEp28r
         6RpSucjXfjS16YUIHFjCGAYVfr6Jp91ozROlliJ7KrP1T2YBdAPkMNXH1ymbw53Rvukg
         RyTs4MnP2pexNYayMusDw7T9385RlvEQHjot17VSd187jgvPwNa1gPh0BmIN1we15UWh
         kHbpMmsG3+3U6OScVhdV7uQeoa0w2hdenGvsXMV5IteT6E3/X1r4Y99vhwr3AfuNW450
         vMNg==
X-Gm-Message-State: AC+VfDyJ5YrpQxu9gg8muhlJu6y+oLFIdIoBt9XpUSx+N0AuW8evtf83
	h6pnyGZFpAaqEGmuA/lB0MGhtYyxvxw=
X-Google-Smtp-Source: ACHHUZ4OdmKyiUf8UliJ4syRmQThin85hVxu3X9SzfVY9Ovih8BST0uH7+WXaEpAoBi2UncxRBSbvg==
X-Received: by 2002:a17:906:58d2:b0:96f:f19b:887a with SMTP id e18-20020a17090658d200b0096ff19b887amr1843234ejs.56.1686322096999;
        Fri, 09 Jun 2023 07:48:16 -0700 (PDT)
Received: from NVC4181.nedap.local (159-210-178-143.ftth.glasoperator.nl. [143.178.210.159])
        by smtp.gmail.com with ESMTPSA id gv11-20020a170906f10b00b00947ed087a2csm1377097ejb.154.2023.06.09.07.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 07:48:16 -0700 (PDT)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-devel@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	richard.leitner@skidata.com,
	Jermain Horsman <jermain.horsman@nedap.com>
Subject: [meta-java][PATCH 3/3] rxtx: Remove obsolete rename of libtool
Date: Fri,  9 Jun 2023 16:46:46 +0200
Message-Id: <20230609144646.1977-3-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.39.2.windows.1
In-Reply-To: <20230609144646.1977-1-jermain.horsman@nedap.com>
References: <20230609144646.1977-1-jermain.horsman@nedap.com>
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 14:48:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103203

From: Jermain Horsman <jermain.horsman@nedap.com>

Autoconf no longer generates libtool with a host alias prefix,
this causes do_compile to fail as it is unable to find libtool
without the prefix.

Since the rename is no longer needed the edit in the do_configure
step can be removed.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/rxtx_2.2.0.bb
index 27935bc..a74f11e 100644
--- a/recipes-extended/rxtx/rxtx_2.2.0.bb
+++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
@@ -40,7 +40,7 @@ do_configure:prepend() {
     # Ugly but don't complain to me, but upstream ;-)
     sed -e 's,bin/javah,bin/gjavah,g' \
         -e 's,bin/jar,bin/fastjar,g' \
-        -e 's,\$(TOP)/libtool,\$(TOP)/\${host_alias}-libtool,g' -i ${S}/configure.in
+        -i ${S}/configure.in
     rm -f ${S}/acinclude.m4 \
           ${S}/aclocal.m4 \
           ${S}/ltconfig \
-- 
2.39.2.windows.1


