Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F29FC7EE3A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9096.1685521509908603719
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=dNkfz4tT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.48, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-30aebe2602fso2458207f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521532; x=1688113532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmbVfkEIMfv2XX7y7aMNCFWV01wPP3al7Csp4WZ7Nk8=;
        b=dNkfz4tT7KUfi+eFlh7M04XhSJLmpC35yo06FJ2A0scC/wi2dlrzs7/94nyWYGhqpE
         pJsaLKgiOOnfddWPtloD6fbVotg1kqNdzVunm8jqyBLNnboOJ/FRIM7PrQaZHJPCIqU6
         reVIH9yofUyoKGiZv/O11VXylZO2KZYZNcHDG/y6GYCQCGpJrn3I0Ty2ZVgXdZUE6C2n
         fukaFZHM2t6+LCSQ1Eu/95rffGJWeyZV+nu/A0rlGtO5Jc/tOdCdlPAgFr9ux/xXmPaH
         M7bNdl+6I7V2PSpEnFfnCgL4Y0cpHhBH5U95xhUlqJOZvkWQFfszlUB6MCAUpvvs6qs8
         9m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521532; x=1688113532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmbVfkEIMfv2XX7y7aMNCFWV01wPP3al7Csp4WZ7Nk8=;
        b=daw5B2pcArrLOPMbFOBkeGl4xBWCYaOx66RZ9xOe0a34vImgwGsX3tjJmyXal5PZCc
         UW48kWXSkin3JTuCmdWS/K3YQomur7cMgxa+YrEeDtOxQBWSW9bJm6vAczO02aruixLF
         9btocMjlUlJ44R1r1fUHk/Bo7txkXP1vSZJ4VYIx4H9zEuOKhUrz0j1XWjICM+IBbQvd
         4CDGNmFCYUCVoeRrWK3IClNkrpW2Fb/WtjacsQX9COP+cxNKB6HJPS2bXJbXmqVMpKDU
         Vl1ot17Dso89uc/R7ohg6IwdNsz9Xq9LmF4ANLIj9pjgBz42wlnnL6E3Mg8wVnqOkWH7
         DdwQ==
X-Gm-Message-State: AC+VfDwY5B/yYufNkSqaSPutPXbUzd2Ad/ro9mDQVGrrpztKVXRVQvdQ
	gWm/U4Zls8rwgGXha+c0RW80SA==
X-Google-Smtp-Source: ACHHUZ5dlUgLoaEksS7GO2WGCTR/Iv+aoDspq9tEq8lVsOiDjFiyxgHeH3xF3q3TGjHjXeFVrmn6kA==
X-Received: by 2002:a5d:63c9:0:b0:307:a7af:402c with SMTP id c9-20020a5d63c9000000b00307a7af402cmr3173435wrw.41.1685521532423;
        Wed, 31 May 2023 01:25:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 024/149] python3-iperf: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:32 +0200
Message-Id: <20230531082437.10646-25-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102950

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
index 36d646305..9a8e6f7da 100644
--- a/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
+++ b/meta-python/recipes-devtools/python/python3-iperf_0.1.11.bb
@@ -9,3 +9,9 @@ PYPI_PACKAGE = "iperf3"
 SRC_URI[sha256sum] = "d50eebbf2dcf445a173f98a82f9c433e0302d3dfb7987e1f21b86b35ef63ce26"
 
 inherit setuptools3 pypi
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-json \
+    python3-threading \
+"
-- 
2.39.2


