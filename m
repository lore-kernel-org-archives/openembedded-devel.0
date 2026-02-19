Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02660E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:09:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10632.1771495745738065980
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:09:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=iAn+xV4/;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso6656025e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 02:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771495743; x=1772100543; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ7ug5Y8WQatQNBHq/ByePKfgNUkAP/7ZeGRsZESzbU=;
        b=iAn+xV4/XmzSDzagYAy1PPGAWMmdUP4jAxzE5dqhHPXya6QIi4wLKNEpcnmfrEwwDp
         yxYSfGlijaqFhgqO5PF1lamIF4cZ+9Top1qtzRkj6dwzNfZa6yde/irCimP/H8Afp9Vv
         tSwqaC+2vrsEFrP7VLWp3+VyQgCdiHvd9sfIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771495743; x=1772100543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hQ7ug5Y8WQatQNBHq/ByePKfgNUkAP/7ZeGRsZESzbU=;
        b=UMYFvDPTyUCP7txt6qkyb0so+VOHclN/SXLk9Bn3FPm7qGv7Y2zV7VtUc20LOypQcC
         CLu65qwmvG7IqC3BGwL0dLU0b/aVu68rl+DNnFZUnCfLJ3JEYNodYRKVTdUuawv+FRaD
         Uh3y+0Z2X0fOPp0iK1HaE2DSJ9xO7dVUG60O1xfpOhPVW2OUzAJmWppEtKNhqsmK6/T+
         ZkxD31qd7AichG0PPlWcAc2oTeVgKuV1Ryzhhl/YdMFhxajgzvjd8z9nA+r4TvQB/sxM
         GifI6yQUxGbU7uig2DqabLCNnFohuAHmvxNH2ecJoeeHNMyOBsbT7vMIL8NlT4P74OCg
         dITg==
X-Gm-Message-State: AOJu0YyXSRN4YU4BiDqNkCCp82mUfxvyBaUnzz7FpYfx2n2kzR7QtiNf
	n1JxyyFqfXH4nXnytKUgd7Y7jmhKAmsvPZ4vYzyojS3fb31251lV1aZB3gUHpNH1hsFeUe5HsU5
	UeDeA
X-Gm-Gg: AZuq6aItZPYqfUx9CCOm+lUCIroTZ4KztuNOtf8R+V50kC6mjY8DxrCZ60d4TZQTm/4
	AcISNJ9lfdyBiXgmQ/zVZGSVReFB47iOd0X7JOcRyTa5aLo0E8ceRcptvWOyjdOhUR0z54MJwoA
	5L7oFIXgzGB2wk2qUOwuRvor97gbWNn/NQdkMH4IlDmzqvPnYKp8+nTq8HSe/cR3TD2HRP236QZ
	6Vurzg197xZ6C2OBIGZ7MrjUsrRRW4KbSUAxpeUpOhm1tH1Sz4HhRLjrFQO5wyNnbsCq/Z4s2C8
	SI9QE0JzxEuuuRlXVMj6cqlSa26t1Bv0eaHSTHbL84N2foy2/xLCs+0tFSvEYJZCtBkcS0nyVD6
	GPe/YH94OV3QJ0O7eqNN+AxWlI+Wv96zUNQbRgejWiqjQX2l8+E+qOrvpe+wZp6Y7Tc8ClDd5np
	JGfk+8pHPgLirMJYpZEity3qSVnFnXRAN/30hJ
X-Received: by 2002:a05:600c:6814:b0:47e:e946:3a57 with SMTP id 5b1f17b1804b1-48379c42d00mr275988655e9.36.1771495743388;
        Thu, 19 Feb 2026 02:09:03 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5ebd1bsm712340465e9.6.2026.02.19.02.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:09:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-flask-socketio: Upgrade 5.3.6 -> 5.6.0
Date: Thu, 19 Feb 2026 12:08:57 +0200
Message-ID: <20260219100857.3498767-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219100857.3498767-1-leon.anavi@konsulko.com>
References: <20260219100857.3498767-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 10:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124503

Upgrade to release 5.6.0:

- Use Flask test client's own environ dict if it is available
- Add Python 3.13, 3.14 and pypy-3.11 to CI builds, drop 3.8 and 3.9
- Documentation: Added an example using the init_app() method

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...lask-socketio_5.3.6.bb => python3-flask-socketio_5.6.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.6.bb => python3-flask-socketio_5.6.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.6.0.bb
index 7371d7646c..8358489089 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.6.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38cc21254909604298ce763a6e4440a0"
 
 inherit pypi python_setuptools_build_meta
 
-PYPI_PACKAGE = "Flask-SocketIO"
+PYPI_PACKAGE = "flask_socketio"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "bb8f9f9123ef47632f5ce57a33514b0c0023ec3696b2384457f0fcaa5b70501c"
+SRC_URI[sha256sum] = "42a7bc552013633875ad320e39462323b4f7334594f1658d72b6ffed99940d4c"
 
 RDEPENDS:${PN} += "\
     python3-flask \
-- 
2.47.3


