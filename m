Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFE2C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 11:21:02 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web08.2979.1665228049852957334
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 04:20:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uh+lp8EW;
 spf=pass (domain: gmail.com, ip: 209.85.160.47,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso8097671fac.6
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 04:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgBN+pwETqrQ0BiRcSNfPtzZT1vCb1fk1wSLLKfqy8Q=;
        b=Uh+lp8EW18byzFmo6UaZV6j6P/MTBSeLIlklLjrQQW1UGUDjvK2v8NRxgC430hhdIo
         C6K6lZUxpPtXLih1WqzfLIwbJ/wYPNOMWSDroLXU4D1RExhwNID7/+h4aWnIb8B+0HR+
         mNfiL9dNCAIGipHaxm+kt1YPP9HPTzxhVCWbCIUHVe7OONouv7cjhSTbN7dqS/2rtu5S
         VXfwRWP6AghdYtuip3kLjf0zkrpYaBK81ZPOMD0PM3hdtOI44Bqw6AxkbQrDrPO0Vq+B
         9S2Vv7u+Ark0fC9e5V1BIHtLQqLws9Gw/i8vH+u7R5Io5U/dc7fbeWBDgd9aLL/cMxL9
         lPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgBN+pwETqrQ0BiRcSNfPtzZT1vCb1fk1wSLLKfqy8Q=;
        b=4GjcIU0FjVQNi6/gLJBK53TrSBIhLXM2vHyZLjtGkAlKL1d4JRJqOEPIbGy122HgzS
         hxV4Iliu7AfbWfiL32Xy/6mCsIjl726Z2RWAGjqDd7KyWySDr4XsK4woWe6lSEH+Hbki
         0ZObc6whg1ejVSC2SpmfUW9KR41kiFtOQrEFKmXBzywSB4U1+fpxEbE1VglltCFzGO3r
         sCduAkHk/qDlMesNIpBcIoNcsI1HUvqmez2knSfNQGGWd1u7sOMuwuPIHeaGNI1761yB
         5yqXHuaPUL5jzR6mhOPgmwR87aa0Uhzl1tDuUDnmX75LhVdVnI3F9PxMYI72h1izTw5A
         5qFA==
X-Gm-Message-State: ACrzQf0M9Uss5NwYGVYv5OSkCA6QqKZvDqBI0Ds7q3CxAbGXra4WDaoo
	fDqzapmRse80AZ491KGP8tzSlu2P+fA=
X-Google-Smtp-Source: 
 AMsMyM6UOva5dErOSuknHYe3DNhl8O1QHePiL6gP9sF+qgFR+vDE5CsT2zB+lPvqITL6A1hv0vjuFw==
X-Received: by 2002:a05:6870:8910:b0:131:2f31:dc1c with SMTP id
 i16-20020a056870891000b001312f31dc1cmr10671691oao.290.1665228049036;
        Sat, 08 Oct 2022 04:20:49 -0700 (PDT)
Received: from ma-mailsvcp-relay-lapp01.apple.com ([186.212.115.217])
        by smtp.gmail.com with ESMTPSA id
 m7-20020a4ac687000000b004805e9e9f3dsm319163ooq.1.2022.10.08.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 04:20:48 -0700 (PDT)
From: Devendra Tewari <devendra.tewari@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devendra Tewari <devendra.tewari@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Bump SRCREV and add libyaml to
 DEPENDS
Date: Sat,  8 Oct 2022 08:20:24 -0300
Message-Id: <20221008112024.39451-1-devendra.tewari@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 11:21:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99096

Remove boost from DEPENDS because it is no longer needed.

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 0b9f3f7a5d6..53cd94cbf0e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -12,13 +12,13 @@ SRC_URI = " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=https;branch=master \
 "
 
-SRCREV = "acf8d028edda0a59b10e15962c2606137a4940af"
+SRCREV = "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
 
 PV = "202105+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 PACKAGES =+ "${PN}-gst"
-- 
2.37.3


