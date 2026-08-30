Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68DEC61DE1
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:40 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1028.1788051036051691924
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KGeevW+k;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3322265a91.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051035; x=1788655835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yknL/yEM0c9d6S+EkUnDn9285gm27wRgPtAhexULecc=;
        b=KGeevW+k8G5ytwUL/3/qaVKVACa864rb/EsKdueqNsdnXADHobddNkL8dubEPbwCcz
         mdYgHYY+KZBBuWIcUbHeqKOSIJHsLp4CLVITs7ZlqslQXlAs9IZmBv6xGrSHs9im2Aoo
         NmiQsvELbukSUuncNpzbLE/HyuzolYkB1T021s9HofzURcYW/maY1Q1vz6Jkd4E6/ZD1
         7YK/9ac/OoSUXH07h8iKkloPSZAqEA0hPRyQAiO1BEnKG+fxa7jykn8P0hRBt9RaSb+H
         xekOu2xZA+bGsAAf9d8Z+8Db7VlPTJmtmF6lUeW/vAPx5Kjzb1KLrefJM+YzGpOspIE8
         XUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051035; x=1788655835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yknL/yEM0c9d6S+EkUnDn9285gm27wRgPtAhexULecc=;
        b=k7sOlBHe7REBh091+4Hh6pJQdIapwimt3KHIt12m1GiC3kXyH73U8mecNWR/BfXiwt
         Dq2D7V8cjaxYSO5rJvT+2eaWuV2e77wk2tp4Nqd3mhwSKv5EsCbXs+j/eXL7UJ6PgzJF
         rknPuBO5ETYcOC8rXhA0izym0KnOxEZLZiiWGxBpUieDVxZcHP0pDguxYUC1myHhqyx3
         dEREuF9bNnZh05Ooe2rossoa9gq3R2H9pauS1MSxYh1W1nqwM7rVfmzJWSOvdQ/mELjM
         iwViq2/nvwlPsK2lphMZqdt5qqw4xXlmdZI3PAO2pllyldgW+aWTUkb9ayFnBCqAGPzn
         9W5w==
X-Gm-Message-State: AFuF++l/7wRcFPJRhJdWD9aVaug1tq6gYOAQwq1SwIAuJH5JlOpcpmo9
	+7Q4YTE2fWV7qmtbqKxnHrO+AXk6GUbkABWWk0xZJRmiJfEOMfToBA2+itRGvTti
X-Gm-Gg: AYBFou1YnWvb27R22thW7ZUSG5Ij0PJ3pW2oRbhmLwEM0/6/OKwxK7OzgEdXBwMaI8H
	tJYgtYaM8hGPmI1DsMp+R21jA1mg9Jmobz6lKSAP73gn0niajcgr0u4xKmM8LsNR8qsumxjI+B1
	PtQLj5dUGb3ECvnFZRroJMhtkSk4mC29UlukrmHtPorjYU0lHkUwoYKjnsWUw3lD7/XRjUFcfTl
	7k//2fE+Kx2IScgW5ySm4khwYHVvpys3/ATjZCfMErKtxes4E5z5Q57m+p/RuqXx1v5FkicDkvl
	0YXl9fBTyi9fcSn4VWa+xF6FeKuxJJtvb5607+xwnW83e8F71BF7kBkOW6F2sAJ2EFll3zuHr+Z
	g+LccPbd+MNgsuyYrmA1P3MRle+vRduc44hwj8p+CCg6wxoSEVmgFolCN486UanKGDWzeXswppL
	/mwvyohk843H1rs8iY9q3aKguxCeCL/ETp2MHFq/PCJVbOStoWl7mgO5raSAZVaFTA07SAkiVp
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr30402458a91.12.1788051035489;
        Sat, 29 Aug 2026 17:50:35 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 6/11] python3-tox: upgrade 4.60.0 -> 4.61.1
Date: Sun, 30 Aug 2026 12:50:10 +1200
Message-ID: <20260830005015.2555347-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129587

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/tox-dev/tox/releases/tag/4.60.1
https://github.com/tox-dev/tox/releases/tag/4.61.0
https://github.com/tox-dev/tox/releases/tag/4.61.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-tox_4.60.0.bb => python3-tox_4.61.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.60.0.bb => python3-tox_4.61.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.60.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.61.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.60.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.61.1.bb
index 43ac28cd6a..f1ddc7d723 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.61.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "6f93bb580d35e00fc69cfec1116eecbe21155f747753ca5019374f7c69b2eac9"
+SRC_URI[sha256sum] = "d41ff6eb434d71763740ec90d869cb82688e6ff9204c913d8bea13fb75fc8f9a"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling

