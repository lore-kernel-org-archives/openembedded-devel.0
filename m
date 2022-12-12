Return-Path: <livinsunny519@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D62DC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 20:06:32 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.54303.1670875588437087830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 12:06:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F3WWXtCi;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: livinsunny519@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id db10-20020a0568306b0a00b0066d43e80118so8034898otb.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 12:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FlIJYv4tAjbdFLxG2TNWMYja4emM5f5OH0EsDuZ8kQI=;
        b=F3WWXtCiHaX+HnPDbhqOjLVI9ddmY2dGyFymK6WljMJ8vquCS7P5/n8KOgkNA/hOTn
         Rn7ir0L51GD0j1uR++JEu3qiiXr/Qyi9XgjZdn8UoaiV0nUqIzDo1+TBbLVjw5ESQPtr
         LGVQOxoK8mOYn7grznJpuiIMIGO9MtHIXNOrr3c89v32Kz1G3X1RVqjGIV6Aj4WRwz2O
         sM8eG+l6rnSMwzT1JFngzWloVRntdin6MB/9oAK9MQJHYwwI3XAr7GPbB6VD+uXR4TkI
         4sfZ3b2Pie6Y/JIne3lccXYC0tio81+NfQk5YbQiB4g95W41iYsnho/Y5d15RTAnmK+s
         Vl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FlIJYv4tAjbdFLxG2TNWMYja4emM5f5OH0EsDuZ8kQI=;
        b=CYiWa8vj2TsM40ASWaCgkvQLCVvVuD2alWfVs9nwdIpSaKibz0fwKDxysZb5fEciEN
         HM30qUeeSReikbTuduRIUnZE/dk6z1rALm79NBrquI6czR0yqMQ1xwoOIyNHUFpB5d6X
         bKAUoUgSUVZwSFuTdqFfxBA3F0X5qj6E//IMxamyirNIjlJXGZpggAp8giTY2j6oFvaF
         Z8c1w6iWc8tq8BAt5wTXH0ZnwyL0+Suj33h0acOIIpKpeZno/QlYR2dRNwT/hcNMHXKa
         sR8ExA6DJG5F+bWzRDBqTw5VpzpJ3Dqvs6uIoQOth2wSeuev/9/VEqjwn28+7uDHeWOt
         zRvw==
X-Gm-Message-State: ANoB5pnABYIm8kzE6QVWize0fyC8zJ752H1phZxcvhkBWP+UEzpvJaNl
	ghruRnNVu1mMqbbz7wUTomIFwWMmju45wQ==
X-Google-Smtp-Source: AA0mqf5VruFS9847ugnIfq/Ed9i5JuAdjFLazVSPCuz8uTEHFpwYKkT4Q8ODbmECdxbTRnfihuS7zw==
X-Received: by 2002:a05:6830:6306:b0:66c:a612:30db with SMTP id cg6-20020a056830630600b0066ca61230dbmr9275046otb.31.1670875587356;
        Mon, 12 Dec 2022 12:06:27 -0800 (PST)
Received: from livin-virtualbox.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id k4-20020a9d7dc4000000b0066cacb8343bsm341946otn.41.2022.12.12.12.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 12:06:26 -0800 (PST)
From: livinsunny519@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Livin Sunny <livinsunny519@gmail.com>
Subject: [meta-oe][PATCH] libwebsockets: add ipv6 in PACKAGECONFIG
Date: Mon, 12 Dec 2022 14:05:58 -0600
Message-Id: <20221212200558.30233-1-livinsunny519@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 20:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100066

From: Livin Sunny <livinsunny519@gmail.com>

Adds a PACKAGECONFIG if ipv6 is enabled in DISTRO_FEATURES.

Signed-off-by: Livin Sunny <livinsunny519@gmail.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
index 0ce0513f3..d401a187e 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.2.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake pkgconfig
 
-PACKAGECONFIG ?= "libuv client server http2 ssl"
+PACKAGECONFIG ?= "libuv client server http2 ssl ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[client] = "-DLWS_WITHOUT_CLIENT=OFF,-DLWS_WITHOUT_CLIENT=ON,"
 PACKAGECONFIG[http2] = "-DLWS_WITH_HTTP2=ON,-DLWS_WITH_HTTP2=OFF,"
 PACKAGECONFIG[ipv6] = "-DLWS_IPV6=ON,-DLWS_IPV6=OFF,"
-- 
2.34.1


