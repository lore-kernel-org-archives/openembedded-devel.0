Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5A2CCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 17:24:28 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.6355.1760030664255624983
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 10:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JNtpHLQK;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so2217345a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 10:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760030662; x=1760635462; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dw7ZtJB3X3xgeKyniodEBqZ2ujgUShV6FgLaQ/edZs=;
        b=JNtpHLQKExtcCuFEr6WrvXsnSo2LaP/Rs/6PWniaC/MR2f8+dbmuVfagZ/cOlNPjTl
         BtS8QKB30Vvuavz5hKXtlaHjjLinGp+w70s+TYirEcQOul7vW4vwnSQMrCBRgpNQZ6FO
         werHntVVddXb7u4MzVZ1pY7M2IZJ251+n4YiYZI9jArobOLIe+tTMZxE0YNhw08NdMSZ
         DrxISVgtX408jnMt0SmKsC4c9vXLVQ3zw2BSAWGOpVT/6kRI/ihFoHyNq8qEo8v8dnC3
         SUsKPDQK7dKzhohknWSBeS8pGBh93IFsqUQijF1J3yFMY7u6GQs/sXZ8VZnV3XSoyqMF
         brXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760030662; x=1760635462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Dw7ZtJB3X3xgeKyniodEBqZ2ujgUShV6FgLaQ/edZs=;
        b=uGZ44bA8JP/4KYJM0HO/bLR/U1jMfA5aOYCovUvskn517R/NVf8aEEiJ2/EwxONg7i
         Jgu7NY/9wXKsTIi4uj/vt/mosoTPHgm9X5U1na1Owyxa63xLusokca5XAa6DI7I6NoeH
         6tswG7rmMVDlVP1hA7s/LQT4fsKmcKG5+6IIrlEMR5vP69Jq6eofcUrTaPN9ONG+8mrJ
         rRjF0US0n5l3GsOqiuk10n6D2jCMqOdEDMcCa75aJtTkfCfSzv/D6Mz4lJSk7pM/xdHk
         JMvnrmCWcO8drl3wbV7OcpYtPGUAC9ok67/mEMjlbXBJ1BKsHU+G1eAAwALCOJdk5Tjo
         fg8w==
X-Gm-Message-State: AOJu0YzceBCj37h82tKUNCa1kMcgsJY4wf7OO5WpVNwITNL6Gn3HXhDG
	cLeHiLchGg7V5vSxYqaOEgOwLbHDTGYJyaEX9KvdiJEuE82s9nDXxInyick/Bg==
X-Gm-Gg: ASbGnctUjRUiVpqR6oxy3NYAZjZQkTOnV9vPoHM4wIT3m6C/Gi47Wfcb/BKb9eTp8o+
	o5Hkr+4VANyEzLH9TSJk1ThnGga+jkN5lLPAraNSPhFvkniX1z9YOpEgoPYOtZlbOdnFvAFTyLk
	X4HG1qlxYo928QBK/BZNvA93YV+Iok5VMx0WhcTq+4h1+ky/oYzs5+a4U1sslNfQhIalp6iSQ01
	q+LgmfvaYwgrS4htYfIrEgVetANBlIv9PLL95AZZa05o5aLt/MY4gW1GGzntvliV5OuHgNs5aNV
	UA7Y6dPlsz/fyG6IxygNji4bHNOC7JUjuwjKD3Zf6ve3GKkkoe/zbrftHVHJ4v6GOjbkuHXyjI9
	1xFnitIBJOFOlOIRoswO/XsiJdzdey1zMXykgWE7mtysI
X-Google-Smtp-Source: AGHT+IH0aodDx53Inq4OWmEXMJzbkyKHDGVBm6vgAHPtBovHm6z2Jo41zqPwc2I0zPH1vaPZMm28fw==
X-Received: by 2002:a17:907:9287:b0:b0a:aa7e:a191 with SMTP id a640c23a62f3a-b50aca0b70cmr1024768166b.57.1760030662346;
        Thu, 09 Oct 2025 10:24:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d9920ec0sm18965266b.86.2025.10.09.10.24.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:24:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] iperf2: ignore irrelevant CVEs
Date: Thu,  9 Oct 2025 19:24:21 +0200
Message-ID: <20251009172421.7360-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 17:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120437

These CVEs are for iperf3 - which is a similar application in its goals (and name),
but an independent project from this, and the projects are independent implementations
also, they share no common code.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aedf74e08230f60c270032e8b937d1ab9bd2fc9c)

Reworked for Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE))

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
index 86e5fef530..30575590aa 100644
--- a/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
+++ b/meta-oe/recipes-benchmark/iperf2/iperf2_2.0.13.bb
@@ -21,3 +21,6 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 CVE_PRODUCT = "iperf_project:iperf"
+
+# cpe-incorrect: the vulnerabilities are in iperf3, which is a different project
+CVE_CHECK_IGNORE += "CVE-2025-54349 CVE-2025-54350 CVE-2025-54351"

