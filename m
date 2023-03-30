Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884C7C761AF
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 12:04:41 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.23213.1680177878860434967
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 05:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=Ba65YCIM;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5445009c26bso349642337b3.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680177878; x=1682769878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yNV5FdeuNe/aG9oK9fSVPODhotNxICPt7RNFqnj9+yw=;
        b=Ba65YCIMSlQ3R74FRksyt8Mxvwlch4B7JILlmzgqKCB66yI7mQt4EQwWVpAFlEoUBP
         6HKrSmfcfN+A6PDIeV4lMAW5+64cvdp4BC6fwCVQCr3FrB4evA7RlPwHwDuTkfVrrTt7
         s8jQMm8NXXwSBxWmAz13SHfqX3tqj/C0nkJk9N/+5Pkkj6CQSupEEzCAfBZ6+PglYaLj
         SV35D4sbWDUOPCEviuJDZ1AmB64oE0l8DI31d9nWUUzUs1ZecuR8llpQUQMjKBgzPfne
         7gTaluho4DaPpMs8ZW49VNZaWikn2x7S9HfzQKWeO/F/so6NLPlHKdgmDS3D0ej4XHZ8
         oW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177878; x=1682769878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yNV5FdeuNe/aG9oK9fSVPODhotNxICPt7RNFqnj9+yw=;
        b=HRigOLNwNWTq2BV9A1C77TtlHVsQtJmUJwPvBcyCxfwLaO8RmnjY7RGabT0Bi9UfaL
         RPLq58YzpiHQ65ipwhOTaVXi9RcepfYt4bJx7PxLF5aZGE1yLXkIm/jnF5xHDx890/v5
         Dm5Bci5pfg4nNB34Hc528hdH3YW5FgUdJ+ysIFLA80HSWNhCR8MkPZuJ7G1no2j7kLkO
         4Kk9wCgj2NKHJnTwegsre1tLXbUaQp/E7grmfr5f1hcXvItMcA1hZt+2wDxPxMkiyNxg
         XqBtKLYCcv0JuBh8f3qOUPRM3GMO7oPZ3Z26xMtHPLfzauPUTyTFa8Kv3xAH09kPfpyp
         eFrQ==
X-Gm-Message-State: AAQBX9dWTbbPRhPjWMplth/v3jp5oIU0pmEeVuwGoGvAyd3McnJ98X8R
	gtcOyPLCV0z8OdILPDkrrnAMRus+Ab3uPA==
X-Google-Smtp-Source: AKy350YEbI939AV7YGwELq6XiKuqC1B9IaNdi9tA+GqvSyDtXwA2xY2t6oQZqcpKI4C0BxmWKMOv5Q==
X-Received: by 2002:a81:8447:0:b0:543:1dc1:828b with SMTP id u68-20020a818447000000b005431dc1828bmr20052441ywf.33.1680177877226;
        Thu, 30 Mar 2023 05:04:37 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:4171:fd90:b516:41ed])
        by smtp.gmail.com with ESMTPSA id eh17-20020a05690c299100b00545a0818491sm1435286ywb.33.2023.03.30.05.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:04:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 1/2] monkey: use git fetcher
Date: Thu, 30 Mar 2023 08:04:35 -0400
Message-Id: <20230330120436.2884051-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 12:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101832

From: Martin Jansa <martin.jansa@gmail.com>

* monkey-project.com doesn't resolve anymore
* use v1.6.9 tag from github

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d04444509a220fcb61496d7e64f3ba09c647543b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 16c5d44d421a10510e7d31f9368df5a9560ddd05)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
index 5b7e32733c..d3e22757c4 100644
--- a/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
+++ b/meta-webserver/recipes-httpd/monkey/monkey_1.6.9.bb
@@ -7,12 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 
 SECTION = "net"
 
-SRC_URI = "http://monkey-project.com/releases/1.6/monkey-${PV}.tar.gz \
+SRC_URI = "git://github.com/monkey/monkey;branch=1.6;protocol=https \
            file://0001-fastcgi-Use-value-instead-of-address-of-sin6_port.patch \
            file://monkey.service \
            file://monkey.init"
 
-SRC_URI[sha256sum] = "f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb"
+SRCREV = "7999b487fded645381d387ec0e057e92407b0d2c"
+S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_URI = "https://github.com/monkey/monkey/releases"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+).tar.gz"
-- 
2.25.1


