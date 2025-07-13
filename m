Return-Path: <t.f.g.geelen@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B804C83F17
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 15:10:14 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.58243.1752419407305606053
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jul 2025 08:10:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ashs5ijP;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: t.f.g.geelen@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso5622831a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752419405; x=1753024205; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vzSlgDMLbORGmH009We5+EiR9wsGjP0CFoqMg/suiNM=;
        b=ashs5ijPmjKGrZ7hyMO59TYroA8ZwDhxaa/3mnFYJwaYjLkW06RQQogFTxznW4MvbR
         i8o2GSiJfsJhdXZHvp779kOOMTr5WIB8YYShKRZQY0E2LUd0hQyQzDhIRNFtu1PESgM6
         RdFhRVBKNxf3AUaGBeZ3pY1YnTlgp/ClHPKlK67pDd3imosMI69y6AZVGiNclfAK4W1A
         sF/C3o0R7HaUsTmL63F2CQ0quXZV6LEvWvblVmT4rSujNcf+uHH1Mr03h96GxXWX65M0
         MD5h9mYT105BEM1zrf5AxyXsaLFCGXNTCGdcDWaphNDI0HD5ztVrmoPCA+ShAyRVd3DJ
         Lbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752419405; x=1753024205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vzSlgDMLbORGmH009We5+EiR9wsGjP0CFoqMg/suiNM=;
        b=OyyrIHp23O+5QjKmI2Dvjf4lSVuVquWvyQPVfQZCzQ5+wQBw6Os7L5T6l1DWx64yHz
         ctqpI14VlcKFuwmc7tz5Pz1PrCHx7aytYZ9XWiDCbxwXzr51QpsFPAAey14TPwvghzLP
         U28n3+iOAMXgq8yKmxxtUmqnmA/PIFC+3ISluqNGoMyrYIMaeJAJ6e2M5aBONKvxiYZp
         oY+y/pSRHbJ46dD4K7RlP7vTSHb5idqyirtYelczmJ9xoxCXTLKykd6XJwb5hIRC/Xz6
         lL7zdRHRErHVXpA/JDcXgEjgqhAtSm669RB1KyUqlftG4iAIwNvKg7ru+QtExTbqHCG4
         k7AA==
X-Gm-Message-State: AOJu0YyAiLNi3ZQEh5ZZZibo4epClMz7WunmZcK4nEpse6EGBmy6QWA2
	8vD+qdCgTTcH3HpwKVnUDCHDaOvENqZZ4Sl6b7dDDCPkxP8idtKC6wwk79lnRVXg
X-Gm-Gg: ASbGnctNrzIA5rWaSjTcGiK/mUYQC8y3pGgOppFWrlNg1khAMB/heeVVk5Gn47dud6K
	u73gQibspY3H/JfVEbOVZmTADum8GItwnAVle9AgbsU3oCsYlR2GhS0QZ23JYki9MTEDpmXlKhq
	7l5zEdZlGKof7TxjARBLhs/wLXJ4DTL7le8qI4UztzBgw8ZBIrOLEndxyP8TUCz/OBR7muXhWyq
	LQbcpu2WQmSSbpbBwagLAbPC5ZtOvi/yMsT8gSjqGmXnrSx+8Sd+EizgCgfdmAf2n5+T37VlieL
	HDfXtveQqvOhIibMRbQnBnlUTMp3go8GR/ov8jxIC7481xiNOoDU8y94nS+OdoeCDDWBpgaItzt
	q3nmYFy/Vz/T3qlBsw5ZgQB6xkZechWgam0HxbBtBCuW5mHmDnpidRO5EzbvdzfUrlJz40ogyCW
	1Y
X-Google-Smtp-Source: AGHT+IEtNFPHoSs3WVEBCAYPbwBf9XTrdITWqiH3tdt1Kq4BG3zP6TlftnNOTEbDpk2UOoH8yCkcSQ==
X-Received: by 2002:a17:907:9282:b0:ae0:c6fb:2140 with SMTP id a640c23a62f3a-ae6fc120500mr1078323566b.32.1752419405019;
        Sun, 13 Jul 2025 08:10:05 -0700 (PDT)
Received: from control-center.fritz.box (150-12-20-31.ftth.glasoperator.nl. [31.20.12.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294c0asm650493066b.127.2025.07.13.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 08:10:04 -0700 (PDT)
From: Tom Geelen <t.f.g.geelen@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 1/6] python3-pytest-asyncio: 0.24.0 -> 1.0.0
Date: Sun, 13 Jul 2025 17:09:34 +0200
Message-ID: <20250713150938.2992477-2-t.f.g.geelen@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Jul 2025 15:10:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118508

---
 ...test-asyncio_0.24.0.bb => python3-pytest-asyncio_1.0.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.24.0.bb => python3-pytest-asyncio_1.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.24.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.24.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_1.0.0.bb
index 1059b788f4..118f4e030d 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_1.0.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
-
+HOMEPAGE = "https://github.com/pytest-dev/pytest-asyncio"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "d081d828e576d85f875399194281e92bf8a68d60d72d1a2faf2feddb6c46b276"
+SRC_URI[sha256sum] = "d15463d13f4456e1ead2594520216b225a16f781e144f8fdf6c5bb4667c48b3f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


