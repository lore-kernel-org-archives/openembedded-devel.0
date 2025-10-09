Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67D37CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:26:49 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.9129.1760037999354959234
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJYowt+D;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so1804786a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 12:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760037998; x=1760642798; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iv33L8QhgrCjBO374oEnulBjv6PNBcl1hpUXM/OwvZc=;
        b=ZJYowt+DjqeBFZN6g+WestfQDoIeGk24jQ64obMRLL4wl6fyG4mdn1+pbB/fSM0Enn
         BXvUr7Y5FLbhXRWqgUQBAyFK+fgrxt0Z5LCi/iunj+WwwY2wyJ0j5g0Fx/lG+MyMX8BS
         CtHGEqc16Sk237xyKbA4ebbxk2hcbdywZLe3IcOUFGA9oaGrgqe7/pjNB7ReGJ2KOzIV
         WaQWwjRgTR7YScVcc1DV5rjB0xnJofYwkaDrc8as7aJtxUaOx2PhdrcpEtJypuxX4BHq
         9vLT29IOUWUYmB4uOLS5iDqclAUdBKEHIh0UnqeeO7A73fR2xQvfvW4oAxr2TwaqruoS
         jh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760037998; x=1760642798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iv33L8QhgrCjBO374oEnulBjv6PNBcl1hpUXM/OwvZc=;
        b=dG6SBJpvopc57Ie1aubCgOaLSDo66U7mVeV0gDPw8UHr90nz8isfR/PDOYLLZ/lzae
         pvGDhagvAPRqjUqGwOKORiTnvsQnB/baNV1bU/Hxa1LsTNhYmEx76hgcdIkChSDtK9qw
         2FGaaCRfcNhXkE5dOtZ0CNpzCLUl7SAFSUiVOOvueJOuIM9IBcEIOowdyld2bcoL/iA2
         HAn/adEPHNEoyt2XYJqiMMcxfBiv2VzJOs1+ynfBiZMYz1miVyJm5texUmV/hhjdpvO5
         4ZuDgmiDDVx0We0s1jVsXEn9MJLfLI3Pt7z0hvFXlwzVHHs+YcqmHrcnwvPcx7tcMYY7
         gZ+g==
X-Gm-Message-State: AOJu0YzgteEDHuFdo4xYsxjN4Tp6yli53h1Z1D4K8TxBcs6v7m8TnKta
	xBddRJdf8imlYECkYzQ0HmxHCvDjPppBCvInDBJIA6VkaC3vXVXFwWeBFEEzfg==
X-Gm-Gg: ASbGncuejkiOITNT5d4ZaE8WF0q5K6T2PPXaQe2B7N7un5Oa7vrDkkCDiOnH9USvDg0
	pqaCAuBHdNL+giFP/BRQRyWTlcfULM7Vh8hF4KeJCgT5qqpBIECGPUZduvyTvfa7ZBOgbxsAHkO
	oy4QALvscWJ+/VteKMtCUVPH5p1zU9WYO/n3zvfvzRdJrLld2hvCGfbOwQdl7DFDHlzwVJAC+SS
	BZHpiY1NuHZPTmMd/qIrphqyTVYXSM3tw5hWQsYyzBQrBpvzxo2VJyOp+xi+yRBimvkVcOmN3ZS
	jWcVQyn02HASeZJm6S/lAkhd5v8Nx8rUSMd7XGvTof+HQdruUROdbi5rYH5K4Ix1LjoQaDqVI19
	ddQYGEzF0HyqNaE+aIIrBMBrEvqBmtoJDHYek2TmHAYXC
X-Google-Smtp-Source: AGHT+IEY4aWt4KKD4Ny7bRuRpBWPUnbRCl4IyeclrNYSMbGGWe93rOQqvIpoJF9vFRZ6YY826hhJGw==
X-Received: by 2002:a17:907:9706:b0:b39:57ab:ec18 with SMTP id a640c23a62f3a-b50abfd5472mr924511266b.45.1760037997409;
        Thu, 09 Oct 2025 12:26:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad7e1sm42643266b.9.2025.10.09.12.26.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:26:37 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH] xsp: CVE status update for CVE-2006-2658
Date: Thu,  9 Oct 2025 21:26:36 +0200
Message-ID: <20251009192636.1553923-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 19:26:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120450

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue.
Package used in `meta-embedded`: maemo xsp http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/
Package with CVE issue: mono xsp https://github.com/mono/xsp

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3cb411a05744eaa6e822c3d435d9205aa87ff632)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
index c611da48c0..32f7bae0dc 100644
--- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
+++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
@@ -13,3 +13,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
+
+CVE_STATUS[CVE-2006-2658] = "cpe-incorrect: The recipe used in the `meta-openembedded` is a different xsp package compared to the one which has the CVE issue."

