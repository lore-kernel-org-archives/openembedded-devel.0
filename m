Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DA03106B510
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:01 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21188.1774441259938242792
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P3Pia0sC;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so44710805e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441258; x=1775046058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkM6LwuPo3Cv8rVO8SzTjvg46APBFqNWS3+obuZ7SZA=;
        b=P3Pia0sCbEnpnKrVlavR5fD/rpeYIGxnAdybefM9cGNVkGFz8rwWm/e2yNLM6uIHRM
         HLEmChgyzaFpMMdsk0v+DBn2ImAbGHmBJI0czn8SHRTJnwEJv6Ew8cffEq3m/ML6Qpuk
         aH5hCTuoBYPgdvcZ2Zt86scP5U6RTS4nYoJRMzc4QDB0CYV8/cWxvUGDwwyjrbGmzFyr
         ZDadoC+/l5u01m4tCTjdibm1Xni6aLeHrrgRLC3bMBvtCvpxLaMvg+cwC6D1pWETJboL
         dve9TKKLl9f3iDaUZzrjGTrY8fhBK/2+YLb9iJlBtKWHQIZJmzVspFwEsliyVQsaeGIL
         B0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441258; x=1775046058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CkM6LwuPo3Cv8rVO8SzTjvg46APBFqNWS3+obuZ7SZA=;
        b=GAsU3SYFnm/ufhEMbmnGteUi8vaLMkT4RVPiDDfXf6SIrva5epeX4PVGh/BqsqaVwI
         W0AZDfc6UsHry6DM1EOVsV8kMa/f09Y6KVyDatDnRRsJPwtQ6y1wHLHQzu8CAMAgjPB6
         3hrj4fwrd9QWabz530AbHNSiTS7s7Xk7eNjKn+4Diysr/gcrfqGtPSkMHYC0dJ0dROv5
         qYmG+BhBq1YYaWgepq5uArhLoxpTKB7XtPjsRYM/uZbMX8egaLEJxW9dQ1xf/YaoiPk+
         WNvnmKGZ2++6g7AaAxBagPROifYb4BeyYNIEjy9JQg487nJO2KYFjjBx50K5Jdo/toLL
         t5cg==
X-Gm-Message-State: AOJu0YxpxHGXHPqfi2J9lGjssnRsnhSjpW9HXyc7tkoxwNXvjgsT+IT0
	3p/vTC4QUPjq8ZE2jYtdBg2x5VTRx114vH4mVwWg2WcFjE3vHJy0hIwua+oe6Q==
X-Gm-Gg: ATEYQzx/RpRZpv19EW07ptChFv1daKPzoIXxITReCSVMASBzYg2clQU2yY7FnSFgx8m
	p9QmLX1X4tnIO6dikMQfRdX+PKClmqstD8rZTuoME4VwKd80V4FuZ/FTFo7R2dgSk13yCT9cZdG
	y+cLAHzvTvl1gjbSjES9AeCiyPWHTCTSd2VZ4yRyXPgV2GnwVNlU1Xq+sEa/+J6oZMGcDib7ZNW
	5hSAu+IzipG77eTOriHbMOrQkOf9gKzWTCY14B5WnFTIkMf6pRJGfQI+QSITkiGC80M+ezFc6Jh
	FCtGv7wDRrpXgnXBvwwIBCKh3nkHt2mH5JG9Ol/SouDnPSQa+aO6nnnA8aBXSE3mz6jQRqX9KTH
	lPhmnTYz521GLbzR8d7zR58v30s4zbuQPZh9SUMTTMHA7wIIYfySQR99KoI3GCdk7JYgOojgaIh
	fpc+llG174zKHfMA==
X-Received: by 2002:a05:600c:64c6:b0:485:34a2:919e with SMTP id 5b1f17b1804b1-487160a681bmr46324185e9.33.1774441257930;
        Wed, 25 Mar 2026 05:20:57 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:20:57 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-gnome][PATCH 01/15] libuser: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:27 +0100
Message-ID: <20260325122046.1211090-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125608

PYTHON_DIR now contains PYTHON_ABI, use only that.

Move the installed site-packages directory to the correct
location.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-gnome/recipes-support/libuser/libuser_0.64.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
index 27cbb43486..dbba5877c2 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -26,7 +26,7 @@ inherit autotools features_check gettext python3native python3-dir pkgconfig gtk
 
 REQUIRED_DISTRO_FEATURES = "pam"
 
-EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"
+EXTRA_OEMAKE = "PYTHON_CPPFLAGS=-I${STAGING_INCDIR}/${PYTHON_DIR}"
 
 do_configure:prepend() {
     install -d ${S}/admin -d ${S}/m4
@@ -36,6 +36,12 @@ do_configure:prepend() {
     cd -
 }
 
+do_install:append () {
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
+}
+
 PACKAGES += "${PN}-python "
 
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.53.0


