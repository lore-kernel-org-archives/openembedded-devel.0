Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8159C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 18:40:09 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.14594.1700160004819215387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 10:40:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TK91dPYH;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: jan.vermaete@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53db360294fso1766013a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 10:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700160003; x=1700764803; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XvlBOPI/pqGG5TtTD8I7C7qTJKfeyNr2hddKTA6dRQw=;
        b=TK91dPYHgSSsdQGtXS16CoCqD1aWtwqiHPyyfWfBqaUllc3hpzDGWhj0Xi9oG6HqE6
         CfZMXnqchcZQpl9cj6eT+WN7ljyuEmoshlL2KRAYKwX9HfayVwHNTcLS0mr+h5cjBrG8
         uhreXzIbbpWnTE7G8OpHyBZsCK+/5D6GyliO7ve2mc977AQFzx/jzCdUgVvxdgO0k8EX
         VLhU3TPdjA3cZMdpr/slTyhqBfA0ml35MpTLGUUJcdX9qdXylNdv2IG0NeyXviGNGVBX
         HkeMTkm8m1Chnz6E7egOnRO7F6fxP6scW8f9ny+XevVrEjMQzrtF4sIoKfJJK3XWzEke
         IWhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700160003; x=1700764803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvlBOPI/pqGG5TtTD8I7C7qTJKfeyNr2hddKTA6dRQw=;
        b=luwGxEEZPwYw8YSv1BBLQgulFxLv13/174MPI9xlQRbjXcO6ZfZUeyo/d1r9GhP4xh
         j9t26dLH6lrT7mMmuC44oP07A7x2RGzlXxLjryxigXstMz9qcKm3Y+MMAHpb3Ds0LFGr
         iG/AXy1d0nO4gmJ0VAy1yXQInFaOmOPABfaUWQKCi9xJd3/6a5ryFO+v4K3AR7nS4j3F
         4l4+zlKL1j7dmW0gxTL+/hKqrEtdonqdoolZAe3EGLaJiLNDwpxaqjDs0Ib02ME9VnFQ
         BqDu5BKjmcuBc1H6dnYeihnYCVlG9nzuF3nwymHcBCOoqfTyi46ve3azJHslvdfFxMbG
         fTsg==
X-Gm-Message-State: AOJu0YzYl+kPr2kJyKR2pOBLRodQxk+4sCnZElrbHTxk0kBkiF2zTI3H
	pp2XNbEdqThLrhUa6v1mokWZLzW+k4U=
X-Google-Smtp-Source: AGHT+IExzc04ZD1hMJd0xl73vJCqReqUnmSMUGOGVvQOj5ghaCcH0wJCgWWMPIXSWx4OdhU9U26YDA==
X-Received: by 2002:a17:906:774a:b0:9e6:da40:50e4 with SMTP id o10-20020a170906774a00b009e6da4050e4mr14232372ejn.7.1700160002681;
        Thu, 16 Nov 2023 10:40:02 -0800 (PST)
Received: from localhost.localdomain (ptr-fij45qy5yuypv0vsveh.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:7720:7419:1b40:3cf9])
        by smtp.gmail.com with ESMTPSA id lt7-20020a170906fa8700b009a1a5a7ebacsm8645510ejb.201.2023.11.16.10.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 10:40:01 -0800 (PST)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [meta-webserver][PATCH] netdata: version bump 1.43.0 -> 1.43.2
Date: Thu, 16 Nov 2023 19:39:56 +0100
Message-Id: <20231116183956.26469-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 18:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106823

And fixed the upstream check for new versions.

Changelog: https://github.com/netdata/netdata/blob/master/CHANGELOG.md

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 .../netdata/{netdata_1.43.0.bb => netdata_1.43.2.bb}         | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-webadmin/netdata/{netdata_1.43.0.bb => netdata_1.43.2.bb} (92%)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.0.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
similarity index 92%
rename from meta-webserver/recipes-webadmin/netdata/netdata_1.43.0.bb
rename to meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
index 07ee03d86..c56da3744 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.43.0.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.43.2.bb
@@ -9,7 +9,7 @@ DEPENDS += "libuv util-linux zlib libyaml json-c"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-v${PV}.tar.gz \
 "
-SRC_URI[sha256sum] = "d3c66273d8eb62290d412c870dcde45ea214ad187df9d5350f682d9e6d19d426"
+SRC_URI[sha256sum] = "d4a7ea2717ac7c8f04865f18e13aeaa0a36784156059f1b5ced75a44f74afc4d"
 
 # default netdata.conf for netdata configuration
 SRC_URI += "file://netdata.conf"
@@ -17,7 +17,8 @@ SRC_URI += "file://netdata.conf"
 # file for providing systemd service support
 SRC_URI += "file://netdata.service"
 
-UPSTREAM_CHECK_URI = "https://github.com/netdata/netdata/releases"
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/tags"
+UPSTREAM_CHECK_REGEX = "${BPN}/releases/tag/v(?P<pver>\d+(?:\.\d+)*)"
 
 S = "${WORKDIR}/${BPN}-v${PV}"
 
-- 
2.34.1


