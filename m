Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2957CC5478A
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 18:46:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.1875.1708541190220913647
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 10:46:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g7dJmLYC;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33d7b04f7e9so702671f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 10:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708541188; x=1709145988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hqgzyan6POYnrVifTmgoWQhiU7RoDh0l7+ZLbFXNP9A=;
        b=g7dJmLYCutsj0yR89fUpWezUB4eF7pjIoPhsGx08+d1izwDmsHY5FRFVkVOnLNUTat
         IAelhXgIAoN5m8n65mI8Qq5knk2BlWckjCK/OvJDsnVmVTkXT3DJogO5sydd/SaAmPgk
         6VaFueTAS2V5/F3EDWp5iTPWSCv/qAXDyveYOW0kAhk0I30vVuvEijraz3O9JUN9fwMA
         uMtQG59qyWyYGfmp3d1Ca45OI1rzJmxs8rCq0ifQfRBewehSmIEF2ed/5eGDuh7BWRVQ
         zMBs22/n+pGW/9q4mTLeDxe2n8u1Ibs1cAgD66i+QpVLwQJrE5xpqw7sw+ZHIzVbiLxO
         ShDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708541188; x=1709145988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hqgzyan6POYnrVifTmgoWQhiU7RoDh0l7+ZLbFXNP9A=;
        b=AAjgLWIQxSztQ5PEkkMH/tBLKLPyh4ZlJm1/2Ep09Zvhyx1SfMQffTsUPErOD0Wgw9
         rjBQZeg5yqNJvfMrfkfCygBTIg+h7+L8GKfy+zMVXRjlYl/YOXBUFkSPPW+khJXiEYad
         Ds2P5nTrQzERaYgq/JjcWpJQy6BDLRMjHI25sAfblpOygzpJWR9pm8MrQwQB0nyfm8TL
         frsz1i4KXiaZp+2OyBhdDLxad7CDQCt3NGJhkMc/S3PTgtjvYupJ66hDnNxLBnKZYksn
         OaAJI/8JeuNmIMkEnUwR5UmfeKtHpqQjK4UFIVTxz4rkfpFm/tl7bqHlBG8j5iSfcrs3
         YBpg==
X-Gm-Message-State: AOJu0YzOizE4uKCgfMkT+NJnYwmXLpf5xZRH9M+wIDdKJqdCheagXhao
	CD9X83wC40LurIFhnH4VIgEzZeP+nPd6HbYWdfBrMcDSkcPhdKy++PHnyo9w
X-Google-Smtp-Source: AGHT+IEidkGn9rxCdum+0rimH56K6RGBpuRydk/6JsacY9kaQPuS6uo8W9+qe9028iB/MlD5xdjPrA==
X-Received: by 2002:a05:6000:1a43:b0:33d:32ff:9629 with SMTP id t3-20020a0560001a4300b0033d32ff9629mr9270187wry.23.1708541187884;
        Wed, 21 Feb 2024 10:46:27 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qwpe05upfboa6f.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:1715:9d41:4853:e087])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d5687000000b0033ce727e728sm17483183wrv.94.2024.02.21.10.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 10:46:27 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: version bump 1.43.2 -> 1.44.3
Date: Wed, 21 Feb 2024 19:46:24 +0100
Message-Id: <20240221184624.3000696-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 18:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108968

And fixed a few minor oelint-adv warnings in the recipe.

Tested on Raspberry PI 4

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.43.2.bb => netdata_1.44.3.bb} | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.2.bb => netdata_1.44.3.bb} (92%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
similarity index 92%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
index 28e82dac3..8eeb61f66 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.44.3.bb
@@ -5,17 +5,17 @@ HOMEPAGE = "https://github.com/netdata/netdata/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc9b848046ef54b5eaee6071947abd24"
 
-DEPENDS += "libuv util-linux zlib libyaml json-c"
+DEPENDS += "json-c libuv libyaml util-linux zlib "
 
-SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
-"
-SRC_URI[sha256sum] = "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059f1b5ced75a44f74afc4d"
+SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz"
+
+SRC_URI[sha256sum] = "50df30a9aaf60d550eb8e607230d982827e04194f7df3eba0e83ff7919270ad2"
 
 # default netdata.conf for netdata configuration
-SRC_URI += "file://netdata.conf"
+SRC_URI:append = " file://netdata.conf"
 
 # file for providing systemd service support
-SRC_URI += "file://netdata.service"
+SRC_URI:append = " file://netdata.service"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
 UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
-- 
2.39.2


