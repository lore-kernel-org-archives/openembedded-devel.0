Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5507EC7EE26
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 11:36:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.29583.1683632178922279334
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 04:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=V7jn1msl;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4efd6e26585so6503308e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632177; x=1686224177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9ZjdB0she1vQIHABCu00XxxzsCMjsDa8P0KE4DPcFw=;
        b=V7jn1mslMtSCabl7va1kkT/7S4r6IFc4tE/0H9V5iUgYwZZ7RVW4D8Ck+jrijB/DKB
         QLJPhRo1W1VecodIYmBelzgxcYK0JnRyYho64X4aOnzWcArut5mbpCiUkMWBVgLG3Xmp
         w8x9gjDkuRjMpA/+qED7HkQQmcwcuOyA0Wh3rT8f4Omakq0t3BibI6yaEuGhaEb0mlPh
         cwbrqGFhz7wZuwCRHbjbMgBiKbEkNlsNC5GwHddS9f/8KhDGWZTosYUwLhiBCcpm9Of1
         xDTO/IDofeWSA8HBf7UIqr5lAEi8LPCRg+k7qAKuQP6cMyCJcyZIsED2KY0OAvK0n9ku
         WjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632177; x=1686224177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9ZjdB0she1vQIHABCu00XxxzsCMjsDa8P0KE4DPcFw=;
        b=dykdNRhzMuU326OLp/B3Edr23bfD6z7OuG5bYcSS8saeLH5cWX/vLq1AuiUhdiKIs3
         x/h4x103SOFpUikN+k3M52dKiIFb4j4aOHtr6tBAkXf251dFim3JJPjWUtd8O/RZWKaI
         DQvDAzcKjQeJruMjBSMeKOt4BEBSbw9o05jJ0oYaYevZJ2nl6XVNmG4/DyvzU8CEhfcn
         km/rNtVh1IemftYrmRCjnTOTZMLcCdqoSwdakiYHArGIp8Mb1CPuk9TEk1dNqIPxt3XS
         Gy69/lALQVPK2Cy5609Gc6yQ5QYUArCtXYSuvr7H0Ef+sowtOHZUbJVkStg2JTJBK0A+
         aAfg==
X-Gm-Message-State: AC+VfDyrnhr+9JeRsQ6GqTCYxShFcy7H9JW2+8YBMzRD72dcWtjqYgzD
	DBNTzUaa1hoCQUiuKpyjZoF80cHcHE4=
X-Google-Smtp-Source: ACHHUZ44KvFD84TSpZB2jLzy88Wg17kYQbnHWfk4dHQ6GF9ljt1U9VTQyVZuaThzrOEJabEQWuXSog==
X-Received: by 2002:a05:6512:21c2:b0:4eb:1527:e29d with SMTP id d2-20020a05651221c200b004eb1527e29dmr697614lft.52.1683632177081;
        Tue, 09 May 2023 04:36:17 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id m27-20020ac24adb000000b004efe7b2e35asm314209lfp.248.2023.05.09.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:36:16 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH V3 2/3] libusbgx: fix device hot-plug use case
Date: Tue,  9 May 2023 13:36:19 +0200
Message-Id: <20230509113620.786170-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509113620.786170-1-liu.ming50@gmail.com>
References: <20230509113620.786170-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 11:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102503

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Upon hot-plugging device (resp. un-plugging host) dwc3_gadget_init()
does nicely get executed. However, for an actual gadget to get started,
it also requires the libusbgx dance as well. Instead of only doing this
upon boot aka after multi-user.target (which is fine only if the device
is already there at boot), execute it after usb-gadget.target. This
ensures dwc3_gadget_start() gets executed also during hot-plugging.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
index 74541d3c2..e2aa95a52 100644
--- a/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
+++ b/meta-oe/recipes-support/libusbgx/libusbgx/usbgx.service
@@ -6,4 +6,4 @@ Type=oneshot
 ExecStart=/usr/bin/gadget-start
 
 [Install]
-WantedBy=multi-user.target
+WantedBy=usb-gadget.target
-- 
2.25.1


