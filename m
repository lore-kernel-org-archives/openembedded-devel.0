Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76752CA9ECF
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:53 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3514.1791763851996338735
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TZLCV8NK;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so899881a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763851; x=1792368651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tq4Jyy0Md+hDU71NW0upmsmT1bjck2A5lshkdE8RtuQ=;
        b=TZLCV8NKhKMQXR1nCX5XE3tyxEUQW53cxZZxWnUB1uLBoTE18G+wCdiiHvZajlX5Q0
         9MgB+WZoH/3hzA4LYo2rUokxWmeJZUAi3wTNXSHRFCFB4+xoD0/DsX8/z6Pkz1Cj1TtG
         cJ5smzfmuHehit9Z5yAVIGtqOu5ArRbhX51mu/XaRvUdhEUs8FxMgo/e+yMiVPB+c1jD
         sFX3ZeQyjNlmdmrussvkolAv85sOfHuCBmlt5QtXCOCrJfr7AfeW6zyffO5HMNyHG0iP
         AIccF1c8pbnFzf6ISop5FFueHhyaoCa3CaFt9hW4lRYKSPH2B24eBQqqFCYFoD3p4NxD
         fdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763851; x=1792368651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tq4Jyy0Md+hDU71NW0upmsmT1bjck2A5lshkdE8RtuQ=;
        b=Q/cA6URF3JyBITcOVmwq3arRDtF+6VDowJ8lljd0LYLzPVKFfylZLOhlWq0d5L60PB
         ya9szWUd0Zm5mNpCFsWPuZQQfmX+uE2Z8Qdklg4m0j6mc6ujcf2dayqAR57Yh2vQAQiS
         A0iwvq/mqXGRGSwldPVrMW325FKX1FjE1iZVdarXR2ve0Q1HskiK87x+Vwvb0Cbn57IB
         E5+lFnYZzm2Rhp73akhuMCfuzXFrHFI7emVSBgpZT6lNKD9ka+zkSewqSGYuD0VDHC23
         3/fL0JU2A5R7CEwOl5UhFPmU8iTyO/0P2SAm+U1JmnCoMgTxnpMP2OOeKg5j/KwixGck
         QH7Q==
X-Gm-Message-State: AFq9FYJYeDuBZNBMaQFXwbzH5ffb5za1XYhvWhdTrmm2U2xk33oVGS/E
	ttMtaSXcxuQjtVnt3uwO82HrZdGU8ANHD3r+4If0SuWF7WSp7mqcf3ML19nIBw==
X-Gm-Gg: AYBFou0QnFYE1EFtuJ5ztQg7vRJxqsc3+GWPxxMBVQQNl4fX+gJRn6UHGq2yyqLauaW
	mki9t15Xeohz4d9iFmG/bxI/aIvxdr7H/J5t3h5YC0Ow7UTLuWsTqnce78UqnhHMOSEfRWUeVHh
	mOEWkdZUcP9j/um7a5Pua6x/DSyDdpoUIm13qwVfLaUZ2HI/XFvXI2boPOpT/bgSaQgtZetra0b
	0BbGZvF441DDwXGj98r/8MHAeAifA/C1kK9rxpxOsmVRKlB/LfW3HsPqcZmQu8tTdC9wQryulTw
	m1hE9IV27YrYskdhzZ6JSJa85atcPaUz5Ww1TeSItDMMRfGaACbWlw/E6cHlcaV5WU4P00gMDmX
	D+kNmaYPfFffvQLMigVlPVaynfRPkweMbQPJsI4xWAa5qU0Bd0vLL3Au0g9wHAJHCRDZ2vInS5X
	+dczTFOdXznimrK6fYom0lA/CMwyynDI3Lxi8xDAIsfo4MfXdINVyr8DHJU+x7nnW7CjEzOZA7l
	NJp3T/P73tc1967vwBNpJm3Ul6mkyaDJ1IyYFs=
X-Received: by 2002:a17:90b:224c:b0:3a8:6045:5a19 with SMTP id 98e67ed59e1d1-3ab3a8ce938mr6606619a91.37.1791763851316;
        Sun, 11 Oct 2026 17:10:51 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:50 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 14/28] python3-gunicorn: mark CVE-2024-1135 patched
Date: Mon, 12 Oct 2026 13:09:52 +1300
Message-ID: <20261012001007.2541673-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130739

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also identified the commit.

Details:
https://nvd.nist.gov/vuln/detail/cve-2024-1135

[1]https://security-tracker.debian.org/tracker/CVE-2024-1135

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
index 545947446cf..e19be893602 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_26.2.0.bb
@@ -41,3 +41,5 @@ EOF
 }
 
 RDEPENDS:${PN} += "python3-setuptools python3-fcntl"
+
+CVE_STATUS[CVE-2024-1135] = "fixed-version: fixed since v22.0.0"

