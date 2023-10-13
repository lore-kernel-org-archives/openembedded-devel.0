Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A83DCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 17:30:22 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.44947.1697218212643812279
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 10:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2TtHcPE9;
 spf=pass (domain: baylibre.com, ip: 209.85.160.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41810cfc569so14666401cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697218211; x=1697823011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oygg2AAzfcHCHtc7aUrH412E3Wxwzu8akWnJBPRpw2E=;
        b=2TtHcPE9UK0ia63uTGHL+eI/fxwW8bsiis6fwpxFfi9ryQ/Ljx8DQTU89uBwyn8/ER
         +CL2zDITulxg8MPUyyJr4F8bW/NNgE2k8ZC2O4Bw2U8JXTh3LGAvcOHobORmxBioqXmb
         gqaMpwSuh/hiS6PDcXKy0vefiqFT6xj2GNK2Dz8I3aq7KGEpd++gmsQdrwRocQGYb/th
         ByGi2Ka7EE6aDAHNBNMrCTzVp8hd02hVrgKafxk4InyknM0pD5O76YK3vEZVoF8Rl9Uf
         JOlvgd0jOroFMRUtXulXTwnVmTXKIsLYDf6J8L6BiMkE9Obt5bK7UAbtJ3SGOJHGpfNy
         EsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697218211; x=1697823011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oygg2AAzfcHCHtc7aUrH412E3Wxwzu8akWnJBPRpw2E=;
        b=kr2B9wnMqrFmimmVTwfB30/DDZiLbINy4678R1qHNuiyKDuBTjyy18/7mkvAmTbAqI
         yl4wEc5Hvom1RWrx2kPbYNEseN7ghSGOGwWhgAaf3lNW5pFt89Cn4xhL0Ua+A9mfqmZ9
         OzLdG0zoqVtluHXrkxB8kivDNBkDMuJLAKu19uRCAEVt/RVXZvFS/6Q1P3JZNZj/CKiM
         Q4X6HfOWoGSPGdQRHKpIg1fJN/NwV3G5JvXbOF6JzByMPBtsyrcCrq2hNfu1P5sBcC2O
         PSJ/xal2kRlWFDyv5AZVpz37yoCm7QqZPpRGvBL26F/78Ei7s9JD+s24Y2cPOzPrngoE
         kzIQ==
X-Gm-Message-State: AOJu0Yz/s+WNYmY3g651IZg4yTtbfJg619lYIcZrldw7jKpwwYkXkFYJ
	fj05y9YqPfntI2YQ7zn7xxkqROyBZdYA00YcGeG8qg==
X-Google-Smtp-Source: AGHT+IGX4BDE/61ZCpY9AiOnnjgeLuWtAyrTfVg3d7yFwM6xUmRTAmZZVN/tEoTM3EymYay5cGRQ+w==
X-Received: by 2002:a05:622a:1787:b0:418:2268:992b with SMTP id s7-20020a05622a178700b004182268992bmr30732743qtk.14.1697218211561;
        Fri, 13 Oct 2023 10:30:11 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id kr6-20020ac861c6000000b0041b3deef647sm766918qtb.8.2023.10.13.10.30.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 10:30:11 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] meta-python: update ptests status for py-cpuinfo, pytest-mock
Date: Fri, 13 Oct 2023 13:30:10 -0400
Message-ID: <20231013173010.3966278-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 17:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105487

Move python3-py-cpuinfo and python3-pytest-mock into the FAST ptests
list since their failing ptests are being disabled.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index c4a752ae61..043d4a1358 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -29,9 +29,11 @@ PTESTS_FAST_META_PYTHON = "\
     python3-prettytable \
     python3-pylint \
     python3-ptyprocess \
+    python3-py-cpuinfo \
     python3-pyasn1-modules \
     python3-pyroute2 \
     python3-pyserial \
+    python3-pytest-mock \
     python3-pytoml \
     python3-requests-file \
     python3-requests-toolbelt \
@@ -70,9 +72,7 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-parse \
     python3-pillow \
     python3-pint \
-    python3-py-cpuinfo \
     python3-pytest-lazy-fixture \
-    python3-pytest-mock \
     python3-pyzmq \
     python3-scrypt \
     python3-service-identity \
-- 
2.41.0


