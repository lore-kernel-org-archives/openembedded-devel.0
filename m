Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EA2C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 12:23:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.2557.1667996601764911423
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 04:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H37cofLH;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id m22so8988907eji.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 04:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcRUgsRCujnPUeOqKEVSF7mXwpa/SsOBuL21/f9G5dQ=;
        b=H37cofLHVVGr1gWsUvWmMAbSXI13aMeJeygBTNGJntHcX1VYlHZHZ0wGkqYGTuvlgL
         r0it9LSdClcP9GZnkpO88eFfxInFsaJDK8MxUp+2ATHaDv8j6ofkese2Gfbx+SbNGA7+
         ts84yM7xJ/buO9LJES9RQe9dlsdzFqe8x7YAHO4nGaJ7JgBKrRGdI9VzGoOXKwQqBtZf
         ygH0gOqUPT+26cAfBZq2/HCYTCvCRPENDkdPB/mO7qbNtFrq9KnLmcS1Di2tSw/ePoU+
         Iqpu5A7H6bl3+KG8UmF21b1S5YOwI/A9q9R+//xTgefY7GrchM6ybQkYvGa5ohZnl3AR
         8iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcRUgsRCujnPUeOqKEVSF7mXwpa/SsOBuL21/f9G5dQ=;
        b=OQvRpmJW7Gim2Ncc91Q989A+VmmmA0pK5DEeDjap0FcwlCxZPqKiFUqZDllauJVccq
         cx6I67ghfyEIPlOVNHA8RvijgdRr1QjQut8k5ftKYI2BM4kXH+aft+4gek+AZUBCLQLS
         krIYB/PN5rHZoTey2rGgVyHLcGtTnElHZbTzTj6eU53VEHBnFnl6k320xwNS8IQezl0U
         FqkGv4WfRLf5zxUxrFOvHxL3eksHFT4lCME6jGdhooy3GG5jr+SYWWXkSkqLsPgndxJF
         Q1R0oNzoB4o7tMueOrgYNU2zmt2KsNQ8S559V57IupDopL/ULGsOtEIb7dKa2ecRlpMf
         lPVg==
X-Gm-Message-State: ANoB5pnz14XyH9Zm6o3X1bqYXM/fEicZX1ETEHKvXufnb0lgtnyeKvhI
	agVTZeTCX7j5peBDR1i8YTVjbHc0HNQ=
X-Google-Smtp-Source: AA0mqf6xsq0zLTRY3Pz+/PWH+dwD/jrUdx1Q2TFZ3RVw4pV9+DtsitVlYGStDKQKz8AgX6F9XpAaLA==
X-Received: by 2002:a17:907:708:b0:77e:ff47:34b1 with SMTP id xb8-20020a170907070800b0077eff4734b1mr4754075ejb.493.1667996600100;
        Wed, 09 Nov 2022 04:23:20 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s8-20020a056402036800b004618a89d273sm6986755edw.36.2022.11.09.04.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 04:23:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-webserver][PATCH] monkey: use git fetcher
Date: Wed,  9 Nov 2022 13:23:17 +0100
Message-Id: <20221109122317.3093006-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99495

* monkey-project.com doesn't resolve anymore
* use v1.6.9 tag from github

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
2.38.1


