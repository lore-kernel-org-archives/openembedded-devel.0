Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFDCEEEC37
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:20:58 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.67533.1726208458012812150
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RfPhRDx1;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc47abc040so16099225ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208457; x=1726813257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uBPt+6TlJo6O+g20MrzU2sMetD7sduIdkK0ymazLYw=;
        b=RfPhRDx1M9SW6JOhawgSUuatSwDXUkDx5vqT9csthRzMHS17OvHKO1crEqKRvOleM/
         aUVNg60O+chRx4hUpugsay1h/HjbdfkM/7KC62trKMqr2w6wqQFnR4e8WQukVAEh4ZGX
         iG9j3dz7zm9yUmVttYS5YQntvaitGFYyKxqjnhIRyGu/Uc7xW4xm6tD6Jn80XpMTJoIp
         tI/XJ2enh8cnN2HVd+m+IW695VlMyOgPAsI0AZkS419h66BcmY3y+T7W9B0k1d7VsPh/
         EEYCYFYpPsPcatXVCt6cCXWfNcV6Or6D95ikT/MnIK6GY6dnolsMJKU7pmxKhhetIrNZ
         FYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208457; x=1726813257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uBPt+6TlJo6O+g20MrzU2sMetD7sduIdkK0ymazLYw=;
        b=TOn+XRurKLdNlLHWvG3X4gqhRAuBd4yab14hDRSkbNRLM0IxQUeXoBKWR/xJRXjYFM
         /1oKXKmhmzErchF7lNV8tt8EyyxsJQvmLmTF2VHh0XiFcqGqSqfJzgHufTUBVreMMhNp
         hd6kEWgygmL0aISYOWqn9a8PGtP/WApFaAAs7wiubLA5qeP7HXjqTNpETK5AP/OxJYgR
         n5NwlH66dvnvOVwO0YVc8fqgYBlWExJnMakyi4JXAEFHdEd+nynaEVk/MhgRokEhq3oc
         Z9Qro5edt1okaj5O3hA0CYxA84m2DnQuWXwL3cSZ48lAXZbCiNLsS/BDbWqtF9pysivb
         Yfdg==
X-Gm-Message-State: AOJu0YwfQkq5VSkH2Ht91RPDndOz1Y4kvJyEn3vrlDpJzYU3F+LvoV21
	gy6V/6/S9VVXO8Ico/SvrK7FMobHnFRHAPd9A/HAfqLDYENb9yDGIabpDxKN
X-Google-Smtp-Source: AGHT+IGQXhZ7e9IQh9Z+VcMxgYnJo4mLg+4UsHEBHsa/cUxfW7IqLiL05/56hI6NdnfrRF/xfWfayg==
X-Received: by 2002:a17:902:e84d:b0:207:1570:13e8 with SMTP id d9443c01a7336-2076e31f04amr73305315ad.12.1726208457096;
        Thu, 12 Sep 2024 23:20:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 05/10] python3-service-identity: Fix ptest rdeps
Date: Thu, 12 Sep 2024 23:20:45 -0700
Message-ID: <20240913062050.2597921-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112264

Add missing six and attrs modules to runtime deps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-service-identity_21.1.0.bb  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
index 267bbea13e..a1d6a3c0d8 100644
--- a/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-service-identity_21.1.0.bb
@@ -20,7 +20,9 @@ RDEPENDS:${PN} += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    python3-attrs \
     python3-pytest \
+    python3-six \
     python3-unittest-automake-output \
     python3-pyopenssl \
 "

