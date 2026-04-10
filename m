Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4414F36BA0
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 02:32:57 +0000 (UTC)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148161.1775788367713225661
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 19:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KzKF0Vvw;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-128b9b7e3edso4023650c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 19:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775788367; x=1776393167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftgH4Br1SaVl9gkGvcKKb5ns1uGtywOXY4FgtJDxpPI=;
        b=KzKF0VvwnhgPuBaGLKc9EO9/q+ol8gP3cdA4jOFwsj0q9PSgNMv+hLw/yjPrgIFYMh
         hPyFVQPXbdC75A360AEnnPnAq7ZN2tSAh09fZXKL/VvYrkG5l3ipnI5AA4Q8DJnbOBS+
         SGQ0w9O50mmX7GlLtBikvJkBW4l2jRWzIL7C60z7FtLfi62GoUoaeaPUVRQNYn/JapZ0
         mvKCzQSLbAYaQgdRBjYo0ObM5AyA/ze0oE9IltyHdPCpUKcm20frZgTsv7iK8E3fNLdq
         RM7QmdY2+KjckXuGUc2ATZTEVMmQuLVH/JSYHRPj73ZKsckPKovK2Ne4CxT+WWTJfuFL
         upMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775788367; x=1776393167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftgH4Br1SaVl9gkGvcKKb5ns1uGtywOXY4FgtJDxpPI=;
        b=DAgLqFpv0V+7TZlhe0wKWNkaHvre0/2REeXNQWWqZ5Aa0MQlwZje8kOcN7XoPFGoOG
         VFN2tjf0wZ++1nLndCXnYFt4tbQXxmkXOqxcof+CqzT9BN0JbWKtqs5jqhoI9EScybZT
         GFeNgObuDhVLOpmZRk4NWhbGSYksxRkubGyL095/JnzHdXO6EvuPogRH3FhxAKhZ1bSy
         DtjdzNjtq0CpjvTQ95U8Vlhe0WqoqoPL+/a9X9jFto6i50J9aHy0qTLTR2KZ5Txafj+4
         H1UevujwWOfHKzwQrCVpoRxQTP5uw2QK3oEyqfvvAA9ujzmpcoryPn1XazoLgOJQoG0W
         A98w==
X-Gm-Message-State: AOJu0YwY859yePporWhBMjoH7HVtoicFTqVAUqrT0qeXyFpHunRhA5l3
	nhdYC5AbX4QGRZ8+SJa10v/CSaUZLd+8t12bHvccjM6fWol6aKiR5/kDdUWMWw==
X-Gm-Gg: AeBDiev0fCd4Y2C8un+LaWTRIBL6tqMNctbGYzIncsnHGGHHAPLQN1XmZY7G/pmmgRK
	M7NpxuJlIOn+3MxKFDooYSH1soFNQowK7VbVNZE3iDCnQT6ToL0ZxTMFDLxCEs6fihFovg8NLyp
	4IqH4KTyysBWzKtZxkMbG8tbW4r+rTGcK3qJKa6ESd0I3Pw4xX0b8wIF3mRbvlgXO9ns3yeVttt
	lcoLkJZATKYWE9g1fN6TtNs2U12gG0wVx3GqdV44zX5goHKamxfVKQ1yArvT2uG/sY1hofDtDRp
	O5h/fOr/qJikcZsFAug7bLt8ipLb+ZCE8Dg5eKq7WKMlMgWIEsJcd6LMyIauI1S2mrA5H3+/nfK
	JQ3Lyxx1NpcPvTIQumoCNC0QzX2GhWRmHqeMN+SvAuoaZZ2gUnGwf32c1rNGALkgMsLheUyaM3w
	oqkVUpycz5jQbJhyHbZEbbPFyKENYcUQky5Jvd8860TjBhdHwpRgEdx9ZUGadk0X/gh1QOuIPdy
	Z2rMH59qF9sXMcMXRlWNS6NnAoNRxMQMO43rJYj7TPyieSubAzuLUxeSCmE6Pg9/X2mopk=
X-Received: by 2002:a05:7300:4352:b0:2d3:2846:c878 with SMTP id 5a478bee46e88-2d586ea75aemr894175eec.5.1775788366549;
        Thu, 09 Apr 2026 19:32:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c6afdsm2307530eec.4.2026.04.09.19.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 19:32:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] libwebsockets: Add missing dep on libcap when ssl is enabled
Date: Thu,  9 Apr 2026 19:32:43 -0700
Message-ID: <20260410023243.3650447-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 02:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126209

Disable tests, they do not build in cross-build environment

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
index 02843be7c3..f720c7857f 100644
--- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
+++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.5.8.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG[libevent] = "-DLWS_WITH_LIBEVENT=ON,-DLWS_WITH_LIBEVENT=OFF,libeve
 PACKAGECONFIG[libev] = "-DLWS_WITH_LIBEV=ON,-DLWS_WITH_LIBEV=OFF,libev"
 PACKAGECONFIG[libuv] = "-DLWS_WITH_LIBUV=ON,-DLWS_WITH_LIBUV=OFF,libuv"
 PACKAGECONFIG[server] = "-DLWS_WITHOUT_SERVER=OFF,-DLWS_WITHOUT_SERVER=ON,"
-PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl"
+PACKAGECONFIG[ssl] = "-DLWS_WITH_SSL=ON,-DLWS_WITH_SSL=OFF,openssl libcap"
 PACKAGECONFIG[static] = "-DLWS_WITH_STATIC=ON,-DLWS_WITH_STATIC=OFF -DLWS_LINK_TESTAPPS_DYNAMIC=ON,"
 PACKAGECONFIG[systemd] = "-DLWS_WITH_SDEVENT=ON,-DLWS_WITH_SDEVENT=OFF,systemd"
 PACKAGECONFIG[examples] = "-DLWS_WITH_MINIMAL_EXAMPLES=ON,-DLWS_WITH_MINIMAL_EXAMPLES=OFF"
@@ -34,6 +34,7 @@ python __anonymous() {

 EXTRA_OECMAKE += " \
     -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
+    -DLWS_WITHOUT_TESTAPPS=ON \
 "

 do_compile:prepend() {

