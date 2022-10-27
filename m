Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AEAECAAA1
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 14:21:19 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.7018.1666880473628250373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 07:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CX9R756i;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 16-20020a9d0490000000b0066938311495so1033052otm.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XVimsCtYQp19MnTANYXrfs+blcIvaYoNqv79URzwsok=;
        b=CX9R756iTsBJIk9nBGlW23Dut8xJS7QfZkbz5h4lB8dDhNUKad3DFT0Vw2+PTk3xjB
         jgs4WieixvA+hG7rstzqQsaGXmDzhanGtYLh6Eaf8N/m4VvRVUjE/lLULo/cmfhVPeVS
         tThzFxx1mj3hqrHxHLXOBkikYvKz1Y5vAr8tR1iLNSM2qoxpxTzhFZ14ORfJkgyYFJ2k
         s9Se+L65fq+KuygTfS+SAIdgSLrR2yMxzOgFG4O+At9ZIoDRaqPQR0XkQwg3ySC7Pidg
         Dh88sbNFfoFeNcVK2HQnJq24Yo5PnpSUi0hmfYhD4gKCCijHOSYA4mCQd4ApQ2P//zd/
         OVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XVimsCtYQp19MnTANYXrfs+blcIvaYoNqv79URzwsok=;
        b=6cfQjFLzrnxaqtl9futrp1ZD3hHyRKWXCtALKXgahKvP6gtpo4ovFKIyn3p0b/uNbP
         rbH6UY4jUjS3AMXhFavvoCKSK5W9ISjDpmYlt8kQDrSoFkOVx3GaJDwkC7/V6+FOio5a
         M2MT2M1ANurhEwDPcwSOnrgERTpxgzAZ8l9I0TBS5oGJZ0QGEmbbjcxWu+dV9/CIVbZU
         swEYay9EymmgnwYR0yIwTR3MNoRdRUqY68+/BNP45oWy79K2r96lakolTQATgKzDPPQV
         x2UhNil7l6GDUGeM3XFhStzbC10guUCkzjMz0hDNItZs+FA5DKzA7l3BA/wDqlKrokdE
         bftQ==
X-Gm-Message-State: ACrzQf22rNi4I3gkE0XUQFmaFCweLwbK+/CcIQMKsQgaWaay7XVYgntE
	sH1bmdymD2FfjGPEnrrt2+j8sB7VeUI=
X-Google-Smtp-Source: AMsMyM6wXobwh64j9LoW0FUTLcWQWUuk5MtioX4BFA2w/2jU6XYDIPcYzw5aijhLn08/aCZAe1yokg==
X-Received: by 2002:a05:6830:4115:b0:661:a2c4:3bcd with SMTP id w21-20020a056830411500b00661a2c43bcdmr25547514ott.368.1666880472425;
        Thu, 27 Oct 2022 07:21:12 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id k7-20020a4ad987000000b0047537233dfasm500663oou.21.2022.10.27.07.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 07:21:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [oe][meta-webserver][PATCH] meta-webserver: nginx: Add ipv6 support
Date: Thu, 27 Oct 2022 09:20:43 -0500
Message-Id: <20221027142043.177983-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 14:21:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99321

Adds a PACKAGECONFIG to enable ipv6 in nginx

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index dfced3330..33791ec6a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -43,6 +43,7 @@ PACKAGECONFIG[gunzip] = "--with-http_gunzip_module,,"
 PACKAGECONFIG[http2] = "--with-http_v2_module,,"
 PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
 PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
+PACKAGECONFIG[ipv6] = "--with-ipv6,,"
 
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
-- 
2.33.0


