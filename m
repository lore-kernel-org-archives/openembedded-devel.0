Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B1DC5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:38 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27788.1786651774733985908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GyAue6vN;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso192895a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651774; x=1787256574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIMEpSNgOj4Cbq0p4rR+ef0XH+g0Mi71L4kddPbYV3A=;
        b=GyAue6vNHcJoZa1uvjTQ1UmgYcxZ/qrUWvQFnFrMQWtgsTCfiOr8ongaXX6OKTm7lx
         pbFJ2EONMe+z8E7zxEXcmcTNYVrFWiXcv1c5GxjjAkIZYwSKteMCbUhvIFuklcmX+eCd
         BtsKayF9mmvlRfWQFzauDYghq9cRURiyws4/8CZYhDBswfcRKkHh8vIW+Z0vKY/KJeL1
         M1saCd0rx4BukdCF5Qr6JTAreIc3FQ9FL1vkxqvAAlz8cPgZqKtfJkL1qGC6kpRIeFwL
         Yi56kDy7Av74X6OQ5CVwRGxCVCBv5lq7gT9SmwBT8JyotesaCJN/JGqocBGvUxBayX7I
         Nz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651774; x=1787256574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIMEpSNgOj4Cbq0p4rR+ef0XH+g0Mi71L4kddPbYV3A=;
        b=mvx4U3LlwjvdhSYuFFoFM0lujLAQLW0Ru6pVZiciH5OQ23ZdqB8K2kcomt7S88IG/n
         mViFYDqZb7Q8syb5mWR/FcYLMVYAKC3o9HULcWr1yaoScX7Q46Q4Z2CDfRA3SQsySc4e
         3HoUpryOzBLAdABKyx+UG2FasYGAf/C+6JK+i2FuftQiZRtbwdsKYjCgrerpAFbcsowt
         UxBDa5GWRzvKYpZgf145pdo+3SmamJPHXFX9hew1Dbcqunii+Bc6YWF2n4KbFr2zaw+I
         C7KI0xCQ3+pROs3YYOiRji2jvaHauSiRhDX4Ysn/20TtcsUOW0WlLe8zTlce1P4tTAY9
         c9yA==
X-Gm-Message-State: AOJu0YwqfKQH4rn2cJ1qVp4LNZtwetkW7Gh9ngLO7ZXIiy655kmPw1Mv
	JIvkKEBlgFJF69XHqgic0i+dF5RkKQYgUcQ5o7wsLdwE9l48jTk5xnaBEsSk+m1O
X-Gm-Gg: AR+sD11MfvlMfDUeBus3CVI1Io7rP1IjSzBp869c7nVW9zpgp9JOMSBcTQCSTKI4dTs
	fpOhgoa+nKFlbpcBA0nsduKD/YnIUJih4X4e2yCbjSPEFXwpiDkpjzswJPZlTg0+eOTjZm+zchj
	UlRTFs3E1u1/9631euyQPN8jdAx7BV/bqpKhwquz9J7Ogs4A6mm5Ef0YIOobATgPWVLlk0aDbLX
	e5IhJYOCOugTxqav46hMqLz4ry6xhxV3u3B1KRZhfXV44ZEn4px7d1RGK1WyBsq+FF6265dU7Dr
	9pYu3ON+FzVD/vYTluoThszGIw5Im9U0hoeycZGsRvep0Mn2OXF6Kcgp3VrhbEp/vr5nLQRnE2l
	6dw+w53wje6Kc8pDK979AtYOyDm9zHUz5eSH29+oweUPKUHhcGHdBYRZP+PZNOb1LuF2h3TZn9J
	Oty2PII+MgDxr9webh2MGoss8M9g3YpogkX0Y5ruqhw9KlDn8FPIXuNBtCLjhnkhAt9BATayo/W
	rNwq61/FtQIznYklPJfbgaPMWKzd1cB5wzrWwb1uXcz9TclYOJ9TZt+zrUdg7HPt1Z1S3VxoeO/
	/k205rej4CA6S5M/UfFL8CJt/01U2f7UeGMcTCw70DVjF3zr4rD+p7j/TG9RsozVEfxi9QT3oVH
	RNDjzN4BvsMr1r/3irc/zINcRnkSuiNxbsHhQC1VTc6uJGA==
X-Received: by 2002:a05:6a21:3398:b0:3c3:84a5:f2be with SMTP id adf61e73a8af0-3cc71a10b52mr354706637.11.1786651773985;
        Thu, 13 Aug 2026 13:09:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 31/80] python3-hyperlink: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:45 -0700
Message-ID: <20260813200834.1302829-31-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128975

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
index a3fae39c7f..431cf72f64 100644
--- a/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hyperlink_21.0.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "427af957daa58bc909471c6c40f74c5450fa123dd093fc53efd2e91d27
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 RDEPENDS:${PN} += "python3-stringold python3-netclient python3-idna"
 
 PACKAGES =. "${PN}-test "

