Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47000C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 09:06:59 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.54807.1753939520727785969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 22:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IyvMeUUq;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: nmjain23@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e638975262so87616685a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 22:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753939519; x=1754544319; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XdKn/5V+0AlQnLSpLKTvuMnMwJN/tciYVojwWwmg9NI=;
        b=IyvMeUUqhS/qmfaRGEXf0umOhBk9atuPs2jkaXFZnBPqNfi3nzLf+TzFBfMqYns50S
         SPaec/qU3Fz6MlC30griyANeYnkZHRw2PyJGmBXMU6QpovA93jcHLr+wB9hLq7Y2cGQI
         9yxdbbpwNF4e8LvFT6ZmVmq6SpwzxppyDmF0RyWmldvn4vIyU6k+aomF01ZOvcc+EMVy
         EECSvZVyoK40rL4UinwBSzEKCiIBFxDdG23h3BW1HfKkBrNWgJR/UDcslQIEY6hgvClP
         AYLapt6ML8uu+mQyAQTiwFzcZvIFMDedljobvWKjpi3ZfflVb5F9P09IP5obYC7CF1j1
         ArhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753939519; x=1754544319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdKn/5V+0AlQnLSpLKTvuMnMwJN/tciYVojwWwmg9NI=;
        b=koSOiQtLFS9SX9QeLVQHUrO1AxKD/tSEFfT+YQSSYIXv/L0I6EeZ0ToynlUFupdulK
         K9ujnhEQ9qf98A6yxW5deSSI3nN1XOdcMkdehuZWrTrdgTWewYwmE96sUjlvsxBK1AjQ
         6KOAWE9lc3qsefsrv8aflNr8XuIpfuyiZZJhddh3m2616LnvHZ0jKvGJMpFhLlnKgsZY
         QqmOzvwKq7gHdKIY2J5HBEuYMD3GniMvGGWsOVEA/GMahrb1cLwRCamgv27FFAFMHUNi
         Y7yABvBu1bMjwKa5hN/kb8PzAWtKsHhWBAfMQAIaLdWPnIlRrUsB10fozBXs50yCZ4Jp
         r3oA==
X-Gm-Message-State: AOJu0Yyy9MP7AfyfyacSV8JlOW7aIMJPQLtSRRhGkqMSLlxw7Xr6pf7d
	dsW2l/uvSAKve12yHp8U6sOGIdCDs8G3J8Wuv+pTpAhTlz1Xkd4nXKi9HZ798VkT
X-Gm-Gg: ASbGncvxEna4UIdYE2I8x2Jvi5o6vokSY0xcflTDxeK+2RytyXXoujL+GKGTdshMqyB
	0oUsLX2t/P3BaLMA9VhBNJmdW5Ms2fnEsKYjIoE/DlxaENVbBMiAXlt6yLxDanyivcCiYpTZ47w
	fs1ZGm3Je8Kt1NPw2ZyPR2dMCjNi0KOWeNrq0RYANKzQy2uNW0YwrWWatGi81BX0DziqRjwHvpL
	td1zoYqN+344t3nEvRxf9wVtsw5+YtgK1WkXhA+Z9uuGgpGAkCMSu0sUyGKAn1qiZAeaLWu/I9v
	FV0cTjtQ8KjS2rYNsbierOCAl4YmxDiqOdkBnT10nFdXZhBT5YM2zeb5o3VMe+q5mpGSSugEowL
	tXDOTtQdoGUhFZ7B2txpij+FifTAfxagOggL0yknE73P1paM=
X-Google-Smtp-Source: AGHT+IGaQlDtKMnc2KqM5F0xRdhsz5OKaI7WR1FTFlBu3FtOJMLLjppIt3Ic4VI/hQdEUj3eldXhbQ==
X-Received: by 2002:a05:6a20:748e:b0:233:b2f8:70e with SMTP id adf61e73a8af0-23dc0ea3f19mr9886801637.25.1753939128215;
        Wed, 30 Jul 2025 22:18:48 -0700 (PDT)
Received: from LL-3450L.kpit.com ([103.133.67.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfec28csm503246b3a.130.2025.07.30.22.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 22:18:47 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <namanj1@kpit.com>
To: openembedded-devel@lists.openembedded.org
Cc: akash.hadke@kpit.com
Subject: [meta-openembedded][kirkstone][PATCH] tcpreplay: fix CVE-2023-43279
Date: Thu, 31 Jul 2025 10:48:28 +0530
Message-Id: <20250731051828.506035-1-namanj1@kpit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Jul 2025 09:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118816

From: Jiaying Song <jiaying.song.cn@windriver.com>

Null Pointer Dereference in mask_cidr6 component at cidr.c in Tcpreplay
4.4.4 allows attackers to crash the application via crafted tcprewrite
command.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43279

Upstream patches:
https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242448a0de94fb901d3560

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit ea99328a0685b577adf4175e4d674c560ce9a490)
Signed-off-by: Divyanshu Rathore <divyanshu.rathore@kpit.com>
---
 .../tcpreplay/tcpreplay/CVE-2023-43279.patch  | 39 +++++++++++++++++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
new file mode 100644
index 0000000000..45581268c0
--- /dev/null
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-43279.patch
@@ -0,0 +1,39 @@
+From 3164a75f2660a5c3537feff9fd8751346cf5ca57 Mon Sep 17 00:00:00 2001
+From: Gabriel Ganne <gabriel.ganne@gmail.com>
+Date: Sun, 21 Jan 2024 09:16:38 +0100
+Subject: [PATCH] add check for empty cidr
+
+This causes tcprewrite to exit with an error instead of crashing.
+
+Fixes: #824
+
+Upstream-Status: Backport
+CVE: CVE-2023-43279
+
+Reference to upstream patch:
+https://github.com/appneta/tcpreplay/pull/860/commits/963842ceca79e97ac3242448a0de94fb901d3560
+
+Signed-off-by: Gabriel Ganne <gabriel.ganne@gmail.com>
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ src/common/cidr.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/common/cidr.c b/src/common/cidr.c
+index 687fd04..9afbfec 100644
+--- a/src/common/cidr.c
++++ b/src/common/cidr.c
+@@ -249,6 +249,10 @@ parse_cidr(tcpr_cidr_t **cidrdata, char *cidrin, char *delim)
+     char *network;
+     char *token = NULL;
+ 
++    if (cidrin == NULL) {
++        errx(-1, "%s", "Unable to parse empty CIDR");
++    }
++
+     mask_cidr6(&cidrin, delim);
+ 
+     /* first iteration of input using strtok */
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
index 32c978c1e0..8b41ba25a4 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.4.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \
            file://CVE-2023-4256.patch \
+           file://CVE-2023-43279.patch \
 "
 
 SRC_URI[sha256sum] = "44f18fb6d3470ecaf77a51b901a119dae16da5be4d4140ffbb2785e37ad6d4bf"
-- 
2.34.1


