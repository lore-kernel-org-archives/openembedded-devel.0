Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48535.1795411864835172217
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Us74WkiV;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-385d8a00598so3934469eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411864; x=1796016664; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPO7056Wfxx5b2QmRQg9saHGIfdXjWPGBjlhaLIV5pc=;
        b=Us74WkiVMMhOWSHddC0gk45fPClcuZeD2s8+BGSYkAYTS7HLQ75svdk78OAWLsBNNU
         bhDMV63OQe8yiS4fIDC4EuNFrEHyXRMAZdwttXL7f+8IuAv4BX88K61Rvg2iuQjka3dU
         O29/EJnIQqdo4BLTA2vRMgnGl9uj1XO/VI31bSX4/YQET8ObDU+WoZPRuUpqbFw3Q6fD
         kTgluzyKVmiWqNSFKxnrLBlZjhT5nTm7u2AXKJOhTwPNIEY3knBYiew4/e0Ip11bnsvM
         HX9wmHadNvlynhSx+eNOtYriXEX9yfyLaiqLFnL58JmRiE6v8E0oNGdjCGlrG+Y2Ie5w
         twEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411864; x=1796016664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPO7056Wfxx5b2QmRQg9saHGIfdXjWPGBjlhaLIV5pc=;
        b=To/sFbhgfuw79pI5Q5XWjLvZWEXnDpTWxrSVqHcHL65EXw8Oc8TSM+PL15KQhPzr9d
         UOUrJy9nvEJFfhFQkqatjeSS2oknbvsDga+Pc7VEXl5iqGdEXPKr6qn1yibrHDjqSEqR
         So5f22BegMn969BLg5ju0hbDTpmSFCye8KuBdEx+ZJuLzilaLkVTmzN5Tenp8W7MYnVH
         teVOsY0Yxc1W1jJdy/Gd3uKAwIfOleLVuO9U27U+JTnCQFnokyHEf3MR+e6cZxcgQ/38
         B9i4mPZPG4c8VZ9ueYAyks4wvKKkxu7DF9sp2bV8lvrf0UDJaz3HWtRGMpyCNtKCDIvi
         hChg==
X-Gm-Message-State: APuU4Z+0jEFJpWshnV/rwpqkWv5o6jwRHTslzjJkT0Kzo0DKp+JjLUVB
	wE7kIW1EWbYm19ucpJ439sJFqUrzE/JYGDfcTPdcqvpJcI/OQKQK9yD0wAWYAUn8xz8=
X-Gm-Gg: AZFdTZfEngnwDKgc7Q2najYobrgidMBedn4Relprnez5BsXFZ5lV1ss7leIr56Zk1/P
	v8GGipQHzGP9gy0a/HDktFg7Omia02c8Xbx9Z/tSu23jWmQ/4i4ipW3xzm+lQ/4SxcLscNs8OCJ
	6TU73977yAynhy0K7Nag+r1GYDlnuSTl6F9/0p5Fmd9jL9KoBM6SDesMiBFBAVHIEz36ZsGbzk5
	xixWJlXaQ8ad3scwf/gTZqOJ6qEU9CmUlW/I/57tCzeq+1rzyy/3lHTurE9cfZ+bFMmK0hRzvfD
	oX7hSocCE7GrHakNUAXCoea6onlga+8gIDy9+fH1qEbKFFCbfshpsgwYrJhbXL1rJeZ2QQkCtxf
	pqj/foTOhJ8B04Ot3f42fSHOlQ4wISyLIbGMEH9x/+pEOPjj231J3ZS6CfsJi6Qgcq/zGLCNFTl
	Npd/lVdXoF4j1AjyghM0qkB7OOtl3qkB1BwfYfDdLf9YXz5Tt3DRU2WcB79EJx0xwRHHcYwpns5
	SCeH5bzf8RfmPzkP1PkxqfENGPpdgPCf43Lyda2SP1084uUtlrT5RPEu0EFORoK4SKG37I4zqTF
	TX/OS6YJpjMpuE//XouU00QkINe2qlgmeetXZ74oWg2z0KytyyXbPJGjljwoE6tDZS4WlW3gNTt
	8xWsPQrjoZElEkRFcRf1ymhFQ80iUSubcYK+2u294ON3suTCA6Jfu3AKluNUnNW+l8du+fr4HGu
	RkVpO52gf0zunqNYUrVbDNJ87L69VdeUE9sqcWz4L8VYytaqacS/xXeB2I/51tzYMOTiB8ZcNbY
	r4/+ljTLXtUgwcKQWJU5PRtWskaxPG0gcsjkUypGmERY0YvZxgQT70miT6wAK71JlvYomFeSp+z
	DvRm
X-Received: by 2002:a05:7301:4704:b0:383:729:cabe with SMTP id 5a478bee46e88-3856f8519ecmr11644234eec.19.1795411864175;
        Sun, 22 Nov 2026 21:31:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 28/42] opengl-es-cts: upgrade 3.2.14.0 -> 3.2.14.1
Date: Sun, 22 Nov 2026 21:29:12 -0800
Message-ID: <20261123052953.3658549-56-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132843
Content-Type: text/plain; charset="utf-8"

Bug fix release: fixes glGetnUniform* error codes when bufSize < 0,
an invalid shader ID colliding with a program, a precision bug and
GCC 14 build warnings/errors, and skips tests that need unsupported
atomics or vertex shader SSBOs.

Regenerate opengl-es-cts-sources.inc with bitbake -c refresh_srcuri.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc    | 2 +-
 .../{opengl-es-cts_3.2.14.0.bb => opengl-es-cts_3.2.14.1.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/vk-gl-cts/{opengl-es-cts_3.2.14.0.bb => opengl-es-cts_3.2.14.1.bb} (94%)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
index 88eea63ba3..64b87adedd 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts-sources.inc
@@ -6,7 +6,7 @@
 RECIPE_UPGRADE_EXTRA_TASKS += "do_refresh_srcuri"
 
 python __anonymous() {
-    if d.getVar("PV") != "3.2.14.0":
+    if d.getVar("PV") != "3.2.14.1":
         bb.warn("-sources.inc out of date, run refresh_srcuri task")
 }
 
diff --git a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.0.bb b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.1.bb
similarity index 94%
rename from meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.0.bb
rename to meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.1.bb
index 2a98ba1bbb..d2dd4adbcf 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.0.bb
+++ b/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.14.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "OpenGL CTS"
 
 require khronos-cts.inc
 
-SRCREV_vk-gl-cts = "ed5729a4e50de78f577cc043627aef93af8f16f6"
+SRCREV_vk-gl-cts = "067e8832315e79817ede1c4863804e440f5d1c80"
 
 require opengl-es-cts-sources.inc
 
