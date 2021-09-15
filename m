Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.7794.1631714130654404241
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lq2Bmk+1;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id x7so2711492pfa.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SiMiK0LGotNw1JqknEJgxxafzWwEbF4Tfkk/Ikxlaf4=;
        b=Lq2Bmk+1MqrWrCI/LXZWil2dn1A+bJCDbYvml1e02/IznL5NWjJ583ASwU2iaKcA6q
         g2jXXM5wQcl5wSkf09zUHxkhJFbiOSAyDErsZcmxbNtfV7j8Gufy7e87jP/3dt5bCJ8L
         Vqg6o1F6BmSVfZvGhoJO9X02kfrvN4V/KAnr98wwyMpT2/nXpS9z3RxQ+Oj064Y8WHtP
         RkQP+eOsKkVG405z/3HjlAmYA/0tPUc4L+rCrqUbvTzVQ8jcaQgDNIsJqfABrBfJpOls
         qdRZkwmYtWMM+mdA5dPSiiGf4MN/AohXGVRtIwEp/Q/2J+XhIO/OuqqFKcp+fj1ZiRTt
         atLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SiMiK0LGotNw1JqknEJgxxafzWwEbF4Tfkk/Ikxlaf4=;
        b=7HM6HEfSBagA/5iX9niSBUndPZj9qNzZeLOj0kkJGhrS1GooFR5cFEM2swkOJk37dR
         I2QBIbXUgMKWzC1Ukm9ZryqquLCG6BFCP9XPVP5rRfcJkR8edms+rWceOihn+0PAadU0
         2AlPhCCu9KSSwuABpEBgf4ALosIOkjVDkQ5gyWMNwiOy8WfVRgg3ridunJmuL5iOc6AQ
         GJ0woFAr+5BiOS7PWGgu73PYiYZP1OiN4DEDRu9r+gaRPCeVN5EG+j07QtftnaNz2sfg
         czSr/yjfnSl8ccvbjaignLsmjIpEWfacZ2aBuxIai8PMoTGgwGDEocG4NXJ0D/ngM8gM
         TDlQ==
X-Gm-Message-State: AOAM532E61sBvqj3dkiJSCNd+w9XZh9K8taTeFH46HfecYwl6GzD9TD+
	JjmW2w1/rAYDI/2rKEX9dcNWAILeDd8=
X-Google-Smtp-Source: ABdhPJyu7RYobSGObKKXUt88Vyo/ImiQABv8Pc1mRrzWI6tav/wXaaAvMkQja8cTrAeVQGpf4MjiOA==
X-Received: by 2002:a63:1266:: with SMTP id 38mr20781658pgs.219.1631714130075;
        Wed, 15 Sep 2021 06:55:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:29 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 6/9] cryptsetup: Add runtime dependency on lvm2-udevrules for udev
Date: Wed, 15 Sep 2021 06:55:17 -0700
Message-Id: <32f1d758a14bba35d67a75778ae747f1ff5c5482.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kristian Klausen <kristian@klausen.dk>

Without the udevrules cryptsetup luksOpen will be hanging with "Udev
cookie 0xd4de0f6 (semid 5) waiting for zero".

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 60b33e376b2331cd20950f0745336397790d2201)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
index 9e83b90eab..498f333810 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
 PACKAGECONFIG[cryptsetup-reencrypt] = "--enable-cryptsetup-reencrypt,--disable-cryptsetup-reencrypt"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,udev lvm2-udevrules"
 PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
 # recognized.
-- 
2.25.1

