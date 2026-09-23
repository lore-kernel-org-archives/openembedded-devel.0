Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6628C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:56 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4175.1790160114582416909
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J1kGf+yD;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-853e2610bb4so985547b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160114; x=1790764914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrVD3FYHMCNipLDCuqzOOamFAF7U3OC3+4rS77NFgYk=;
        b=J1kGf+yDI79IdS5g9gqNVM5qV5d6TosvhBCH5FCw7aPHmag0GYQy92lvSXqu+gUiGx
         Lzufx7KcSl287jhoeS8rpYqRvMcktFhULn68JcwBhYPfJTLS7YR6xJoSg4w5/mJPKtz2
         vsmOFdK21FyVFQ8CqeYsaViQs/w+3Ukg/owfWKaoOBR2ubMT4S6+rXshrfratpZDU4fj
         mhdtaKW4TvNxC3qaKrWkDDhtQQHt/Xh9JhMOAtVCK9ZnaiVE/sTFgZLIsT3ej/pKSmbt
         ln/ezVDWVAlHgt2MXrwmgv/MTPBTtaiLiM0Ida1+DF0hRQOrgKvV0ocVVZ8TRfnNScoL
         RS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160114; x=1790764914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LrVD3FYHMCNipLDCuqzOOamFAF7U3OC3+4rS77NFgYk=;
        b=Kb2FNBLCaTAU4+5c0R36C+Kt/bXdidqa7BCnYQG26xvUu0K6WmZgLsOByzydZAiYN1
         bXytJsvH9ikeq0DedWnCKjp3a5CUBLz7oe3JA6HO2Md8If7WgrZ76/ppg/OSV8QpJpbA
         tWA8JxfHO0UnWkUrd4Kxm22pAZxuxw0VXaIX5GgvrCGeHI0fj1WsZui+tL7BLtQotqh4
         r0C6nxcnioSOWM65gIOne8E65QW/V/l6cpEkQuKEEn4L5obvd4kDLavTpwxYwACnWi1T
         KawqSCLOOYMwtvMDFnr5Yw6vClidOMDUUTg+fMPFD031LkWjYA8LP0Li6CB+Q9Xmvhrs
         IDdg==
X-Gm-Message-State: AFuF++lN/fe1ld/nTMr7RChaUWb7nfuvTzrF6t2/ZBHWTvCV15M3m3AL
	JExfNYwTsJzUaYmsa2Myf4KwvmDVf2d56X/sjQtdD7lNheR55oAY4/frCia0Pg==
X-Gm-Gg: AYBFou3T0bNf6zemCGaIZVizd8QxqFKdaOhUMixdi5bRllx3zaBFh65+TFw5b4e6+zb
	+JZGQU97sa7gqLXJsUWvgtLuh/+SxD8KI34oL5hlzwxaQQjSQSb7Q+UPCqtUfBA+i4qNcSMS07d
	ia5wZftSDa384HRApBphkSWd0LThIacqxG3SPLEmbV86E0x3TIKBrHcKJB0TDaT/u3CBmhR4UP1
	YZwHtX0+hmg5bElrrhPsxAOCAPMOrcLhjGO7xz4jxEZfksOKQR2yEC7UMFQv3q/CA2zkWmTl5Me
	/hkYJhn7maM22cFh2/LqYV8PAjM7nQPQiohKRj/elhIisslvr0mFblyPpPH1aeseJMdL+5yakCG
	Rwly3qBBdTVO/3coJ6o8PJiwaCgH2Fn4R1dtoTLPZMhkCpAZPsBG4/rs9Qpn83xOsewL/lV2KuE
	wKEFoctiAOrSxYwoLN3nVa8duYd8Tb25rjeJhHiTJPW8eBFN8qJoo3coiuJM9HFW7cD+Ns5VAq+
	2IR3TZnZ4AGo7cS4Az7qls=
X-Received: by 2002:a05:6a00:14c4:b0:874:72b6:7daa with SMTP id d2e1a72fcca58-87c84e181c5mr2660366b3a.37.1790160113894;
        Wed, 23 Sep 2026 03:41:53 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:53 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 26/42] ntopng: patch CVE-2026-84990
Date: Wed, 23 Sep 2026 22:40:40 +1200
Message-ID: <20260923104056.457360-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130213

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-84990

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ntopng/files/CVE-2026-84990.patch         | 53 +++++++++++++++++++
 .../recipes-support/ntopng/ntopng_6.6.bb      |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch

diff --git a/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch b/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
new file mode 100644
index 0000000000..0b443e3050
--- /dev/null
+++ b/meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
@@ -0,0 +1,53 @@
+From 2f36e393fc35f576d7c447af337848e81990b084 Mon Sep 17 00:00:00 2001
+From: Alfredo Cardigliano <cardigliano@ntop.org>
+Date: Fri, 17 Jul 2026 11:51:03 +0200
+Subject: [PATCH] Add admin check in conf backup listing and download
+
+(cherry picked from commit f912ee93bc143330b6ff3bb946ee7211e5ee9e1a)
+
+CVE: CVE-2026-84990
+Upstream-Status: Backport [https://github.com/ntop/ntopng/commit/f912ee93bc143330b6ff3bb946ee7211e5ee9e1a]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .../rest/v2/get/system/configurations/download_backup.lua   | 5 +++++
+ .../v2/get/system/configurations/list_available_backups.lua | 6 ++++++
+ 2 files changed, 11 insertions(+)
+
+diff --git a/scripts/lua/rest/v2/get/system/configurations/download_backup.lua b/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
+index 1603a94c48..404b09ed97 100644
+--- a/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
++++ b/scripts/lua/rest/v2/get/system/configurations/download_backup.lua
+@@ -12,6 +12,11 @@ local backup_config = require("backup_config")
+ 
+ -- ##############################################
+ 
++if not isAdministratorOrPrintErr() then
++    rest_utils.answer(rest_utils.consts.err.not_granted)
++    return
++end
++
+ local download = _GET["download"]
+ local epoch = _GET["epoch"]
+ 
+diff --git a/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua b/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
+index d901a876b0..8a08ad15d5 100644
+--- a/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
++++ b/scripts/lua/rest/v2/get/system/configurations/list_available_backups.lua
+@@ -8,11 +8,17 @@ package.path = dirs.installdir .. "/scripts/lua/modules/system_config/?.lua;" ..
+ 
+ -- ##############################################
+ 
++require "lua_utils"
+ local backup_config = require("backup_config")
+ local rest_utils = require("rest_utils")
+ 
+ -- ##############################################
+ 
++if not isAdministratorOrPrintErr() then
++  rest_utils.answer(rest_utils.consts.err.not_granted)
++  return
++end
++
+ local rc = rest_utils.consts.success.ok
+ 
+ local order = _GET["order"] or "desc"
diff --git a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
index 57d2848ace..11c4a2d3b6 100644
--- a/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
+++ b/meta-networking/recipes-support/ntopng/ntopng_6.6.bb
@@ -18,6 +18,7 @@ SRC_URI = "gitsm://github.com/ntop/ntopng;protocol=https;branch=6.6-stable \
            file://0001-configure.ac.in-Allow-dynamic-linking-against-ndpi-3.patch \
            file://0001-luaengine-Use-lua-5.5-API-signature-for-lua_newstate.patch \
            file://ntopng.service \
+           file://CVE-2026-84990.patch \
            "
 
 # don't use the lua under thirdparty as it supports cross compiling badly

