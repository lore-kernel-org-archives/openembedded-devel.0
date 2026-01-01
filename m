Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8982EFA3724
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 23:52:18 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9364.1767311536912386987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jan 2026 15:52:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hH+0K/6K;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64951939e1eso18722886a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 15:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767311535; x=1767916335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=opF/dUKARpGPE3vM+Pqn3Gu05ENtWnjOCSgjLrwIyfM=;
        b=hH+0K/6K67ROpUQpGFAHPmGQf5SNkEBdHdDr2mjPSYysPnBvg7gzEPJuJoVejMUDzv
         tsw6NlU1lGe8hG58LUqyhw2ctaWIHkMJBHT6ftElN2DqTXEKb0ESbOwL/cixVt19gfbF
         Ehzk+E4nRTgNk9aPd6TXp+GycqveSHV+fRDyc0xjWGYmm/c8GWkNjy8UIcMPtJpz84+D
         FnWg+BILQtnibZe1c/QyrEJ3idxe+2tmXdjidE6u0jhMjGv2PrEVUM87qOJJ1w32egET
         IDtSJuQzXYVUYM5UewsWT5VPl2M6gQh0hhtWHwFDh3oaLZBwLFER3P1971NUDEfF1YuY
         JJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767311535; x=1767916335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=opF/dUKARpGPE3vM+Pqn3Gu05ENtWnjOCSgjLrwIyfM=;
        b=mLFmiuy+R1a1lBhUIGqRibUVrZaKmbX3zz4MWqWfd0hXhBN3oCva97VVgjBNt2XNwT
         iYIGH5B+Zuq4GHwuyPFTI4yr3gSmy0/GKA1jTiXYbayJqcbDp9I9TlCJSTLkNdLyvTPu
         1Mdca200DB/LxPDAT9U3hB3SX7r+fmQnbYLH4TFbqXfxya7OyeDEYLysCcnCqBePEbwe
         swxJ6ODC+fAtwXuk8TLBdujlpqQKBBfUBvKGAe5cKlDzqVEo+QmIeomuMGNs6tqFBlSd
         xw23X3fEWAeW/r0qfD8ZPbK4jkiFXYW6CZ87ubjq+hbEMQh0glz5VPQKBPD0FNnMx2/U
         M0HA==
X-Gm-Message-State: AOJu0YzELuZAw0gox3cT+za7vaquxUuRHKLuEdPZPbkdclG5dBc/PNrQ
	q0QxxKWvxzjk9tyO1vty4DnrhEUOsG40UGtEhiU2tXaid8gpw8Uf25D6fwMH/QFu
X-Gm-Gg: AY/fxX5V9TzPfKontvXZ/nFtwZIfeoFWs0YS3m/3jd5snNRzSD2VRH8v/o7EFQSUSwx
	nhNGy9T7+WAskg95Ib/aEA0PQDRbAnqzQhqSEJBcjvYrnp+yaiqr3QshLz6u3QXhrCbz3pFzJ/0
	CvmSPNQha4PmKjysdpyD5qIs1qCOJ8abeR58oTo1JHDRN4v98KL6t/hd6mJamjeeef8NKg1UZdt
	PP6yaa/zPlRWEyz7xgQ4+WSXVPUzIp5skdmJ73FNujHdq9bPgI8c9doi/kdjKzJ87TzIkWeQbN9
	8gAOhqYeF2T1gOxx0K57b4VDfOIq8ZsomMyU9HWuoEPxkZ5Eb5k9SFC/Jqfjq1uKAuP8fuC6Pst
	25EaUe3mo76kdamlU55yZWs4mcqFDAWwZ4lGZuH4KjvYkPbM/4ogBsaPWv5irQKRQUHmxns8c+v
	SJmtfZqqas1KgG4376kcTf853xEIlgJ3QxOO/XSZfIehy0DFT8g33L3lkrKPSOh1nEriyEBzGXP
	w4=
X-Google-Smtp-Source: AGHT+IGOAqI5FVWzWLGoPwZVC5hdmQdGPB20OT3dcBVslf/lcz4TH5AKEuaQtzejoEKbkWMuEqUcDw==
X-Received: by 2002:a17:907:608f:b0:b73:870f:fa32 with SMTP id a640c23a62f3a-b80371913acmr4671738866b.43.1767311534434;
        Thu, 01 Jan 2026 15:52:14 -0800 (PST)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80426fc164sm4200698966b.30.2026.01.01.15.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 15:52:14 -0800 (PST)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pytest-aiohttp: add missing DEPENDS
Date: Fri,  2 Jan 2026 00:52:02 +0100
Message-ID: <20260101235202.2746620-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101235202.2746620-1-t.f.g.geelen@gmail.com>
References: <20260101235202.2746620-1-t.f.g.geelen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 23:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123088

Signed-off-by: Tom Geelen <t.f.g.geelen@gmail.com>
---
 .../python/python3-pytest-aiohttp_1.1.0.bb               | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
index 7bd7e4fe8a..9a5c0b3bf4 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-aiohttp_1.1.0.bb
@@ -3,7 +3,12 @@ HOMEPAGE = "https://github.com/aio-libs/pytest-aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c251ea89d32d196dddd14c669ed3d482"
 
-DEPENDS = "python3-setuptools-scm-native"
+DEPENDS = "\
+    python3-setuptools-scm-native \
+    python3-pytest-native \
+    python3-pytest-asyncio-native \
+    python3-aiohttp-native \
+"
 
 SRC_URI[sha256sum] = "147de8cb164f3fc9d7196967f109ab3c0b93ea3463ab50631e56438eab7b5adc"
 
@@ -11,6 +16,4 @@ PYPI_PACKAGE = "pytest_aiohttp"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "pytest_aiohttp"
-
 RDEPENDS:${PN} += "python3-aiohttp"
-- 
2.43.0


