Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB38ECCD185
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 10:19:09 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.4026.1759485728959319324
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 03:02:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ohttudbr;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: joao.raul.434@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-46e5980471eso9961145e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759485727; x=1760090527; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0zef8akI6u4y56IQCQWI04K7n8J1NQv20d2UyPEEQwU=;
        b=Ohttudbr24lr8dZ63xWmoCqjT5Hrwy74zxqlczCd10CA83u7ND51FLnVXJV20ARLAX
         uv1mA18YGTEO9WA9mSRLNAxjTOmZ+fVSyqmQ84/qg/vAH0neBrqCeUNdRLLF4v7y9sOh
         MlGahnvBdHpFs9fZF2UCo+JYeeZMQw0qYqk3Krgw2NYY88zOliba4rqTxtNA1QGDVL8v
         6Tgz/H72aFeXllCdHqANCHhjl8uFOfzWTAvVSWM175X68rBZ3Anwf+K8BjAPn7w9HX3o
         mvsAlJ7f9wVRFmZXbJAMo8QJmba/dIqhM8UYHzbXqQfG9VEJzRglRStLOljEMYT1zwdI
         5YRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759485727; x=1760090527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zef8akI6u4y56IQCQWI04K7n8J1NQv20d2UyPEEQwU=;
        b=OgzyV+20KNVoVsHD3eBI1oD1jyIIBMfwTrpsXHzBrjxeBEj4GKnWzyYZc8W1J6PclB
         fSwaciS1lKFm3jTHi1oxbRfrK0qPUYZR/IfHCHmQ+vGDGy2HPhdi/bvsNf6B7ypOcITl
         0ERaj60s0PT2wyIpp+ECFUzj4twG/wjOxwHAHkv+voZg7SK8GDdvSU5G4btaTsXK1k+m
         ta1DtCawrQcR07nzhI7UVq+nI5oGuzQDb4Nb90LDdKijnrmue5KbQauwZgi+EUnr2XQc
         YSGq0oNF0OeQ6CEXI94piD5Mkre6NugZxKIp5ltJ7Db6D0pEcbuoVE+By+j+M621/0jw
         1AdA==
X-Gm-Message-State: AOJu0Yx61VonIMw4KMJ5G0F3+XXsH+NbxTFiEpFel17yq2Mrbx3NPXG7
	S0tyRaV8WoN+/WRhBOFH49fEk8FUuxCgw+svXBz2cq6lKGFCRd4rsUs3EF/sXLRf
X-Gm-Gg: ASbGncsKySmRPmpWH8gQ455u//ujFFKxk6O40antaaljn8eEL9chTI1Q0/Ku18WEiTg
	EKQ/X56IYYw3+LYHNcOs+uGCSz7UKXepaxhMjwXkPpteunpJefio/+H7ZiY1y/0ngNBBS9JDRr3
	iAI4uwJ4w/v/TRAnimrajvEcTlVdk3Swq0nBjFjt4iK0vttLVvxYL7GQB6D2iOoth4zvNpUDvx8
	f67P2cEFsxisiN6yWBnDZeoodQqBzaCjLHXpOZU57y5wMNhHV04PgWjFNU+jOs5inWgTowuo6/5
	jczbibDCUgWa+Edn8ixNzpwGoSjc67oHk+N3QbPnZ6GOZ50N2VA48AcJv98n9FTNoMKJa6BxMdm
	LaFYF/azWkrWNl4GskErCe0MR/4OtmY3xFUD3EesxUY8EYE7qS3S5t1rbcimNUgR5YDqBm5gK+7
	HbMkGY6w9Yi9PkXM+m0VMWbf1Tk6GC9fm3ymQdRZYRvvajZA==
X-Google-Smtp-Source: AGHT+IFgdypZ2SXJuZ2ZKPNr8IX48nzpEW00qoXafUp/3tlVWUjUP0E/D8zH3zbGwzarLRpyUw66+w==
X-Received: by 2002:a05:600c:628b:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-46e71147470mr13709405e9.30.1759485727045;
        Fri, 03 Oct 2025 03:02:07 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723624b3sm23352645e9.17.2025.10.03.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 03:02:06 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: joao.lima@hbkworld.com
Subject: [meta-oe][PATCH 0/2] Add SWD and dmem support for AM64x and J784s4 in OpenOCD
Date: Fri,  3 Oct 2025 11:00:46 +0100
Message-ID: <20251003100049.1695-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 10:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120214

From: Joao Lima <joao.lima@hbkworld.com>

This patch series updates OpenOCD to support direct memory access (dmem)
via SWD emulation for Texas Instruments AM64x and J784s4 platforms.

Changes include:
1. Version bumps:
   - openocd: 91bd431 -> 66ea461
   - jimtcl: fcbb449 -> f160866
   - libjaylink: 9aa7a59 -> 0d23921

2. Platform support patches:
   - Add SWD native configuration files for AM64x and J784s4 boards
   - Configure DMEM access parameters in ti_k3.cfg for direct memory operations
   - Set up DAPBUS debugger and emulated AP descriptions

Joao Lima (2):
  openocd: bump the openocd, jimtcl versions
  openocd: add dmem support to am64xx and j784s4 platforms

 ...wd_native.cfg-Add-support-for-direct.patch | 77 +++++++++++++++++++
 ....cfg-Add-support-for-direct-memory-a.patch | 65 ++++++++++++++++
 .../recipes-devtools/openocd/openocd_git.bb   |  8 +-
 3 files changed, 147 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0001-tcl-board-ti_-_swd_native.cfg-Add-support-for-direct.patch
 create mode 100644 meta-oe/recipes-devtools/openocd/openocd/0002-tcl-target-ti_k3.cfg-Add-support-for-direct-memory-a.patch


