Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6F2F36C30
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 06:28:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13766.1776666478275559751
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2026 23:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cUD/ZgzF;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so5711825e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2026 23:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776666477; x=1777271277; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQHUcmycMtUB9LAdI3eVmQYRc/AZ64IKq41+RFPSAW8=;
        b=cUD/ZgzFgMDthoP+eAF5CK1fmLkprneiCAcFSk7bElg/cTwxKo4mC2djubiMpin+Ud
         W3+mB8Ntee6gcPWoUG76vMsIVTHD/WJS3JRXUdgCFuKjMDE5UkRg5K/7mKNxjDILC3X2
         G9zsdLeeSGtROc9+1DNi0/0Y5h5SN7qufIDjOhmTZs2blQi4GUsqEvqdJJSUpcXj6wod
         vxeSIbGRntj9BISONULY/x2mHwlXJ/0tKRM1I2V1E2FbdFcMjJ1fifRQOCkzoAJ0bGoG
         51SOD0D7zSVa4BnjN7r6mtNmok/Zy4rX/v3HWwXq1WjW2iMMGOPyNIKf/dMTzKuwT00X
         u5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776666477; x=1777271277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wQHUcmycMtUB9LAdI3eVmQYRc/AZ64IKq41+RFPSAW8=;
        b=Eqfu9IDVeP9yPHLqHaarHOzIzAJhluGxr1nXcpT7P4n/6tlF25lXUI26UfsL+armAH
         5LvP9+iIMHYtK44JDEfLJYscO/fAwkPcv8fJvIS1zk0GRd0Ih4gLHS6LnNqXwmrtjxnz
         ayy5Pw8enV44i+r8uSduyhjN+gcYgA15gKEMo4LzGOyPjhI2vcfWfzQBM6nAJ2a6QKlz
         zEz4iWMe/ICxLCG2L3tg6ZgSUGtMs5JqgTjnvLl2VHs7CSpLxK3RIdg4Bs1vnRU1ByES
         wfk0ZJM19x+/6e9g0Xq66gt0CfEbbawu7sIRQiIjoJnhqX8sJyc1vNptRJhlsZWn2WSO
         rMyg==
X-Gm-Message-State: AOJu0Yx4/NV+/TtznLoHPzz2dHzk26Rhftami9Ul6gSO0C2btC35qKvZ
	Irv3rbbo8wQBZlcPfTIh3nDssC06NCVwTbGQnQtMegVXhgAZaiJC3kRWlnAdiw==
X-Gm-Gg: AeBDiesERa51sLsOkv/1swn6ysHr+c2v20C04LpN64TvHcxjIDCqU0ZS5EO3/4ytGV8
	SL9XJ99p4qisak7u+uvz/WcAatVSRjRiNA81qAQ3ssw9Gizfc+fmuRWQQ1QJK16cMnqmNA7cW1H
	Gct1peVnLNQ97NqUGWSOKL9FkvTT2cBLCN+v8Uf23Vqx+weHDMcpo+w0APNcqnJsdYQpaiLpkRd
	hhqUMUbvnpk24R3PA1OQN4HdWDA0CsGOZdKkjQ7lM5x8Y8N3OMyu37ehC+YWprDd8Z8udL2REQJ
	l90Mba9kdjH9UjWoOUNuTm6JBgo4p1pgK72t5vj3FjiKQIDAjIfT62KQl1904TKV+HstnJ4FHJu
	a5tAQ/oRIxa8IAqENrbne6ZPrHtLRJ+zjMIyx6xPFJmDQaPxwff6QWpFYaT/WONKia8gk416ST8
	1j6b0WGyvsq4VjMUu4T5f5P5qrHyNq9edNx3zcv9Cubg==
X-Received: by 2002:a05:600c:33a4:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-4891abb574amr26339465e9.5.1776666476504;
        Sun, 19 Apr 2026 23:27:56 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc17f642sm238296665e9.5.2026.04.19.23.27.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:27:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 07/17] libcoap: upgrade 4.3.5a -> 4.3.5b
Date: Mon, 20 Apr 2026 08:27:39 +0200
Message-ID: <20260420062750.3795917-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420062750.3795917-1-skandigraun@gmail.com>
References: <20260420062750.3795917-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 06:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126471

Contains fix fox CVE-2026-29013

Shortlog:
https://github.com/obgm/libcoap/compare/v4.3.5a...v4.3.5b

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libcoap/{libcoap_4.3.5a.bb => libcoap_4.3.5b.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5a.bb => libcoap_4.3.5b.bb} (97%)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
similarity index 97%
rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index 611795e17d..e7279013ed 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=05d17535846895e23ea4c79b16a9e904"
 SRC_URI = "git://github.com/obgm/libcoap.git;branch=release-4.3.5-patches;protocol=https;tag=v${PV} \
            file://run-ptest \
            "
-SRCREV = "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
+SRCREV = "851533c3cf63d16984d370ce39d586ecb3694971"
 
 # patch releases often use alphabetical suffixes
 CVE_VERSION_SUFFIX = "alphabetical"

