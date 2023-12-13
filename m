Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C1CC4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 22:22:43 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web11.2555.1702506153524044116
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 14:22:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7b70139d54cso273836839f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 14:22:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702506152; x=1703110952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v98FygFZGd8jWkgz4BU4UrKYi5eJZsDxWp8K4dLZBd0=;
        b=paLhuMzW1tWAwHbfL3NhP4H0GoEBNg/2UhWY1+pw1x+Qp/1X+64AopCcKMu0zkctLB
         iEUoNZxb/i8xhaNDZZ2aWYL5nzvWVY80NQETMszPRNhfVdgXQ4PIi9sD/7wC23G1m9t5
         mC3jo3PYy/DikCCEBsDy3MGZBTrBejU5ie3+OlZzgsstMhq0ZQmyXfYFL7Zjyn5ciJho
         71Q4h3SsG2cR+sbAOKDLZXQWVNaRmCTeIohrpkF4mOVLIGxY8abdN612uxdOx+blhzTC
         Vyob5la0RIYXx81MJxj6g9NAkSbBiXU5/1wySBa7BuHcIYrJJgNVkKDo2GUNmAX8Wth8
         w8ow==
X-Gm-Message-State: AOJu0YyN2kD9fuYm+sfRC78qzn2d9mGDC0B/o1Iu5gBtT/+YGybdvU7G
	VLcifS42LrMO5ISUc2PlS04hLvsr/PhtIA==
X-Google-Smtp-Source: AGHT+IGc19mxLJ8LE9tMJbs2xFKcf9q0QF+0oUrHFLKF+LtxGFjYvCboBTGwCHe4Ev60WtMDE7aMUQ==
X-Received: by 2002:a05:6602:2f10:b0:7b6:fc0a:bf14 with SMTP id q16-20020a0566022f1000b007b6fc0abf14mr10561666iow.3.1702506151851;
        Wed, 13 Dec 2023 14:22:31 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id l10-20020a056638144a00b004695f88acdfsm2326595jad.118.2023.12.13.14.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 14:22:31 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-ujson: update to version 5.9.0
Date: Wed, 13 Dec 2023 22:21:57 +0000
Message-Id: <20231213222157.1122628-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 22:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107399

Changelog:

Breaking
  - Raise TypeError if toDict() returns a non-dict instead of silently converting it to null (#615) @eltoder
  - Use lowercase strings for bool dict keys (#614) @eltoder

Changed
  - Speed-up and cleanup objToJSON (#615) @eltoder
  - Use lowercase strings for bool dict keys (#614) @eltoder

Fixed
  - Fix typos found by codespell (#610) @DimitriPapadopoulos
  - Fix undefined behavior in Buffer_AppendLongUnchecked (#606) @WillAyd

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-ujson_5.8.0.bb => python3-ujson_5.9.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.8.0.bb => python3-ujson_5.9.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.8.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-ujson_5.8.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
index 9486435d7..8de9b030d 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.9.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e0039a83d8a99726b5418f0b03302d0a"
 
-SRC_URI[sha256sum] = "78e318def4ade898a461b3d92a79f9441e7e0e4d2ad5419abed4336d702c7425"
+SRC_URI[sha256sum] = "89cc92e73d5501b8a7f48575eeb14ad27156ad092c2e9fc7e3cf949f07e75532"
 
 inherit pypi ptest setuptools3
 
-- 
2.34.1


