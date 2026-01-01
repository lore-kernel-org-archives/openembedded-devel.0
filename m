Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62055EEB57B
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 09:16:38 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.101547.1767258994415202834
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jan 2026 01:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UMPKfX5b;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477632b0621so70954025e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 01:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258993; x=1767863793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPTtI/FoFC7edOENV6afBsSW1ucQcYJq0fv36Wze+3s=;
        b=UMPKfX5bmYT8tf8siqWZDV2AD3eod0HpoyhpNwyQ+2hLo+ub1Q/3ySuVKX/rfgTWJm
         70+7krn2cQUostXPG4M0VEkXhOBjDhm9F+LqfFTcrL6n97ZYGOTtCTMY8o9SoxxO2oyT
         IPUdLoaUXcoPLd4L5lByzp/6TQyFG1ZctQP/LFGk+NpPgNW8hTVoqTHqCwUJQdB4uxzt
         JhnYeZAkXeBldocOPDcze0WNPM/bMbD7fYk8cAMO4e/jnZ5M3w6ocZDEyPt20gP5ffgU
         IspyXuEurnPHQQCETOKNpNzFIYk/6x9jMGAF645B8jZZqTdsJsmGP6eD4eT99Jow3SFp
         NT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258993; x=1767863793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SPTtI/FoFC7edOENV6afBsSW1ucQcYJq0fv36Wze+3s=;
        b=uWtnPQahDffofeyy42vz5DGzUOGhlQ6tN1drpHgFw6N5Jlxlf4skuYauyyOQGnMwh1
         qshrwGwcEkUm+GhQqQhCAmn5pRwk5DrAbVaI1lkQ4z/FhZsgZqOiN3X51uUt2tnOuSlA
         CGu8njom3g1WdrqHk5oapjc6k0SYO2X762XlxC8O5Fqo6nWVWtsVCedT9DJ+a3CCbydB
         2k9NEivgoNbTWR9z4Ql8q1gqGbuBx/u8uRFj3Ay+C8FStJBh9xNk23nDv1NsAqeQXSq1
         iqrk7P1U+iwHY6Wac7nyvlOtpi1iJ86PZPFWG6E4JYHtGqyzVu97UjGF+mCgv1HKPIcb
         nDuA==
X-Gm-Message-State: AOJu0YymMt82wasdEVBItg2DMarouPjwUzbsSCvPg5oK3ugIZO8hmcbf
	fXT1mfbmznNW4BKaItNqUODiKtwKfng7dGPmqTR/Ybk60zJRiDqrFipP07zwDQ==
X-Gm-Gg: AY/fxX48W/ubtRS/VQQZoN4I+yHwXZ6bt+ayGi/AP/1ArB8WVbsqgtC+O5HVx8I6AxF
	7SqPcxQFJ+SaNZ9xEjbNPXWCq5m7e5izudaLZdK5vjtdg1k2HZu21Oy0zzBokrIjtbyovzMj2Ba
	9vlNPEn7F5o022cQP2ZzdAd6wvqNRofR3qxHVhPfrFDQtlWrMu5uXKk7BDhP1KS/33JeY1T1teQ
	+qtuOPeecudLAb5bLbnH8yJbBCiUdqfRfwyeJeVBM5p9rku1uFywTboFggXSjrgS4q0kvCvuxBc
	eSywo5ThKT5ZvBA3WJQd56w9U1c+f7owuy91/BbZCuqSoGW0Zx4TEegBQeMhn5q2OFtI1zCFyy1
	dVgFDwAmU2zvZLg59Ce/TSwLsofAEHAdRnAYldKXDsz8Ez1IKsSBwkA6+2j9s3/N3gIihi3ssph
	KTWqe/cHeR
X-Google-Smtp-Source: AGHT+IFpQtQscRV847KQ9VwzL2t8ngThzJEol9N6I1/zBihNWyOBorjW7bx/PzSZtDbta3thj8Eneg==
X-Received: by 2002:a05:600c:c041:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47d1c0360b0mr323557395e9.26.1767258992713;
        Thu, 01 Jan 2026 01:16:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be272e46fsm719752695e9.4.2026.01.01.01.16.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:16:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/3] python3-django: ignore CVE-2024-22199
Date: Thu,  1 Jan 2026 10:16:29 +0100
Message-ID: <20260101091629.3744709-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260101091629.3744709-1-skandigraun@gmail.com>
References: <20260101091629.3744709-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Jan 2026 09:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123086

This CVE is not for python-django, but for some go project
which shares the same name.

Ignore this CVE due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python-django.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-django.inc b/meta-python/recipes-devtools/python/python-django.inc
index 7021eb842d..05333f831f 100644
--- a/meta-python/recipes-devtools/python/python-django.inc
+++ b/meta-python/recipes-devtools/python/python-django.inc
@@ -36,3 +36,5 @@ RDEPENDS:${PN} += "\
 "
 
 CVE_PRODUCT = "django"
+# cpe-incorrect: this is for gofiber:django, some go-project, not python-django
+CVE_CHECK_IGNORE += "CVE-2024-22199"

