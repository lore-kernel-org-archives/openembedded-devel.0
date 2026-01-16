Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC15D4A60E
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 07:38:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1361.1768549099064186561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 23:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AeFyC6Cv;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43284ed32a0so927925f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 23:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768549097; x=1769153897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3q7Nd4NhY/AGiegspDw48j+YNFf/LTpHjPl1hxxowE=;
        b=AeFyC6CvFixBNJidrV0jkx96LqNTKhaIRMxzV8mBagGJjxN/t0FhIImVl8yXJCpFHK
         qNmR1KxzZCZSZtZwWJa5W8Jx4iEU8YGu9IKg+PVNBzGkv/OhYWJidLTn4M6yYJBqE/Ki
         l1kt7LxlaOcn7O1fMKSSmAEhdjDeWAqUZoWy2q85fi4jppxBQ18cSiPGq5+7jiyiD7V8
         CpU8whafPzXFqBuW9zfy80AAAECiOYB3wGPuqGC8PV1nHnE67Ibixsru+MoF73P0Blq/
         xQmAp4zQofZRfyDNBGYACerOk5OoFhg/clVW5BeoCx2i1Wju5xxuhWvKW+lGmq+T9VMC
         9ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768549097; x=1769153897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3q7Nd4NhY/AGiegspDw48j+YNFf/LTpHjPl1hxxowE=;
        b=orw/iF9LRuo9NdJWXO5VWsXfwd1f514MinPfUNFs7KQ3OC4xcsc/uFuZkCeCzB4L72
         h+qozM3ONwgTOMhWurUDRM/NjbZzXB1aMU6JzXZWxYH79xfK1uRarsTki9lCWfS3mUME
         w8ZGfeM7WLWT10G/tSwph5a8pZo8ngi1dcAfeS2GFKc6RZuJm14hCzzHy3r8uSnoe4fW
         VLtBtU+LnSkoA8msq97VCb4ILINQGoh7v3rizY6VMgeOlV+mkf1nTbpewoRj1dTEiFRf
         sgUXAyJUr0S9aIgL03L3mni6V0tSvuTlWRcXOMRBp2WSTf73/z8AxG2+FcFX71MhOs/m
         JcOA==
X-Gm-Message-State: AOJu0YygFiyXrBbyVWVIyYpY1BYrvSOllFluKOCShmNCVcaMfjE27Lhy
	8173WjqDifPTblqajCbpPt1AS7z/KuLwSwMeLK9b5h5sAomlHwQpeIcgyqFHkQ==
X-Gm-Gg: AY/fxX6az+QhEOEEXN8qGIyklnoWoJ6dLYyWal/TqJrBtZGWA2fD9vK5kTwG/u7WKgb
	uuuoz689UzFXItePQiY4WWdM+tpq31ZmIWRhpKoqQNXGDXLzggvi4MDcciJrxeA4z3EzsV0feKH
	li73hbjtLbyXaxljO2I3u3HQ/R9sfWguzlBgTK1UT35sGHGz8XDI0AA7EUgyVhqzGlJIwMXYzC/
	NXkxoPDwl7lFrcpm0bAB5k+bfpxjAzrvQlPo2+j0TpfjEstlWAsajW5fNjW1qBQCkIUtPy2RHxt
	eYQVaHZi1rZJYJ/TYzc+rfCu27F3So1n5bmsbrW4RlaYdlQ5UjJzwjiY1SMJwoIxJRSZAVSyWP6
	EP7gfwvfujdLbmeoL3faDwpMcxNjW79gTC+5WelDHxoNB64e12geNs1J0OkMcD8KQQUlUa5PbN3
	fum2kzjEiy
X-Received: by 2002:a05:600c:1387:b0:47a:935f:618e with SMTP id 5b1f17b1804b1-4801e30ba55mr27335925e9.15.1768549097340;
        Thu, 15 Jan 2026 23:38:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm84992495e9.12.2026.01.15.23.38.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 23:38:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/6] python3-smpplib: upgrade 2.2.1 -> 2.2.2
Date: Fri, 16 Jan 2026 08:38:09 +0100
Message-ID: <20260116073810.3290097-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116073810.3290097-1-skandigraun@gmail.com>
References: <20260116073810.3290097-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jan 2026 07:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123525

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Added python 3.10 tests to CircleCI
 fix socket recv error being silently ignored
 Refactored Client.read_pdu()
 Refactored Client.send_pdu()
 increment sequence of commands as spec (fixes #214)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 50bbe6ab5f49cc525fb85a985dd5981e1c86815e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{python3-smpplib_2.2.1.bb => python3-smpplib_2.2.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.1.bb => python3-smpplib_2.2.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
index be0bafd33f..5c635d6fb0 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "c0b01947b47e404f42ccb59e906b6e4eb507963c971d59b44350db0f29c76166"
+SRC_URI[sha256sum] = "f2191e73b24dba94f2889bf2ea1a60aeef6bd43afd3ddbbc632d7e41d9f30e47"
 
 inherit pypi setuptools3 ptest
 

