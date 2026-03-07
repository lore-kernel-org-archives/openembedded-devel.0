Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC105FC9EF9
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 11:41:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7520.1772883706117227106
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 03:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6H7+xfr;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-483bd7354efso133483545e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 03:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883704; x=1773488504; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eobZ49vtonbxOJ4PPu76+7Qld+NvknzmwA2GY8cOXo8=;
        b=l6H7+xfrvyksLP2+JQmE7NUSqBc6AaKDPXJK8BWMEvPPSSwwrp9teHzEf1JrOFBUI+
         0UZVnmiRHtWeOB/Rshz13VUqVgWhU7Zpr5ktmtovOqqD4AgK0OEHlk+xaC6iTnQkqRjh
         R1y3F0b+HNvWiKkkc3Y8TFSygbpJ79BetleCyOX4jpNWYpb8ZOG6ioLGSJCw9vIcOiAG
         jCayAkwnqfHFYFUyofejyyHR7yHDk+nzREpqpydb+cBtez63Gto/AeQxEnqVURjjAp1P
         0GGXCMsrekzdZR0JcsDyfce1vdYJ88NTf/8WMxPoBP82QzPpGCL/ug7wmqJ9XfC3UNx5
         d6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883704; x=1773488504;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eobZ49vtonbxOJ4PPu76+7Qld+NvknzmwA2GY8cOXo8=;
        b=S8uqmKX4OkcYVJAgQB60rWpnX8J+d0t4OdN2okvJY7Bq1Sj3pxjEEH8vHcB1+gcRJ3
         ufHUkd5Zh040z1keTRJBgecGtBp4z+cUcKvfZp8Rz1xpyyuW6vF8UJsCKJBETFPLCFDC
         g4wYE8GOrzAcDOZe1X5weg+Em5rCuWZZtBnmX7amUhDujsRCP6yC5ovmf2WDMrVXCRP/
         hmMzI/YsiFvhiaiZNDoZ/69yH5M6ZU17q0s1/iqJWXeT4yYPVufz5S6BcCjksJiZWRMO
         jYhpt3+tWJMmAP2mlvuhKM9f40J/BlA4K+VIinDCmli7kyuelOG0U3Tm4uzFtk2B6kqp
         zqaQ==
X-Gm-Message-State: AOJu0YzZ+6jW0nQdn7+/csCAkRwavFMkU/tWMLacQeSkQtfBC3lLJurs
	9uRY3KdimgHm1HxeXyA4m94s+xJokZEGjH1O4WZyW/oINC76eCZ2ehMZ6tCp3A==
X-Gm-Gg: ATEYQzwEAF7dFUCpVMcUxkeMTxb+ZcsS6Q6eeyxTKr05ITCZgauWWH3CQfXivh3FfmS
	ZVRTcYfcUtg3oAPCmnPMxrSHkHZ24KFQ4H8IKM61o475tta1UgO6hEsOG4UWSaX1O1Cl9rpFMLQ
	HhIVeSs2Xp4T6DVeCw1KEhRUp9zfyp8Ca1wA3AzHcj6tI+SAs6qLEhRpZ/N8llZojek4m4QgovY
	+NObIsKnIYQJxLd7jbJ/5D7uTgh2ZlEIEvt8HQM4rRso173Wo6n7kWClU0/yHwPOOO1T1zm9zeq
	C1bYJaLF6Mi7u6hydhXW/461MV1Ypo3ft9oDFJQuxQsa45OWQu2tlxG3T6WbtV13Wb2nfu+bSTX
	EegmbrhetDCW161YPmqJ0nx1KeYlGjspcUraCNaUa+zeVYfn/0YoUjNL2YBWEF3HIpNIboE8zw+
	Bd2q3RcVDslenvVYnInvIf
X-Received: by 2002:a05:600c:8b68:b0:483:a21:7744 with SMTP id 5b1f17b1804b1-485269692efmr95784985e9.26.1772883703970;
        Sat, 07 Mar 2026 03:41:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm11170913f8f.21.2026.03.07.03.41.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:41:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] udpcast: update patch status
Date: Sat,  7 Mar 2026 12:41:39 +0100
Message-ID: <20260307114142.3992185-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 11:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124926

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch b/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch
index 3255a3fad0..244c6f5922 100644
--- a/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch
+++ b/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch
@@ -5,7 +5,7 @@ Subject: [PATCH 1/1] include stddef.h for ptrdiff_t
 
 This fixes compilation with musl.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://udpcast.linux.lu/mailman3/hyperkitty/list/udpcast@udpcast.linux.lu/thread/2WTDPJNR6WGDO3PGCEC2J7RSJWETDCXW/]
 
 Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelinux.com>
 ---

