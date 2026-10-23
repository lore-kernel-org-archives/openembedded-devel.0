Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.933.1792720919625270324
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 19:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aqSWK2SN;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso695122eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 19:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792720919; x=1793325719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sRHtXcQuaGPeeWezJt7/7GU4Mq7D4F4ImZMpWG8PSFc=;
        b=aqSWK2SNnAvqSIfbjgiVgEzNcnxWD2whr4Pa0BRfOzAegdG98L4BLp330RiYNeWy3O
         En28qr+uyptSuVPFmsP5DOX0JMcNPA+0N3VAmGkzzxtuOKic/XpkxL67lpHaPAcfpnJs
         UzESHWvduH9amcF6Gir/10q1t9Yu1+WfgT458X1KLf3eLRPAzQwEftw2TZa1OsP1Zb6a
         rAGwII/vof2AEaI5SgBJy1hFdLE5Ps6IyUUqLw53sQIjsjyowEeY661RG5KoERcTDx0/
         2FuobgU1BW+ag210tpRo7iduM6hV859qaKj2AnCWpxv1lw8jD+kVzHbVxNYiRViQK0/i
         qj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792720919; x=1793325719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sRHtXcQuaGPeeWezJt7/7GU4Mq7D4F4ImZMpWG8PSFc=;
        b=DuweRA4wSuFBpLyqGH1p7vkyYF4UlynwpP/prydy/gQKY/gJW32QKSzl6WvRsG6BcA
         B1mSRDcS1xiZ3GB+4GHEwlZmF1wcyVZkBMZ3IkS/lJwGB082uU3hrE5oekiTJLWWEggO
         EszgtyHFN6bsEfgQfy6Dv435WI9CZHimiLKNmB+nm6BfMFyuubI1fYxHmsRQRkqbM0E8
         FqvYdTyxM63ECUIkrfsZmJZz6vrWte2CCShVy+QHacSJVes9+93zbiXh8iOFkcbyYOAN
         ura4WDeSfvdIQyZg6fyDW7JQZOMFndsOcFAh9ZgBJgsHjEQJkByXGc6xCyg2qeASLxto
         usRQ==
X-Gm-Message-State: AFq9FYJH4RRVSdRhsRW39MEwxm4xHZ5UqOTtFJZzD17xwhqVVzhNdcVx
	qH5Wf7J++Av946HNGm/lV3YInV8ivUxa50ttIxJgGdisdnIgN2ejUU69INyp/86RGps=
X-Gm-Gg: AYBFou3QwkLcxeD+Im4brgxQok/5NJSuHaBU75ajWy/wt4TJ+XiYDkAk+iC81cfg1Kr
	BV/ry+/4jH8g8Qa35D726KVSC4Y0DPedGPRzbTGI+hNyLMe4g3Cy1qzk6M8xFx+5gQiH6RvvkcO
	0UZ3LBx+c+S3vKPPxrZEDQiNm1dVAXJfHePROqcLd0qrxWNrIqXTrmAX4uZqoMeRtGt2B/4iMI3
	m+YPGyQ08VBCHY7D8QGJvJjp1ZYoKs2OdnYdcdw6FvIS5KBVGanS6Garhwpjlsetwvw2VsW2mdk
	8xv04t0gzpQjoMvDUQ6Xxq1G/YDXhamuY8Cr2FwjWLOpFSDxFNL0qMQYV1+QqVqdPzBnVJaKXwF
	W6ZdqRlbXVFNctTN76qXR2qdpi53O/JuWR9y7RzlgfHyAoOEJxVaRkM1AVS+MWhmUhDm2fq8CKT
	dJrSGm6q0/XJQY9VOfIBj12xTCxTBXEVZrdJPj0ax7CGdlPkY6nO2/J7LvwHrXpRlyjdl6NYndE
	vsOKifM+5uTfnKc3ofx7DT/D/Ygwamxja7yNzo+1996xhSeih5oSQHQ86WGrdOuGVEALcU9NPIw
	UUBxGKUhgIJM8mwT7a2NoUeUQiSpSsRCD2VTePpaqcMIKYa2UXzUISVs4rR3DaGenU36bVlJgaG
	cDXXDvahTEnKPD0JTO3wahXi7Wn3ZDe/azq8oXiNag3M8UDA/kRQ3q403ZZ42JrLoMRF88nStSQ
	8wHD5KXWLfSIXEE1M/0DOJDzXRXZmqmpnMr3t6WKnYZ/xv9Cvdk0ko6Oc4+FYtzys+8rpfn0zXj
	Q1S72LDvmd5DXqnRMQNOdBf/jMXnWQ=
X-Received: by 2002:a05:693c:42d2:b0:35e:6eae:c01a with SMTP id 5a478bee46e88-369d9826d9cmr980303eec.19.1792720918468;
        Thu, 22 Oct 2026 19:01:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e1a085sm2079541eec.29.2026.10.22.19.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 19:01:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/5] python3-filelock: Install docs/how-to.rst for ptests
Date: Thu, 22 Oct 2026 19:01:51 -0700
Message-ID: <20261023020154.3881598-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
References: <20261023020154.3881598-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 02:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131319
Content-Type: text/plain; charset="utf-8"

test_documented_cache_lock_name reads docs/how-to.rst relative to the
tests dir and fails with FileNotFoundError when it is not installed.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb b/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
index ad4efd998b..c0f4f59e17 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_4.2.4.bb
@@ -40,4 +40,6 @@ RDEPENDS:${PN}-ptest += " \
 do_install_ptest:append() {
     cp -rf ${S}/tasks ${D}${PTEST_PATH}/
     cp -f ${S}/pyproject.toml ${D}${PTEST_PATH}/
+    # test_documented_cache_lock_name checks snippets in docs/how-to.rst
+    install -Dm 0644 ${S}/docs/how-to.rst ${D}${PTEST_PATH}/docs/how-to.rst
 }
