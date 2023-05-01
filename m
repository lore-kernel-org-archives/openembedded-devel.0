Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EA6C7EE25
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 06:05:36 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.87636.1682921128160177085
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Apr 2023 23:05:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YYVvEqVW;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-24de2954bc5so998341a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Apr 2023 23:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682921127; x=1685513127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoQjzzDxMA8C1AAiI/TaQNk7aYUckxZSXfumnlXj0i4=;
        b=YYVvEqVWy7va5Gk8/fAUW+efxkd34IMSqkth4/Kw5jPtyA5qplxtGHDuBHcQXb00u8
         4r+Zj62zR85V4kiZdW7N1rse3KB3c5cW9fXX0/z6/fm20S90PW5o6n9cIx2pXFWitmrt
         jx7OiKAjDP3qhIpLKRt8pZqxW91xBje7Y7fsCz4H9nTDldELmLDowpoEFJLCWLgQ/+gr
         DSG+lTqzHOv+pKwxnp1S/NzVGNMr5oCb3ZJVaSy6qWQwssPf45YgXemRv1X2Zej+Rg/F
         A0Y+vNaaCzREfhy9+gmLYpLm1QTceZ9pI2PVxPwzunIv/ksmaYktwnktIis2k7zINcbw
         8tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682921127; x=1685513127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoQjzzDxMA8C1AAiI/TaQNk7aYUckxZSXfumnlXj0i4=;
        b=cmThUcO9l3NWKYbeR4tQhDCAHjRPolEb9IIvDJMaYbCP+s75f+gwhr7fvKwhfquwiF
         DhbdCkWkgAokOgCVDtOGpTrVh/lHKUFnkXcUzmoKj8w8E2CI4NhTXfOytsj0eQvdG5NR
         31t22Q5O3Bn5lHYEQS20djEH0MwSepHe5UBfKPscFh/m8Ra5V+hVS/qP4uA+6+GPD9Hz
         okh1UpHSeiIRPrJKdb0IS6M8+D35Gjvab322IFmM+nNsD5Cw15f9wGZv2kJLOzQbWw2K
         wXRpfFavN4gXRsctRkHsxBwBit0NuWwXWK11a8VkBFa6DpqOm6jbJRSbnE7tz6T/qxvB
         Ff+A==
X-Gm-Message-State: AC+VfDxsHvhWWsQKz8XdKbuEu+/sfW8rJoQWt1NC3o35/6365evspGcX
	pB9bfBz8SNz8jU6ZXgwEOgOmmJ83OT4adA==
X-Google-Smtp-Source: ACHHUZ45Lr+9LiydeZVhyUQFdb1ePSZQ4JzpPH4mROfS6izc6dTl6S1mqhcZleYTR0brhw7mnNHJHg==
X-Received: by 2002:a17:90a:690d:b0:247:1f35:3314 with SMTP id r13-20020a17090a690d00b002471f353314mr11986207pjj.48.1682921127245;
        Sun, 30 Apr 2023 23:05:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005134fc049d7sm16767730pgt.31.2023.04.30.23.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 23:05:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/13] rp-pppoe: Point SRC_URI to valid location
Date: Sun, 30 Apr 2023 23:05:15 -0700
Message-Id: <20230501060518.3505068-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230501060518.3505068-1-raj.khem@gmail.com>
References: <20230501060518.3505068-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 06:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102239

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
index d990388abb..c19f7d847f 100644
--- a/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
+++ b/meta-networking/recipes-protocols/rp-pppoe/rp-pppoe_3.15.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 
 PR = "r11"
 
-SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/rp-pppoe-${PV}.tar.gz \
+SRC_URI = "https://dianne.skoll.ca/projects/rp-pppoe/download/OLD/rp-pppoe-${PV}.tar.gz \
            file://top-autoconf.patch \
            file://configure_in_cross.patch \
            file://update-config.patch \
-- 
2.40.1


