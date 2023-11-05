Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E4CC4332F
	for <webhook@archiver.kernel.org>; Sun,  5 Nov 2023 08:02:01 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.26575.1699171312667058293
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Nov 2023 01:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f+aknRKk;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cc68c1fac2so31387795ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699171312; x=1699776112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4UBI/9wYTJ922nTP24ZaOHUeVJUttOnm4UwcBWvyd0E=;
        b=f+aknRKkxHsgReuD24GHSDxJ2MzJkHXuWF+93FTjGncrorDpchomxYv0R3dhQca4w4
         +tq6dhQ8eAtzzukNMyaObV+2qtyX3XmjILnpOvVu++RwIRp5Gw37zemv+K/39XD+3FfU
         ptFz6+qFWPLLivhENBejY99UK3z4w7E5iBznE8StbNKFpxx7kYLPyelhmHYRRBSBtV5M
         +fZDwvb3H+6QQ0emNG2vcoKvakv1KHX8VS19Vp9cRGPbJ4wj7HPlHsGhYKXJ+aSV7QMr
         6Y+RPLbhwcKK3rpqZr+3gZ7M7ep/fMI0b1LTWKP6WmQwuEVPw9b9wxcIw8XsefHuTX4N
         k1YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699171312; x=1699776112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UBI/9wYTJ922nTP24ZaOHUeVJUttOnm4UwcBWvyd0E=;
        b=PpK5TpzBURog7eMJ20kCRY2sV73xpx+69iAtz/hzLl23E4VaDJI+wXhT8LsGxz/QYG
         txM1IqWZqJYaPRP9VOUW62acV71002zQA5Ht36m6Am5LomV5lbQEVvBA3TE9Ahpv9gxH
         5l7Oy8GtyAbOglRWgel4PIfC+TBzk1gMOfKwFaFf3UVm7bmKk5nBehC4Ju26YIqtfkpA
         92ve5Jr7qYmhqDPwsajXfi4fOYWqmZjdXme7OcjenBgJVz/6BVKXI7CWTmVgg2iaQvjY
         2i2xvdYMd/J0sgY9o/+HeCkNpNfNpddJeHMWxYl7PNDnaEcWiCHdeEee/82mbyKPy61o
         PJNA==
X-Gm-Message-State: AOJu0YwyibW4psugLkFtUssJxkzEE8qDLfJDv/Qxi19W3N2jfqAkbe7i
	CeIyqp8+cobY1ZEc8p6zP1IBDdFLqViJFw==
X-Google-Smtp-Source: AGHT+IETjRFxmmhvhl+rZCowEXsWGPTuWZ76yhM63C7fq+zkHhw8dshpiMq6E89xGPYTJvrdZk6RmQ==
X-Received: by 2002:a17:903:1cc:b0:1cc:4cbb:c564 with SMTP id e12-20020a17090301cc00b001cc4cbbc564mr21894797plh.69.1699171311676;
        Sun, 05 Nov 2023 01:01:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902e31400b001c613b4aa33sm3831487plc.287.2023.11.05.01.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 01:01:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-cbor2: Add missing hypothesis rdep for ptests
Date: Sun,  5 Nov 2023 01:01:48 -0700
Message-ID: <20231105080148.963131-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Nov 2023 08:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106381

Fixes
ImportError while importing test module '/usr/lib/python3-cbor2/ptest/tests/test_encoder.py'.
E   ModuleNotFoundError: No module named 'hypothesis'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb
index 5d36f36e7e..c8cfaa8aa3 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.5.1.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+       ${PYTHON_PN}-hypothesis \
        ${PYTHON_PN}-pytest \
        ${PYTHON_PN}-unixadmin \
 "
-- 
2.42.1


