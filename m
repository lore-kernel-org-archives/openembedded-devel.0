Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6355D3E1AC
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.29948.1729278796017416628
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l6QeQ82Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e3c3da5bcdso26429937b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278795; x=1729883595; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBPzeskPKCXaHS4XpBXzYjei9wsw/uQwWOI2mUXzCRI=;
        b=l6QeQ82Ytdsx/Fg4DVNyXI+RuYK7jxEiV71laBox0gop4H1OQt0ZSSs8nE6S0E7Qmr
         E2uKVa8HRo0bo1To87Ig5HuTrEZI377Qzi9r2xjRfqOal0S1SMJLw3YTmQBYKVFJ16fA
         llO8XT2TYAcyYn+G8M9v6x7UIFSdee/Fu1wTPnbWfxaSySCIZGzwk8m1mkgLBUhXJaib
         29fE9PJbFQXrH17M4u9OdN4gTNr63PWr/ystsz0RPQ+Q8pBWWAz0CEw2dTx2HbQxLEQ6
         fK4p91XBDlztjpu7d50LGm+DPaz0Uxz02CNqIdNuyA5MUJDS3zzjDoD4VLK5anYtlfzX
         hirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278795; x=1729883595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CBPzeskPKCXaHS4XpBXzYjei9wsw/uQwWOI2mUXzCRI=;
        b=TRdLibpMa55HfpK43+ogN57Szy93ICXF5REzEx/iEP9quGrb7OF7XkSqHXYw2PoRdT
         PsDBMfQ4jBFbvhU82YJIs3Friq6ZuQTpO80SrM1gw4HzvKKK03nOZOI3BuEaJtlhsr2M
         XdmLrSRTwODhfs+LGss7hEMOFSrx8Xqk/pFzxR1X+R9STGW6deji3kX90CdD9RpI0+/A
         uAl5V1b1FkVAPBQMHZrpMRRsUS2J+g07WAvUVHlRLvDNCSVyyZU9JduuDyEofgsQIFy3
         +iOVuPNOSVN8Bxcyd3DAdKTz9HHK3ciKriZc7PbK0rshmNx3dRWx6nDXXv0OZie1ajhu
         AhOQ==
X-Gm-Message-State: AOJu0Yx9/lH2zpMRe8Li7hExMJ0joLqYwjUJqwyiTB7effroyMKMXGLf
	xFxj4MUOi2RbxYvb4o7XVHzTei7siBarazGRf/YXFGN+kNrfrXbGbWmiHw==
X-Google-Smtp-Source: AGHT+IG7UXAi+j5cf78cASKjsVrkUtDL2PRghQT5ekruKlKgkREu/QiPzHEO1h2zq72kitWN4My+1w==
X-Received: by 2002:a05:690c:6609:b0:6e2:1336:55d8 with SMTP id 00721157ae682-6e5bfbed086mr39224547b3.10.1729278794436;
        Fri, 18 Oct 2024 12:13:14 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:14 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 06/68] python-django-south.inc: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:05:53 -0400
Message-ID: <20241018191101.25184-7-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112993

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-python/recipes-devtools/python/python-django-south.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-django-south.inc b/meta-python/recipes-devtools/python/python-django-south.inc
index 28eb84c56..c2932f923 100644
--- a/meta-python/recipes-devtools/python/python-django-south.inc
+++ b/meta-python/recipes-devtools/python/python-django-south.inc
@@ -4,7 +4,6 @@ HOMEPAGE = "http://south.aeracode.org/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
 
-SRC_URI[md5sum] = "c76a9758b2011bc3b6c39f881bba2f66"
 SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
 
 PYPI_PACKAGE = "South"
-- 
2.43.0


