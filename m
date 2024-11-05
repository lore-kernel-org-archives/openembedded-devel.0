Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B65D35E4D
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:55:06 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.27868.1730831927115209525
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gaCNsFKQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6ea5b97e31cso963307b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831926; x=1731436726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7uYdoOQJn1EG768uVgDT/0ofEzmD1RpnXEllCKn5SHY=;
        b=gaCNsFKQ8F4HgSQ1AiKDo3dFTt12yA6b1zx5/jsKPCW3Sl9EI0V4K0zr5En9LwbK7c
         stc+/6UdIDOOg7JP/p8fcibODS72saiRCOBa63wb0P3MfJl65j8bHj2b/kxz53YaCYXI
         bzRnpZoJGtlco0/MBUa176E03fadlNKyGOq93x6dfvDAGJu4wmQi0paMSEFem0/Uq5ll
         kjoHD4yXP+5/TC6jdJe2odjdnCpiK6i/idkhJROUp4OkXun0CY0nPGH0tD377GBk2X2/
         WoaPuMF/ew3QzA7XPCBiPqZf2ctcQEuM/3isIMQIS2RM7XlNvHSRE85ndxaXmXDkMTI+
         VXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831926; x=1731436726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7uYdoOQJn1EG768uVgDT/0ofEzmD1RpnXEllCKn5SHY=;
        b=KdpJ0UN/JSrVHb56OnfVSzNhfe/D/qm6YXEnY7DHEaCPDVcKv1e1V0btbmOgWtyVTY
         niHhXuyEvVfyjOekSACjY1rnKB8+34ClJwbWBhSW0xOf4tT28UQJKit+CvDT6cH8ePcF
         +0gs3oJ95ehKlSJmLQXoPGPzr2EZror9Qt02JN/00XQC17PrFJZXbgDZxgtcmPKMVVok
         dWhh1NDsb8J29T8IhFGAQ8gFBLFiy5vMsT8463Qdt0OFUhQkcQ+Vdc/ZB6ampbvCqRxw
         AwRhWmdPK/G6uqGU00AVFa2qV3g3344bFVvhOUGf2bDzKV2QitkhCdbkzVlLgu4MULQZ
         sbpw==
X-Gm-Message-State: AOJu0Ywu//sf+IAk+YES8a3boO4p4R6UJbCCuw8q+EwkcWt8cy32Hb39
	Am3zdubrEUY7kxncsUJJPIJHbD0HVetxVyN8/GOhwQwq09CDMKouTYszJSK1
X-Google-Smtp-Source: AGHT+IE66HpsWYUZIkR7aKiygYiGiSaJkL59Sn52SJM+bS9rTgK02TWxBLSyeH30EPElYOHajy+E4g==
X-Received: by 2002:a05:690c:d18:b0:6db:d02f:b2c4 with SMTP id 00721157ae682-6ea64308628mr140433287b3.7.1730831925781;
        Tue, 05 Nov 2024 10:38:45 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:45 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 058/161] scsirastools: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:34 -0500
Message-ID: <20241105183658.34982-60-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113573

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index c9a5bd1f9..ccd2f90c3 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://prdownloads.sourceforge.net/scsirastools/scsirastools-${PV}.ta
            file://mdadm.patch;apply=no \
            file://print-format.patch \
 "
-SRC_URI[md5sum] = "6271a61b2ce40aaf33ef61775148cda1"
 SRC_URI[sha256sum] = "e7b997e75decb06a650c42c35cd63d0c94c34e39cf133c723337b0eeabbfdf6a"
 
 inherit autotools update-rc.d
-- 
2.43.0


