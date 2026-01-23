Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DEED7788E
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:39 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.116.1769187750758132811
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LwPJ5zJ/;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee4338e01so14056375e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187749; x=1769792549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Di9+mQIqHJ1YJTK1OxHgyqkC5huXiZnL0+/JHQ1T0Y=;
        b=LwPJ5zJ/jHKHGw/abQ8Z1BzQ/gfJIgZI/8zGYwQjz9PAy1fr2kx1sr13s3+PM3R1/M
         +gmWIDmbZSvkVIyaQh00oMM7ImW/nuCHXNXERep56VwkbGYPQC98lH7F0E+eZPqbgnRI
         cQSRUL/DrrRx3PuWvDg/lmLhH2Plr43Z8nulZwENWyNBo7tTZeAHeJz4UGLsGXix+5XS
         j1GdWlQlkKwTLHmP8gEBfCwkAKKiJ069H0JRD+oFteGAvUvLkIOJFMvpTghdxLVeZACu
         U2xdAzGMYtP4lIAh1zKL2MPswyqNWzEUZYcdnZJv6mNDWvfWcb6gC6TpX9IsMnyw7Lou
         2pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187749; x=1769792549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+Di9+mQIqHJ1YJTK1OxHgyqkC5huXiZnL0+/JHQ1T0Y=;
        b=J6o2gbRDXwrElM32XxbTOdWUDRVjphzwg6Pr4jsFwiGLUmt1TuI/lg6r5Mc19+rZ9L
         h7yCRYErBblW+BBR9Ovw2ZtiDU7HdqCu/fhIMn3cGPrj71ooHsspBNULOooJ3u/0lxq3
         OqHnMzQ0lslx3ELRWzj09beFycOzLXTnrmozjkqea9/WEj2l8AveKLFCfirHb41VXv/n
         /11JhBjcM27A1mhrM8X4Pny44lAjN9LL1H5+juZ2K7gQ0jMr5C+s1kN0RZbVZnvoTMdK
         YYdvbYb+qqXEUb5GZNuN2Yhq5mZIf6alnUrX8Htsj5LzwFTqBUuYexox2mF2MXNYosZL
         w8Jw==
X-Gm-Message-State: AOJu0Yy7Yr1XjTMVZXdMqOeEBPP9bxEJ3PBnoi+6q1fr3vM6IfAf+OW1
	rv6KGL61w697FV3GUY4RvhHLsDtZYFwyxtzIKGPMQprN2TMI/zfcNaURlaiKzw==
X-Gm-Gg: AZuq6aKkcAqzOYGrPfImdiytUHJu/xTHuBqmfBKKFbGBavDH9T4L0ELnfW75d45rUoe
	kDnw/z+jMWxr4xsUcIxSef96Jw/gk2xVDV2VTbKPXhmXOqeXedgs7c0TYWY3+5ktUwazBAU2FYy
	9CLz7lNqt7l2ZiKReuKkJUYHM2v7xTuNA8D7O2y1m9UphPHFZhuGuvGbDpD3qTWgNRTbpKpLHee
	THXXf36rh08y9cteNH5Miod177D0fttnu3K73DGiQx/mApaatSHlbpehRWjFrtuShMgWZ55gNQo
	g+l+pm9NRjHP2EgKF9z7kN53AYLKWF8Pa/2HTZth28BYuFaE7GTHsByQEv7CXOkM0K0P059/fDc
	j32afeATddpquK2HVvPVX0PFmrU+E2ROIaCa7W07pT/K++E5nl/DsZeCGLIC8/dvyhik+pN+qQI
	kmlWj9rWAs
X-Received: by 2002:a05:600c:3b0d:b0:459:db7b:988e with SMTP id 5b1f17b1804b1-4804c959a1fmr53627855e9.13.1769187748881;
        Fri, 23 Jan 2026 09:02:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][scarthgap][PATCH 07/10] python3-m2crypto: ignore CVE-2009-0127
Date: Fri, 23 Jan 2026 18:02:18 +0100
Message-ID: <20260123170221.671471-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123792

Details: https://nvd.nist.gov/vuln/detail/CVE-2009-0127

The vulnerability is disputed[1] by upstream:
"There is no vulnerability in M2Crypto. Nowhere in the functions
are the return values of OpenSSL functions interpreted incorrectly.
The functions provide an interface to their users that may be
considered confusing, but is not incorrect, nor it is a vulnerability."

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2009-0127

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit b46a5452a1c1a417f2971e494e151fa1f4022e36)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index 1d8c22d196..95c57d5d48 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "bbfd113ec55708c05816252a4f09e4237df4f3bbfc8171cbbc33057d25
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi siteinfo setuptools3
 
+CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
+
 DEPENDS += "openssl swig-native"
 RDEPENDS:${PN} += "\
   python3-datetime \

