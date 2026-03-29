Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203F5FC980E
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 21:39:07 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37385.1774820336018365220
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 14:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oyxXsH9f;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b93698bb57aso698825266b.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 14:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774820334; x=1775425134; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19FbKOnJrYUWpDzhHLCkhdsta0ygky0N+vDR2QkHpGA=;
        b=oyxXsH9frYzsqhi6BKKR8dZwOjYVMIwG5Pb3kO3F5SjHFFC0OvQcRNidD06FfLQBWT
         RBJ1/tneQ663rmdBRS3tDocY0NEgC3TiDkdKnC58iFnc7X1C0PNh/yhxEAifpwbTR1zH
         cIIbBLk2Omwqavh7+Alv5NmPt+pP7rvKOM36Gdi4ie/jLff2kHmTuhBcEEscyinJVwXv
         UEm2JXEGcyNyXlfNok6+QAp6s60rEtSDod59ZRwMLghX9p1ygSJegB/+Hsp23XBRu178
         06Hf6uvvkODVGZyxjMBebux1xErVTtyEQsWmnSGlQoTRyUjbSR5u/URQJyDpdQzcG90y
         lFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774820334; x=1775425134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19FbKOnJrYUWpDzhHLCkhdsta0ygky0N+vDR2QkHpGA=;
        b=javhVFY+rLudUk4AfiZbehsjd+PaP+lgd7l7Az6Y4LpwF4FjXaxzlXuIAbKAHurjbt
         R8oQ2xiwsbSYnklmhXhulFKylNC7YQ6y3J0Nxg83EqcZ5ui9hXjg66a9jFIh/mLVfR4J
         DZrIp+m/U5FxMB9uQNjR0BCpGQbT0dwTUp0qoeVWqUQxNEskWgjK50CRuzJWy1GnLdD+
         qVEGAPUqiP3o1jizJq44pnd/tUKvQFLlrXD7uafwzDzqI8CCR6A3YHPzZdZAESE7nI5G
         CoblX4KOsN1TkY/f6/TLJ0Jw1GltqjhK+UsVXAtCiDdhMEYWGEtTJcBTugsbSsNezayW
         M86A==
X-Gm-Message-State: AOJu0Yx7sO3Cj9BVwDHIAEsBjQ+Nb9Ci87CCGlUGOjc1+W3oT2lGhVEK
	OFA3o3W0gkfK2Wd8H9Zy+l4HQcvBQD45jtMmf6vSZQzgM+XiN6bLEtKc
X-Gm-Gg: ATEYQzyqs0ndiTIyKW9DOn1Fus6lTD1TUMKrGeSXAqH1y6EvPL/2cQ4rVJ8WMIDRb1U
	Pkz4w57I/icnyihLHOvPLYfPODGEIMA9irDtXjzCyl9hdzIr2j7GlmcICQmzxrb4uZZ8yeK7HPd
	NSlEuqX9Sd6AwzH4K5h4oOFA2oyaM4Gtbn2gHqWCXeA29+EQ0muu/AebmcdF4qGmG6Lscqrg5bs
	uukytKBCvvKSHXUU37E8Dh1BMc9TOZJquqe1ihdP9b9zHciF/3KrdkCHvoeCR4pAnTcI3OQbBoQ
	QiQNI4vWeFBVXqE8LNziet/CgvUZjrIhQYkA1ZclkysP5ZGYLDPAKBIMxsIY7aj22T+VIz4IpuO
	230FrGYAgA8bnkFtey79iLXUHbpFYwsUmVKQwQmZU8+Ab2HBaKR8u7egCIvNmwI+cHnlLG3P/7U
	bPyE//iYj+vpC/A43rXchlbuue+3avRvfcGaRYZEs4tCiyr3b01miqsmWWHS7D
X-Received: by 2002:a17:907:3f14:b0:b99:86b6:85fd with SMTP id a640c23a62f3a-b9b51c3873bmr593150666b.9.1774820334217;
        Sun, 29 Mar 2026 14:38:54 -0700 (PDT)
Received: from [127.0.1.1] (185-72-185-220.cgnat.inetia.pl. [185.72.185.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae57679sm202102866b.25.2026.03.29.14.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 14:38:53 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Sun, 29 Mar 2026 23:37:03 +0200
Subject: [PATCH 02/13] gnome-bluetooth3: Fix RRECOMMENS typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-fix-confusing-appends-v1-2-df7e87b8b879@gmail.com>
References: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
In-Reply-To: <20260329-fix-confusing-appends-v1-0-df7e87b8b879@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.15.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 21:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125811

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
index 1ceff5ffcf..8490e3d161 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
@@ -34,6 +34,6 @@ do_install:append() {
 FILES:${PN} += "${datadir}/gnome-bluetooth"
 
 # offer alternate bluetooth-sendto
-RRECOMMENS:${PN} += "gnome-bluetooth"
+RRECOMMENDS:${PN} += "gnome-bluetooth"
 
 RDEPENDS:${PN} += "bluez5"

-- 
2.53.0


