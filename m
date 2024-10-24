Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F154CD10389
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 20:36:24 +0000 (UTC)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
 by mx.groups.io with SMTP id smtpd.web10.6191.1729801147868469705
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Oct 2024 13:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NtZtB0yT;
 spf=pass (domain: gmail.com, ip: 209.85.219.170, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e2e32bc454fso1472580276.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 13:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729801147; x=1730405947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxjhWxWyh2jUAgq6cGNY+QKQaLiuavrgSzERmQW/nWA=;
        b=NtZtB0yTf2wgq4P5oKFwO6Ktt76NimZPyrx60917zkF8T1BnBFTw/Iqb+GP7YFGv/H
         ATcidEUoNZZLass2qIsbuFnODjftL9Hs0UIu+7lnpIRIDyBPmh31x1gudyxw4tJxqFhb
         Mo4ZgxfDqXCRU9Kv4gB96ualXLEcGkUkv8U/c4I8fpDfj+6fUoWFdbib2Tk58r4kDWv9
         VU7vjP0Huy+IpTdg2WWlim0g+gAJxU5taZaJTYQCFp0jU1NyoIOSy0ikferDd3rvPERm
         Ek/445MvjxgGtdauqUSIva7EIK6yzK0tbzk68I6PGiIWXZCQB2HBRZfk8mJ9tLpowTw8
         Jl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729801147; x=1730405947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxjhWxWyh2jUAgq6cGNY+QKQaLiuavrgSzERmQW/nWA=;
        b=aDiw0lv+0tobK9IELk6rzqMNUGe9jsB2gCnIpu6o6rCBiseIQEVLYIoQkRnOFoU5vH
         kfbgXM4+d8I9yRSA7LCceHGAtKRyrVSGu+pwB1/4fTGFK7bnirl04vI2Y381/pUumqNe
         sZb4J4xAoM7frFgZumKDNbTtVJ94URkrSRbiNLvO2ST2H5qukliu28ZXi/lRcOJJLnYq
         mXqFjcbEtl8q8F6ykbw90BIFpB3B1pKp4j7JaXz4PrxvfX6UeTNRwQosRqE/k9g4Qf6U
         0n3TaAHOQHXnq5JiPwC3V1ugMTCh64tlr/DPIE7vZ+1YUyHqfPYwL0gn80Dufi9mMz89
         RMDg==
X-Gm-Message-State: AOJu0Yygry5b9qOABMxRsBh4zcKJpHNvuv43zpTcbcIvJN43m9P4RLIi
	643IOj75TICXlyhPKEMQhpYiuH9Ahj37cWecYmZU/a1AzYti5tJkaMtwnQ==
X-Google-Smtp-Source: AGHT+IGFEDP7AXMan/sjcpoTBgCQ58pVn+wGR1YMRaYijIK1zzF/1R7a5RdeP3RxbHhIus/653Xyow==
X-Received: by 2002:a05:690c:3203:b0:6dd:b7e0:65b2 with SMTP id 00721157ae682-6e858184304mr30752177b3.24.1729801146562;
        Thu, 24 Oct 2024 13:19:06 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5f59f551csm21484897b3.10.2024.10.24.13.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 13:19:06 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 21/42] libio-socket-ssl-perl: Change references to search.cpan.org to use metacpan.org
Date: Thu, 24 Oct 2024 16:07:40 -0400
Message-ID: <20241024201806.440273-22-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024201806.440273-1-schonm@gmail.com>
References: <20241024201806.440273-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Oct 2024 20:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113199

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
index e745cecaf..689c46b90 100644
--- a/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
+++ b/meta-perl/recipes-perl/libio/libio-socket-ssl-perl_2.089.bb
@@ -6,7 +6,7 @@ needs to write a full-featured SSL client or server application: \
 multiple SSL contexts, cipher selection, certificate verification, and \
 SSL version selection. As an extra bonus, it works perfectly with \
 mod_perl."
-HOMEPAGE = "http://search.cpan.org/dist/IO-Socket-SSL/"
+HOMEPAGE = "https://metacpan.org/dist/IO-Socket-SSL"
 SECTION = "libs"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
-- 
2.43.0


