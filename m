Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FE1CFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 17:21:29 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17531.1763918485579210799
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 09:21:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOsSO4SF;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-63e19642764so2600936d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 09:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763918484; x=1764523284; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSEfcvVxd7pTarCt+C1Fv07xfzRtQzp1I9G3MzFJlSU=;
        b=mOsSO4SFiaXF81koHF/SxA5i1uBx254ymxH1jK2/p2zcvaaeq0wRap+ezxlb65KIJS
         IL/m/PEYaiRF6MzWj5B3eD2w6Nx2wIeWCM1WUDfcSWf3yZU1gxJDUcWs/KRhSFsupitj
         Ykv/oHIYpTfwk9Q6pmbgr3QiRh2uyWdJzQ/kyOjb12VzzlZ+wn3tEcrYcFWQ6dLQwWcT
         xAc9X4sv2xeJ2SiomR63bOTMUY062AWpStMRPXXzRzDXlRfWVK1vo9AWe5vIObRhlefs
         oYIEt45Rn67OrPSdMt685bBMUnH8ap+ZemoC4SwNryh9HNV6euDVWsO5hel+Y+lRWTrB
         bBZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763918484; x=1764523284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSEfcvVxd7pTarCt+C1Fv07xfzRtQzp1I9G3MzFJlSU=;
        b=UWuTXvq3yt+4HuOVn6C9n3e9E+uNLeGH+SS6xF3RLF1JRnyH0R4iMUvuaNv9zKt/y3
         RRWo4aYFtSbcg/oyHuITnGF/olxW1I0Z36/rFV1SaUm9d0SXnY//+/jo/8h5J3FBK1AX
         hsxeSSKmdN5QGCuQ6DQ7VMAPezuH+fQUx5R2pFOqXA4jur263unjlUJszPRWsBGXI38m
         xyIj+lHHK+hT0IA6Acbm2yNN7XtQ7NaBlrxa6CUitx4VxmnggQHlwKh6h5pdCYcOIjT5
         ooDe+EC2C1FKnZ5ef++cWOlfOUdgHaWpJxjz0IRoyll81NRVF9Oic8WdQolAVLsnPfXB
         IlSw==
X-Gm-Message-State: AOJu0Ywztk/4R2JsqKF4RYVSSi8PFnvHBMeTjtUHfhirdIpIdNmbSo+s
	BIpJb4igWCuZF0uYIJTR4B/bqNQ/UgCbH//9RMe7vxs8g9c1StL73GNWBiJRUQP7
X-Gm-Gg: ASbGncvbLXOKarfTqwjwlXEg08847mu2cMtvAvLiiIUUlb+qHxRGuvy3uCrJzntOEW9
	59IXan16zMt+9lJtJfvBJUYTFI2rwla2ho53LKpAFGCi5UkoIiFD31m7pF1ozgVCtwBoGyXqcZ7
	tNLOdUJH5ak6Rg3l+Meq76fH4PjK/w8zyf0zKUBbRGzlqG4FQ7nxW+EmCFAtVUvxfU553NckwG8
	vC2bdVMfJq7UPEdJU7PYaV3+7vAZNMNfyjWbBmJXSB7ezJNpENQFlU2pmcum4sJTu/394VfoZf5
	1xm+ZSKCr00q+59HZVunci0WUjVnAF95N5qXQLORr09cEB0gi+/roiYKClT9CUaqfFGM0z6DMDd
	Ouuv8i+6GYhznr7na5pwvWAg+1Nn4PO2QhOYwqI61Mz/PPEM/qCfKYCmYzhWdl2FsLuK6hR+34H
	8dtEouThlER/nxURFpTD99pTM5vxKb1X0peHfGIywfn0iA
X-Google-Smtp-Source: AGHT+IEDByv+4cglxvveCbz446b844HByat9oBflDm4rsnAPqGuGfguOITkNG/TmB7wH5KfG4rUTOQ==
X-Received: by 2002:a05:690e:4089:b0:63f:bcec:35d with SMTP id 956f58d0204a3-64302a3a7b0mr6922861d50.17.1763918484028;
        Sun, 23 Nov 2025 09:21:24 -0800 (PST)
Received: from localhost.localdomain (71-208-12-78.ftmy.qwest.net. [71.208.12.78])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-642f70a6c44sm3996715d50.10.2025.11.23.09.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:21:23 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] xdebug: upgrade 3.4.6 -> 3.4.7
Date: Sun, 23 Nov 2025 12:21:10 -0500
Message-ID: <20251123172110.487279-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 17:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121997

[2025-10-26] — Xdebug 3.4.7
    Fixed bug #2359: PHP 8.4 Lazy Ghost Object inoperable/defunct when Xdebug is enabled
    Fixed bug #2371: Step debugging initialize lazy objects
    Fixed bug #2375: Xdebug's exception trace conversion initialises lazy objects

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb} (91%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
similarity index 91%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
index 6f8540c0cf..a3947a8801 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.4.6.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.4.7.bb
@@ -6,7 +6,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "4cd6a2523d9c1576c818eb4d15fe0c1650a25dde4d31d1d20a616e9d9435cc20"
+SRC_URI[sha256sum] = "7592923501e3fdb9741ad35b90e08fc6b3c5dd31eadc4c83b7b3c9dda0627b24"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


