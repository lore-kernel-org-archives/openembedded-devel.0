Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1C7CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:04:47 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1029.1762200281259187324
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mmMbg70+;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4710683a644so38222635e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 12:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200279; x=1762805079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIe8SPV97lqhQ/eWbuZ5Y2z6xFAPesp2Z7l4IagLH/I=;
        b=mmMbg70+wXELQgSVkZUCEtOO0tszTlv1P5pkprFCZtLwXcfORxdiiUt3C9sWeAIhFb
         d5BvAuGf5CjKuUJ5v3Jbn7qEDBI2aJ+4G6dBjUe3JozgubzcEUkHUqlB/XN2++VDRrRb
         CAUda8Xs6gVCPDZPJrtVGyFhc/FgDbkupHDohClX6/yvFsSpLJAZdQsDF7/vKQWDQgbp
         HAsiulf6Tte9JRz1T7UegEa1w5J1S1HSfmijTCRrfISfWgwlowTly2oMgPZfQQV+hFaA
         M0hklrOscOnLJ5NaI0lLPXiygtb64VSfV4NRSHf71hZNHzZD4UI/gdJQDKYpJ8GV04FB
         kN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200279; x=1762805079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIe8SPV97lqhQ/eWbuZ5Y2z6xFAPesp2Z7l4IagLH/I=;
        b=LA5QhJopaou6iUfTxAPU6EoCcjhHjqk4zVg8XJI6gY/1rkCev+j/UBAH3IJv3rUKbm
         7v0/aOswRRjd0Xi5MM9+naEN5Hz2qpjRIiBsbAs3AT+/4DPbsqnr0Ft1FLbf+c9MFn9o
         c7jsYakCHVyPzJ5+/mlXDAqCkrug6zpcOVtTLWajDkhbOPOW1zYKDPeVTvwwOi3cpmzy
         HSIRSu6govH3OFxFdMHN74Gg7U48rl63Ye/qSs1d77d+d38hd4vvq4gOsf8xQ3d8OoYT
         VZZNLxDOis7cBUVmeic7Gqxn3/dZrBTPVMWzGLHEph9g/xLJS+uHnA2pFjekz1fJ2HQK
         Ambg==
X-Gm-Message-State: AOJu0Ywt1fcTJeNMdKM18Je1TFG5dI5PJu/z440GOfQj08HqWAwOF0pr
	Wj+7Z46kx3baoI3T8g6sSz3bqql4j7bBlf/5ndp2x5wZI5bOfAmZ7bVpuv0yUiK7
X-Gm-Gg: ASbGncvTLts0aYsRiEp1LW9x3JwZD9jZ8iyWAUnljeHjDbCKBSS2qkvL+rPPKQQC317
	YFFgLK4BrcD+42FNhHWP00ywSPw99uRtP+pDNHYnUAYuM1nbC9bXvVkqT3sEpRGUvqlrXy7GqHY
	In+FS6rX3v3clk6etfDsIB7Fg3ee+AmVLwt2bB1lnF8mf7xb0PgDlpCXZxU9X6guRPNqHd0NbhP
	YD1U096TYAPna0dEHeMOQdBh1cyd85xBwff0jmWwv37ooiKzhZ0iT6K4uK3FEQuoVEczXyN3nGY
	tUt66N+1RDsppCeBkQ9yBUo67sU/shMxg9mOg0XdIb2kgf6aegQ1uqbTSUMrck7uXwvEVJDIRqH
	OcdSiu+v9v4AnV0PbG3CLvfBy3N302qMtXqPxPhs2ml2MX9B+trmPaKDwCVY/FdQxV55qUueacr
	usfdqFI7ZsnTBSH8gtMa73egXdB80w+bMRsw3wQmPGUhp5S5+odjB+SLCw0zUMhYUODL+3RpmZW
	7dCZzUXpBpu6U8SIVa2qyUhS8WbfirtCW6BhFR7xXLk0oXUWas=
X-Google-Smtp-Source: AGHT+IGDOzIz5Q329mYMms5Dpt6eC4PZccIqlbeNvTKWcWJnDjH5EOrox0yCrQyItOVEBpvjEIXbiA==
X-Received: by 2002:a05:600c:8b71:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-47754c3a2fdmr7451725e9.13.1762200279105;
        Mon, 03 Nov 2025 12:04:39 -0800 (PST)
Received: from localhost.localdomain (2a02-1812-512-2c00-5cba-763c-2ed2-f98a.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775556798fsm368075e9.1.2025.11.03.12.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:04:38 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-python][PATCH] python3-rich-toolkit: add new recipe (version 0.15.1)
Date: Mon,  3 Nov 2025 21:04:33 +0100
Message-ID: <20251103200433.1766280-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 20:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121282

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../python/python3-rich-toolkit_0.15.1.bb        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb
new file mode 100644
index 0000000000..d63850b3ba
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-rich-toolkit_0.15.1.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Rich toolkit for building command-line applications"
+HOMEPAGE = "https://github.com/patrick91/rich-toolkit"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://pyproject.toml;md5=29c91c89ee62891477a1476375143bef;beginline=6;endline=6"
+
+SRC_URI[sha256sum] = "6f9630eb29f3843d19d48c3bd5706a086d36d62016687f9d0efa027ddc2dd08a"
+
+inherit pypi python_hatchling
+
+PYPI_PACKAGE = "rich_toolkit"
+
+RDEPENDS:${PN} = "\
+    python3-click \
+    python3-rich \
+    python3-typing-extensions \
+"
-- 
2.47.3


