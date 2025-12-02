Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F39CD12675
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 21:34:23 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.418.1764711257372612955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 13:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MwTM2DEu;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-640d790d444so5110760d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 13:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764711256; x=1765316056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D2d4D46OmFM1VkI/A64l8uRY00ye+Tv8jiB6vaDid2E=;
        b=MwTM2DEuf4QKn73nz2UGK6U6JBi/JjcvvK9Ci1s98UQUH8QWixrlyYZjOh1qFB/Uha
         bwgcBfq+/ks546rA600OwP4lsQ9IKvmZa6VnWZB9WTPVuj60LIFVNmEerE2JGpv/4Jjt
         5ILgTdavYL8QF5vjMDbP6wY6S2dcHyQiohNJ//Qg2vSuhJpjPYLxUjFAbmUCPgHRwvJR
         ngUo9HqXX6vJormPW1xZw07J3byabMO1DDYmBkV2QhF10fFW1T0OyGilZNhkM+CMyzfw
         uV4MYjUtem+fe8VwUIqocGhSc+R1127eUBgznbsk1mUDmTXOxJWUo1vZqWd5XlJndsl6
         viHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764711256; x=1765316056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2d4D46OmFM1VkI/A64l8uRY00ye+Tv8jiB6vaDid2E=;
        b=VayFVcU5ONBQ549JJ125ukvkYKVY3i99fpkeyJDpR6LZp4foJTb6+V95g7YMo40mVD
         fP5ihc0BMfRQrV/zZNxNZWJnVTvzOuXxCdsYW2VKjfBWFvfmXhkQYdlkVwNLBEtm0IZW
         Yl4Plmo5JGIgNFjv6UNO6xBL8Y4vfa3VzzMbqV6DZ5Km4bLxa1lJl1/nNNMCKQGbakDq
         Eaa8ueeRvI8iEZIbCnxuvzz9jclgyW4AZWTY0UgJRvf9DKSy4SF7nXy0xw33L0w4RN8N
         58/VgZdJ72dDNUeJLc857SHL/hBKHGyKNCdljGGP5UtHgW39TVlB8YFEsPi5EcOrfHpi
         HOAg==
X-Gm-Message-State: AOJu0YwmP5cK0rEB5VLdMdFiDMcjl0kPyShS1cSHKZlcBsSnTTIukYkx
	zRB64Bph4sq0CQF5oj5ZcD+KfAa2Zbkx12B29W+MdBRi0zeox/bqPaQ6CLDq20Iu
X-Gm-Gg: ASbGncuOGUnI8FZAKS9N0z7zttyRLRs84Zl8ACi7NCUzVwme/qqoa+UQNNwQVdJvVto
	IzB5ktF8SINfsbMVRHle5CcDyaK0dwgXebn4rE9roerJF16YzKcBV9NHa615sPMCKZNcfqjtR+N
	yEqovwPBUU9pRtpcKFuKdPIRrsqlO4s7/73RncB3cz36dK1WcBMPX7UE6uen18C31mH0NUipFwz
	63QTau56UCRZslPfJWN51F4EZl6N5v8YJr6I2s0vV/Oq5IcVLRSDl4+hqqBQJMJD9GHi7m+28LS
	oKPkIygbCPNzRHsz8W7RIL0+PUyRhcEeVTzTxmXumO2+u6ozoJ8scoJNLovxEikapVR76Z4/Ci6
	ww0Bgbh2ru5JEQano20ZnM4v2a4SeZnkUHGmyS6TM6zWpHwWXWxUWQAYwQdCnzAc1N+kX+phl03
	EA6bLEZ9ke+Vkn0Dqr+CoTvBWrNnOj4e6iWgJ8xm9PHpgQI1JcSeDYJhw=
X-Google-Smtp-Source: AGHT+IGsZkBPmZ3gZsMoKIDAdSzw2+A5WmloD/7I8qaDTea+jdGzZcC2Wxd3h3KOR66i+KULbM8Cuw==
X-Received: by 2002:a05:690e:1444:b0:63f:b222:e14d with SMTP id 956f58d0204a3-64436f6bf21mr207258d50.14.1764711256033;
        Tue, 02 Dec 2025 13:34:16 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d61404sm66536187b3.21.2025.12.02.13.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 13:34:15 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] webmin: upgrade 2.402 -> 2.501
Date: Tue,  2 Dec 2025 16:33:59 -0500
Message-ID: <20251202213359.288416-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 21:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122272

Changelog: https://github.com/webmin/webmin/releases/tag/2.501
Changelog: https://github.com/webmin/webmin/releases/tag/2.500

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../webmin/{webmin_2.402.bb => webmin_2.501.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/webmin/{webmin_2.402.bb => webmin_2.501.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb b/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
rename to meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
index b2b1b818f2..2c807947e4 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_2.402.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_2.501.bb
@@ -19,7 +19,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
            file://mysql-config-fix.patch \
            file://webmin.service \
             "
-SRC_URI[sha256sum] = "ced99a948411e255549f4ce8b730820387a50379d755e802ff90ef6ae5deaca5"
+SRC_URI[sha256sum] = "0f2772a582d4c4cf24085993729cfc94df2a64d619cefede5400c24b02efb08f"
 UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
 UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
 
-- 
2.43.0


