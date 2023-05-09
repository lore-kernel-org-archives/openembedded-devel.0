Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20824C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:50:11 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.26378.1683618608976771053
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DaO9QlZr;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: liu.ming50@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ad9f2926adso6727911fa.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683618607; x=1686210607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9ZjdB0she1vQIHABCu00XxxzsCMjsDa8P0KE4DPcFw=;
        b=DaO9QlZrJwzmMnRKN1e4g3zWB5BIVZt7O5RXDwqhBjLNwkvlNiPgg+/0XCyRscQihZ
         YC5z0HXHE3P69R4udN6/htq/qRfzX7z/cL4MyUs/9A8jaYg7LDDMUtpnsmhLeFvFB+Xt
         K787Gqu6FF0dSrgD1ZDhgWtgk/ykot2yYx3QsU7n1rq7ut1qRP5K3hh/05vA7rmfFmii
         DdKQU4InKw1CYd2z7xRhFGUm07bQjD09MmnKGzfvA6BcIacp9CrA3aHIDFCQujv8GG1y
         X6WTN+puaKLFPc3U4B6MwBFTnvHC9UgV0T0VGETnbO98vTtUTEi6E+uDCzXDKorCNvl3
         vJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683618607; x=1686210607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F9ZjdB0she1vQIHABCu00XxxzsCMjsDa8P0KE4DPcFw=;
        b=P0aNpAjeJKAdYPiyjVKiJNuR6fwRpR8QlOK4qKqzhfONVP+mYqXu3zW3pQMG6mHhPP
         Ufg8fd0PFjiZJPlxLra+/Vzs6aOabN91WG/hHaKSp8qvIpTBfT8rh6zMC14kDzwmmj3j
         BipeMZriQ2mmuHTQeJ02vwQt46Pe2AduodsYTT8IBCIfrx8O/T9i7c7h1GgrxvdWGKSG
         XA3bXiKJ4AXQ9rfpbebIVnDOpNrQ7Nzc5LHINKoygkrCvaI7ySpbN+fhzhwD2sj65l31
         Did3ogjC7mQ0/Rzy2cUwm95u8GScwSIs20ulKHFZ61ufeBuX7X6YQ0iioMFfa+sdh0Fj
         Y93A==
X-Gm-Message-State: AC+VfDzQyd9trb19iyMug4bY7IACFWucQMYkKH/+B6qxELu5yD/OR14w
	44AJS70KKMy3KBl7WZL+ncgsnnSRFI0=
X-Google-Smtp-Source: ACHHUZ5F3QdYZdWVWrB6UX6G/ePG79gELkhG5CgaKuCxmIIECj7JGXqCGu8gYt6rUOcg4518F5E0gg==
X-Received: by 2002:a2e:8e86:0:b0:2ad:9751:8d79 with SMTP id z6-20020a2e8e86000000b002ad97518d79mr542769ljk.31.1683618606732;
        Tue, 09 May 2023 00:50:06 -0700 (PDT)
Received: from peterliu-Precision-7530.emea.group.atlascopco.com ([2a00:801:724:fbaf:9ccd:45e1:5af6:d3a6])
        by smtp.gmail.com with ESMTPSA id u21-20020a2ea175000000b002adab10a1fdsm16583ljl.117.2023.05.09.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:50:06 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: francesco.dolcini@toradex.com,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Ming Liu <liu.ming50@gmail.com>
Subject: [meta-oe] [PATCH V2 2/2] libusbgx: fix device hot-plug use case
Date: Tue,  9 May 2023 09:49:46 +0200
Message-Id: <20230509074946.8246-3-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230509074946.8246-1-liu.ming50@gmail.com>
References: <20230509074946.8246-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102491

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


