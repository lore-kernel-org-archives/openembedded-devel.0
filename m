Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEF23CC6B3B
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:57 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32813.1792043036602834465
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RieucwrI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so28514765ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043036; x=1792647836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yobsyBcNMHXYWF4sjLbpLEmDpMfy6IIP8ei+VHdbFOI=;
        b=RieucwrIOhWcj/MEHEWxfQjdDa2xY9/UauXhriNEaxNiXrwdNWl+OY5ifiRZiz1plc
         Yy2b4Kfy7U8RW5YvzC6KH1fAST5d/w79AoIGdasDXxBsj8GlH5LORQD0jrc1JdPa7vUV
         QT0fOjnq5qL5ycZ2OySv+CIkgG4PBrLj27KVZvAfzwNU/rja3M057lExescj4y8Lh675
         KIC1TnFmvYd6YZyJwfK6Am/GnZIUvjAjajr8t1LsbDk1fBqv+4q19PT+mT4+J5O0G9r/
         0Rv4jkZeJVZjhNxPi7BkUq97HkVlefAXnbaM/GGTlujQdH4i+7LtWa2ruZFxeIPWAOZm
         zJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043036; x=1792647836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yobsyBcNMHXYWF4sjLbpLEmDpMfy6IIP8ei+VHdbFOI=;
        b=CY42sA0RpyrsW5+edou47J8rtbKE4OixuX/ze95/089Yz/ZFjUrHgolIaR35Hb3JTJ
         lQYGFwEF8KYfC6/Pih6zEXsORtAIbedra3uyd7Ro/mXrM4sT7Q7D8qqSHCf2JMfcKhsl
         cepjbu0tJ9QYlImnVYloPjI66PHWTlBjNHvIYulaYK48igVq4HichMeICiJ8IIXQCx+c
         F3dkE4Doawq7YM8JOt0VXGPK4vj6y9rFUWe0uTPE2HO8zEuJsnD71B32MyAUcU6Ysqyt
         rT+H6Y6Gvv628QY+kp8LAIQT6nICcMPRRKkl5XxG464cZDqvfAUoYcr270uphrWCLEXg
         0yGQ==
X-Gm-Message-State: AFq9FYK5mZj8MXdeKvPAIFcfBphkIh3TrZNgj+G3oV6wA/I9xPVYIMGA
	DwNMaa1V5ZKd5ZzLZJB3eGyyKG7ZcyHcqymBqpmtE3iEMvbVRzKxUjHvlBCUpA==
X-Gm-Gg: AYBFou2CTjuMxJinypDK5fY8SmM2T/0Px9+p4Cw6mC1zWRbm9j6fCdg/H/xm5bZemY+
	LB7X5/0zgrx2Cd2zA0IHuKjjQvm/gOC1qKgmVfP7DQfsFE77cm2DUlBstdWPeL7XTwgelY/ETwL
	GZqmU5EDq39H+RnWJg39r1n9MNmacUu8E8IODH2LaYHhXGJsLmnABGtA2pRewD0Ws8AsFukWrlw
	dNQ7HeqVPGz2IWiRBMaLiLb/MHEQV3JIIBerxastnqP0Ksxb4uC+PMcLrf+qETrio/LO3W3kySk
	m9GaW7rnDtx4bnK7VTpzNsIdIGFT5UjeLrubPEobbJv7DLUcDyhTDmYpOrKfLg1r1cNMWSu+A30
	bHBKBB+Mm69KODQAIzpx3Pl5a9/eEvpxlTSCoMnQuhgDCVfMFXSp0NHmJ22xu9uFYojFSY7SMaw
	gNWvmP3hFzjhAtlN7VnuVtBW2OCli88SXbUjRbX73XBrCLcCA2j631vw8kHwsJDjlzHBay+U4ZA
	6IVwv+qDXO4UxP4g/+XsYk=
X-Received: by 2002:a17:903:160c:b0:2e2:d9fe:51fb with SMTP id d9443c01a7336-2e84280aeecmr164774325ad.4.1792043035910;
        Wed, 14 Oct 2026 22:43:55 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 31/82] libiec61850: mark CVE-2024-45969 patched
Date: Thu, 15 Oct 2026 18:41:19 +1300
Message-ID: <15d002f2668a724ae99fbe00672ad36bae8e2e3e.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130951

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

NVD[1] mentions commit[2] for v1.5 but is also present in v1.6[3]

[1] https://nvd.nist.gov/vuln/detail/cve-2024-45969
[2] https://github.com/mz-automation/libiec61850/commit/7afa40390b26ad1f4cf93deaa0052fe7e357ef33
[3] https://github.com/mz-automation/libiec61850/commit/d1ab50298fcba3f87b1e58dabff92f8615b14ee7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit a7088b0fda5d269721e5d3f16ae410062b9b2c8e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
index d2fbbc53fb..51ceb5cf02 100644
--- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
+++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.2.1.bb
@@ -35,3 +35,5 @@ FILES:${PN} += " \
     ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
     ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
 "
+
+CVE_STATUS[CVE-2024-45969] = "fixed-version: fixed since v1.6.0"

