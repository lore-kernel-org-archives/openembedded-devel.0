Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF11F45A1C
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 18:02:36 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.278780.1776103353429457981
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2026 11:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UsDuwolt;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so3520732f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 11:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776103352; x=1776708152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNswvFMWqVoH6MgHczXagHVD3px8lhIbrCY0+IQMHTU=;
        b=UsDuwoltdnEcxnfiL5FlBShbHGJ9PGFb7GvS3s7Eo3QOq7XBj70T1PIRnVQoQNAfUl
         U/nds7H9VZjC1SxrE4NMdS6fl29H+nkQbBgrKEG0M1H9vsgpdR7PEehYpEUbQuszTey6
         7eLdg4qqUlM8ofWKHB5GLFQNPpAbVD2QH/a9YGNgcpVnKn7TcjIp9EI0aHz2PIbL4GHK
         8TIsPaDzm5Jvt1QKUNJARl2eHkqo8FkyOfgPszf7gUon5oS9galj3i1wOoGkav+vkLII
         nvsn5PWf8rER314Ok/z6F2nvsNKxX1QAhkAraE2TZhE3rFv+EW8Q1iIZ1dlAZzrc/wM9
         NRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776103352; x=1776708152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNswvFMWqVoH6MgHczXagHVD3px8lhIbrCY0+IQMHTU=;
        b=bQ0fXcIBzgAR7AUjxFYlBxkPhiZZKtkEL3W3m7Z3jaxKqddyRxpFItx1VjKrnmV3yS
         6HA7obhqhipf7Z2eGMueDrUdZdhSX8d/Masd5AcVM7JmqQCR2qg49V9G+zl2POnHjT6Z
         DaF/AUfc3EM2diLtUBXyl2nb3YITJsapmlNWF5FlMJXkZkOSUzJlNDLe+Wb9aWkwebdZ
         lcts2YZ545EON3kaMKi1FiB0dm5phvKwen0dUeHtdJ6VqEswCa2Rf0NZ3ZLKUWoFKmwc
         pQ3S28SLHlZp6uHaIynrsWL8O2s06Kn/MoYJySY+OsxqCYgbgoe9CbcRLid4Eu79vAgw
         hAaQ==
X-Gm-Message-State: AOJu0Yzvhbg62/XvOLsJcVct+P3SJuRJj4+TI6LpaB4o86KHVf6w08cg
	FydOe5zF0NwY6tFbvt1o84corWOPM4xFI+f8abmS9as0oQyqV0y1aoyeQblGYA==
X-Gm-Gg: AeBDieuGx3TneWrM9Be+Zr/DsXTls4MbcOaRAr4dB+gO5teztZ/sHsXPPVMvDtsAh71
	ctPeDoOOoC6M3pNMS6V6th3iMhRrdknfgmcX0KrvotvLOP1WMNSA43VzLq2Ksot0YSswvPx8OEz
	WmFHB/stFsac26/LTQL94Zyvur+TrXIh34gWXNjZOIZcABOXe3CJx88710aS6jL71YT5sU6XDLN
	av8dRG1YEcDRwtjYWHWx9ykGm7ZbQhMX5XWSXe1cq5FiWibV9u9duiLi8/0qsVl06vO7+/uVeI0
	7ANs+1n0Tt0vOgo6APIvAiUwmfjFA5jXn1oU6AEAJuJFndvjvDFMfFIC9ftShllHBr4fpbqyHbs
	AakHCqgFsucCVwssmnQ7HZ4dORenoF7C4ZuamzSHSgxMAxeX/AsesxoRcCuoDE09zxHG7gbD5I4
	NMKiwG/sxUeQGeUKKzoYYM8qz7/9+jduizRGu0s52d3g==
X-Received: by 2002:a05:6000:238a:b0:43d:7883:87c2 with SMTP id ffacd0b85a97d-43d788389b2mr6678046f8f.39.1776103351656;
        Mon, 13 Apr 2026 11:02:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d762decf6sm20841686f8f.8.2026.04.13.11.02.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 11:02:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] libraw: mark fixed CVEs patched
Date: Mon, 13 Apr 2026 20:02:24 +0200
Message-ID: <20260413180227.755337-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413180227.755337-1-skandigraun@gmail.com>
References: <20260413180227.755337-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Apr 2026 18:02:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126285

These CVEs have been fixed already in the current version, however
NVD tracks them with incorrect version information.

Commits that fix them:
CVE-2026-20884: https://github.com/LibRaw/LibRaw/commit/aa4458eb511daeae90676c1ce5c587106e4aaec1
CVE-2026-24450: https://github.com/LibRaw/LibRaw/commit/c911c9b9edffa5fab99f828d0fee6dd2d0f6105f

These commits were identified from the changelog of this version[1], which mentions the
Talos ID of the vulnerabilities (and the Talos ID is mentioned in the NVD reports[2][3]).

[1]: https://github.com/LibRaw/LibRaw/releases/tag/0.22.1
[2]: https://nvd.nist.gov/vuln/detail/CVE-2026-24450
[3]: https://nvd.nist.gov/vuln/detail/CVE-2026-20884

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libraw/libraw_0.22.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
index bd0a4c0b03..2e11a7f1f9 100644
--- a/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
+++ b/meta-oe/recipes-support/libraw/libraw_0.22.1.bb
@@ -11,3 +11,5 @@ DEPENDS = "jpeg jasper lcms"
 
 CVE_STATUS[CVE-2026-5318] = "fixed-version: fixed since 0.22.1"
 CVE_STATUS[CVE-2026-5342] = "fixed-version: fixed since 0.22.1"
+CVE_STATUS[CVE-2026-20884] = "fixed-version: fixed since 0.22.1"
+CVE_STATUS[CVE-2026-24450] = "fixed-version: fixed since 0.22.1"

