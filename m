Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E54AC79F9E
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:38 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31907.1788776616412891076
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kO/bjvet;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71ae3455aso50354325ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776616; x=1789381416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8DdMkGnyqawS0RXP20RuvauKKd61bndJCGo6LHadSd4=;
        b=kO/bjvetptaNQHUD2XutCbXJa3EMUET6d6hpJdBwscGk+GzRm0K2QUAmegJK+Z9e20
         YcPX0csbyLaxVcTlu1i6HDFRbuQDWf5zO5CmUNSbYabHrfRGFyfy9lCutVALnTlByMRw
         eHdBJzsKBhD63wp6Z6S3lHlB6pkNg+t+EzR6c/P25AMveStScQXvG9FR9vUxFUSb4eTv
         2P03EAeKqEQw7uCZaPW6UrEF0o9yHD7rZt0YATKXECwB9j5lvnoa8YR7OI95D54HX6sS
         q5t5Nl6nKXelAbp93dFBJFdqEvzAW0L5gKvR7Me6olk38SbT5AcwwYSnWxYrdclLjFVu
         IXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776616; x=1789381416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8DdMkGnyqawS0RXP20RuvauKKd61bndJCGo6LHadSd4=;
        b=GNyH+2Sew12jcqxx1kpIp+XDuw8kZyV2+raSPbTZe19FsLznRNoAwDNvcEIAuVOjfB
         iQyrX0eVPjQEPSXBdcP0izebBEBszs0qUDWwgaea/XeFpokMm3ULhK5K+FZyLGybmzLL
         U7rBA1m8Eur/T21LxGsMtrVfpG39emLGF6YFBd8htDPKANKl0hqsz/H9EB6e47eP/7db
         iUQh4jA+FGDzCwYwjOsLmlG7VOK4dNbaPh/doop/AoyvD4/fbM+m3PSKLLy4FhaB+n/k
         ld6SiePTHx36X1mHlV7FcHM8W4XEbcCzqMiEDdnUBAw9WFspHSJm2SGgk4HcU6gZrajd
         O9sg==
X-Gm-Message-State: AFuF++nQTouIwcfGpAc920VE3i8sG+ahtntm2F3MOey4MbOdxOHWrBjR
	KqGVlg9DOHa81J3XVOMVs+QD0m5EuIKQVYC97wDZI1+KQhaKlsGSSusp8RuBEusa
X-Gm-Gg: AYBFou0RtUSnW7NHg+9ysBXahgxxyGsNN3HOsfwLJBKT/bd80r4voKrLMqYREMl2vF/
	YiupugjFnz5UOiLFwbBMcaOALWNoH1G674FVunib6VoVcaywcK0cwQyiRoeN/HUthXH34JdY6Os
	0/I+gr7XMMts/rbPZaffEPO6fXeKfxtpUIJ40PhUkGd+k+ASEf4ajns2oV8oAdOBj1gFhH2JCAk
	HI8J4HbmrrbQYo7ZyqM2zIP2JoIs+BOsF3lnMUUKFQmscBihbjPnciKLFy0+2ZRGhsPPFv0Uols
	QcfMdJRkc8DcR0Yw7gGR4l9btT5YD6gRTyKiawInZKzwPLpzw5zVYrJsrs2ywNm6ltRrRqtkP2L
	Q+osOMjsmXwA4LE6NyeLcFlwVpPuub0EMa3kwgG/TZUnXTZe71QtBEAJ/iCvNu1pJ2aUwlMedfC
	I9cLHSlTlKzjPaLnlDfw0HIYYwUz2gpIOc3t4s8f/NU77RN2HQnBi087u9STvZ3AxHgnRSF0T37
	DEq4jX90HQ=
X-Received: by 2002:a17:90b:3d48:b0:396:5f7f:52f5 with SMTP id 98e67ed59e1d1-39b260e13e0mr33443552a91.3.1788776615623;
        Mon, 07 Sep 2026 03:23:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 4/33] libssh: mark CVEs patched
Date: Mon,  7 Sep 2026 22:22:48 +1200
Message-ID: <20260907102318.2459883-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129816

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog[1] also confirms the fix.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-15370
https://nvd.nist.gov/vuln/detail/cve-2026-59843
https://nvd.nist.gov/vuln/detail/cve-2026-59844
https://nvd.nist.gov/vuln/detail/cve-2026-59845
https://nvd.nist.gov/vuln/detail/cve-2026-59846
https://nvd.nist.gov/vuln/detail/cve-2026-59847
https://nvd.nist.gov/vuln/detail/cve-2026-59848
https://nvd.nist.gov/vuln/detail/cve-2026-59849
https://nvd.nist.gov/vuln/detail/cve-2026-59850

[1]https://gitlab.com/libssh/libssh-mirror/-/blob/libssh-0.11.5/CHANGELOG?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 612cfdbb19..752bded528 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -49,3 +49,12 @@ do_install_ptest () {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: issue only applies on Windows"
+CVE_STATUS[CVE-2026-15370] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59843] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59844] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59845] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59846] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59847] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59849] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"

