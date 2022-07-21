Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E91C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 17:35:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.9391.1658424902998692494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WhxO0ATm;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 f24-20020a1cc918000000b003a30178c022so3760924wmb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 10:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TO9PruxJWdxbx5BJ3OShl17z+UP+J/mjOxDyvHMg9M=;
        b=WhxO0ATmSBZUwowJeBoRVCAMk6dFim8sa5lOWbMnocjU79xPh5TwTmQlowM6S4GAOq
         Md4oYUJ8BUVJWH+6uY074yuHdq9KLm/uvCzR1tNjYoQO7vosJTvQ7lmg8nctAxZ5P5C4
         ejWVIIuvUY+NHp9c88A8g6d71XgeMw5k11AuaYz+beVJjPS9D6VQjwq+m/1Bt4XJC1vW
         P/YJ2XXgG9BaU+BSfg5uvYuGbBtSzrRZ//I6wLz9l5f4qE5cvcfU/Xqh8VRJjviPse+4
         zG+wIqB0nTXLlDPkDjD5pA925n9JeUghggQfbKjouENJbb9WOprOibiEksixCcL//1IN
         EKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7TO9PruxJWdxbx5BJ3OShl17z+UP+J/mjOxDyvHMg9M=;
        b=sWEM8+F6dJUVCfUveqnRxzoXeJAhRaOPTfV92MkGpQLi5osLMp65b2XWoyZzzSqH6s
         XzQChvMol8L9HLX93+v1TlXfG2zAZik2ap9QPgXNgAsk757kx+FyOEmLxOE52cIzUnJr
         8ISil7cV/9Ut+H21SIJM7qhtO6G1StT/Ottj2ctETzUpmIe7enZe4URfeUlST4KDtjwG
         7uj1vJszvocB5rfAfOhiDhLapQE9IVm5eNihVXWVhO59TtZwYSEJ/1rc4v3yBuorUOmJ
         QDu8Csl3Cszm4ZXiYq8rpOjZF8ZQs6tFyJCkR2lXyvDGhqW6rvbXaIrScADXJblR0RQ1
         hasQ==
X-Gm-Message-State: AJIora/I0Bv2d9ebBzukX4WkfhQt+H6w8ppqvY668onkhAnFYWVaPSme
	XVYOcaDFeJW9REP6UQoC/Iv109zxrn8=
X-Google-Smtp-Source: 
 AGRyM1uru65y4+yZ+EdagGwqkpMSnu2piqwJEQ1zkD973bG5xCzQjwvBmzeFosemMdX1V/TzN0/IVQ==
X-Received: by 2002:a05:600c:ad2:b0:3a3:181e:e228 with SMTP id
 c18-20020a05600c0ad200b003a3181ee228mr9447701wmr.139.1658424900945;
        Thu, 21 Jul 2022 10:35:00 -0700 (PDT)
Received: from Unimatrix08-Jammy.. (mob-109-113-162-128.net.vodafone.it.
 [109.113.162.128])
        by smtp.gmail.com with ESMTPSA id
 o17-20020adfead1000000b0021e4536a948sm2545229wrn.79.2022.07.21.10.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 10:35:00 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] vboxguestdrivers: refresh patch for new upstream
 release
Date: Thu, 21 Jul 2022 19:33:13 +0200
Message-Id: <20220721173313.874289-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Jul 2022 17:35:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97922

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...0001-utils-fix-build-against-5.15-libc-headers-headers.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
index 6c11f1d4c..203eec6ee 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-utils-fix-build-against-5.15-libc-headers-headers.patch
@@ -48,7 +48,7 @@ index c73093c..7bffde5 100644
  #  endif
  # elif defined(RT_OS_LINUX) && defined(IN_RING0)
 -#  include "linux/version.h"
--#  if RTLNX_VER_MIN(5,15,0)
+-#  if RTLNX_VER_MIN(5,15,0) || RTLNX_RHEL_MAJ_PREREQ(9,1)
 -#   include <linux/stdarg.h>
 -#  else
 -#   include <stdarg.h>
-- 
2.34.1


