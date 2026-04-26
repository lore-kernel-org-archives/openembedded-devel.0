Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCD2FF885D
	for <webhook@archiver.kernel.org>; Sun, 26 Apr 2026 11:45:11 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16858.1777203902261703783
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 04:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Cavejzh9;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891f625344so80920525e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 04:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777203901; x=1777808701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ9grgg0gXJjBX0Erpa/uWeREx/iW8Osc2igXjF6J0Q=;
        b=Cavejzh9uCndv0ff0ya2WQEN14FbOgkEehGn8Mppuoy+AoQ6rCFEc6DLnK3WFBPomm
         zKjll6j4aEefXlgGhOQcfzcy9hbw3PBiFeJQ3LhcmLD8TGjUB5QWxmmg730AYy+zhhoF
         N59gPdePqEh9x5YWgL2njN27448Z31V89AwJonkFM/j4I+kM1oxPzfJhaQc7dKKRblQ1
         nnng7sUmKWG3RZkOm5zBTYnsZ5Dvs6ukQNKz4SmvsngcicoYt4isV2JbRG8NUtqsiiJc
         cb5njCy2HUicgxJuGAdWZ2zWePwEX+KiolNpaDBTDfWFH/8gL+OATgf0p26t5pEiFKQQ
         HUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777203901; x=1777808701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ9grgg0gXJjBX0Erpa/uWeREx/iW8Osc2igXjF6J0Q=;
        b=TQ7UFIpk9GXj1RI+E/UIFR4WNu8iwkw7aaP9PClqDKqe0aqsGS0tF2yTNrwJpOuPZN
         A6fK5e+UY/K1Ucu2b+y9WAmIh3AYxMo+6DnQ9LP35uRULzBp/W4mLvyy3Ydeysp0klpF
         9aC1BStg3aDChNktyBJ8xe89ovFFvKMComp6q9CeBRNFmpCiYErP+vFbCuBfC/xloHMH
         jg5ztbhp78jviR4xRS2Ze+nmrJ4+p4nXmCcEvgzJSVBw/xlkN/EwXnmQ2JpCSAss2/pH
         ciKUQKgrteDvDaGbD8I3AvqEeOqg43boYFxzvT32yWqxlcyY5smApoLE19x6mjLaPR6u
         glqQ==
X-Gm-Message-State: AOJu0Yx/rbn8PzgHshJ5duDgwHIasAzUUVS2Pli0AvTeQgM0835vKevK
	vLqqAcGt5ZGHZbj+TppVveH3hnNdWN9+E/mchsuOWtzo8O7DNCpng8hEoQCPEg==
X-Gm-Gg: AeBDievLNbaNUS91ipgJNjv7mVgtymVe5ymRxtD7T8PGtMSs+aYnPq82r7G2pjDNZhb
	gPfNmurcsQ/SpZXvVIhtBZPYK+57JqrUWIcjnEP6J9xWpbWo6BIh9uA44UrkfTJENtpWbNFXGwe
	43KUOXzVwmZU1Djy7B/0ydxllKiiPcjDFNOtCLo03MUk+E5QH0C48o17pPC4zZJeRGAR7t6fElR
	FeZxuR3+YG/dF1dRiCoWjZtJMHjFE8YXXNdYorid2kW3sig77foSsvBA4RqMkirbljM6DSzYtFN
	jpgs4ThAmbo/kkiHri5vUmb21QUWNO/py/AmCehhnILs/Upe3KGK8MLnEcHDZxPh5QF+0orPCXs
	um0ptQLdJkEuACE8VrrnMh5fzdHoAd6AL17O4x1iTTc0eUWR0mBZBdNRLhI5uuwMGY13IGkcWw3
	wSkGwFlFkt4Vbk2gnRUkwAzhVB5F6lSW4=
X-Received: by 2002:a05:600c:1d05:b0:489:1baf:8c03 with SMTP id 5b1f17b1804b1-4891baf8d2cmr393615745e9.11.1777203900458;
        Sun, 26 Apr 2026 04:45:00 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489201cde98sm476905355e9.7.2026.04.26.04.44.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:45:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH] freeipmi: mark CVE-2026-33554 patched
Date: Sun, 26 Apr 2026 13:44:59 +0200
Message-ID: <20260426114459.4006021-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126615

The CVE is tracked by NVD without version info. It's description
confirms that it is fixed in version 1.6.17.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 21f792ff6321b4631e36c29bfdef080af4fc7da0)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
index 50a1877c0e..7970e0f563 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
@@ -23,3 +23,4 @@ inherit pkgconfig autotools
 
 EXTRA_OECONF = "--without-random-device"
 
+CVE_STATUS[CVE-2026-33554] = "fixed-version: fixed since 1.6.17"

