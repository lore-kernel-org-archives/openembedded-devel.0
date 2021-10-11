Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E7AEC43217
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 18:41:56 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.2738.1633977715797109494
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kehSqWJH;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id m22so59253528wrb.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Oct 2021 11:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZcXemCUQkhb8xv1FfRYrypc58rGHin72dWxcBO1HIek=;
        b=kehSqWJHFtK6zHHwy2la2gYNiWel1F8zPt8vums6nLVdOgUxQA3swTZK5Ht/+nCr0f
         RQ+getG8LwpWPbBcMmtPUlgeLNg1R0Qw6ds9u1vWgr6TMecnJ6DKn04IHPozl8PIVj2W
         R/n9jdxtsviEQqKBmkhQJqWqjD0LPaIltYectKBUYOKnU2p1xTd83z+NcAeyPufyvseU
         PgytMDLg7Kk8yndx2H/z5b92EWIlMOKAIipQ+h33SikLkmcsfA9QKVh0tt0RyvW4qzvw
         1eaEdTVi3LX5O0apqcbFpT92RCXK95myuJenkKFadhL1gHgvdwjNGLNwBPlixmQpJhy0
         nPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZcXemCUQkhb8xv1FfRYrypc58rGHin72dWxcBO1HIek=;
        b=VxI9TBsYc9sqHhcFuL45wvw/98hKQGMWFO99pnLwi5xba+U03s0hamMC/OnzJBYEPD
         eHrJvw1DRAJR8b81PtJbOFJ2S4X+fJscML8lWwT/v8jrfoxNn9LUtjamvk0A/JsS5DuO
         nY/ytCTYLzX70eMEBlleoCfU2lTKnu1lVjuPDx2R+taXCq7p53/b9QWUH6ic8kfJD0Mg
         v8UZY9VmSpEqC9Jcg2ctVt/KFayYFrNv2O52GE++o1EzRfZIq8biWpP54gNgmJZgWjdS
         nODdp10kZCNt1WxhSiPhG9ztq3evhLnFqgQDJwMJPz0QQN3NdBWp6oMGCgZXC397iJIb
         sBiw==
X-Gm-Message-State: AOAM531/EqfYP4kSeZjuE6ADsHkO7d27ZcJ2hThQ8PrH8WLMOjPlSKL0
	Sv/0CVaGAMxlQ6Kfw9Q2VZQGoyYXG8pQ7A==
X-Google-Smtp-Source: 
 ABdhPJwLK/+RQPRuKkOPCOkrxS+eIkQHvzp4TNL5G8AnM6gWhDlZN7o2lyjmwrOOVH3cT95Du+xAog==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr732075wmj.22.1633977714483;
        Mon, 11 Oct 2021 11:41:54 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id u5sm272936wmm.39.2021.10.11.11.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 11:41:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/24] strongswan: disable openssl PACKAGECONFIG
Date: Mon, 11 Oct 2021 20:41:27 +0200
Message-Id: <20211011184140.653609-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211011184140.653609-1-alex@linutronix.de>
References: <20211011184140.653609-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Oct 2021 18:41:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93225

Until upstream addresses openssl 3.x compatibility issues.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
index ad104e44e..e76636af0 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.3.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = " \
 
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
 
-PACKAGECONFIG ?= "curl gmp openssl sqlite3 swanctl \
+PACKAGECONFIG ?= "curl gmp sqlite3 swanctl \
         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', 'charon', d)} \
 "
 PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
-- 
2.20.1


