Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A8CC7EE2E
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.94678.1683499449380092304
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ms7OfsX5;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-965a68abfd4so731303566b.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499448; x=1686091448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHPKUUBfZRSfVlFuo303CvK5y3hdtqYFnnu1EN8xjes=;
        b=ms7OfsX5jDy42CLBFHYFBK7Epkc3BWTYqwLaKK6lred6FMyfpUCInQxnsN1yC2/YC/
         Cz+5V9eQCgj09+WD/hGhbyDFTuSxmF4sVy+u39+k6kvzWLAwsV+matgH92S9F4FhnAi/
         HXdbkPMj3VA43czV8LtBr7Un32q6jflbvdvmMNoJlijxwxmvQkyQJUVu9RsExWVDdC0p
         qxPyREbfHrBToaGn8HFR3TwE2wyInNfSUibXUw3s5+D9apZXaLtN1YAXQMujIFAGJ4AS
         KDjbI2rmvQmXwKvx9qKDjiEwxHFbdNhgrSdP5m9MLk/dJcjH0HXvXHUePH4usVVA9MFu
         BjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499448; x=1686091448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHPKUUBfZRSfVlFuo303CvK5y3hdtqYFnnu1EN8xjes=;
        b=bpzj+ReM/hNo7ksdx/2wVnAkdjrKPnjSjZwuHDyor9vUEmIvoYOcW62o5Jqc/o+XoJ
         7m0nN5dJp4mB+LOSI+/oVWFNH5qfwWRuOIFyNmLlqr9PYRgfS7rqHBCjhFDn9op6RO+m
         IW6PFpP8X15P78kPrchnfylIRAv164OoUlNrN+HelkZvpawTmK79b8AZXbGLV23Usxcb
         fl3pa75Etn3E6t/XP1ihqva1Zhk7CfN8B4oFoq3EonyMf1nQoBidFrlhPbLYV/7RQPwB
         v5UCpk6Hxx8MB5AmIFucXVCFpIGNpnmqYDbPpLGC+U5pR2329oJ5uPPvvO+4T7Pt4h3+
         Y8QQ==
X-Gm-Message-State: AC+VfDzrl9UO4vixHKujpOE4oxRyBVc2IMMYzgIvIPz8PH5VNZlFfcse
	L+M0zzOSIqQq+AQNrxY+8/Q3k3r1VQk=
X-Google-Smtp-Source: ACHHUZ4+PHJBx3gJDW19SnpprksrXdClSwDpV5QYiuhflM9SBTAbH4rUS0a458t9aSheM2VMCtDfKQ==
X-Received: by 2002:a17:907:7b9b:b0:957:db05:a35d with SMTP id ne27-20020a1709077b9b00b00957db05a35dmr9129004ejc.48.1683499447712;
        Sun, 07 May 2023 15:44:07 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id e16-20020a170906845000b009603d34cfecsm4081302ejy.164.2023.05.07.15.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/16] libreport: add dependency on libarchive
Date: Mon,  8 May 2023 00:43:41 +0200
Message-Id: <20230507224354.1149327-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102365

* it's often pulled by elfutils when debuginfod is in DISTRO_FEATURES, but
  when it isn't, it fails with:
  http://errors.yoctoproject.org/Errors/Details/702773/

  checking for libarchive... no
  configure: error: Package requirements (libarchive) were not met:
  No package 'libarchive' found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/libreport/libreport_2.17.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
index a8d1db65bf..1f2c55c699 100644
--- a/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
+++ b/meta-oe/recipes-extended/libreport/libreport_2.17.8.bb
@@ -4,7 +4,7 @@ SUMMARY = "Generic library for reporting various problems"
 HOMEPAGE = "https://abrt.readthedocs.org/"
 LICENSE = "GPL-2.0-or-later"
 DEPENDS = "xmlrpc-c xmlrpc-c-native intltool-native \
-        json-c libtar libnewt libproxy rpm \
+        json-c libarchive libtar libnewt libproxy rpm \
         augeas satyr systemd \
 "
 
-- 
2.40.1


