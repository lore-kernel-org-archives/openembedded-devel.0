Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1507CCF257B
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 04:12:43 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7409.1763525561441286461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 20:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aEyRj7O7;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-29853ec5b8cso71815825ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 20:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763525560; x=1764130360; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VV6QmmpgdOi00fs4sN68GaNN5160AcdWeLBHDKHPpXI=;
        b=aEyRj7O7MSsxYuJ68ucpGgCkbc+uIfTH4BXKrRfP/UV2Z4lQ13y6qj23neYlcXTyPi
         7D15n9j9t4GyCJPsPBTqpwRE01P+gVZFJTI4/iVmi4DjP4iR+HAYFHqzY5v3So0cxbH6
         Jo33JWpDElUZaJ+P4me8+3l2CcFd469Bj7N5Hm9DAfIfW80cORz1v9pVm21H5WKHb+TJ
         2FqW8hvEvijTUcOdd+cgZNIfiQOmmpGM540l3w1ZHkuEy2dSUnab/zJKcX1K5+VuAwJO
         Xy9SCCM2nhjemQPmHN642aZDXniSPrJ4Zm1+k+N/GaBKfUJf5SwZCNasu6NOhpVcn35Y
         P/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763525560; x=1764130360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VV6QmmpgdOi00fs4sN68GaNN5160AcdWeLBHDKHPpXI=;
        b=BjF1RZ7lUpH8UCx2jMB0h+sFIrYSmSbKliX3Q+SBxMvBmUpJ5MzK1/AkTpH89HeUPj
         twELHGsszF2G94jcEdgr27CmmsDy8vpe7JjCl/rDNSjxKaoXN7Ec89hzuS/en2LCLcYw
         j1QKn2U7/ec9yj84n12gNsTlevmmqWaKMyH1jiHl32CfkAqFn9oGhrGcJfyTdsY/LJX0
         U4RX9ux/sj9iffvCkMwnEDKr+NFfd7dkeTAN5LzsWuBMSGZxk9GDtzruqZLQBRiguqIQ
         oTdIxr18T90I7t75/xhX+WlgzyeoP5Z15abimFXi9FQBzdxbUR1SexvTpvRoonfhCOqW
         e4/A==
X-Gm-Message-State: AOJu0Ywa570eKDdBIOlX3J5YhlBFgpFtW3sLNGvVtT3pKCeAzGgeGTAa
	ybCycfqvn7YLDCmjfznS9lL0rLM9iwID9KgBVhnD6GB11gRunVKf5FrmHDUCvPT93RU=
X-Gm-Gg: ASbGncttA1CEWc0aHo513QTVloo/MLmwMCgfGIgC+S2A9UD6IA1LhnFjRpE8nwLLgke
	kgxgHJkWEyXcVujXEkW+Tx3GAtdEmpHOOVhg/CI3sl965zT/Rs2VHmmMRBYZ8X/AIjPQruEFbLu
	hp5bcj+A2ukIni48Bu+6VjGeY6CNICfqiFNnbDCD11C7GrRIw/HDWAONU1dmkmEEExs/tEDxX8c
	XWAQ0wHdNaEArDqwZtqsnymDPIPDPDzyV6KczpzUzzg0Rd7z65sRfZBKe5w3ZNsKOPZ5HFDtyeQ
	ipDUxXWzDrC92oZkaMp6MEP44kuVXQP1hEAr6gTntYw/kKs4wtFbkIB6KhGXAelQ4hn3M2xukz1
	Z8TWV9H9Vrm+BbiaehPtgVESMPSelyyabJonmyb/OXolPeSnZIrCQTe8GnzlGJ58J2sCGvtUItb
	bDjhyp0k183YLHhoU6OFeHAqSly8vO/FEP+mrsIbG3BSbdoTs1o1gxJ5pBfHkuLew84bkzVYzes
	QSXqWBDPBth2KYxTnoeSNsuI6NBvj+Tzhi6yOa20aU=
X-Google-Smtp-Source: AGHT+IFWaPHMq7f53q7KprxX5GHSjlM2kgGi+nrxlGtN/aBhqId+ujzeusxG4yq4JfW3EppfDS7lTA==
X-Received: by 2002:a05:7022:6885:b0:119:e569:f609 with SMTP id a92af1059eb24-11b40f9b6a9mr8145202c88.2.1763525560410;
        Tue, 18 Nov 2025 20:12:40 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b060885e3sm66819088c88.0.2025.11.18.20.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:12:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 3/9] python3-pyzmq: Package pytest.ini with ptests
Date: Tue, 18 Nov 2025 20:12:29 -0800
Message-ID: <20251119041235.2448193-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119041235.2448193-1-raj.khem@gmail.com>
References: <20251119041235.2448193-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 04:12:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121877

pytest 8.4+ is strict about asyncio [1]
however pyzmq is not yet fully ready, and installs its own
pytest.ini, add this to ptests package

Fixes the failures e.g.

async def functions are not natively supported.
You need to install a suitable plugin for your async framework, for example:
  - anyio
  - pytest-asyncio
  - pytest-tornasync
  - pytest-trio
  - pytest-twisted
FAIL: tests/test_auth.py:TestAsyncioAuthentication.test_deny

[1] https://github.com/pytest-dev/pytest/issues/11372

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
index 02518f43aa..4014879aae 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_27.1.0.bb
@@ -59,4 +59,5 @@ RDEPENDS:${PN}-ptest += "\
 do_install_ptest() {
         install -d ${D}${PTEST_PATH}/tests
         cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+        install -m 0644 ${S}/pytest.ini ${D}${PTEST_PATH}/pytest.ini
 }

