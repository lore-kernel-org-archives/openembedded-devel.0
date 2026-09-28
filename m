Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E108CA5FA3
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:04:07 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46637.1790553843011002875
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RRnkz7m3;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a02551822eso1777331a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553842; x=1791158642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eKNXMSZt+rbdlRfaeFXSBz2E9OjaCZk2t48qUHAEKMk=;
        b=RRnkz7m3tT4GY9YYvoc33Qu7aeyTGU6uxStw6gwmIaM1QmncW1ZyUoyr4osoMbHqCm
         aQcFMJHapztcHlcGPucUs4oTyVvAWuQj52aEsi+JjEf8Y5V90cWRrEj+4amuR2UulgdL
         L+WIsZ5lAphunI8+C4VndsK1eF/5OgUawADI6tK+Pq70orR6IQmogWVkLOI3KLgj2Kdt
         Y5jlato+pjcwYidDf4AZBCjnNBjf5GwTtC1a0+gqQ3ME1+kkHqxh8eG5L9kd+jIs+Q6V
         jtQpjrL4vJ72TjMQdpw965pIpg9c872SWV0FPr21ycEvFcucM3r+LkRne8+US40asE6P
         TtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553842; x=1791158642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eKNXMSZt+rbdlRfaeFXSBz2E9OjaCZk2t48qUHAEKMk=;
        b=vGYgws1XBc02P1R/R7nl6p1DUu44y/upmqGlmNAuxth6oPzs6vcx1VTQT37ATeH0PU
         2FJu702USKQ0K3wwWDchHM5/aLMrThZWnJ0UwUsGLAeKF0V+IPNqx70C6HWjNUmbZPht
         vmwl2uEGksjR/9Azpii+sdGN10qInzG4rNfrU7KBNmSF7jo01iMJW0fncBgZjmbiyRjD
         K7cP2QV/VjeUDFmQ0Xc79Vy6j72gY2XmfP2IYW8cnyJ3slKXsrLXRLyVtAwScOKYc/R5
         8c0xVeaOzOSjnu0VnYa1RJRw4ct3//x7DgP9DKpab89M8U5B88C+PR+PNxCs6UrPTZS0
         INkg==
X-Gm-Message-State: AFq9FYJNlbj6ABye170JLLvVh34tnTeWMDyjl49RU95GpOULlUMJYzIT
	uPG8j0LZeJt3MDxgme/kFAQAW1kS4j0+DQQwag9Poibz4vWdm4E/+N1G07rFSg==
X-Gm-Gg: AYBFou3fjx6RvYgq4+NdMtmNtME/+a8pk+Zzl9kBCaSTvarLfqv3AYaxwKwMlksiZwk
	bkxs/zDnJFCOgUsV1YMwAzxBCl9z3ZRf0Eba3F+TKaNqEQbNu46sB0QACj+uRnLqXj5Yei0zm28
	H/MOH19Q18YfvQzjUf6h6yyX5BX8Vf9b/ttZqRhDw9k1hDwTIGBoIWhOuQHNFOuN++pXrfXfxlT
	e9f8yo+GxehFNcVTcG7W2hvyawstGlkvuUKNWdiXXTka6g0R3QO5G9ngkKo2Y4M7KHiFa/nbokU
	HTDZX1q9z1WYGdkosmDkGC3HJPuNhtnrfeR+YgHlamXs27cA4k9TUcM4HwgEHbeVpKX5b7smkQk
	pV+TZFb9rODMHr3onOXfZSdQrpoBhF5vOMDXSnA/rvMBhaa/yaUyEzzwUCFQYRQPYJ/Jt19kIFs
	b3npg3T/0lvTy6zooTSvnGP5z0Okef8pR72pDeo4ORrRlt37rxAqab5sjBlqmV9gfk6NEnN61Jp
	Os0EgiHmaD4+zF4ZrLCJOM=
X-Received: by 2002:a17:90a:10cf:b0:3a0:bb48:a7ba with SMTP id 98e67ed59e1d1-3a0bb48b16dmr3603512a91.49.1790553842278;
        Sun, 27 Sep 2026 17:04:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:04:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 25/30] python3-periphery: upgrade 2.4.1 -> 2.4.2
Date: Mon, 28 Sep 2026 13:02:57 +1300
Message-ID: <20260928000302.2528437-25-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130412

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: copyright year updated[1]

Changelog:
https://github.com/vsergeev/python-periphery/blob/v2.4.2/CHANGELOG.md

[1]https://github.com/vsergeev/python-periphery/commit/a7361781456fcfa605b0d4d335abfbb9ced45918

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-periphery_2.4.1.bb => python3-periphery_2.4.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-periphery_2.4.1.bb => python3-periphery_2.4.2.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb b/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
index 876d89443a..43a12d7fcf 100644
--- a/meta-python/recipes-devtools/python/python3-periphery_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-periphery_2.4.2.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "A pure Python 2/3 library for peripheral I/O (GPIO, LED, PWM, SPI
 HOMEPAGE = "https://pythonhosted.org/python-periphery/"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=30fe6f023a80fb33989fb3b9d773fea0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bf8adf497db13d58fece90db6850816c"
 
-SRC_URI[sha256sum] = "61d461d736982a6f766e878720ab10a68151e2e8c1086600d9389ac47e40e88a"
+SRC_URI[sha256sum] = "9b334a31832ba64f74aa72700ee5fd6452d79d1d1fa6a0b48333bdb716d91575"
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE = "python-periphery"
+PYPI_PACKAGE = "python_periphery"
 
 RDEPENDS:${PN} += "python3-mmap \
 		python3-ctypes \

