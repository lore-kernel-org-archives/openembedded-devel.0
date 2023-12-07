Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA984C46CA3
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 23:24:31 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.113512.1701991467588408908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 15:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Az+Y8vwu;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b9e2d50e61so586698b6e.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 15:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701991466; x=1702596266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvdqRcIp9qJww7hG/CAXTUbpXajie659Rh2GrbnfYws=;
        b=Az+Y8vwuR4UixB4kp4kRJv8FIUWZxfWH11wDIPRYDKJ62mlwFQHPoHywGvQBiJ/Nut
         /67sZ33o+Qe/r0gHLI5RAG9U7d8SbLA2OFEXzM0zk/DojHbzgb7p4zngeOZgnCxBNwfY
         E5cj7gTPmDt15G7ruFthI+V8W17GzvcTEXkqfEdS259LqAVTLI3HoNutzkAcrdaUCpjH
         QKe4GdVNiWfZrx2FYX9qVOv+zmKXF4UiRvkMzb9s7Pdbl9aCy+8fTB3yiPuqle+tXGyc
         0szJYZB+7MiB24iH1PdFyFJTRZHpC28Gf1t15UNbZkD6xJIYMKYc60XH/3ku/Ia/sPyy
         a6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701991466; x=1702596266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nvdqRcIp9qJww7hG/CAXTUbpXajie659Rh2GrbnfYws=;
        b=ldUyx7oyN/V97Ez8V6JkHBiB+X7j9uOC03rmwCmEB+2mtHhH1RaGWM2Ad9wZQgVSqi
         8ne13tdl6InZKWu0P89XVzoYvryw9ONqgkBW+hLCf6/epL2VNPI88+r4rDGusJ7O+0hq
         CteeZ3Cxvk2eqLnYdCOwu57bOIAomYkthnI7SN3Mbl0U1zGLsXOgWPuPA2Cz5k030Bso
         3PftecDGTvmkolpRs0i9UA0SwXcvCcAZChhG5ulVxaw/3CDxoPjC9qdORCxGc+SBZqN0
         G4ZLWOn/PUjur+Q2n38c0RR5xSa5LsuoErrlU07BcO7FLKu6WI3K8H+7LmBgIY2tCi0k
         nYEQ==
X-Gm-Message-State: AOJu0YwvhIM7EkBQBdY2IWJQmDQPtTI0P6QhyjBJpDfqxulwSvWObomy
	XAYDA5wUDlB0huQguWM2FaZ5iN7ZH14=
X-Google-Smtp-Source: AGHT+IHEtJxPyx9Bphr7+0322iski9C6Yk6syGq8cLlkOhe1wehqQUQBdQbQfrL7BeLjyUewsPUJpQ==
X-Received: by 2002:a05:6358:7201:b0:16d:f46f:16a9 with SMTP id h1-20020a056358720100b0016df46f16a9mr4367200rwa.17.1701991466394;
        Thu, 07 Dec 2023 15:24:26 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f523:dc1d:b135:87b9])
        by smtp.gmail.com with ESMTPSA id ff16-20020a056a002f5000b006ce742b6b1fsm324266pfb.63.2023.12.07.15.24.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 15:24:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 0/7] python3-pydantic: fix RDEPENDS and add ptest
Date: Thu,  7 Dec 2023 15:23:50 -0800
Message-Id: <cover.1701991044.git.ticotimo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107292

The python3-pydantic upgrade to 2.x snuck in a runtime dependency on
python3-pydantic-core for which we were not yet ready: it dependended on
the 'maturin' PEP-517 backend.

Depending on https://patchwork.yoctoproject.org/project/oe-core/patch/cover.1701989368.git.tim.orling@konsulko.com/
series, we now have the support for 'maturin'.

This series adds:
* some missing RDEPENDS
* python3-pydantic-core including ptest support
* python3-pydantic ptest support so we will be better prepared

The following changes since commit 284590b4a4277719df77df800eb9d1c22691ee8e:

  vte9: Drop recipe (2023-12-04 12:30:43 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib timo/pydantic_refactor
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=timo/pydantic_refactor

Tim Orling (7):
  python3-pydantic-core: add v2.14.5
  python3-annotated-types: add v0.6.0
  python3-pydantic: fix RDEPENDS
  python3-dirty-equals: add v0.7.1
  python3-pydantic-core: enable ptest
  python3-cloudpickle: add v3.0.0
  python3-pydantic: enable ptest

 .../ptest-packagelists-meta-python.inc        |   2 +
 .../python/python3-annotated-types_0.6.0.bb   |  14 ++
 .../python/python3-cloudpickle_3.0.0.bb       |  18 ++
 .../python/python3-dirty-equals_0.7.1.bb      |  21 +++
 .../python/python3-pydantic-core-crates.inc   | 166 ++++++++++++++++++
 .../python/python3-pydantic-core/run-ptest    |   3 +
 .../python/python3-pydantic-core_2.14.5.bb    |  40 +++++
 .../python/python3-pydantic/run-ptest         |   3 +
 .../python/python3-pydantic_2.5.2.bb          |  32 +++-
 9 files changed, 298 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-annotated-types_0.6.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cloudpickle_3.0.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-dirty-equals_0.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core-crates.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core_2.14.5.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pydantic/run-ptest

-- 
2.34.1


