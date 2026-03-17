Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7F9CFED9F6
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 17:24:02 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.81494.1773768232470278372
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IcjxQPHL;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso54549195e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 10:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768231; x=1774373031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b37nhQTXgJj23EpRABX8DiKTdIYmZwM1FrzSKvFjP7I=;
        b=IcjxQPHLR5SamJndERFnbG63KgYEFL2RP80V6Do9ehtPyRgW8fIoB3sfD4N6yMTWI2
         JyXc9qWDq/c2Yx9h/53pEBAHqRyIbDtCpi+Q9NqgTpQwbbAeSiGLXNmSAGXR4mCSL3B1
         4i0XWdF+jvz6G+qk04qjE8Jqv4kg3koMasB6WpW8yaMN4ejnd0n4zW7+Dd2kfsbqYMsZ
         CQBLgpqIAHqCr6Qi+81D+WRFaPIWmZ5sWKy65mXsbJzHrqr/OpsAaGrWtWZ63C73Mske
         7VCUIWlCp7+1l0cMO7nCNfb+/L4nx7MwG3IyBwG6cXoF+rfZzQ+kJ3FpUoPYoFklqWew
         i6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768231; x=1774373031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b37nhQTXgJj23EpRABX8DiKTdIYmZwM1FrzSKvFjP7I=;
        b=UPodTZje5VYwJQ8Fzg7DXlmhPx+Trxb590QlBA2i4G1C2kzgtGlc1H7AXVt97H3spv
         SzpCCx/StEZX6tTn1jVTkCE/CO+3c6YNJA6WmEdvXYDCrDKfPJiSX98Q/ZVwmCBOHO5w
         9XIc8BYTe3lakwpRGq9FY7/bI9hNwqoZGLFTmE3DNLC351lpOlgUDAoKnADRg3/YJKXr
         8TIlznZbotJcCcDZBhAYkgVpZ0TtES5vFlEWKJPjojVxajHnTm55ekhkfgFKgkIsaUGN
         Rms7W7RW0Bwy6FcKLc9x9Xw4QMXZrlTdrweLFQixcupn8KQUBk2PhFJjex2iEiby9qZs
         S6fA==
X-Gm-Message-State: AOJu0YyCkwLZWyRmRzNWW3yOKE4zKIBvjrkMGNzSeOMgLjQ1g+DYIrdn
	vbWmzDclr4B5XONb+EfFvdA4fPWv0BmwasyECELywO3nBJ9JP+Z3S2T06xkmrA==
X-Gm-Gg: ATEYQzzCUTRpdUfHTfYWAmLfHN2NX7TJmZ+olKk+u86CJg0WEFvrIpuo83VITpOA9Hs
	cwkRswYbEJKRQkCHBICnCdDvTdA6df6MdwGirRm8aQO/vHaBdnFDF+fShs37NtXMHMBokf+up+M
	dAoC7DR876/GqpYjiuJsHXFGj2kkuwDKTB1Ec26TI6YHiowRgPseTlF9I7Oplt/OBHsv4x+pQqq
	7dE1BYQ0LMKI44shvsgaMEy33tSco3w4XHuvBgMukYOVLTFsg/JMOLiEGWhIhBdYZt4TdVjOADL
	pM9qSbN5AAMgm+RiSf6WYQ7eQ1LPytmKH1WZIsanO8VDMso1N2FOaW+/rCjFm7trosnE+qcavHA
	RXPfm6C2m+2HL0Q85WXZ5rEJ+G2n8H5UAx1WPptSEk5LM7gFLeyKnk/FhIC6J+Hbb9YMCNSgJm5
	rYzV9dosFulXYp17Js8KWo/sozIh+lFXM=
X-Received: by 2002:a05:600c:4e0d:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-486f4456f02mr5737505e9.17.1773768230693;
        Tue, 17 Mar 2026 10:23:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48634a7ac93sm61717385e9.2.2026.03.17.10.23.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:23:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 6/7] unixodbc: mark CVE-2024-1013 patched
Date: Tue, 17 Mar 2026 18:23:45 +0100
Message-ID: <20260317172346.2862459-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317172346.2862459-1-skandigraun@gmail.com>
References: <20260317172346.2862459-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 17:24:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125328

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-1013

The vulnerability has been patched since 2.3.13[1], however
NVD tracks it without version info.

Due to this, mark it patched explicitly.

[1]: https://github.com/lurcher/unixODBC/commit/249bfcc511e89431b910ce2c62ae0b62bb9cc214
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb
index 6f26f7b174..62992f6f50 100644
--- a/meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb
+++ b/meta-oe/recipes-support/unixodbc/unixodbc_2.3.14.bb
@@ -46,3 +46,5 @@ do_install:prepend() {
 do_install:append() {
     oe_multilib_header unixodbc.h unixODBC/unixodbc_conf.h
 }
+
+CVE_STATUS[CVE-2024-1013] = "fixed-version: fixed in 2.3.13"

