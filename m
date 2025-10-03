Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE12BCCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 10:19:09 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.3806.1759484991327320255
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Oct 2025 02:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXF40NQm;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: joao.raul.434@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso373065466b.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759484989; x=1760089789; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0zef8akI6u4y56IQCQWI04K7n8J1NQv20d2UyPEEQwU=;
        b=NXF40NQmwS0VFmsa3pPnTx95or9zmXOWdYiVoRzTTVpjZzacGdHLnkdpU7alY3zGp6
         xmoh44pVoOFIeXFeWyh5fw0r2hnHOeit615XY7Ja7C8zRmldXnTPTNxRnw5qGPtczuxy
         7JBm0BcE4QYCZDMTFZYX0q3bwe/yh8BAa3ssZXQMDtQrw48yPm//gR2adgNWSo8DnOHX
         Kpo6cADpiYU68L5mJpF3XYR6/vW3H5cNkE5UPim3tHw/3uggmASWTBnbOD11VDBTWI5c
         5YbQi4lPt/R3mNPHjwTjuT4Y2JZHuN1jifpERvXgBZ6ca87LTaUmYX74VnQYQW7PKfJ6
         IcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759484989; x=1760089789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0zef8akI6u4y56IQCQWI04K7n8J1NQv20d2UyPEEQwU=;
        b=sFnxfv2clPPKPue5mzYLq66egLk5C9OeAGtlB+Cey1IAFfGYEjyR4fQwit9wtKfLWf
         uaAnSy+OaQECRsYA1a1GKvCWbP9jhL6bcZ8JZkuab/uGkWVGH8Sw7Tv9aWXinj88hXhj
         KRWlhuUzoUEW4sayeIZrU9TRXIC1p010v7fLOfl/HvzIj54CKwwu8Tw3/4sqbNVqfH4R
         c/PPmPqsaS68FNNHv0LLfZauAkpN16m3PqMHm3FFrDX1Mp+j+f6BoFVz7n8plx0k9tW3
         lh1yUEzZEc+nWLc1IBB/uQ4u21djoZupcQD0yf440XwdSezoxdELu1ieizSEiFAD3O+n
         Rm3g==
X-Forwarded-Encrypted: i=1; AJvYcCXCEPZbWOTXzjPpAHUkHZef+BjdTnPsUgfNUgupvhWA30vfu9W7v6nfKsbUHChV2JZ+aeU5/agDh9KOBqDnM/lvRCo=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yylawvcw56d5i88v0mwCT6L/bxXjVSLkZWfcTIbE5GXxUWynCD3
	qQPlaf2qq8PQOgBTlbVWRT4jQGR9IxL7ah/dubv6BAduoflGzy8ZNe0KHffULneG
X-Gm-Gg: ASbGncuw+Ivg2xt1HFElieIubqLd8hx3FkcMQ8nLwxBurPTlHnauQlmwqa/mopmLUKe
	UxiCxPV0mm+IlPFLwa/T7wcYjV8g/7GcMlo95RbV6qsTVGnG4rKwaEsFVxNvN1Uz8HinWpsF+Ij
	FprOX+C9mtimbZ27FIkY5Hzkg+V+IX8Nd0MIm64CIwQgjDkBDpXBFBIctVBHYT0aix+wIvH4Lrp
	IrU1sd5QHN6oQANs6g1/D1Fty3dm0GT32ZT6YITdyTmqibYMWtGeD8/l3+nHjg9xoAVHVQ+0qYz
	KRWte79AZbqE1hlyoWmRfv3lLPl8MhCgwBqi2yW6LcuJRDRepHKZGJAx5rTulTjQemn8CM/5pfS
	rcqeURgQxwrpShv9nVPICB14JeDkOJ48wut8jqBIx80DMpaclGB67z8zbC+/WzT0lsG5ZK9cKsx
	N/W7zzQupD48ieZh0S0BuDV3oDPkkqy7MCq3k4ZJVjJbjwuYYCNNLB2O6I
X-Google-Smtp-Source: AGHT+IH71FtzmJKwj/bkGe33ITW//s7pakuqkZX0POlzr67hioQAXIerFU++Ixv2x1QbGhBAwRxhtQ==
X-Received: by 2002:a05:600c:548a:b0:46e:50ce:a353 with SMTP id 5b1f17b1804b1-46e71105742mr17386735e9.14.1759484517360;
        Fri, 03 Oct 2025 02:41:57 -0700 (PDT)
Received: from RD-8dhlsmLpT3bz.corp.hbkworld.com (89-181-200-223.net.novis.pt. [89.181.200.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a4161bsm128962275e9.16.2025.10.03.02.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:41:56 -0700 (PDT)
From: "=?UTF-8?q?Lima=2C=20Jo=C3=A3o?=" <joao.raul.434@gmail.com>
X-Google-Original-From: =?UTF-8?q?Lima=2C=20Jo=C3=A3o?= <joao.lima@hbkworld.com>
To: joao.lima@hbkworld.com,
	openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH 0/2] Add SWD and dmem support for AM64x and J784s4 in OpenOCD
Date: Fri,  3 Oct 2025 10:41:34 +0100
Message-ID: <20251003094137.2046-1-joao.lima@hbkworld.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Oct 2025 10:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120213

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


