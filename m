Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E262D33A44
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.27725.1730831893339057732
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GCNEgbsD;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6ea8419a57eso33727707b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831892; x=1731436692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YFFHDdafNBFmT2DUtOKY2Ddh0pd0j3mF2KICCNXLOAU=;
        b=GCNEgbsDVlXgMnA7kuRpmkeaQnL/WURjHR5YXS1fAby2+z+3bvcmSUBBl6HFx4YM+1
         JJ7MQwfCKYNKFtMZe4ceYD7mgEHQx3yooScRzgM1xs2o50LG3t4VjpHIbRnAqtA6MNk2
         szW7FBUnUQkEnHlcWZiCmjrTWTGt2KRX5fP24YokmsakFgko/I7EIbDDjh36A0wBaYZ+
         boaJ07fr2e7AowCQkL7X03YZTVNqWQeMJv49VVyOiIiGXvNztV65jEx9uzlm6xHB8YPG
         Jrle+uDh/tJWlFW6Q8hUbjHkiic2CKdFENebt9ARpqdlVgxKbgipkfm3PnBa0pY99kUA
         ttvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831892; x=1731436692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YFFHDdafNBFmT2DUtOKY2Ddh0pd0j3mF2KICCNXLOAU=;
        b=A/bVy2KR3gI/qYGswm+h44mbHLhKcl+14igDLmWHT0a1A6r+Q0BwEvj+c9HhVYWB6v
         Hd+MhAYe8EJeT5a+v3pgopspqeH8DGxWJQhmLtbJSaoIZIKnDZzF5F7yG4fQx6Ph70s6
         2hECJ3KQcRm+dDCLXaaV1asjLJcCAGEj0rBDDJs0NnvXsRWi3/PP1fwtMTvgiIW5Jdnq
         lTFTVou54oIIM2u8tjzhmYWgxspQpsP2wKddktTfyMXYO1kv2Yr87wbUfnN4qofgnWUd
         4XDu0Z5ntGTbzTbpC8u+9P1skO3hOhZIW6QYGT90cVvJR+TtmprRB8LVgmohLW/lGpVx
         WDJg==
X-Gm-Message-State: AOJu0YzdQSZEwtMdwb52CSGy75WKt2mOw6Hbu/JSRLfJI1LkyD32MlIi
	K1KFTPZv+4tOa2aaQ6833C/2XYK1YN1UtGRQBvsUGvOFeIFbaPA3w0P1w0t5
X-Google-Smtp-Source: AGHT+IFUMy5m3d1wnfiVo9qz2mRZEizcf/CBM5Wrm1HzMEgJgYGmxhXtnwj4NgoK0+5yZCTESqoKUw==
X-Received: by 2002:a05:690c:dd3:b0:6e2:3f8c:8fe2 with SMTP id 00721157ae682-6e9d88ea600mr242174607b3.4.1730831891998;
        Tue, 05 Nov 2024 10:38:11 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:11 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 019/161] telepathy-glib: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:24:55 -0500
Message-ID: <20241105183658.34982-21-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113534

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
index e08303923..56af002d0 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-glib_0.24.1.bb
@@ -5,7 +5,6 @@ DEPENDS = "glib-2.0 dbus hostpython-runtime-native dbus-native dbus-glib libxslt
 LICENSE = "LGPL-2.1-or-later"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[md5sum] = "cbeb0a24acc26e7f095be281c324da69"
 SRC_URI[sha256sum] = "9e0df1d8f857e0270cf0b32e2d1ca5a24aa7282873361785d573f72ad7f7d5eb"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
-- 
2.43.0


