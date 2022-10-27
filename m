Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A26ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 17:33:49 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web12.401.1666892021165442796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 10:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BGxrN664;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id s206so3070312oie.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrQT9uwSwYuRkvqA5JP+fFBwi49zo20rSbHzPt0gPzM=;
        b=BGxrN664151WX32yJNwFM6Lem1Wi4NcMEd1aLslghOFa37IZirecnwtN9JD+gCHz8q
         jZhkxysI5/PVyBe/UsVPChBWUoW9PrGn4VFRou2Nms8epxSz3Qbm3tx03zT8qfLkNJnj
         qndIRwKbrWuYEcx65IfSvy0VADnVBR1F2XLMT+pC8XodOxDaTfaL9E99fPBMGlNcJLyX
         vQNoFoe3ZPJDVg8hfU9B5myGmU1i15Buyp6AgPGslhHa/LXaD6a3M7Joaz/BRztVGpIL
         PorDnV8qjWBFcaJYufwfEYmpk7VfDGAUznJ0zWJs05fF6WUIjs9O1jushsEhR/G/rAJ5
         RV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HrQT9uwSwYuRkvqA5JP+fFBwi49zo20rSbHzPt0gPzM=;
        b=VTRTdPKDiKuUlE05TW5sM4q7GLXBBoMl+82U0vlOm8mInznZOKSOyqyjNJ6hKyTmkm
         x0sZqSK2j8OA+KrF32BgANxHKdC8dAMtcDttuQ3Zdy6mLb7IdcNXG0LR4rwolD8aI0hS
         FtqAcTP68PA2HzebsEbsB/81N+9UFtX3JImgPp291Cpqe6yjKcNgqsUydBSI6MaAQvvP
         jpinkKkX5+7YyoavRKP5k9S/8Bmwnw53KUDHOJZ8V3W+Bd1s6WaX0GgJyXFP2WrzJt8J
         ON1EO15LUsEYE0Npke5j5j3NKCqRyvHZtNhRjZJW8vFZyz+z/Xm40SzYAPw4mVaFMX/1
         HGYA==
X-Gm-Message-State: ACrzQf0UQ9Gcd1hTDobjZHF7RG41C77N3tSBkruvx3MoH/mai2Qk+ToN
	9F/B/BfCsSL9sR2ao3VmBLH5pq0wmy0=
X-Google-Smtp-Source: AMsMyM4lset0MrwoUApoOXT7evSXbJu49GIrZ5Sief2K0ypR3gXFPuUOrLMgROCPTPP+LPqFTfpFPQ==
X-Received: by 2002:aca:d886:0:b0:357:5bb6:bd with SMTP id p128-20020acad886000000b003575bb600bdmr5232552oig.8.1666892020218;
        Thu, 27 Oct 2022 10:33:40 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id f45-20020a9d03b0000000b0066a849457ecsm749905otf.25.2022.10.27.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 10:33:39 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-webserver][PATCH v2] meta-webserver: nginx: Add ipv6 support
Date: Thu, 27 Oct 2022 12:33:34 -0500
Message-Id: <20221027173334.312517-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20221027142043.177983-1-JPEWhacker@gmail.com>
References: <20221027142043.177983-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 17:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99325

Adds a PACKAGECONFIG to enable ipv6 in nginx

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index dfced3330..260f5f320 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -37,12 +37,13 @@ NGINX_USER   ?= "www"
 EXTRA_OECONF = ""
 DISABLE_STATIC = ""
 
-PACKAGECONFIG ??= "ssl"
+PACKAGECONFIG ??= "ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[gunzip] = "--with-http_gunzip_module,,"
 PACKAGECONFIG[http2] = "--with-http_v2_module,,"
 PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
 PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
+PACKAGECONFIG[ipv6] = "--with-ipv6,,"
 
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
-- 
2.33.0


