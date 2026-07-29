Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4977C53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 05:56:02 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5181.1785304559407792171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 22:55:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=K7LNN0jc;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc97653887so7659125ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 22:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785304559; x=1785909359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=37gXKeC93SniF4Ux3TPqmeCEEUnEo1XuMRP1Wi/HPbs=;
        b=K7LNN0jc95UojpNDCOBQ+CnzDSG4jtmWM9aWqqYqRSn/Gqaonv3OUGcGcEQ4ck0ktB
         dkSaCaWoObOdQyMn1f5qi0DVznRVcz/8MCPvQz3laChT5GqAzw0bar07L4BE/BhyG95H
         oJpXApq2RDvmrMazAFt+6w2p6T+vgwh5JRHAtkHlMuE/S7zSwmucVP8JA91MKKcy0a/l
         VjF4F6qonkep2ONC1Na+70RQiTIfe4vj79gwttKZ2FK8zw58hl5YMOo3IzPyig8D3xxK
         4JUwWKvb5iwyC6pp8TMJ649lQYy+kPFAcKQW4CGJrjw1fNPEgAomG4PhBUWp9shkq5IZ
         Ah/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785304559; x=1785909359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=37gXKeC93SniF4Ux3TPqmeCEEUnEo1XuMRP1Wi/HPbs=;
        b=cF9OUFPtJhQuSuA2mcak7sClnAoBk+5G7yQS6z1D7MraTEDG3APs+BBGlPEAFW75jv
         kPoUM8xlsR29iGGCu/WvVy8GGixmYIe5e3RmfefIEqHsf4RG+asJLyRvijVGnXwBOHCE
         LCXMWH2Kgfqii37qK2vVixWy4SQCmZXa7nLMgb6KnKjnUVO5ZJCcXEm7yDOWiUjZ35MT
         H6pjQrhUhqRXINZMeh2sKxUtgqoSr5zEGOCox/qhfAmvc3tgNVDLwSaqedP65EVyu5UX
         bAF3SDheJxGjJ7KXhUTl7Uaybz8tl4LUgfrdbjJN4ZisHbRqnNqfY2G7Jr8hZgBWpkep
         olhw==
X-Gm-Message-State: AOJu0YwJufCNRtP7qe5G8t0WUx2gMo1JjgDIQgb7cTBzMpdEzCy6qkFN
	KBsOUcgmT4ZldSV3ykn8iKvTjZDKTDWmUS5j9wgwkOZi3498nlY8cphbs00KEATS
X-Gm-Gg: AR+sD10a6ApnI4eEUpw/eCWzTv/ySwoikLziTenK74NDU3Du79XCqFFvGVs7llpDK65
	/316uojT6GVfhjIlYaPzUovyYy2XwCtV5C7zpWC2ZgX6B4ycgXDxStKnrz7pyW0xVZurjfR3OQc
	XwbWuUd+/IBtsrUAx0m9bBi8430pk83piIrs/N5sVYFKn/JoFHTf8w8s3qBxcKfn8jofByxf5Qf
	yznkoNnjzTCtV2pnHYbAs/TpGmo5Ds3pUv/figK1s9mDLPbiOHs/Gork1TkoN9NCjMofVRQ0C8g
	7EDWJGU5iOpcY9P03cx9tSKzi7VdK18gg9a/YUDLq7u+23QWkj1CL9GqNo+wXcYIlyBZ7f5UktI
	q+UUnydUaZss5MUBbCaOhh/JTFjaVcQICgJUkGkuZhTaGx9SuIVk/KN6IYSk9AjK1qHLS7Zyi/3
	W01l7lnECxNeoSZ5CJVb3JsXYLggIMzUoNXTxf47vRTgemM5b3onG00NEwctO48gYihXcTgY0QN
	P4PssG+JD9bRsrrsqDqTcuo7pZPD5nfVLrpA37xUVhsJ/MYu+P/tL8R3diUh1DCk6dgguIBLBZH
	eEEIUMseD5g2cpjQg8f6HHxE8ZstNiGh6lSwl1JIvkleLCBkQDQT+LItqUfnAR1cHA5Tab5FPM+
	2Nw==
X-Received: by 2002:a17:903:b90:b0:2c9:df1b:e948 with SMTP id d9443c01a7336-2d015b145a4mr65916025ad.4.1785304558822;
        Tue, 28 Jul 2026 22:55:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm5885830eec.19.2026.07.28.22.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:55:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/2] python3-pytokens: Extend to native and nativesdk
Date: Tue, 28 Jul 2026 22:55:53 -0700
Message-ID: <20260729055553.3633678-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729055553.3633678-1-khem.raj@oss.qualcomm.com>
References: <20260729055553.3633678-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 05:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128543

From: Khem Raj <raj.khem@gmail.com>

python3-black RDEPENDS on python3-pytokens, so extending black to native and
nativesdk only moves the "Nothing RPROVIDES" warning one level down unless
pytokens is extended as well.

pytokens has no runtime dependencies of its own and only needs
python3-mypy-native to build, so it is safe to extend.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
index 0772b48f35..d0c3875eee 100644
--- a/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
@@ -7,3 +7,5 @@ inherit pypi python_setuptools_build_meta
 SRC_URI[sha256sum] = "292052fe80923aae2260c073f822ceba21f3872ced9a68bb7953b348e561179a"

 DEPENDS += "python3-mypy-native"
+
+BBCLASSEXTEND = "native nativesdk"

