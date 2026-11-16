Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34352.1794851739717498701
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Mx/0Bye0;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6023233eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851739; x=1795456539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=znEkS9Bz9ymsMjBCeOPTpCGsUjAQD2ddAUy+Ton1Tiw=;
        b=Mx/0Bye02HUQQaU7R0y/By6MGaEe6jy+keIB4Qi973SxQI6/VxPq6o4nVZhWNtdMbf
         zOEJB2dAX/vEsKlfjA9HAy3WkIV59nKdn3lPwx3l4sl/ZdYBpd0abT4lmL8Z0FYc5JBV
         hRVPpiVFnmSfq7ri0JR2L0CYEAkiONhrf/ksHcWwH92Q6eTv9LGGyXoHnqfM/ZblYVAP
         dHCxsjdkuFpk8hZ8SBf+nZiLPacUdUZjjVu4bgwvQdLtAtBvkdw6eA2S+VIXfZjJZO+f
         Xas84yEVIyQp0Q6JVpws3Ejw+7VnACFUw8DuuOhlScTF1Q6X7qUcm9YPnW4V+qt41ALx
         lrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851739; x=1795456539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=znEkS9Bz9ymsMjBCeOPTpCGsUjAQD2ddAUy+Ton1Tiw=;
        b=EsRIBhyMXviHn1JtVQIUFArRPrIBzJP1qoZEO+YDSSQgQGFL+Yt7R9+fgMx7TUf/sG
         N8BqUJKZ2P/wKn6oog6c0lFSn356WtsmL/fkVSnFilgs9J6ptc3cEmM9BTB6QFvJB+Wb
         xXdS6iX4nfI//xWJxmDvPef5qVuO090U28JRAiuKtud0uQmwEH1oXvJrtOeR8MZbiLnz
         kUyX+MXTxlua0aiMIEkTKSDKeTpmPsa1pgtC5y1NUVfKo5w7nT4+Ki65Dz8vB6/wOnre
         UkTL3ykjw0rudzQ/xznfLbhOos0OBa1X/VrPrIqKslq3hyeTqLTIY3W886Sy1Cu0s9yL
         n9XQ==
X-Gm-Message-State: APuU4Z8+CdzYLTTR87lZgt7vyl+RCvYWCPm0TKU2drlMEOaY9L0Y/2wW
	oW1HkaaerclBe5tuzIaIj4DYeBdpgY0JHvAolwlOxElQhc0o+rjBrXDTwlub2qRl
X-Gm-Gg: AYBFou1d06qAb6GL0Bs6FELImWn5aYc8tXE+DyWKhiXjkuQC0tIzQyX9dyF+ZJaegzg
	ZHnVnEYL5jie8f+bLp92kONu8gMPVhAO0PHbzL5lAzd0cUMCrw4bZW5wY4hkkYVFOuuv9TaA2sW
	QWoKt8qbcmSM8DYpsk9FMTpWjkHMPsJ64YcbR64ruG5Ib3QqK0NNcUyBlRFx1YdqddLAEPUSUmm
	ZlHwr5VZ5UIFp2uCpge4JGXEY3vRZv5iE9G9ZlRg5Ucxql5B87KbxGYfO5fKJ+yJI+leVwQ2Uqq
	NHMaK+59B7/Y1c2G6nCtVyFGUJwILtimkPDF8W9jS6n+Ul1ltpEHlRUutpA9WLYttp3D6VE7BHL
	mhmrpwsWxKZIH8iUPUmtnWEUn3G6a6NGGaLIoMtl5+E7gecVEeLsBqhrFqXE+z/E6cnfY0RvfW/
	M1CxmbUV5KjAN4Jsuz3EXsSDi3d35VpZJtyFbYj+9mKiknq+sSpQ4SPY/DwIF699Ns9SZ/rboca
	Z68GfshDwD0gGZxZ3LoaglIYfxmXLFBtRFCHNK5NZRYVGuhPEo6l3udhgKo3HI0cXBjrhNWUBpi
	aTcSgg4MRC1+/VUUeT2gWAkIx5Xv/UObAYWETfm7MD6RFZXr3QamzXe49DZOni7dPRMqP4WCE2B
	nYh77mO6UBobFmrsVLBL7sDzSYc/yGwek+xw6TCSGtl8QSgQKKho8Nr30Xek7/iDf65h0XnMICP
	xwx9FT+ZqdhwXpVT678TIrHWH9SglXOOm3BUDC0IbYldsmuAmo+ZYXcTL4Hn4V3RtcP8lBWDWgB
	4K+kFuVsPfUPcnCifkGDqIGABU1OP+SIpTrDR4tAauToJm8mWkrpL2+CpImQWE+V3NNjKsWH4Dk
	NI5i
X-Received: by 2002:a05:7301:2424:b0:362:fa87:2aa6 with SMTP id 5a478bee46e88-3796057b51cmr10233950eec.0.1794851738997;
        Mon, 16 Nov 2026 09:55:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:38 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 070/105] python3-pylint: upgrade 4.1.3 -> 4.1.4
Date: Mon, 16 Nov 2026 09:53:22 -0800
Message-ID: <20261116175359.342679-70-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132526
Content-Type: text/plain; charset="utf-8"

Changes:
- Bug-fix release; astroid requirement unchanged (>=4.3.4,<=4.4).
- False positives fixed: using-constant-test (unknown decorators),
  dict-init-mutate, unreachable (sys.exit in lambda), used-before-
  assignment (class bodies), undefined-variable (walrus in multi-line
  comprehension), method-hidden, bad-dunder-name (__prepare__,
  __mro_entries__, __buffer__, __release_buffer__, __replace__).
- Pyreverse reports a clear error for an unknown --class; fixed a
  crash when linting packages under an implicit namespace package.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/{python3-pylint_4.1.3.bb => python3-pylint_4.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_4.1.3.bb => python3-pylint_4.1.4.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_4.1.3.bb b/meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb
index 25f6c916f0..3836d82951 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_4.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "e75de10c69103381c875601f638d4b977ff0fcaf"
+SRCREV = "edc8e376ba4affd43bc07571bdf3a90efc281ba7"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https;tag=v${PV} \
            file://0001-Adjust-test-expectations-for-ptest.patch \
            file://run-ptest \
