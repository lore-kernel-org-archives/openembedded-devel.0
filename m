Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354FAE9DE49
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:09:42 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127035.1775718577639992353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R5eA+i1t;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-824c9da9928so732124b3a.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718577; x=1776323377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgeCjaAB2wEdQ5iZ3S7wBm0yra204DFLQn1ed2rM8rk=;
        b=R5eA+i1tSG60I/0VBEQUkReTr+qsxMx4jPTX4Ek5yNDxkKSlNzhpKQ7+CEWuXMZZbC
         rbJ/5z2SYcDhkSzd9h/Hi3VTdh9+DSqRSg8CiVxPD2wO/9UVB2qQ6DrT9k+na/Mfkhhu
         TeY0fvMO9hM7IwsH5qkGgsTgZ9IAHBbXSqvDMkJghLPf5cmLlMMzi6TobPXggjdpKJho
         0WCM0wGasSQRlZNvKhRcc9ItZ1ziplnPLaMmgbOnd2AcvQc3wHUXrPVrzM7l+IbK88Wk
         hxmheCK8PgrAYjXLI2dYxxCYv6k7MjLaAvTZ9bJwtkd6bQ3kFWy/w01UJ9Z5WNh84FZG
         +Hbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718577; x=1776323377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgeCjaAB2wEdQ5iZ3S7wBm0yra204DFLQn1ed2rM8rk=;
        b=Umwyig3CwMTC55a38Z0xHWPL/fVL87jvf2VUG9cwfhrQmMxEQ5vj/rVqxSUXNBZEF3
         D+Y8Xn5uzfBcjarNE9QRLZHCCoKAi8Zt1ch2UDm1TAATaEAsTw09OpUUA5B2KvchNwnx
         G0o04GHHIZ7ul2SNSt4iNd9LlTUYa681tqissNzuRiNlTmF7TsLgmmHgQRd2oTzExWI2
         B3SWrk1XOCxKAsHI/zkmBXwdutbsls4fy0zeJj6mrJ60be5vQZ8LNYK7byjj3a5lpZgD
         TxRG0J7rPHn3Fyf4hI/x9dthpiTllFK9n2SIqfoGY2/69sv4nCtYnExVckScnMUyjDQ+
         AFTg==
X-Gm-Message-State: AOJu0YxFBeiDmUsTJOgVCQrJuYGji0mF8oqaB8pzYriiXPH72gAGISRF
	dDz241xlHWI5xXN8GUrgDAH9TILwx/ZbZgMBAzuJ99C90C9sXRuyY+sx9f0tSw==
X-Gm-Gg: AeBDieuLcngiAdrcMuK94DrnZLCDVxf96AWB+5Hb+PcXyaUU62BY3lQeKPKkeypyhxx
	NMMAwFVz16OCENNpZvJh+aYpmd57DPzd3SUsp3y525dJNp+qB0u7RVHQSfFlQ5wCkjCgVl5lfxA
	JogYJhgn5wO4hFod+O+UdRm1jImvbNBWljLBYg041ys0A76DILcL08/dbRbtPWgZHTg6RNufdDt
	LHxxj6VhhC8JtWEhC628DrG/2xr9i6zaN6jYWMsm/vFkBY3pPcWatfpaSBmCG/d058xM7ykMFko
	pNichX/6E8RILztxh2E9ztE62+VnpqdvcZtUT0u4VpLbM+UaKsTFkAqNe47F3LQQHwbVPZ/snLc
	NYGUfC2qlFaq1Bhluw9wnPZ0kR30y8bDz4SlhaneEbzA8CAby6aikzqO7Bo6bPvw5sCiOim9nH8
	4kYaGaHloQmTF6MK89r9A/Z256jco+O1k9YZE=
X-Received: by 2002:a05:6a00:2d10:b0:82c:9c47:fef9 with SMTP id d2e1a72fcca58-82d0da34535mr22799026b3a.2.1775718576880;
        Thu, 09 Apr 2026 00:09:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:09:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 4/22] freerdp3: fix CVE-2026-23948
Date: Thu,  9 Apr 2026 19:09:01 +1200
Message-ID: <20260409070919.3968586-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126126

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-23948

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-23948.patch     | 55 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-23948.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-23948.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-23948.patch
new file mode 100644
index 0000000000..4e232eae0c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-23948.patch
@@ -0,0 +1,55 @@
+From b5693e6cc688e7cd36016f53392998b1945ff7df Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 19 Jan 2026 20:11:24 +0100
+Subject: [PATCH] [core,info] fix missing NULL check
+
+CVE: CVE-2026-23948
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/4d44e3c097656a8b9ec696353647b0888ca45860]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/core/info.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/libfreerdp/core/info.c b/libfreerdp/core/info.c
+index 3395e4d2e..81e59a060 100644
+--- a/libfreerdp/core/info.c
++++ b/libfreerdp/core/info.c
+@@ -1424,7 +1424,7 @@ static BOOL rdp_write_logon_info_v1(wStream* s, logon_info* info)
+ 	return TRUE;
+ }
+ 
+-static BOOL rdp_write_logon_info_v2(wStream* s, logon_info* info)
++static BOOL rdp_write_logon_info_v2(wStream* s, const logon_info* info)
+ {
+ 	size_t domainLen = 0;
+ 	size_t usernameLen = 0;
+@@ -1439,11 +1439,13 @@ static BOOL rdp_write_logon_info_v2(wStream* s, logon_info* info)
+ 	 */
+ 	Stream_Write_UINT32(s, logonInfoV2Size);
+ 	Stream_Write_UINT32(s, info->sessionId);
+-	domainLen = strnlen(info->domain, UINT32_MAX);
++	if (info->domain)
++		domainLen = strnlen(info->domain, UINT32_MAX);
+ 	if (domainLen >= UINT32_MAX / sizeof(WCHAR))
+ 		return FALSE;
+ 	Stream_Write_UINT32(s, (UINT32)(domainLen + 1) * sizeof(WCHAR));
+-	usernameLen = strnlen(info->username, UINT32_MAX);
++	if (info->username)
++		usernameLen = strnlen(info->username, UINT32_MAX);
+ 	if (usernameLen >= UINT32_MAX / sizeof(WCHAR))
+ 		return FALSE;
+ 	Stream_Write_UINT32(s, (UINT32)(usernameLen + 1) * sizeof(WCHAR));
+@@ -1510,10 +1512,11 @@ static BOOL rdp_write_logon_info_ex(wStream* s, logon_info_ex* info)
+ 
+ BOOL rdp_send_save_session_info(rdpContext* context, UINT32 type, void* data)
+ {
+-	wStream* s = NULL;
+ 	BOOL status = 0;
++
++	WINPR_ASSERT(context);
+ 	rdpRdp* rdp = context->rdp;
+-	s = rdp_data_pdu_init(rdp);
++	wStream* s = rdp_data_pdu_init(rdp);
+ 
+ 	if (!s)
+ 		return FALSE;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 18795551ec..c570e5fb7e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2025-4478.patch \
            file://CVE-2026-25941.patch \
            file://CVE-2026-33952.patch \
+           file://CVE-2026-23948.patch \
            "
 
 S = "${WORKDIR}/git"

