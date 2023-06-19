Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9247C001DD
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 13:22:53 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.7413.1687180965875330187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 06:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=3UYRpw9X;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.42, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3113306a595so2166047f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687180964; x=1689772964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cQdYCiuafvhHNhsYwUkLJy+N7hMP5FE0216On5hyXQ=;
        b=3UYRpw9Xa0wx2uKGIDgseUHVIdLkPkDXbiDzm6IdzM5xReeuORpcsiz1tQOiWIIxgr
         5VXRXWe2MCIeF+25jGhJF9jcxs9B8OzfK3xch0DMoBhk5drK2UbP3LazbqPCRQt3a3s3
         mlcPDRvk1uDhsczgZH3K5ypIww8FywY0lzSwgS/ZK5qata7CL3tsSbkyjYRuf9SVPi1i
         Uyre0V7on9DMfTzd10tO1JptKndJHoCQ5VQk3aD4stYV0B0Ik1o9VwQvLUl5PqtyJcQd
         Vq4FXHw5X2bHVHhd71lldznu52ddsgMOmnnJUBGIpG7dfZM/sH7oIeyJRpNSFX/UR1mY
         /Itg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687180964; x=1689772964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cQdYCiuafvhHNhsYwUkLJy+N7hMP5FE0216On5hyXQ=;
        b=QSmjhsKyYDhqUFBdqrJNLZCK+MW2MRdAO0ZpmhUbFfu18wViNFp+P6Oip+1qgpEPFj
         nI7Bfi+Gy7Ej2SxGiEwVmlkmq8mVkmijpXRSS2QUmG7czlCq15Pvo9tXL2th3GNqXRwD
         LyTz8E6kA9STVGiN5jRmjpuJB5tCZeD6G6l8vP/q9mIseredE/AcwIm2+cUVjAvQPB/F
         X1ioSz2PGt3So41j7ABAGF5uftD99fVnyIgXApH+s3F/k4Rj9MFoPAomXWwI/8smUkqz
         JZVbwoqx1Z1iWfTlM7p74hPqbzcfVBGiXdM5nSL5j6I/LzOcfD0TuIPY2Moq5mxcIt9s
         UGLA==
X-Gm-Message-State: AC+VfDyFvLAeSSrxFQxjD65XO4wjYcFZMmUKt54cCPNU/2DntNsKskTV
	CL+kIkRIJm0UqIZFzKHGIbWsqQ==
X-Google-Smtp-Source: ACHHUZ5eBvDaGpp7KS0KxJvXlbgyMiZg3m7yjAccjUxkp4BX7UoTyfLMf84SE1g1DREqrznl0kTmTQ==
X-Received: by 2002:a5d:5684:0:b0:311:1bd3:6c7b with SMTP id f4-20020a5d5684000000b003111bd36c7bmr8655395wrv.32.1687180964456;
        Mon, 19 Jun 2023 06:22:44 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:d9e8:ddbf:7391:a0b0])
        by smtp.gmail.com with ESMTPSA id t11-20020adfdc0b000000b0030ae3a6be5bsm31667139wri.78.2023.06.19.06.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 06:22:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][RESEND PATCH 23/54] python3-gsocketpool: drop unneeded DEPENDS
Date: Mon, 19 Jun 2023 15:21:43 +0200
Message-Id: <20230619132214.213417-24-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619132214.213417-1-brgl@bgdev.pl>
References: <20230619132214.213417-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 13:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103407

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This package doesn't depend on python3-gevent at build-time.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../python-gsocketpool/python3-gsocketpool_0.1.6.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
index a5581c252..9ded1d4be 100644
--- a/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
+++ b/meta-python/recipes-connectivity/python-gsocketpool/python3-gsocketpool_0.1.6.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "creates a pool of connections that can be used with gevent"
 HOMEPAGE = "https://github.com/studio-ousia/gsocketpool"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4ba825394aec026b5f94edca44426859"
-DEPENDS += "${PYTHON_PN}-gevent"
+
 RDEPENDS:${PN} += "${PYTHON_PN}-gevent"
 
 SRC_URI[md5sum] = "49f5f292ef1b60944ae92ca426a5e550"
-- 
2.39.2


