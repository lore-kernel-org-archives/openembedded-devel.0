Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.3856.1620806860047843056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 May 2021 01:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=los5ahap;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.49, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f49.google.com with SMTP id x8so353256wrq.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 May 2021 01:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jV8keC8jwFyuCK6+TEqIKbCm9hufuef4h8qS/PgOAWo=;
        b=los5ahapqdXKgxrFzsPhayY4jjeDMAC4ZHrcdpNH1wP9ISZivSDlX7//X3rZ35hSVk
         wN1eg6wSYTAvt+fLaJpnaTuz/x6uE61vJBtMdS9QvgVRYfT+2sMDR5oqI98rsvAntCQQ
         H3lONyS2L8gtK528+xwKXi4qB0uw2PuE2QGtXAILaXTZ0nSuhg7WobFDo5gcmMepeiwh
         vbh2ffieTj2WRUufmJnFKL39bFz3+MqimFTZJM7kgT9S1gNr+jY18JDA0wv6QoA7b32P
         kp5FcUcAtDrOradyLgH+IyZHsw4iNt+8YMCBp2j2tJRS9mz/YsOwavlZO1CGFJ7yGksQ
         LyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jV8keC8jwFyuCK6+TEqIKbCm9hufuef4h8qS/PgOAWo=;
        b=fvEY1N/HaWtGCzzbeTOeBD/UruQML/Yv1VeeVl8GP4MYaMKtsbRh0Fb9qXgkQC2JE9
         /OFqW7yKras4D+OnJKMi6nEWXRDwHPm7AVj82mXq9uOvPUuJvCd4amOdxHM5GircH/NI
         E5Qndge4toJhjt6P0UVLHGnVZzwZr3WKS3rL2VgPOslj07gcpxxUZbtCYJ+BxmIMNBdB
         sdKXCZfBi1ckQHG29B7U6qSg36DUPcNUn9bHQQhOI3G7w/BYsndI4YAfvHYVR8Z21X1o
         QRSu2WU6yz1X7SIESbX6c9T+erBXamDLwO+HYp3izQJLzXjjkwsJMScdp8WgtQ8VEaYv
         VYhA==
X-Gm-Message-State: AOAM532qujQLGFY6RMDMR1L1X0ulA31ZS9Y/Qt4As3N8w2m562mpphoa
	6X9A/ulAmlU/RFh0wObojQBRww==
X-Google-Smtp-Source: ABdhPJxn46sBF+Jq89jfTMUxkg9GhOtACClZADnxaSZca8igMdknYB0H0MA5A8iFOnptLFNNXMBqbA==
X-Received: by 2002:a5d:5254:: with SMTP id k20mr45144288wrc.62.1620806858515;
        Wed, 12 May 2021 01:07:38 -0700 (PDT)
Return-Path: <brgl@bgdev.pl>
Received: from debian-brgl.home (lfbn-nic-1-149-6.w2-15.abo.wanadoo.fr. [2.15.231.6])
        by smtp.gmail.com with ESMTPSA id y21sm5709929wmi.15.2021.05.12.01.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 01:07:38 -0700 (PDT)
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-devel@lists.openembedded.org,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-python][PATCH] python3-pycocotools: add package to packagegroup-meta-python
Date: Wed, 12 May 2021 10:07:36 +0200
Message-Id: <20210512080736.10262-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a follow-up to the commit adding the recipe for pycocotools.
Let's add the package to the meta-python packagegroup.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 0418b5930..992dd690a 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -290,6 +290,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
     python3-pybind11-json \
     python3-pybluez \
     python3-pychromecast \
+    python3-pycocotools \
     python3-pycodestyle \
     python3-pyconnman \
     python3-pycparser \
-- 
2.30.1

