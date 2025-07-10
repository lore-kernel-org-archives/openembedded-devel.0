Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AA0C83F20
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 20:54:49 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.83.1752180886735420627
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 13:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bQ1e6Nil;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e302191a3so14101387b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 13:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752180886; x=1752785686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEvVfF3Ol8WrCn4qxTx5s0R2VmdI/dhp9DOi+DyEu/o=;
        b=bQ1e6NilmQTo0bTkiW2lHyehcUGU2c6SES2k6qnL1wlnqHoDCKD9ly+vva+Y6Tgaq4
         gT1M5JlSPNsRZNm2RJ4/c9oeEaiibmBYn1g4ieBFHHm5qA6H5YlXTh2Llnkw0/JTCcIO
         b5tK3OGJ8YRW53+NVhRiJT9x0aKodCGTUB0ytqQr7fK9z3TZ75eHvizMG5PgAH4n4Z6p
         OCP2FRe7iWDa7HHpmXGZv+Y958DP+4kjgPPzkr5oYnMJNqkIm1PL2p+X2zqwXepaPV1L
         28A0E7+ZMEMQTlCRv4NxugHbB8VYcwUowQj4gz/aRJ3r6//YzGHTPR20m1AkrHpg46xr
         zB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752180886; x=1752785686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEvVfF3Ol8WrCn4qxTx5s0R2VmdI/dhp9DOi+DyEu/o=;
        b=Ytn2ep/1XUFBZAW6mDrUR5+c4uXzACuLfj8jlnTYJ6tWR2C623uYuxc87N7XXrqvbC
         HQF5CJ9ECNONryoZFdi5bISMfNY9Q1kpcc5JDDPnminpgqQWx3mcpT7zZhpC6OV7p9BN
         CY2uSxvQt3G/gY+bQ9247QUCL1OTsySFRoMI3RZ5jOqvrkSJWfoUszUoJ8EvhL4BKML4
         TM6e/DTcgNyVL+b8nARP4dix6AEfefI+U+IXHaQzgQ5q/d33DcYE6hsredUmym/LJqlg
         MduprwC9Vy3wUQs4iVQlr72pSXt23sPXMKxli63sfd+DXA4NlHNqN7uNNY7wZT9SJd/w
         xtnA==
X-Gm-Message-State: AOJu0YxFO5x1o4lXRyNTrKiYFU/XAMhve7mXtzWu89Hi/vqSGHbRVhXP
	arYHAgpIq8aKGeoN7znllqzWDoM80m5gwjZX0OrV7Ov/pE/527OXMYHLRRr/g1ac
X-Gm-Gg: ASbGncvMF1J2LB9bY8eNb70Pbbm2n81BOVxSMx54hfoTO3gn9vbT3pYNI0RuFDRBmOs
	xX6tLcqPXC4JAxDVVEmwAaNVZquVSES8PdJZqxCk/XrB2qqH6KmKIOhx2dlKk2DQeiY5apqBbDs
	H+6BDJuXKGpYH5CCCPs0DOFrhtFx85RsjLTmk3oQr+V7d30OE2a1bB65k4OXxc0Uf66XTfuCM/R
	iX5k6tyHlBGPILi4b7GhJ+B0cXBszXGu0Vund8MraogbD5Fb8HUrHeZm6FSPpM1LZkJJQ3vkCQA
	gu+GreKfW7+ppKzfWHdOBWZXVfVD8nEXb9UUCs4Ews0y1xN3e4WPWGY0UaVvYhtW9/yN2KAhiOl
	ymJG4xVgP378lNBwHWISf
X-Google-Smtp-Source: AGHT+IGkAFbsTQJoop3OBYYv6iTHeKiEr0A1qL5jmyFIIh+zmXZEgd6ELrstD4r5TRiVD8b/BFjS0w==
X-Received: by 2002:a05:690c:3348:b0:717:ab60:392 with SMTP id 00721157ae682-717d5b68379mr19174187b3.1.1752180885288;
        Thu, 10 Jul 2025 13:54:45 -0700 (PDT)
Received: from localhost.localdomain (71-208-4-221.ftmy.qwest.net. [71.208.4.221])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4cf6sm4515407b3.68.2025.07.10.13.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:54:45 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 2/3] xfce4-cpufreq-plugin: upgrade 1.2.8 -> 1.2.9
Date: Thu, 10 Jul 2025 16:54:11 -0400
Message-ID: <20250710205412.788186-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710205412.788186-1-schonm@gmail.com>
References: <20250710205412.788186-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 20:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118424

Changelog: https://gitlab.xfce.org/panel-plugins/xfce4-cpufreq-plugin/-/tags/xfce4-cpufreq-plugin-1.2.9

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...e4-cpufreq-plugin_1.2.8.bb => xfce4-cpufreq-plugin_1.2.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-panel-plugins/cpufreq/{xfce4-cpufreq-plugin_1.2.8.bb => xfce4-cpufreq-plugin_1.2.9.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.9.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
rename to meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.9.bb
index 1a19f488c0..44b3be598c 100644
--- a/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.8.bb
+++ b/meta-xfce/recipes-panel-plugins/cpufreq/xfce4-cpufreq-plugin_1.2.9.bb
@@ -5,4 +5,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1f6f1c0be32491a0c8d2915607a28f36"
 
 inherit xfce-panel-plugin perlnative
 
-SRC_URI[sha256sum] = "07e458d9f4725e572001fb7eb66b9e931792311146e0f75ad5d87b9ae19573e9"
+SRC_URI[sha256sum] = "d0714720d588c649457590e5de3d95859b922a98d5fa9d0d1416f36a76bd3ef9"
-- 
2.43.0


