Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEC3CCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:14:15 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.6827.1759997647705116619
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Dpwqr67l;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so1277354a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 01:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1759997646; x=1760602446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiD9q55gPWwM0hLVC67mlkE6A5zYm16EyR6T4Ey7M0U=;
        b=Dpwqr67lqHWQOcvS66YHhEOAVRfDyoD1sKVK3lVdnzbXiMk7R5WG44QRMDsjenA0E0
         xv9V35P41otFvws7kBRlGkq4vchyX0Oz1a+XJ+n671Rzx0ydN7ChkFa5VvyyzxCNvtXs
         qr9wNYX4AhTrxv+FiohsLOpUAQpvPG2GgcnHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759997646; x=1760602446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiD9q55gPWwM0hLVC67mlkE6A5zYm16EyR6T4Ey7M0U=;
        b=ayAEblgJCGJahlMR6AKTlElFShpBw+ewWGXVb3m7VM79K3jslUCdPOoiqBL0B20Tcr
         oGLr9pfirTwBHwLeWYwT8CVrZapgiAWj3AWdR9ImqRBqUQpNloAtZXvRpKnL4clLbeJz
         51Gr/wCAss4mmbySo44SKQLbDp83Syof2xnlLiTajbb1XVVbH2cO/dXBfE1iKa2F3o7J
         fQJZfdBJlvnMlifcu6GhJGOXIIrYEkorepsWjJbo1hxbwblxuEK9moKLR97GxzyNp85x
         lwDFVBaZdGnINJ7q0UU+7qZ3N1slwLHoogbt1RCpTKZWx8daT7MpcUoBPwosLOnVQYlo
         CeAA==
X-Gm-Message-State: AOJu0Yw4avlyofn1CEhR6QFz4iHTgCKllgjr7glZ/PsbiOOhbE6UlpQx
	imcTZsLOzkahDDFEkRoGXcC+lzj5Bx9zyFqr11v/ox6TstGL/+qNxUSqSeXvtkHnXWaM6vZQbxe
	qmgfa
X-Gm-Gg: ASbGnctDtltmZEoL1Y7k6E6AL0SYWnM5m1y9i6fxlOsYUwdGBmvuWJHUWCeXdm36FPw
	PvfIWdupR14hu75kLZnxABo5irZ1VrTqarNV/bwgEE6UqxY43qHLg+Cwhoag9OY34ZVLEEIBJvO
	VF1GJ4JhHJ88Z1u5Sm47tKyAin3TMgfNanCkMhdmBWBcSYIbOOStcwRZzPOtGa/zUrYLmpmXe1s
	C7HSeCUWLO9BT7q+1YgKiMqpqNwZPEVbuuv8zLNqyfFRcTUuh2idqTAs5bO3nlb/47d8+uW796z
	hgrkNXTlp1K2+nO2ePPByP8GNK7WKvu/OB/lSLlGwv7I6nkNJInfSijDgJSdHH4z5jsUyz/Lzuo
	/Dqgh3INfzqBusVOCl/V1wSp0zRfJ80+tGZmrq6wyVJTgxiV3aUQs4XcOkNMS
X-Google-Smtp-Source: AGHT+IHo5UrCrmDKS1JTOfba2X7mQtxIUKcG4B36Oxfg4SbSJVGQqpUQ6zvDftICiCr55zuFacfAxg==
X-Received: by 2002:a17:907:c12:b0:b44:f9fe:913a with SMTP id a640c23a62f3a-b50acb0e584mr636978766b.65.1759997645724;
        Thu, 09 Oct 2025 01:14:05 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652ad839sm1844874266b.1.2025.10.09.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:14:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-telnetlib3: Upgrade 2.0.4 -> 2.0.8
Date: Thu,  9 Oct 2025 11:13:57 +0300
Message-ID: <20251009081357.3446410-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251009081357.3446410-1-leon.anavi@konsulko.com>
References: <20251009081357.3446410-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 08:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120426

Upgrade to release 2.0.8:

- bugfix: object has no attribute '_extra'

License-Update: telnetlib.py and telnetlib3/tests/test_telnetlib.py
derived from Python 3.12 so a note about PYTHON SOFTWARE FOUNDATION
LICENSE VERSION 2 has been added to the LICENSE.txt. The license of
this package remains ISC.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-telnetlib3_2.0.4.bb => python3-telnetlib3_2.0.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_2.0.4.bb => python3-telnetlib3_2.0.8.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb
index e359e2d88b..46f72b8f08 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_2.0.8.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Telnet server and client library based on asyncio"
 HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fc2166986ad8169d334a342e0d8db8e0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b2cbfe1ec99d8830fa20d62c8f21d0e8"
 
-SRC_URI[sha256sum] = "dbcbc16456a0e03a62431be7cfefff00515ab2f4ce2afbaf0d3a0e51a98c948d"
+SRC_URI[sha256sum] = "08a2a7a3a6790f89617442b7d491da8b531d87706fffd6a33eeff57ac440b752"
 
 PYPI_PACKAGE = "telnetlib3"
 
-- 
2.47.3


