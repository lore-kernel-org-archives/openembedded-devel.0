Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1BACCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 02:51:18 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.11512.1761187869262638918
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Oct 2025 19:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHzCRaxe;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-33e27a3b153so348965a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 19:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761187868; x=1761792668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+bPOFM1GUa6Yiv6H2kJvTZiRhra+ky35rSoIAyWl4Y=;
        b=kHzCRaxeEIS00loUmNoYIeFakcrtIfXL3wQ4C7+nWNfPUe09uRrPB3OVLom4Feos2q
         XeTlJKU+0vhom0HhfrcTqNH0Q6fAciZ5k7NDx1b8t1w9+0RSKAXywONQCaxfOEM8lLZS
         DPxoEt/VN/Ey/TyePvYMO5I1feo9+0WQBPiwBQtBB8l9G7Hsv/nP2k6yjS9gl/btXgD3
         +VwdAFfX2YTykV9SWLpB/Xd1zr2py1Hho6Yfwf7+OPZ46fCu0dek2eNPRlIQOSsXdJWJ
         jwX/cjI+jYB9tpeO08FK+7s9bov543Lcy6TkhkdfJyE3lUV5Nv7zEX7Kb9o18j/yFgKj
         ZS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761187868; x=1761792668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+bPOFM1GUa6Yiv6H2kJvTZiRhra+ky35rSoIAyWl4Y=;
        b=d99UuxXK+g1Kdi8CfqBzqO7fVX4B+emUskYABdVNfvEQUJr49eZ6xOeWRbOSDQDkaz
         vryuiiqnpPTB66UHCIRixY2M5IaUfNSNew0E+jLAQM0UDHvi9XMZd9rZPgtASHPihO5x
         xWjDkYCGdW0nJ1kakTlyr6LxW7ZV0ayLvE730Az0JpbPnTV6SlLyS1iCZdp7nMSFtc2s
         tx1Kzib4hiaNcMNFPhsLRAEa05wUfUUhk/8nQrM+eD5NNrYJE2hLBtkyTWE/4/2ZomC6
         kVU0/ATybONqQN4SYdWLPULHaYL+Ov4g1AchTWkrbK+sb48cDTgxVXPWE8L/1b1v+Pzl
         HX3Q==
X-Gm-Message-State: AOJu0YzfoQs5irXKaVx4AwYRc2lu24Id55ZyM4OHJl2iNl2pTd8D54CU
	EtWR7CyaIwRZcSOjAKeJPBp/QFVOSXp10Ufb0keIFJaaYYe7yHXo/b+Aa5vOZyM0
X-Gm-Gg: ASbGnctkHukNw0FINenvpxjC5RXgxSQm5chK7NhTlJKbS1op0Tm6iMz6pZV1w+tndfr
	kA4pqi2e/MnvH7oNqvN+Ga2U/a5FMHPvdfqg41m2vIKH+bbQgneIZOJE/KLgBAbN+Z4r53IPPxo
	2Qjr8Oh2WL5/k0fClpvI7bSa6zbDTx0r6DkhecBgzH2kbjtOkt5pZYltDXN2Yw+cCAoce2iLOH5
	R9HxubyBM6tzd9oktFXSfxNMqIRx9cphdQKjgrt1LCopKCIHhmNp45e7YV68q7FIe14dGAdejci
	RvtGOTHhg1kHEqwmuMuu62A/Tf+5UyidT1timV48SRtmcK1C2a2Agb8kTbKmCdrQAv34FFvZo95
	gwA9XONa4vnk5IWSIrqJsoK12NHL+fCuNOg4sToL5WPDBoeVT8xGTfWnFW9P0P0nw4y5MJgme2O
	SBqWcGZuovTjoNr6MfLly8TgEUBxFKZ7rLL8TCrpPLwXRHUjd05eUV+N/Ivia3RQ==
X-Google-Smtp-Source: AGHT+IE9EsvTO8JXqpHQkyef2i5N1VBKCg61uvKOsb/ZZ6tJqdaZ0z2voqzdsb+LqePNS/Wv8jJCgA==
X-Received: by 2002:a17:90b:1e08:b0:32e:f1c:e778 with SMTP id 98e67ed59e1d1-33fafb9755cmr1196809a91.3.1761187868312;
        Wed, 22 Oct 2025 19:51:08 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223e223esm4084328a91.7.2025.10.22.19.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 19:51:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-cytoolz: Switch to PEP-517 build backend
Date: Wed, 22 Oct 2025 19:51:02 -0700
Message-ID: <20251023025102.3182631-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251023025102.3182631-1-raj.khem@gmail.com>
References: <20251023025102.3182631-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Oct 2025 02:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120912

The project has a proper pyproject.toml which declares the
setuptools.build.meta PEP-517 backend.

Fixes

WARNING: python3-cytoolz-1.1.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb b/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
index 9840fbfbd6..a75948a006 100644
--- a/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cytoolz_1.1.0.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d422ebce3e9c6447563bd410e9b22f2e"

 SRC_URI[sha256sum] = "13a7bf254c3c0d28b12e2290b82aed0f0977a4c2a2bf84854fcdc7796a29f3b0"

-inherit pypi setuptools3 cython
+inherit pypi python_setuptools_build_meta cython
+
+DEPENDS += "python3-setuptools-git-versioning-native"

 RDEPENDS:${PN} += "python3-toolz"

