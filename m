Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 335EFCCF9F7
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 20:53:51 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web01.14293.1761771222411060917
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 13:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SdfMsh33;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47112a73785so2243715e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 13:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761771221; x=1762376021; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f5b9gsgp5QFWxznALzBCJiL09O9bWMhmf/+MgJTChmE=;
        b=SdfMsh338iL1y6ZWK6paOISDPcS+mCyVZStYEU3sI5+bi1qs/mI0Rwh6WEHX1GlKnV
         HkKF+PZ5jrTN3gujOADVQn2yHbTAl0f3OqR9rosdVbV9KQHSMVDTnxRNWEXCaIlPekim
         77mfQCaK6BNhq5azORGKmN+4Vjs9RUQmoON01lykVHgp1D23J37Y3N7cIjNXP9cFMosA
         m/mnkb59qBvtOF6B8L8M6OPMTYWzzMhjBP3T1dyK7Vmx5blUu7oAfcnaOI2aSqzC9Man
         YeVVDQZcSA35dkr0ieTgQEqtMcPTsnCuU/51o7nYDuTEPN83+WIsRvVfygjwAQHneEA/
         Aggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761771221; x=1762376021;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5b9gsgp5QFWxznALzBCJiL09O9bWMhmf/+MgJTChmE=;
        b=tnUSVwTodaxEcrWTUR2hkl+aAdIInN8ZfKJnuSQ1Lev9ufCp6/6N2A2+1Nv2YBRVaR
         XO6g+cNHFji7MgN67bQJJAlnOcw1cGubimYsN8iLbpSt0KZBKUMC0wmXsh4MTIEHMLul
         bdF4HNkq8uyflmFscNGGDqrfMBNRn/pVZNjn6497fNKxhCMP77O6jNRpT0jMnwqvqhVr
         xJZXKxbeOOsoBI76jAgsosoZS1uQ6wdo1ntAySVpt9+vEBK0Hc7SfMyoElehvNqnCKa8
         gHmvNP9ta0Qz/aO9jdQokcijV6EgFPYpjizpttYZ6n5e858Rn8jsMTckGAaWp7ELLn2N
         V4eg==
X-Gm-Message-State: AOJu0Yx3t9rD+w+OBS2Ri6VuSb979mEq8f2MX8Z4StomsR17Lst1f64J
	9T2ay0OGdF6oz0vqBLocYd8K8Ym8u/kL1tBOXWdlcYFDzsYctnMuquboreN2FrVDW+c=
X-Gm-Gg: ASbGncteWR/su4eRolmF2cMr+s+0xzWAaozhrcloVR5puZZp5MxZz2WDxkYd/+5Ch46
	DrvT/3fsYQGgLMQljmO8jtsrwh4VM1s5NIKSmCXxke1mzYry9IvoeEh1IgqBXiBMeihWY32nI8V
	6R/EW9LJtnt7X5u64eEO971/AYkvDoSzWWwDsJ6kIEqoxEZ3kfWXq3hbR/FHRn1eaKNIrabEs5t
	pUs6BeZXYZ01uIWvpoPOXHPfdG0cklylOc3m0u5MFfYcK4GtTmUWyy4fEeciDvS4LvciTpAlo3E
	VI2O1zhzghPOUXfb59EzsGEpGB1WyeYCytdXlGn5J7zdj/Yv2B4cmI7XgMI5y7+keDg+IHCiwwL
	mwfkoOdxN+82txfda5zDv4BSVXHUIc0eSORGXrecYcsIHtPZQoX9KmLOJgTorFUdgQFncFpFXCQ
	==
X-Google-Smtp-Source: AGHT+IH+8walpCLWfsdPSPzXUETC9KWhtJa9yL1VTdSmkwF9VIOpcj0melkpSB3q4uIZfa2hf695Eg==
X-Received: by 2002:a05:600c:3506:b0:46e:345d:dfde with SMTP id 5b1f17b1804b1-4771e333bbbmr33914255e9.16.1761771220341;
        Wed, 29 Oct 2025 13:53:40 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772899fdfbsm2700825e9.4.2025.10.29.13.53.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 13:53:39 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] mongodb: add tzdata to runtime dependencies
Date: Wed, 29 Oct 2025 21:53:38 +0100
Message-ID: <20251029205339.3826693-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 20:53:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121170

Though tzdata is present in almost all images, some of them are lacking it:
most notably minimal ptest images. mongodb relies on tzdata, otherwise it
doesn't even start up. To ensure that mongodb can be started up
successfully, explicitly add tzdata to its dependencies.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb               | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 0969fb6ce2..a149c0acc4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -8,6 +8,7 @@ DEPENDS = "openssl libpcap zlib boost curl python3 \
            python3-pyyaml-native python3-cheetah-native \
            python3-psutil-native python3-regex-native \
            "
+RDEPENDS:${PN} += "tzdata"
 
 inherit scons dos2unix siteinfo python3native systemd useradd
 

