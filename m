Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95629CAC5B0
	for <webhook@archiver.kernel.org>; Sat,  4 Oct 2025 18:02:58 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.14367.1759600969316632532
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Oct 2025 11:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RJKg9Tt7;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b07d4d24d09so634430666b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 11:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759600968; x=1760205768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OGRgDYuscstlwMekemC+i2jQRcIEXl84xrSlAYejK4w=;
        b=RJKg9Tt7cHxv2LdUI5W0h2HdHG8w6+Ru2qYJW9dRjMC506Ji0TXrZ2IEm+K4c1hWHi
         2evLIl9JaEMqCzAXKgd7U1nelhy/22SvLQ2gwZt+bMtqv/yy4GCtLynWaFNJf0NbfAOI
         A5yjmkfF2ORd3QqpOBl2R8MF7dwXfoDbaFhugsn/MpmGX4fDtOXWzL4V8H94P4KtFSZY
         QNsWMD+Kx2+XSlMSsfq6lDImTXu62EW6A1XMt/Vt2rSPksKvsCnJfxghZg7JX5q2vxal
         AqOikaSgDUKBRIMZ7xc+9tHbf5ALCpGycUzXOL00pN0Kbg+3EparDY7bqv8Qgs2YuX2l
         PUmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759600968; x=1760205768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGRgDYuscstlwMekemC+i2jQRcIEXl84xrSlAYejK4w=;
        b=RA0W/Lmdz14Oaw1UQEZhgmagNIfxT1GUDc3WU1G4m6rkIKIN8/SEcCBZvzYZFDez4u
         pDfc9+YdPQG8Y422RTU92vgS6kZD683TzHzCXqrtYDJsLHpTVNW4541aODZ+oxElnXB9
         yVDOkTjt3LApBmV7D52oF8vLLy+iT1tEepS8nHRDYCD0X09V+80eGoEJwG8aSPIaqohq
         87b0aobe8bCkXAgaPgH7xLn5shTytAkIuLAs1KHF6xFGxe4IduY2QytvqafLdmYmmiHq
         5/9HIi9G51GRizugfJgLzSRCso/Q9kgELcSPekIqFICe3ytKx7CvvbsBKi3mON00JaQ3
         f1VQ==
X-Gm-Message-State: AOJu0YzycBgbCmjQaN/bTVzB76hEcLCrNPKhpP/NGg9sqChMCxcs7KEM
	t/vJZxYnKRB22+4UD08DZsqF011WFI0kGbOFIVylKbIvy7oRPXqLHmiRMsVcxQ==
X-Gm-Gg: ASbGncuOTwdvGDz6CssKPx9d4s66EBDd3/+pohWfIPglpHsSwykvhPBuwUWUbB1ViHB
	vP8Jr1gepo0l94LQNRzTvx4lKaejRJSokWfApVLVPhr/4cldc7bM/kGjz57E2GhPX+H6iXM00E8
	/hv90PZ36uwZRAGGvJw9KzeLkeV5oyH0MV7pzEX8DuFMlEdViclJf1lXoTWfu7tbqeb1hG9niFj
	Kj4m3CWhcTuPOT5a3dLyrq2RM1/IhIKlIu2+2fEJc67ltouINn+LMKFSK5ev4iFJedsBOPQiqUB
	WE8lUrYvdsW7owP44nSsVoKGeJhLHTATUhJa4be2bsvAI0+tmLlhKv9XSJP7w14/q0ZO8EnCGg9
	w6d0knyqR5pD6qXdEETBoCwqAfYYm88vBSxRIe4gfv3Pq
X-Google-Smtp-Source: AGHT+IFqqc2bhHXEzZRvrI4Y5xBxgIAvQHtEksfpk2Xm4Evai6R/rrODMyISMfffiky+lEFCcIEV+Q==
X-Received: by 2002:a17:907:96a9:b0:b3b:4e6:46e6 with SMTP id a640c23a62f3a-b49c146ca21mr867219366b.1.1759600967425;
        Sat, 04 Oct 2025 11:02:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a60dsm731699466b.63.2025.10.04.11.02.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 11:02:47 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] apache2: ignore irrelevant CVEs
Date: Sat,  4 Oct 2025 20:02:46 +0200
Message-ID: <20251004180246.2497728-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Oct 2025 18:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120231

Ignore a number of CVEs for this recipe (because they are for another software,
outdated version, or because they affect only non-Linux platforms). This commit
is a backport of a number of commits from the master branch (which uses the same
version of the recipe):

0e7733f1b8f51949ec91d82267d5d864ac0be16a
1b86a60f6283b08acadc50914075d93dd362700b
59d3949e3ed673bd049aadfd2238213b550f1461
1b86a60f6283b08acadc50914075d93dd362700b
da2b5e8b93c248363581b1bd4ff67ff1d8357c41
0e7733f1b8f51949ec91d82267d5d864ac0be16a

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-httpd/apache2/apache2_2.4.65.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
index c05304f96a..46106e6a3d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.65.bb
@@ -37,6 +37,25 @@ DEPENDS = "openssl expat pcre apr apr-util apache2-native "
 
 CVE_PRODUCT = "apache:http_server"
 
+# not-applicable-platform: The current version is not affected. It only applies for Windows
+CVE_CHECK_IGNORE += "CVE-1999-0289 CVE-2010-0425"
+# not-applicable-platform: this CVE is for Debian packaging configuration
+CVE_CHECK_IGNORE += "CVE-1999-0678" = "not-applicable-platform: this CVE is for Debian packaging configuration"
+# cpe-incorrect: This is vulnerability of Apache AuthenSmb module, fixed in 0.9
+CVE_CHECK_IGNORE += "CVE-1999-1237"
+# not-applicable-platform: this CVE is for MAC OS X specific problem
+CVE_CHECK_IGNORE += "CVE-1999-1412"
+# disputed: this CVE is officially disputed by Redhat
+CVE_CHECK_IGNORE += "CVE-2007-0086"
+# not-applicable-platform: The current version is not affected. It only applies for Windows.
+CVE_CHECK_IGNORE += "CVE-2007-0450"
+# cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)
+CVE_CHECK_IGNORE += "CVE-2007-6421 CVE-2007-6422"
+# cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2.x to 2.2.7-dev
+CVE_CHECK_IGNORE += "CVE-2007-6423"
+# cpe-incorrect: The current version is not affected by the CVE which affects versions up to 2.2.6 (excl.)
+CVE_CHECK_IGNORE += "CVE-2008-2168"
+
 SSTATE_SCAN_FILES += "apxs config_vars.mk config.nice"
 
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"

