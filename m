Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBCEC433FE
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.2782.1633977714070445495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EAy01F/i;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i12so46436959wrb.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXi1Vf0JGTdqiHCfSR2FvqEVkAgRozT3e1JIw4K70Q4=;
        b=EAy01F/iWCLHSQ5mWuv6GYCxKxaiT8CLTKhqxHz5JpI4+JjoHHAhLkg8SCLW/NB7uA
         ZwYMXgc4QzXhJkTGiugUoia1DSfRNTc+jmbcSdAQhqcY56c5fSFZw+sZfDineeXyvKle
         7oPAPoSZVcs5+I2cQ8roM0bkefpvlmOsZ/imFVxPQQXDQp6Yr6l/6c+KsyE8hAdicV7v
         IADneYoDrr+XvbcuadSTHeLMNqrsAtSFKCSd/upIH7/E+Pc9WUAj7amtCEjnCS5QqpbF
         IKIkr6bK+4Gd5cWlsX7I/52UIQ+EQHWpn1VA4PZIeyV4dVCWBxKfV2nb5DAUVCQywP8A
         Ch6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXi1Vf0JGTdqiHCfSR2FvqEVkAgRozT3e1JIw4K70Q4=;
        b=TZnKThy2UBFYzDk41Qm3MqE/+mgQgnoEHsDayQp6wwwUy8zILF06CjG/BVbTt/tXm3
         qlB+8nTPxkzptF2ItnoS8EzN2CJDd5KArJF/GjE9z2POm7Thjr8/8K/j0i9iKSRyxEQS
         awRyU+rSz/bRHR0NavPAYedbQdcYQBPTwKMCQ6sPtLemsJr2gW6L0KY3NX3S494ssg0q
         j7AfadADsWzNAxwFJfjGy023eYf4k64IFFjc23VKf3ELaYs0IAmwk0IpNZpQgjI6YKy4
         HQAzd5pYmWQjhmw+SqNfm8RHhkPyOUL8fDET/FHv6WwC0SlrnlhSpUW25JoGeumVOx4i
         wkQQ==
X-Gm-Message-State: AOAM533VY80AswjSGjl3kUeLfYLUpj5R4ET2ioeXHoaUY8efpECl8O3B
	m9oa+C9K/bA0GqXhuq4tVYqRNzIp2UC8aw==
X-Google-Smtp-Source: 
 ABdhPJx8IwzSYTlrI+JrULrE1c/R4sTuE2eFrLR26/vL6O6O+PE/PQsCcBp2GtbG4Ht8cP6QKF0I6g==
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr5359234wri.40.1633977712722;
        Mon, 11 Oct 2021 11:41:52 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/24] openflow: disable openssl PACKAGECONFIG
Date: Mon, 11 Oct 2021 20:41:25 +0200
Message-Id: <20211011184140.653609-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93223

Until upstream addresses openssl 3.x compatibility issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-networking/recipes-protocols/openflow/openflow.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 1640911fd..94d9553e1 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -15,7 +15,7 @@ SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
 
 DEPENDS = "virtual/libc"
 
-PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl openssl-native, libssl"
 
 EXTRA_OECONF += " \
-- 
2.20.1


