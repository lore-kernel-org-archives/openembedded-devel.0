Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56374C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 12:29:27 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.8292.1637324965781174077
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=d2cG+loq;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id d5so17940327wrc.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 04:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJAbJmQAdsIL/KyJJTcfmBYp9zUEzfUp2Uvy797J+v4=;
        b=d2cG+loq+5K+iEgPa6zWYAtjOpmr+hmvcN1SbbCy8hFvZD/bbuKp+DWDfsKJrJEdJb
         UaucMWdtq1gNGqvh0CknJUvCJKwSmpxihLH9HHwy6le4feo3YmamaTugMIX+TVntbyNQ
         74ACejU9wUP8TtqKAtRDI6Ev1IU4Fyb+jrqP2SRZ+RPzHFZkVGkx0fiu+dOBhM8sOGgq
         P+xjKnShr0aNKkBYClrnjOSnyErk5Z08/jg0B+PLkFCMSk82LS0UWcW+vHrO7uUs1f2T
         H4L4I+P5xxJqnIpbvRLaCLki++Mp4rLAAoDQI8HPm2t1rkmLFNbnwNi2r6pH8m+EsUaG
         KXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QJAbJmQAdsIL/KyJJTcfmBYp9zUEzfUp2Uvy797J+v4=;
        b=1OvNvNLB+N2Yx+wmx4PTue7liFHDetw74SdSwtK/sJhAAx6FPoYnlbZMFTB5E4/HUx
         XaVWQgYIY8prvQxUHlB91wGWX2u02cbSIhEEsIOU3EjeFepYlW+s6PeCjx0JlqbfDcq6
         KIx2dU9gYYN/IzgkamZavqmnszf6MFTPcKTt5tzlQWbv/Ho/LJph+zqqFI6FUpQLZyoI
         Hr/ID2J/s9lzlSxvzSu1HcmUbB+hIwdCZgAvTQm1PpcH35ebI1NEKufY0kjBHZzS2Wvj
         VMD/w+KPxgsGs+92/mQHsKFT93jwboaBE/DwMalPbD8ti6jRgKLDP/21kbgVp7GGWT5M
         fNLQ==
X-Gm-Message-State: AOAM533/ZAzhpusqnoPPiAh2ekaNIPjB1BWz7RAuG25y533hSYtgPKgi
	POvWrh/aZC4bnSFO6SJWHRPqig==
X-Google-Smtp-Source: 
 ABdhPJyvGbkUvqMn3X+4Qrc2itTxpBZsNNshb0pVeajC5tYQYhHjq+lHfjMWxFjd8XjBzKxwp3BELA==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr6827831wrr.210.1637324964155;
        Fri, 19 Nov 2021 04:29:24 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 l26sm3228379wms.15.2021.11.19.04.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 04:29:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH 1/2] libgpiod: ptest: rrecommend python3-unittest
 when building python tests
Date: Fri, 19 Nov 2021 13:29:13 +0100
Message-Id: <20211119122914.28129-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 12:29:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94063

The python test suite uses the unittest module. It's not built by
default in minimal images, so we need to add it RRECOMMENDS explicitly.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
index ac4ba85d7..474784646 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
@@ -49,7 +49,10 @@ FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
 
 RRECOMMENDS:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
-RRECOMMENDS:${PN}-ptest += "kernel-module-gpio-mockup"
+RRECOMMENDS:${PN}-ptest += " \
+    kernel-module-gpio-mockup \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3-unittest', '', d)} \
+"
 
 PACKAGECONFIG:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
 
-- 
2.25.1


