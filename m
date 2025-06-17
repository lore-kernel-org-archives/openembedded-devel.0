Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A33C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 22:04:45 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.32313.1750197878987714957
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jun 2025 15:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L2qGxtyt;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ade5a0442dfso1182399866b.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 15:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750197877; x=1750802677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdS9d3If9ULQKphDPhkLJi3MvEDxHSBBO8NfglHUoNI=;
        b=L2qGxtytPAwrXIa+eSM6Oi8FN1E2R3KwsEGYjU6J+zogQ+/h8I6WwpEM26raMYIpet
         wMr8SeVRvH8h/iMhsnuO0ARa0uL6EvIZr3ENy0Qtz1flAboQEYpfITYPOncZCAmo/Fj9
         xo7x+uN9D7ueTt1OXHA06te2CtXX2F/UYIi7SL9iVy8z0CIMqH7NP/VpL2is8QVsrmJc
         qmDMgHvR+/4Clg3B6t3+K32b5HHusINA8kK3vLkt02KIgm7sImck/Huc3bzUXxCBKIPT
         arix+mP7ZSUaBFTFmSogpqTSVyEvlYw8SatczHChVv+lQVYpacEUJCpi0E/AXCuH3du5
         pTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750197877; x=1750802677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdS9d3If9ULQKphDPhkLJi3MvEDxHSBBO8NfglHUoNI=;
        b=XVu4Qc/LLyEY1Lyhyk/yQZha8vOhZdl+pCtuGk1zIbDRUAA8jbC83lq/ttX6FrD3wA
         RBEF/C3QhTUJ8M4T3G9d92/KVTqcmbCrBSgWZ8ofFolE8JLdFfa0fchT8t+1pOX0oOCw
         L7YZCSoYxH/PWgonNvnL/iN9QBrSMYb3lqVAoEjUTpX9ay+R4KBfmXHHPj4gTpR3BVro
         eTcT3P9U0lTPna+oR3J+zW3AZPXpF38g/3tn/g8/DJH3nJDuneoxLHCzM7L2j33AkjBs
         +Azi1iVcZJQCAsE1JDrn9JuSAwCI+YQzbBW0kx61MJ3tjrmWuCScsovcDIBf1DCyoOGP
         jSbQ==
X-Gm-Message-State: AOJu0Yy32K6Ube3mXY6Ez8en3aIecj89uZX3Hc3+92e3CrQkaOQ6sWnO
	ERG2K3VJBFWkhU0Ukwk/knJYf+ueevale0gH97K98XE33Zp1Tsw1a/oaH6sXkVa2
X-Gm-Gg: ASbGncsB8nL8qRbnzs3M2PNdyyfbM8Ys5noA1wUVmcmPInXj5qbU1IEjRCXaWtV1CL/
	s7lSfXyUAeJswBhScOAsom44PBLVXx8HuPsb4G3HEmTVEXDFJGNBaLboEOIUOkWrwYKCF4lmDnS
	IIlhu7C+8wQT/1hLJ9/o43PsT9WhoOVd9MnJ656e8nIUcIdkqQhh16w4v2zVG6ca9JjeZsu9sT5
	CqHTXi3cAR/pwzJBvVkJoMaDWA6fNsRTupEDcpeYIJyE36DUrnHvtEdZWU/VRkeVF7rsMU+H3/d
	ZbqQoTyc2MBRMf2IT6ttYNsBZ1rWvaeitrx20g+BhGOQ/1fSc39M79zH+uwv9c/2WPTsKWMNvcs
	evXwEBoxTvAqfo/vsW6qRNknnax9RKAZ0oA2m+yfA
X-Google-Smtp-Source: AGHT+IHV8/oJJjSWVZMWTZBj54AfkMUM6BKxKdEDFmTaGDUicSld6e73ewjnNg23cfBBzuOzj78jdw==
X-Received: by 2002:a17:907:86ac:b0:adb:41b1:feca with SMTP id a640c23a62f3a-adfad5e0abfmr1426238566b.61.1750197876680;
        Tue, 17 Jun 2025 15:04:36 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae015d208b2sm55985366b.121.2025.06.17.15.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 15:04:36 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-aiodns: 3.4.0 -> 3.5.0
Date: Wed, 18 Jun 2025 00:04:15 +0200
Message-ID: <20250617220415.1383616-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jun 2025 22:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117931

License update: normalized endings
---
 .../{python3-aiodns_3.4.0.bb => python3-aiodns_3.5.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiodns_3.4.0.bb => python3-aiodns_3.5.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_3.4.0.bb b/meta-python/recipes-devtools/python/python3-aiodns_3.5.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-aiodns_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-aiodns_3.5.0.bb
index fc0f2dd7a5..a714e3ad1a 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_3.5.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Simple DNS resolver for asyncio"
 DESCRIPTION = "aiodns provides a simple way for doing asynchronous DNS resolutions using pycares."
 HOMEPAGE = "https://github.com/saghul/aiodns"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a565d8b5d06b9620968a135a2657b093"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d574ab425d1fcb37c9f1ad3961f18527"
 
-SRC_URI[sha256sum] = "24b0ae58410530367f21234d0c848e4de52c1f16fbddc111726a4ab536ec1b2f"
+SRC_URI[sha256sum] = "11264edbab51896ecf546c18eb0dd56dff0428c6aa6d2cd87e643e07300eb310"
 
 PYPI_PACKAGE = "aiodns"
 
-- 
2.43.0


