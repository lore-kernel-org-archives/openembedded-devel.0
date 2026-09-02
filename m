Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FB2C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:05:26 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9032.1788343523292192490
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oFKWXr2q;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398a5aad413so748860a91.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343523; x=1788948323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfoDaQfvqXQcVLMu2Vx6363P6f7YkbQ695BN9BxgStQ=;
        b=oFKWXr2qFM5wHWUPRdf9soKcU8xLqNhvndB3HIrEGlwMzGgEcy9Ipi02zDL2AhDt8g
         rBEuELPZNYwprX8ajhi9OJUdcKRFUXHJQQM1AZy9GX9l4nyJpenJLgWpsQDLUPczJBK5
         HohfKGmchc8lhBwBb7NTNzezm/lJCoPF9SuxzypgrOkaaiB4y0tD3SjsKij+lQfCgRoR
         PRnk+jpF/xv0UCa6pt/V+g1W7ZULGIrXm9Gsl/NgD9aVjx5OBA3ONz5arF1WxM+C0FrZ
         /bQzh9mrLzpLbMIaoDenCeekRrQ3n0FaAF5RxOwlwUA7Ca8gMoPO/Mjup9p7qbC+nNZ2
         PpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343523; x=1788948323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pfoDaQfvqXQcVLMu2Vx6363P6f7YkbQ695BN9BxgStQ=;
        b=KnJnAnqmA1AlIZ9wUms6ntuPRQJ1mdVp8enaPwREBs6C4OTDyH+wDDdLtLj1wWTbV+
         YtxYcP0cz37V7Ag4TpR9lv3hzKO8bT6ngfDgUUznYNqFpsqWVn8quk/ZKWT0nfplMrn4
         Ljdv0Ac3kbRMNgTl22AKboc8g2f74CuVHztxa1G5f9ge30uA+jx6hEF2f4HlYLbstxIu
         7FdeeBLc5c5YE/9ARo/cX1ZrKOeMIOgaH/UPRq5zuE9jJAnSwUWqaAZdUDrL2v5h0eUF
         DBxpo9yis2pFsoSHYlgrY6TCrpQL6Y80UIWOHmcYMhq+UNn0u0WamPk/ES7/FsB99GvY
         B6uw==
X-Gm-Message-State: AFuF++nxP7EOuhhcmD5tvjGYg/5r2QQ+ztfDdz82e+/9zMX+i5FSm6RM
	QDrfnPYyl7aHICOHWVIYOz3BMZhJ02UXMSsQAc+63dANdkX3OpN/0tqlprkR+0JG
X-Gm-Gg: AYBFou1SQ2qn4cOjy/KhaTxiqgVU9blZuuCh5cR9I5+HyNV7+GEqtO7CFoNxCXnI0iW
	WxEH9HM9HWyXWok726k0Zi8JV++gYlXHLv05/5SfAEjl++btvaTMYnv7YsdIF+s/+NhHDGpcfoM
	EstoRj0UqsbaEtrr/xfAWzKTqNojhiI2dGUyxSyuch1nsWl1c9AXjldpEtrJ3VqY6b9HQ15H9gP
	7ppeVJSszQuZQdct8moDjlWC8uggfys14Ji0vwABqU0mRY7BZkvyESgPS2Oiz2UWL15Gy6T/TUV
	eZD+PmzTOnWYCWTNoChO6dRycNWuTX4ba5Ou7O9BGCWDa/4q9lM7eeSEwjyMuk4BzP8xk75s71S
	QZzyub8ZpwY0Yf7/i0wiXAUxyhZq47TLo5bhDQ7m6eklx5/mweB3pfECHSQBKLXetdWLD11obDR
	7dNli7wuXii3CpP7IUqj+6ytCNM+2epKuU3QpSxfAe2blO/sTFU3OaJOuwUS7Pq1VSReTz99T1
X-Received: by 2002:a17:90a:ec85:b0:395:5f43:4ec4 with SMTP id 98e67ed59e1d1-39aedc3b980mr5625380a91.0.1788343522510;
        Wed, 02 Sep 2026 03:05:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/28] asyncmqtt: upgrade 10.3.0 -> 10.3.1
Date: Wed,  2 Sep 2026 22:04:44 +1200
Message-ID: <20260902100511.2105916-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129633

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/redboltz/async_mqtt/releases/tag/10.3.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 965ab7088da70d00d648216f54dbee88074cebe8)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../asyncmqtt/{asyncmqtt_10.3.0.bb => asyncmqtt_10.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.3.0.bb => asyncmqtt_10.3.1.bb} (87%)

diff --git a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.1.bb
similarity index 87%
rename from meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
rename to meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.1.bb
index 0e1e155356..ffa559e39e 100644
--- a/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.0.bb
+++ b/meta-oe/recipes-connectivity/asyncmqtt/asyncmqtt_10.3.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e4224ccaecb14d942c71d31bef20d78c"
 CVE_PRODUCT = "async_mqtt"
 
 SRC_URI = "git://github.com/redboltz/async_mqtt;protocol=http;branch=main;protocol=https;tag=${PV}"
-SRCREV = "7129d72c1b9adf159bc506206df3fb422bb9fb84"
+SRCREV = "0adc511b85358397d8ebb27c10f1ab62da3e3e05"
 
 DEPENDS = "openssl boost"
 

