Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CA2C47DA2
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 12:23:54 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.219019.1704025424607626446
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 04:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gTtNFzUJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a269a271b5bso896708666b.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 04:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704025423; x=1704630223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJ0Nrnk83DBgxBbOa3bt0C1mDfhyB2bZ5zgYIxDFINY=;
        b=gTtNFzUJhSHG7zFJaK+R2MqOyGQYvEeQuvj4wpGqsFdhV9JmUgV6QxAPKS8to8mgLS
         mx3+dIvNfKLuFKYZD2NGfr7ZDegVh3arrkmB5JWU99T5TH/fn8q4oW0F3RqoRPt0YefL
         s6UG2nojD5rPdQp71PmvtgpUVnHP73Ui0IDiZtk4L3fvZBJP5IzbV6o2i7inEZf0hl7M
         qdGbEV9zWaHQVNmyYsXX5n1pBBtoqn7rg7ruIMYHPLRZ/bQlw/WRJ1nR8gkdWQbe2xW9
         Y1VM+KSjzP4bReWSl+AqVlLx+FRCcvyjXbtVVokNG1Va+HRj4Fn4/qqL+BbS66bLCupO
         oU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704025423; x=1704630223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VJ0Nrnk83DBgxBbOa3bt0C1mDfhyB2bZ5zgYIxDFINY=;
        b=SjU2t3Ok61sNwblHUcNVr0uBGgC6zRMBbI0y1IzOi6Q4s5BgMq5LSYTkmZY3djkMOz
         29V6TFKCTCJdQf3/5KNNwZH7E4y8rfOUWGkOeb3sRsVx5bqtHDTkSLID0jLXMhsoESh6
         Hl4IrtabFXiFftgxvxHKGrjxh7jyluP4+3yb2IGmBT09Qer2js2VbkBaWjakBWHfAJMw
         ljb4Gbp1HfT6KUKAR3W0UNrud7PtKkTgVcDjKJkrbqV/ZkjSVS3DrZ9NfrFArLofqm88
         dVX+QyiQ4AKW8iCR75EQ6c9WR05gwFObZ3LolBZG7he1zI9W76lLIZT5yaVaH7hklr6m
         AReQ==
X-Gm-Message-State: AOJu0YxCIu7+DHdk7r+YuWqGuMCcUHxRwJ2Pt1oX9yE0j/lcAiznifmn
	a9PYrW1MOkgGuPTeR7dmt/VkBEA8OX8=
X-Google-Smtp-Source: AGHT+IEzfIRIKflXEy1hGb6Hplv+hcUv8g+xTV+GK2u3b7827cHqA/mhFR9BjXmSGEfHkBEvVo1uaA==
X-Received: by 2002:a17:906:4a54:b0:a27:9887:c497 with SMTP id a20-20020a1709064a5400b00a279887c497mr1657978ejv.42.1704025422939;
        Sun, 31 Dec 2023 04:23:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ay23-20020a170907901700b00a26aea4942dsm9155474ejc.123.2023.12.31.04.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Dec 2023 04:23:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/23] nmap: disable ndiff
Date: Sun, 31 Dec 2023 13:23:19 +0100
Message-Id: <20231231122329.405225-13-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231231122329.405225-1-alex@linutronix.de>
References: <20231231122329.405225-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 12:23:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107964

In 7.80 this requires distutils (no longer provided in python 3.12).
This may be resolved in newer nmap versions, so if you care about it
please provide a version update: https://nmap.org/dist/

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-security/nmap/nmap_7.80.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
index 52c62cde3..f9fe82a91 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "fcfa5a0e42099e12e4bf7a68ebe6fde05553383a682e816a7ec9256ab4
 
 inherit autotools-brokensep pkgconfig python3native
 
-PACKAGECONFIG ?= "ncat nping ndiff pcap"
+PACKAGECONFIG ?= "ncat nping pcap"
 
 PACKAGECONFIG[pcap] = "--with-pcap=linux, --without-pcap, libpcap, libpcap"
 PACKAGECONFIG[pcre] = "--with-libpcre=${STAGING_LIBDIR}/.., --with-libpcre=included, libpcre"
-- 
2.39.2


