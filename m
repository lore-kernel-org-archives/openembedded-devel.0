Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED5ECC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 04:39:10 +0000 (UTC)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32146.1792039147251963167
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 21:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=e0Dk4GMt;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so2634063eec.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 21:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792039147; x=1792643947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqAp5yjUFqKZ9yq208hve9R6dT0dfn0+cEp3XfeGXLk=;
        b=e0Dk4GMtwAP/HAJh5NEV0SFAiGjShjnxwPEnkorWqIHGueey0zv63kXfGBMV9TmxTc
         9cjkaYwX43Wv6pNHNpRCVlUnkptSOuO2m9FuJ5hzEmtcpfrTaGtyeyOcE5Qvkxk7AANU
         Q8QDEPFUzH/OLexFFBNfDLgOiX2DO1WPOnrF/8iBcR/VKISPdd1uZT0USE5Z3dY+/J04
         ey2eCD1uP5AVX7VYfDivEp9Q5+8qiohJ5S3O4tuNwvZ1qOZX+mrZD7Z9XiF3+BpN2pSF
         2u1it5Tt+sVth2ZPmblS2eGalSP5+EREnuyU2EA+DKwgNE+vs4cQcefpNOi/fz3gU9Xk
         YZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792039147; x=1792643947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqAp5yjUFqKZ9yq208hve9R6dT0dfn0+cEp3XfeGXLk=;
        b=sSXGbEO5pAFlNWo+JdgyhLmeB2Sc2pqIEWWEgDCKpJYPHJegX1q+cu0ZhiKLNMrCCJ
         h/nq4CAvtBoJZgP8dpiDGNWBKI/tCwikDrQIJFOw0+/2fqvHsARX5Ir9gQ6iiWGdCvUF
         5L8xtSzFY8e5zOdIXqYGqIcfSMuCRPzkTSNA4mx9VRuPhHtN5WlZWRk1ybeHBmBrQXxc
         EOGl/kU96UpWkp17RVhi7lsJcgc/2cARaa1OTWlPEci68N8mj5usn6Anqk7hYW6KqpTd
         61JUKkmXlGGGV59li3kC9rsqa7KMCYe/oj63VgwOVN11j+UvwGRhmglZWk0l3/KEFgfR
         F3Dg==
X-Gm-Message-State: AFq9FYKTMc5wh7DDqhsFI3mux/c2/+KKlXAO6FhjQwZAV+0iqtoGvGaI
	pEiUKZlk4UG5Bi1h8GwiWY2s4FmrCD3UcFloskQFsT1oWLwM3mkgHv2Se5ckuByDJKQ=
X-Gm-Gg: AYBFou30Ed72EoQvlQzsJBod5oktb72tc3z1mQl+HDCOkHsLO6qunptxhaLhtb5HeNd
	ilT7Fv6DuL6yIAgSz7A1hFWjly52h9eYoeNGQCq8kBT0Z8009bG8JeRQlof6Z0VTOm9XXBgy+fR
	vYo/gFNrpAVDLUdmtqSSTWmHPYnhs/znVZSkmWv1xGfv3jgosSdGtgKC23S+XRHSLrmorZA43hp
	0ZBEFDrIJePa5y2mfhWqzSeGDFDIK5ZfNNvZppCku1XrKgqkEeJvEKAlOfocZD+aAyQIuZVz7Tl
	1fvuIgq9N61kiL6lXG0KZJkrZoyN0GqD5b8SIfX+aK0bdIEDFUOceFt2A+4QlVdzb87vG3fs/V+
	6gMy32oIdza2g2IdUhvQkcvXjn3zbEHiqZGZ24D8PIohtj41uusGOUtu06IoD9eQPDh/Jfda35B
	1+vzKhBtxd9EsThcYN6CCKMq3XQuHQVKPdcqGUOP9iTK/LSZ5Km3dRxTI2a14QRK/cq65LSLKGT
	tjJkeB3AHPRySut9567aBTZF7SwKxy8swdZ5uRnouNdN4IWCoJnJxD7UYyi/9S0hGdWEC3sCF3h
	g5ORfCCYGWCXtil6gJ4FvfkE0i2HWeX2sis5S77ylGBMYYgYe8jMo5BjNaGQt9fdxCfsSq/iz6w
	tmgqrvKqw6W2uTBZ4MCHKMHgy3RSxm210wT59Zp8ny9Y+ZpEuMHlEk0UWHhxjWwPMh2E7g6Ggyp
	S3j4Tz+cbBQJrQ9etWf/kq9zjGbWZvqkbHN1V38End3WtG+Ns=
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr18317746eec.28.1792039146446;
        Wed, 14 Oct 2026 21:39:06 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-358ee8a3387sm49199424eec.15.2026.10.14.21.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 21:39:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 4/5] python3-pytest-benchmark: add missing runtime dependencies
Date: Wed, 14 Oct 2026 21:38:58 -0700
Message-ID: <20261015043859.3073445-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
References: <20261015043859.3073445-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 04:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130911

The plugin imports modules from the datetime, json, misc, netclient,
numbers, profile and statistics python3 packages, so ptests of recipes
using it fail on images that don't pull those in otherwise.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-pytest-benchmark_5.1.0.bb       | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
index 791e6df3f0..0aa2c24d30 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-benchmark_5.1.0.bb
@@ -9,6 +9,18 @@ inherit pypi setuptools3

 PYPI_PACKAGE_SDIST = "pytest-benchmark"

-RDEPENDS:${PN} += "python3-core python3-py-cpuinfo python3-pytest python3-aspectlib"
+RDEPENDS:${PN} += "\
+    python3-aspectlib \
+    python3-core \
+    python3-datetime \
+    python3-json \
+    python3-misc \
+    python3-netclient \
+    python3-numbers \
+    python3-profile \
+    python3-py-cpuinfo \
+    python3-pytest \
+    python3-statistics \
+"

 BBCLASSEXTEND = "native nativesdk"

