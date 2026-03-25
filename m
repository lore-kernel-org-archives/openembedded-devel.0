Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F02106B520
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:23 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21201.1774441277736691717
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G2QLaKDb;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so47003775e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441276; x=1775046076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/OJytz1RhLx0SKBgFReDFhgGM+LyYGFFM0XKnDf3vCA=;
        b=G2QLaKDbTZMFbwxjzF/PfpYQuSHAZPxWPsdLYa02ji+I2/HKPVguoY2Vrluhf4uBN2
         kDP6gMMeHrXnWI0+2zsS0oUXe6AByYiDHe4T1YOLLsTFSwKvDXYRbZ076L2Tcp5o4jPm
         96tJOFOcn+vDFa+NUxYES8zbsvhjjNeXAhgIy9C57O/wJfujl2ZninsIEJlJZRautPrq
         Fi03gAQy0TpsU8hdayGcTCkBk4WP0vePPnsb4dLIXFHsZiHA20sMl+eTaUaUDNz1uA6v
         khK0KO9xxqWfi7ATFepwJTUHwdK5cTT+BFu8/yQv0zeRqrEkJzvKp68R7MBAAK/hv7Oq
         rNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441276; x=1775046076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/OJytz1RhLx0SKBgFReDFhgGM+LyYGFFM0XKnDf3vCA=;
        b=Q1wNXt/Fx+yTis8CPr53SJ8xmSF0SInGS5TdnQYqKR+Er389rc5CvY+cOEeypMKu9e
         bPmtL33guCyt5fOiUCIFKYswn1aNSlSnxg/Dww3SHuxOy/yphZhigsmZxUwVJiRZinZC
         /leVypouO38AIwuRqMkjbuz1RRwpxHctVsM3O/H+PAsYnqWL4Sc4iEj0U4Ax47dfl2MP
         Uc/szsNzoxqaFezR6J/ISxIuTpPPWRX5JX87AfNl5zPviYcuf06/Peg2e4VJniXU2Zd8
         82AqF8WxxjO3K6PK5WpRAHnBekZsSxgIgkebDhg2k9F/TZIGTk6q+2lN5WP88YyZDNoH
         nyPw==
X-Gm-Message-State: AOJu0YwxGIk3kDE8oNNQrsu7pLjnAP/e45GQOkbEUPO1v4SfYdIrmN1Q
	MZOKITWTJ5JtNiKeCR/Z9iyE0HVDlqg/jsGRtAXNXn7r059JT3yZnQlYvDFp1A==
X-Gm-Gg: ATEYQzwPKJ1a916jE1hVva/DVkPg3yoGg9FE5o2DnspYoWx7m81x+BanUPT49h4xgw8
	FzEqDPcMadeZ110TFAWi9dmZKdf2fjCwT3ucvShav4SpWSHuw9IhBwhPHNHy0eMs1LmG2dx6oGJ
	aSNxAy02qz6EF2UTmWH5V8gB7OgW//CigLjQqq954W90EhtsHbgh6lPyZEDFAymxc7yWLVD8EAr
	PfuJqhCTDyGmH0+Pie4f+kyft3WqXHzcfdEiKzidP3VcxZDc2G3KbN7fw1OsSjlDUl4Zi7muctQ
	ylPjLXPMOft6YMP3EwjB6wprX4nJ3eThQ072wrV/SGHnV+CuD1vONA/WzE1kDOIvUQZRNpfQ9v1
	hNN5E6Riz/3Z5F8YCgAUFQOFIt5Pm8Rs3dy/xm2qtiohzca7dJdxLu/r+GHiyd4qurbemEM35bN
	K9iO7EDwOvRpjIkAENbk5sGkUa
X-Received: by 2002:a05:600c:a41b:b0:486:fbe1:2499 with SMTP id 5b1f17b1804b1-48716043a6cmr29199475e9.22.1774441275747;
        Wed, 25 Mar 2026 05:21:15 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:15 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 11/15] upm: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:37 +0100
Message-ID: <20260325122046.1211090-12-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125618

PYTHON_DIR now contains PYTHON_ABI, use that for the correct
libpython and include directory paths.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-oe/recipes-extended/upm/upm_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index 9b809ce727..ee752dea95 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -45,7 +45,7 @@ BINDINGS:armv5 ??= "python"
 PACKAGECONFIG ??= "${@bb.utils.contains('PACKAGES', 'node-${PN}', 'nodejs', '', d)} \
  ${@bb.utils.contains('PACKAGES', 'python3-${PN}', 'python', '', d)}"
 
-PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
+PACKAGECONFIG[python] = "-DBUILDSWIGPYTHON=ON -DPYTHON3_PACKAGES_PATH=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_LIBRARY=${STAGING_LIBDIR}/lib${PYTHON_DIR}.so -DPYTHON_INCLUDE_DIR=${STAGING_INCDIR}/${PYTHON_DIR}, -DBUILDSWIGPYTHON=OFF, swig-native python3,"
 PACKAGECONFIG[nodejs] = "-DBUILDSWIGNODE=ON, -DBUILDSWIGNODE=OFF, swig-native nodejs-native,"
 
 do_configure:prepend() {
-- 
2.53.0


