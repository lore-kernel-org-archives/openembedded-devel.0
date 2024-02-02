Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40419C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:24:09 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.2796.1706898248413670848
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: straka.derek@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-680b1335af6so30501566d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 10:24:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706898246; x=1707503046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfCBBXT7NtD7yuWKoz9cYZOYVvUzJMyMtkVBOz7SMkE=;
        b=NqrI9ng3wyEU4QStrENp4zT/k9THWssizODV8fCKNmkUUlMn6ov/QOPnld7glA37+0
         gJiK8z3DlsubdQund1rPwhO9puiOsJFYT9UbbEm9lsjqvI4A170/K64biMzsKvIfnqd/
         kIVzM1r/IKXKiZyvQfQ0kkJptYb46yV10vVvp9XbP56cA3rlOhM2ppUpRhmG5qSFOjCG
         lCzgDEfgxkq5RiuufQ6LPIuWT6mfJY3WgGKtW7yYyVNivPynsuDHQXnktFIrmo31mZN6
         x+UXk1F77h+Mc+txCpjC+hWxQ92vAqNBgzcM8Dz+c+HZhvuyuw9eFAQIj1w9NS6e8msH
         BB6w==
X-Gm-Message-State: AOJu0YwI6uOKVLEUYpoyZ6RXB5BRzzom6qfjBgjCcNalqrihqYPJJZa+
	OfZjj/ANGxrM0fwUvwZXa53nb3ZVAmOUNAVSHae0FyXg00tNN1qqekUHmMOgFzlWyA==
X-Google-Smtp-Source: AGHT+IGkSMLf3na1cPrH5NDcek+Y0fpbmoAk0XD1+IIfb63zqaGygm8GpOei10CwXOmAfL9kgPgt+w==
X-Received: by 2002:a0c:fbcc:0:b0:68c:8001:c5d1 with SMTP id n12-20020a0cfbcc000000b0068c8001c5d1mr3923676qvp.31.1706898246269;
        Fri, 02 Feb 2024 10:24:06 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id w11-20020a0cc24b000000b0068c5b3a7f2fsm1024452qvh.37.2024.02.02.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:24:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python3-cbor2: update to version 5.6.1
Date: Fri,  2 Feb 2024 18:23:56 +0000
Message-Id: <20240202182356.1546748-1-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Feb 2024 18:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108536

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-cbor2_5.6.0.bb => python3-cbor2_5.6.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.0.bb => python3-cbor2_5.6.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cbor2_5.6.0.bb b/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cbor2_5.6.0.bb
rename to meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
index 41793aaa4..2c1b0e67a 100644
--- a/meta-python/recipes-devtools/python/python3-cbor2_5.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cbor2_5.6.1.bb
@@ -4,7 +4,7 @@ DEPENDS +="${PYTHON_PN}-setuptools-scm-native"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "9d94e2226f8f5792fdba5ab20e07b9bfe02e76c10c3ca126418cd4310439d002"
+SRC_URI[sha256sum] = "752130e38644319f3dae7f91fabb08f58bc454ca671b72875e6228d423890efd"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


