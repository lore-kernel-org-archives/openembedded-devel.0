Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0E1C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 15:49:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.87204.1723218550821966261
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 08:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U4Ofi/Zt;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428243f928cso14957415e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 08:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723218549; x=1723823349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gluzN/cTJyYHDHtW04Hxq33HyHceABm/rL+czDCVAs=;
        b=U4Ofi/ZtYoSJKrsrDjuhw9lrURNddbepjfQIuaX6wvRBQWpxhVfecJh/T7qsMaqvHW
         9KTj2y/Jh/0SgTs3Pvd/840RI/6SI5RJfEZLd+wlsl7W7WanQRksdZe4Vjtjewr0GnhH
         0YI9Wcz/G5MbOCQf3bGnJ3G7Piy5zmazkTXW4xSekfSwycq+CVccd81tT4eZMmmp1zo0
         CGfcUoq3ohC6FL+vDVi2BtFizQVEvztPDWtTH7cHZk1tE0Kg1HOrY5Rdw/cxpPgsWrC1
         3B5hmMNdYxs/TAK4/k5NV5QPqa86gcfOUiy4kAlGqJQmm23X8kYu3XDhztPVD/8ayVJN
         OWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723218549; x=1723823349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/gluzN/cTJyYHDHtW04Hxq33HyHceABm/rL+czDCVAs=;
        b=ObJkGd7InHtPnIsdWnmgxDaPSRTH8YvEUgW+WYFI8Y/dlgkisNjSXxmwlcekz5mFRe
         U091OhkpCt2pdMBff4IGQLfz//K0ZaPFSLLriKiWA573v2HqK4xZfegtH1fpVJvaZLUZ
         ow0EjS6Pjl+QV78fCyFhxIKsYR+SqUM1Upt4Vyjo62fRGbtBZpWq73hgkSAlLxA/9VZM
         43PHO/aSkysPbZdlocLCC/zDCdPD/hjuPJp3FYYGODjvpizpUV7w0kHWEnWIhZdBPQBB
         zW5LNZwq1JOKxJ4w68JSk7HHfp45g9ZNHxSAL+7Q5D/nZjENOY6ZqkzB7seESRr/sYMC
         d39g==
X-Gm-Message-State: AOJu0YyU2mo1w4xfdDlHohTD2KpoOoORtkCxapPsde7I/5efEJ4bCDgL
	az1HVi63BbmGXaiC2Rrd1wONkfR6PNmXfIUw/miYSiPICoQAUEGd/nNPZPyk
X-Google-Smtp-Source: AGHT+IFqPDRgC7YDtctG/Svw6WAHvY4e2ZmTC++98Fu1gsXyLbPPn6C55CJypaSzcdabtn8LBgoqpg==
X-Received: by 2002:a05:600c:1c89:b0:426:6416:aa73 with SMTP id 5b1f17b1804b1-429c3a19cc7mr12749255e9.12.1723218548677;
        Fri, 09 Aug 2024 08:49:08 -0700 (PDT)
Received: from localhost.localdomain ([176.33.65.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c738eb4sm81195555e9.14.2024.08.09.08.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 08:49:08 -0700 (PDT)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-python][PATCH 13/13] python3-gevent: switch to PEP-517 build backend
Date: Fri,  9 Aug 2024 18:48:30 +0300
Message-Id: <20240809154830.14927-13-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240809154830.14927-1-alperyasinak1@gmail.com>
References: <20240809154830.14927-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 15:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111709

The project has a proper pyproject.toml which declares the setuptools.build.meta PEP-517 backend.

Fix:

WARNING: python3-gevent-24.2.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use the correct class [pep517-backend]

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
index 806e09391..e44972178 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_24.2.1.bb
@@ -4,7 +4,7 @@ a high-level synchronous API on top of the libevent event loop."
 HOMEPAGE = "http://www.gevent.org"
 LICENSE = "MIT & Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4de99aac27b470c29c6c309e0c279b65"
-DEPENDS += "python3-greenlet libev libuv c-ares python3-cython-native"
+DEPENDS += "python3-greenlet-native python3-greenlet libev libuv python3-cython-native python3-cffi-native"
 
 RDEPENDS:${PN} = "python3-greenlet \
 		  python3-mime \
@@ -18,7 +18,7 @@ SRC_URI += "file://0001-_setuputils.py-Do-not-add-sys_inc_dir.patch \
 
 SRC_URI[sha256sum] = "432fc76f680acf7cf188c2ee0f5d3ab73b63c1f03114c7cd8a34cebbe5aa2056"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 # Don't embed libraries, link to the system provided libs instead
 export GEVENTSETUP_EMBED_CARES = "0"
-- 
2.25.1


