Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89C6D4920B
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 11:57:54 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11029.1765540673740195886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 03:57:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M4e2jngv;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so996132b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 03:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765540673; x=1766145473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K9PvyhC1rmakqnTQ0XdE/XqD6DQUQBlXaDBj44S8k4=;
        b=M4e2jngvwPf4xXycUKAyNg7Q3BjubP2mSek/BL+T9wbhI/3v0S7T3/454fk0DLYwLv
         i40/yXwh+R+wTUPavq6SfYC5Q4zEDj89imTvvup12NjgTsNL0QxwKN/e8+stNOB5ZIBc
         UAWubvg2Wiyx8pnwEaPl7wVYou9QMRiEDocmswTo2EusCy8UELh8zEcYAa8smIbeAHx4
         cvKjDAM/ffoVMgxitXdt0iiK1jiQ43ZTbMWiEwUHPNZJMHDW2k2drpNSvQqnz2E58wjX
         0CREKphtsS7L1Tk62c52j9xgYLQml8Kf2NwLDhN9e+nHM9ivgfC4Tb97FAQsfMQrtyDD
         9a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765540673; x=1766145473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1K9PvyhC1rmakqnTQ0XdE/XqD6DQUQBlXaDBj44S8k4=;
        b=wa153wsSxyFeK76AdrgmcUyzddynXAZstYG71Mn4aH5Eeeo+7Ipm0BN8a7MHXs68Vn
         HEVp1Ssj/ea1sCCZehJ/u7jKKrF4wRsWbxBCPjj9d7VsxDKSUgwZEW4u0u3OyqVFxIvS
         I8CTQUQqWnxTVcuxLRmFs5V+wCC32yLN9+cJ7exzJdjJONoaFirwRm80NElnlz2q0HnP
         tl1YDULSF4TC9gdv4f0mKqdZql1BnkBQPua15veCpPVCNRDBInIGPKroTFxf4oKlIWO4
         oZPPjl8bhSTlkK/wqNkuYMCH0bl5/zHe7ZVBJZ0K6wbY54p3qFciqSVu7t8D2O7ISGWz
         M48A==
X-Gm-Message-State: AOJu0YwsaHWy4iPN8yUrtGjb7KN3R6B38K8j9qpetfx+r+wEeL6YZ//T
	0dQIeVIcWYOUFL/wjBxzPHSlRYIXOujGKHiP38x9ASoz9P9/JC3TGkHGUncYoQ==
X-Gm-Gg: AY/fxX53NNWs5WfXjuYb5ZuvLT/TUwRN7Wv2f6+nOPA4HQpJc/y3/bjTsG2HIWNsUbs
	2vlIoItLsEjF3lvwZS91AYLrGjf1I3UbUa7Y01QhL+U6s6qaaRXbatgB0f1/hVg2ve3lFqBVbFb
	9dZ993g6lfxSqdClGt4PaTDosNr8n1PlRTJ/ASEp03hGUvvmG8EkRmhYju05DDnoR4899Vj3ANJ
	rEDLegZyqI5ItMyMcPrMktYydu4se7GahxBQmyVwAyEy9M240/cWWoP9u3SO9VCOmH19Tw/FhTS
	ll428U2ZVvrkYhyNZ89okMrKj/PoC75rM6S8/KOkxzhltwP45VNjbSDp7NUj00sefn/R4vcnnvW
	tLDKBjASucMtcYh5s8Vgxfe1IpQ6xjkLwiddSlTMQMpoHiFL9x/Bz3kjxIKYkV4s+DFccfgqTqB
	Oyj0d9vVA3fxf9fgalzH+By+E=
X-Google-Smtp-Source: AGHT+IE4AIHc4qaXJnnMu4JEF7AE/wMhD16YQEQBqNmEXTbYaJ7N8rIaby5Z4yWbwQtG9ew2I/Vkeg==
X-Received: by 2002:a05:6a00:4c12:b0:7e8:43f5:bd38 with SMTP id d2e1a72fcca58-7f6692aae8amr1921118b3a.36.1765540672852;
        Fri, 12 Dec 2025 03:57:52 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27771b3sm5163198b3a.27.2025.12.12.03.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 03:57:52 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 02/15] python3-moteus: upgrade 0.3.95 -> 0.3.96
Date: Fri, 12 Dec 2025 17:27:31 +0530
Message-ID: <20251212115744.569676-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
References: <20251212115744.569676-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 11:57:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122602

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit ddca2bae90f702c45a1c84e4af5fc086d52aaa50)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-moteus_0.3.95.bb => python3-moteus_0.3.96.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.95.bb => python3-moteus_0.3.96.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb b/meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
rename to meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
index 27dd6ef82b..99d36791e1 100644
--- a/meta-python/recipes-devtools/python/python3-moteus_0.3.95.bb
+++ b/meta-python/recipes-devtools/python/python3-moteus_0.3.96.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=3;endline=9;md5=24025d3c660abfc62a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8607d7c841345ba88fafacc98b820129176e877f5b13176fe5acb4805cc22281"
+SRC_URI[sha256sum] = "b30d63a38bfc834e0bf8154d2f8cead81fbeaee38f14fff0ef2a40f620ed11eb"
 
 S = "${UNPACKDIR}/moteus-${PV}"
 

