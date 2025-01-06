Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2732DE77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 15:23:33 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.62045.1736177007707532500
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 07:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Z0w/a9Cc;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso21635349a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736177006; x=1736781806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hCRVx9+J/NX/z2kwzJbPda8gTIXQnIAhPQGA/KvM32c=;
        b=Z0w/a9Cccv7B+AAevw1gB0wuHnTUiAIJaw/1nyG/dpIWg0B2rqDcPVmH7QMFeNkLTk
         sqvj8sQKiOIdArNjAr5XqJQhZuH1hoAWdlwTXl8Mb0XeCK77LR6Y8Ew0PY9f30PTE1jf
         Es9HwDaWdhsyCESHN0mlJU6BWncMtfQs2NaFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177006; x=1736781806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCRVx9+J/NX/z2kwzJbPda8gTIXQnIAhPQGA/KvM32c=;
        b=cxmi8BnkflFI9dl+bXPgxeyVrSA0rMsV5YaVlqp/EOH9KG02ylp1RTaAutPd3moWxz
         35sVbZy3EVpZ9gsPM/hYqDG8X93SKtGaED0MI8Et2eJfEBiBewT01OJaqPc5DR6URVy/
         JjmCSlSw/aFKvRs7kGgnwWZSZBygolg2qE7YFsgY1GWvob/H51lW5Tb9SYdLyOKr0sOy
         ebFt2b+G+MXbz8LyklyB0SttJegZkNfjAGiWaIBxmOtxnJlfqJmleTsAMSZW9KEXsCyZ
         I9hdchoCQi+d62EPwSigD4yCmrN3818DLaDtCzzQq9v/03PkqXQPAzECen342Pa8sCIB
         oB0w==
X-Gm-Message-State: AOJu0YwtSWyrAD09SpSQIs8jQTqZPPDRH0piUK2n4zNze9onMR2cKXlj
	mj+WsOSB5Rl7LPdQT5BtBrgzB7LREf2RmaTtq3L0ye4yg0a4aXR327s6V+JqPdOijOX+rQdGuy5
	7
X-Gm-Gg: ASbGncuO43Q+M5Bvj47f+hi3kWZtkL7cwgyBcVYsu6ES2FziRVfpYRvH585fSiyYjLk
	orMWvm7gZ1rNXeReoGN8CFQWXDfb4nzPr+RgeT+VCv+0WM3zLTocHMvYnKkftV3hsk0hajkyUev
	cLafXMCtFCdjrHLjTWaZ2lnX2MO4y0kORGnRFLvqhgTV0Hjou4U27kWPcf++3VnQ6HoVQI3981M
	oCHc5a5nCCIiYgkuaLZchgK3pA943dn9HGbUd3CQuZA+VHXQnTWayK6zhqANB3gBtbCIHg=
X-Google-Smtp-Source: AGHT+IES0r+7rGapaJZgr/ZpHtPiW5fsTOCctdJt5/bizyfD8+OPLulxwhHaHjqvCsaKZ3e2A18vdQ==
X-Received: by 2002:a05:6402:350b:b0:5d0:c7a7:ac13 with SMTP id 4fb4d7f45d1cf-5d81de33ee2mr125833725a12.34.1736177005790;
        Mon, 06 Jan 2025 07:23:25 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fed4e1sm23893179a12.70.2025.01.06.07.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:23:25 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-tomli-w: Upgrade 1.0.0 -> 1.1.0
Date: Mon,  6 Jan 2025 17:23:19 +0200
Message-Id: <20250106152319.728893-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250106152319.728893-1-leon.anavi@konsulko.com>
References: <20250106152319.728893-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 15:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114664

Upgrade to release 1.1.0:

- Accept generic collections.abc.Mapping, not just dict, as input.
- indent keyword argument for customizing indent width of arrays.
- Type annotate dump function's output stream object as
  typing.IO[bytes] (previously typing.BinaryIO)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tomli-w_1.0.0.bb => python3-tomli-w_1.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tomli-w_1.0.0.bb => python3-tomli-w_1.1.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb b/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
index 8a8a48467d..dded2cbf42 100644
--- a/meta-python/recipes-devtools/python/python3-tomli-w_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tomli-w_1.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/hukkin/tomli-w"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
-SRCREV = "19099125f32e7c491603e393263754262b356956"
+SRCREV = "179105660c367874818f2cdd1e06ed98eea668f1"
 PYPI_SRC_URI = "git://github.com/hukkin/tomli-w.git;protocol=https;branch=master"
 
 inherit pypi python_flit_core ptest
-- 
2.39.5


