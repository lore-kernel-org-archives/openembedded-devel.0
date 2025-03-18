Return-Path: <fathi.boudra@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FFCC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:18:44 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.9329.1742296722995855643
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:18:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=V9iM1kj8;
 spf=pass (domain: linaro.org, ip: 209.85.128.45, mailfrom: fathi.boudra@linaro.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso31294345e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 04:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742296721; x=1742901521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymYl5Wo16DfZXvVuXr5S9+pkrVNYf4LqAG+uHerAEEo=;
        b=V9iM1kj8agei6Rw/r5uxMqllxtKavvv9o2Y1uAtcUvTg7o+UfXinChG8WDQiMJG34d
         cWvFhHGA7dk/3HNExoUVZAbTQYC2aUk30bk6tc+3WEnTHpwMDilxO95Sf2bQtYdLnCDW
         PccFrurMNbPkjNI8zLv0TXFTNPME+LRcbwIwAIMlCU9D0aqvIlcEfTjmOSRBqPOw0Ell
         mPyIL5O3mdeD/NJQ4iFTGcrhLpdPn/InTNx3Mx8zsfgtMCQp+qOxnMbK7Q2Rwcgah1m8
         sA57+y7QObbU0/yMZxsxPPMcP9TNfvDML69MLL7YJPTwFvRfO85U48WXJGcJ892Gk2zY
         dFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742296721; x=1742901521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ymYl5Wo16DfZXvVuXr5S9+pkrVNYf4LqAG+uHerAEEo=;
        b=PDjC7APkeYQ1w18WmID9kd/3iE2tWapCB+JaBWdkm8tr+ZMaNW/O+rl3yqxA3mUR6i
         PkJvKHaJlWf7yRa/Fym2vaO9DySl7FstsdGoaSEGM0rp8Te3GaTLhlCjMGJviwhF0ADF
         TeQ4xnYjfPROcH/7Haw77BqtFFzTXPNOEj6nRT0HCefcESo67iT32EmZVpKlOp9kJvW2
         gdpDCJoW0vAB4D1q2VME9ItlrxBdFIaLSKTHPdUA2Sv4sgRK4xXBbIWSh2dNEnbeDhH9
         6s25dexHoEQRVe8WBgEYJU1N955J7LQDLOkevXnQPDMAyYu/oXvt4Dg5iBaM1SnkMV55
         09Mw==
X-Gm-Message-State: AOJu0YyNAAvSPzV704Rc+yTGAfNiWQNlYJpvrBFbAnemlbONEuwpFEYF
	04P42WuALbUZI4JuS8gTxMwEHcviIFQLiWj12fG6bVGEAFMU/El+XCk71w5IElzBhNmXZ0rrg1P
	i
X-Gm-Gg: ASbGncvIxvM8gisLKqrY0ieYZKwwT4275e+CuERIkox+Nr81dec3dViPrE6sWqPdwJB
	fkkjxbOf8D4IQGMcLSXvDQ0x154ou6i/1ZLDUep/NBdJGVbQFK8j1vrZrkbPUyPzQfDEkTfT5bi
	CMDCJ6oMqbed8z+fYCArCfyiqg7F2BgmRoeRcTj0ccc1nO1sLcccKN9UM3L48kKWdtz/BwTdqnO
	tK0ZCXJzeMEq3hsHSJ2fobHVmI2apShqq+Z4c30P/UlsvqNPAEO5Tn1bpoq7EsXOikdksHTVS0P
	AkHE11hms8cZmdRXXrJRakWytXhHPcA52DTxO9VyWEsR9koOMA2/zzGFxSWbPtz3j57/xuCyqRH
	q
X-Google-Smtp-Source: AGHT+IH3p5k3fhzxM9DLvW0PJVAVCWejHbO0rtnhlAy/iOyiLly6Y6HMXJBpvtskoY1EeHYiCeQHrw==
X-Received: by 2002:a05:600c:450d:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-43d3b9b2f56mr19711075e9.14.1742296720964;
        Tue, 18 Mar 2025 04:18:40 -0700 (PDT)
Received: from corsair.. (88-169-167-85.subs.proxad.net. [88.169.167.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d3ae040f9sm14334465e9.0.2025.03.18.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 04:18:40 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Fathi Boudra <fathi.boudra@linaro.org>
Subject: [meta-oe][PATCH] tio: upgrade 2.7 -> 3.8
Date: Tue, 18 Mar 2025 12:18:36 +0100
Message-ID: <20250318111836.114574-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 11:18:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116056

* Added LUA support
* Replaced inih dependency by glib:
 All configuration file parsing has been reworked.
 The options parsing has been cleaned up.

 Compared to previously, configuration files now requires any default
 configurations to be put in a group/section named [default].

 Configuration file keywords such as "enable", "disable", "on",
 "off", "yes", "no", "0", "1" have been retired.
 Now only "true" and "false" apply to boolean configuration options.

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-support/tio/{tio_2.7.bb => tio_3.8.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/tio/{tio_2.7.bb => tio_3.8.bb} (74%)

diff --git a/meta-oe/recipes-support/tio/tio_2.7.bb b/meta-oe/recipes-support/tio/tio_3.8.bb
similarity index 74%
rename from meta-oe/recipes-support/tio/tio_2.7.bb
rename to meta-oe/recipes-support/tio/tio_3.8.bb
index 59c772b5d0..93c116d984 100644
--- a/meta-oe/recipes-support/tio/tio_2.7.bb
+++ b/meta-oe/recipes-support/tio/tio_3.8.bb
@@ -2,18 +2,17 @@ SUMMARY = "tio - a simple serial device I/O tool"
 DESCRIPTION = "tio is a simple serial device tool which features a \
     straightforward command-line and configuration file interface to easily \
     connect to serial TTY devices for basic I/O operations."
-
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
+DEPENDS += " glib-2.0 lua"
+SRCREV = "01e637cdf4d2d781a87a2fa68e49e7f8fccd0552"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;branch=master"
-SRCREV = "1c32555c2a4f26b60f94757656825fc6684d6892"
 
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
-DEPENDS += " libinih"
-RDEPENDS:${PN} += " libinih"
+RDEPENDS:${PN} += " lua"
 
-FILES:${PN} += " /usr/share/bash-completion/completions/tio "
+FILES:${PN} += " ${datadir}/bash-completion/completions/tio"
-- 
2.49.0


