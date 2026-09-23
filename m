Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F51C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:04 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4261.1790160063246948064
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kLHMkMy4;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8631d0023daso420149b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160062; x=1790764862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrZphn7M2yZUxStEGfwKl5jBXS/BJdY9IICXfWJGmg4=;
        b=kLHMkMy4qAndH8DvVTbqpQiKUfvi2ECQDixPqhm1kLE8iJrKmbZc0/cnxm/RINkHno
         qB4pH3WE7iKF545P0KuT+ZrHl5EqjKKD/dLleYfKNwJD0G80D8M49O4tiqK5fPKk1qRg
         nhanhragsdwaBvyLnez/6pqKG6pXbr3zxBAZnzsI9BvQPtiN9oyq9+Gqhuefwg/2WiGv
         iCm++DxcU2W3wWnZ00C2fJuDBaNTNG2nE701iFLH6IZ7HEEGIqTupDQVXUFikS1yzsHp
         T7aIF9xi6sSysUxPXoWgITv3n1RJcW6A71VfAe28lOH5dvnHm0rsNIGh59HV5mAKDzwe
         84oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160062; x=1790764862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DrZphn7M2yZUxStEGfwKl5jBXS/BJdY9IICXfWJGmg4=;
        b=cydn5bbS0pFkXesXVMLprzN05qpU0qYYc7KXS7DXZ5izcwHIYjrpS1Ri9KKOTeNmH/
         3cBV1wCaIlFLqQwaLt/I84AYOs1iIEhhZT7L5xCfnYrYPPmIJUFVC/r+MnBplCOJf8Fo
         q1KlYfBZqEw9kq/A7c83Ls3hOkg+tbm88Xlk2znqHjd51iuYIreGPV/xJTqchKUB7m5B
         eQgk34/Oiflq/UJ7DSBidx3k2Rjkc3GPeur/y2jhmXbxxS5Qs7n8TAngZNVvIkt7LWuy
         rdHMzPotdDyhT5768rhe+YdsoFNOD3oeW5p9hKukOX9I9c1QR8/fD6vL4ksAw754xmcT
         mT4Q==
X-Gm-Message-State: AFuF++kGkATsmyJQIHhUvXqN3Hul6+Rvedk/74NjPdqM6z6lA+nqQD65
	WlHYhxGJm6yeIn4V7zo0NJBXhItHoGqZ2nq33p+2ASmPjRYQVt5SEMPrDfnTLA==
X-Gm-Gg: AYBFou3OYxUZjoO8CNAj9ZkfxyVewsxwJi9N/P1mbOLj7PIlMw3GlGHRPR+kFOY8J/m
	oAwUMDc8Qcm/o1FWsHmqkQMLg/m+c4EHM5WrYytEuI+JOoUk+fH13N4xqcyDzgGLce9Aqcpmpq2
	PaNPvztmw+S8i65AhrLet7q1DUdftWByz8glVfWsJHkDoW7+5nB1pWzw25p1Vad1pNT3tV2g0UF
	JN5gINX+4+lQAYdkQS4rgI/x6YqDTJgWBFA3/2d35WOrcqXILAjHNjM/EWBciMJG4CwjbtXFnM5
	UJo6MpnaXSYkPl7m57guTZbgPsC4KpmuUO7uEeRYB/AHbn36YyZtuXd2Fr2OJzrg99w72+1N4cS
	BPHUBuIdnrLdpWIMO3F2o/sgRyq8n5YawLHNFflP7oxUX0Ws5YQEnB61Tbjqy0tgncx76fMET9Y
	hGtKl2dqwjqSwydgRLcn3rNhEPqs3754T/NYD2Pda2jz6WpDGqi3mzyhzHGDeMVSk4KG0r1x9K1
	LPH/T4UHnkt1HNCre/AD9m6Fb116nunfg==
X-Received: by 2002:a05:6a20:914e:b0:3db:3d0b:31fd with SMTP id adf61e73a8af0-3ddf7ca7ba0mr2003869637.1.1790160062436;
        Wed, 23 Sep 2026 03:41:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:02 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/42] c-ares: mark CVEs fixed
Date: Wed, 23 Sep 2026 22:40:15 +1200
Message-ID: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130188

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

CVE-2026-33630, CVE-2026-69184 and CVE-2026-69186 were fixed in v1.34.7[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-33630
https://nvd.nist.gov/vuln/detail/cve-2026-69184
https://nvd.nist.gov/vuln/detail/cve-2026-69186

[1]https://github.com/c-ares/c-ares/releases/tag/v1.34.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
index 058f3666e7..b86b0976c2 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
@@ -30,3 +30,6 @@ FILES:${PN}-utils = "${bindir}"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-31498] = "fixed-version: Fixed since 1.34.5"
+CVE_STATUS[CVE-2026-33630] = "fixed-version: Fixed since 1.34.7"
+CVE_STATUS[CVE-2026-69184] = "fixed-version: Fixed since 1.34.7"
+CVE_STATUS[CVE-2026-69186] = "fixed-version: Fixed since 1.34.7"

