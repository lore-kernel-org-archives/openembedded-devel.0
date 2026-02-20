Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E25C531F7
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 00:52:48 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29128.1771548761418862944
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 16:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3ISwnUM;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: geoffhp@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-40ef10ec84cso1114543fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 16:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771548760; x=1772153560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcX32udDk9lF6455K7p1gKrhbWF0P+IkqJr8TIrLotc=;
        b=K3ISwnUM619QjNoz7o88+9JdJdvNNC5LFdVenJWUQTYKSG0dJ3+JjDSlbfhFWqRhIf
         1vs8ZEup0fTVjvndvMYYwi61SLnPBmvvDXulEBDQmBcwd4dPGibNTjZCAQ7rvGr8IcpA
         0FrTqDHuLUXDEYA847tIRMrFJrUq0zTPKpkpdK7kIJ8ug/2/0Cfyx3wM0PCpmXZ0UFMX
         Xgxc51OiJbkLxvceLQ1HpDnjWK2l+yVnwsC71xjdqx9O5bck+p7jWCshO65jr56uOE8W
         2u21Bj5nBUsv7mWFy9oahtDdjlW/VqWpBBddnVyswj6sM2kP/UZigFUaZTaslbTRa9Ls
         6chg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548760; x=1772153560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcX32udDk9lF6455K7p1gKrhbWF0P+IkqJr8TIrLotc=;
        b=tFQWNCG17f8XiqEgQCG/hYTehB+0OqAIfV1qMjUp6enyli5ymIP0LXwhUq0iyvXQxr
         aascXJ9lmtg6mFQZmZgV89tzgBBJbtwBQr0WWNt0rrc1XzINLer5DgXMPq39l8kUWcp4
         AD0OuRWq34NhQIsHsjy7xOETZzK8D0WxQzgiI7gYRODSRHhV9VsWbCkzJqVhDqlXVgG6
         CbvtWPiUSsK8O5J6tJyNJ8rCTXzsnmTNvtHPuKEYa9BmMLm0zDD02bKPDJ7KSXwaQ9nB
         iuzK6PB4sDsnGwpi6JAF9rlV3wzMElrByWCZrTzs92Dg2anPs+0P35tmxcEY96Q0AjE4
         LnGg==
X-Gm-Message-State: AOJu0YysFxGS+ZCaaEj9hCW/kUP61VO9Dm8st0VAMQLQXWiyXnF4PR4C
	nl92AyrEdaa1Iqbde6Xk86suIDsfNnZcc6LV+79cgFiyWJY7Hjc1corEhnIFHA==
X-Gm-Gg: AZuq6aIluL6R5AmTD9mEvV+G5mDa8juKgNi0p6QUmudPulieMJ/7v7TDyXWRnc5G4/8
	+quF0tFspF6j+cQu1A/8IierTi7gXRW6UQaAWrOVjDRb195noBdpOkFn/+RMuExzBHyfhLAJt73
	xUrz5o6F9I4JbJukplapacaw/E3ubPcC+pP68bcsvnK57Q33sjJl/ejuhmUPEqN9Pbapk8f4+tD
	buifC65owUf7hEjwf+WFPKY7nBSGyhL18AjSrVOtDoMfk6Zp/RuHIjM105CTai1rIGsPv+7ArVu
	QwnaaoQ7stYbo8cIMnEt0kSpXJiOJTU1Edx965nTfsdYZH+gxZyx8/uAEWYCC9usk/6zOLV4Nir
	UTLcT7KuPJYWJRXzNW/Z9WQdq8wqLH8wVSKxOkRdiimxPjjb8Uxc2imLbeN8upmErImkqPUGwz8
	Je8FKmq1m0h1aVLfKn7bYrIMGZaGcPHnGx3rTbuPqAj3HiaSZhOBbCEYnbuBe/6QSphUc=
X-Received: by 2002:a05:6871:8ab:b0:3ec:48ba:8f3e with SMTP id 586e51a60fabf-41529183eadmr4216600fac.49.1771548760442;
        Thu, 19 Feb 2026 16:52:40 -0800 (PST)
Received: from faraday.ACTDEV.local ([207.154.79.109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-413956e44aasm10847207fac.15.2026.02.19.16.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 16:52:40 -0800 (PST)
From: Geoff Parker <geoffhp@gmail.com>
X-Google-Original-From: Geoff Parker <geoffrey.parker@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: geoffhp@gmail.com,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][PATCH] python3-m2crypto: fix python3-m2crypto-native do_configure:prepend()
Date: Thu, 19 Feb 2026 16:52:25 -0800
Message-Id: <20260220005225.401958-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 00:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124518

The recent workaround for https://github.com/swiftlang/swift/issues/69311
breaks python3-m2crypto-native, with error about missing e_os2.h file in
recipe-sysroot-native.

Apply do_configure:prepend to class-target only to fix.

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index bd7a2369bd..abe79671d2 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -44,7 +44,7 @@ export SWIG_FEATURES
 
 export STAGING_DIR
 
-do_configure:prepend() {
+do_configure:prepend:class-target() {
     # workaround for https://github.com/swiftlang/swift/issues/69311
     sed -i "/sys\/types.h/d" ${RECIPE_SYSROOT}${includedir}/openssl/e_os2.h
 }
-- 
2.39.5


