Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F361EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 14:28:19 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web11.59808.1688480898098523761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Jul 2023 07:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fB7Ecmox;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-579ed2829a8so31250087b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688480897; x=1691072897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8tGreJ1KUivMIcS/vU1QxizgAexiXNo/WRr99UAbj4=;
        b=fB7Ecmoxb42lwaHkGPgOQIWH/Q66dIf6Db2ckNrKEPdpiLTH5ddAVpVIRQytxiPK1c
         mm6dqBVKw68oANFg7oCYs0Bvwq7fnVp+BN0NeKA2MxTqFppZO94c/Te5fU1eOFPyiSpn
         SHnWRfC1/sPV5YHbp2LF4C4214K8GYMMeyiUNhyUkVO8bFUfC2MzkXoKTUmywrnVTn9O
         d+fiLScxmczlNIPD66SUNJzu8eAgi6PM6wCyI1ar0BC7s2wNqW9EqmcEr8Zzsz1MoMB3
         LV6JuvfmJQPZR9i/6b/itzeIkCl3+3pye6p3UizQ8vACpwyjeMkrQ6cw3XmgjcfJk2Ek
         pYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688480897; x=1691072897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8tGreJ1KUivMIcS/vU1QxizgAexiXNo/WRr99UAbj4=;
        b=VtqU7azMA4RBtNlByfHCTcMw5EnABARw+gXWE/SqEODpJNja7ID6bVe2jsHHoh7jwj
         8XCITJtiE1w6cTVdDYS1avBcWVF9m1ekLG5LBOC3/DnaNxC0WXTJ2LXkWVfKV4lcpwP2
         jjEjdxqpdwWj6TS7aPikr7GQrLbh03rfESBJDKpTkdHCFPnXRke8At3skYUQRwg3iU+a
         frdsGZu4jig5/RSYjU+mgzLr5ygAXbcRPtjNPYEVi1WyyTOQ0awYP5xJBIDXEZFW6w+a
         mKDKDEWxiaB+c1aL45tbnJ+qVqHJ7ZHuMTKt/gvLukCkLCnsDyhvmJcyo+cq5uoKbzss
         hiag==
X-Gm-Message-State: ABy/qLZFPpahc+A5mL+8z+BYz/0d5ca/qa2fWDQvIPyACjJg96r6tzbt
	WQyJU0ArFWvHNt/i/oktT49VAk5ZnTI=
X-Google-Smtp-Source: APBJJlHEqNpi+Kn4V0pr8RCMsOzNKWFuRFZBIdrwFDvDo5Gp92S9LFETSIOZ5b0R7tw/p6qxbiZIkQ==
X-Received: by 2002:a0d:d908:0:b0:54f:9cd0:990 with SMTP id b8-20020a0dd908000000b0054f9cd00990mr14487142ywe.18.1688480897094;
        Tue, 04 Jul 2023 07:28:17 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:4625:7563:387f:4fe7])
        by smtp.gmail.com with ESMTPSA id x83-20020a0dd556000000b00579df9098e3sm2002630ywd.38.2023.07.04.07.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 07:28:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Luke Schaefer <lukeschafer17@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] webserver: nginx: Add stream Signed-off-by: Luke Schaefer <lukeschafer17@gmail.com>
Date: Tue,  4 Jul 2023 10:28:16 -0400
Message-Id: <20230704142816.2295084-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Jul 2023 14:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103658

From: Luke Schaefer <lukeschafer17@gmail.com>

Add stream support to nginx PACKAGECONFIG

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index dfced33300..231c1d1ec9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -43,6 +43,7 @@ PACKAGECONFIG[gunzip] = "--with-http_gunzip_module,,"
 PACKAGECONFIG[http2] = "--with-http_v2_module,,"
 PACKAGECONFIG[ssl] = "--with-http_ssl_module,,openssl"
 PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
+PACKAGECONFIG[stream] = "--with-stream,,"
 
 do_configure () {
     if [ "${SITEINFO_BITS}" = "64" ]; then
-- 
2.34.1


