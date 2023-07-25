Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74F6EB64DD
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
 by mx.groups.io with SMTP id smtpd.web11.28960.1690312190715557742
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=o8/mOqVy;
 spf=pass (domain: baylibre.com, ip: 209.85.222.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-794cddcab71so1762680241.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312189; x=1690916989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9BLXxuniUKTeNQxBXJSx/RIGar+2FIBZSjUOQLqRsI=;
        b=o8/mOqVycasLb7gcWjPafPg3SXFp2A7FjWUHzMQlbMbwF7YEDmhN7ccDlvmADF9UG4
         k2cGA0WyoGuXyeCbJUSnChpt2SGz8JI9H6oIRBMfyvYV1vRVzjR0oPvLY1bfauzdzrUQ
         TY38GT0HKcCkuVTmcRfqAM+9smnIRRU3xy+KAzpLu4zQ+5/8NCPXUBd3KCUz7geV1fCz
         Ei2XwDARcuSXBnEMyOu2faU9RFHqp/qgRflv2abI02D/Avp93O0Mc0J8VTE2caiXfKja
         6sKjKDoYOrDMjXzFRIMaTv/7njTOxaazNcxVdvm1LXPh78LfZeT/BqilReHNznpnIXgt
         mx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312189; x=1690916989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9BLXxuniUKTeNQxBXJSx/RIGar+2FIBZSjUOQLqRsI=;
        b=W3RvoHH5YcfNBdzNUYikryg89Z4fEDlyOXEIKIsaoDi2jxivgJCQoAhkMt+u9cR/bp
         fTrE2hrSGQpMyjzgUh7iN5CScTFBQUeT9CyzqBzkwLq9pKyfPwJ31fW+X+RV8fFcTdae
         gIoALc9uiTWSRVoJ9KFAj6JPtwuYKSLN20/MJdElJ0q2C3a07CMK2qsdwiMSJ75wqAMA
         T4C6BI+VgDGwPdVl6WaCA3pJ9uYECC+2DFt6QjpRmlqJwUFnQHbkaF8De9tteaDLkONV
         EwOEYvSmfs95rHD6VtT6Pt2o6t3NiIToZuF/5Z4yJ7JEzTiDEVBGLmMZ6KpfJJF06Lg4
         RgBw==
X-Gm-Message-State: ABy/qLaGeVeUR1kVRiTtt4SI1rDlRI5cJkv1NqGYmbaFNXCk6XCFjIoe
	74uXMKCBvsy2v2IiLI7AVRtu4F/OKQYzYYPBBOw=
X-Google-Smtp-Source: APBJJlE6LfGM0ESy0BSlEhRqLvoahlfhVOuD9ns5vsZeEQAgQ5eCOZwyvmXXdW8opP16w1CcOz6evA==
X-Received: by 2002:a67:ee57:0:b0:445:1977:be45 with SMTP id g23-20020a67ee57000000b004451977be45mr5252534vsp.33.1690312189384;
        Tue, 25 Jul 2023 12:09:49 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:49 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/7] python3-fastjsonschema: upgrade 2.16.3 -> 2.18.0
Date: Tue, 25 Jul 2023 15:09:37 -0400
Message-ID: <20230725190947.660933-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104018

Changelog (https://github.com/horejsek/python-fastjsonschema/blob/master/CHANGELOG.txt):

=== 2.18.0 (2023-07-22)

* Improved error message for required props - only missing are reported
* Fixed support of boolean schema in if-then-else application

=== 2.17.1 (2023-05-22)

* Fixed tests in sdist

=== 2.17.0 (2023-05-21)

* Added support for Decimals
* Added tests in sdist

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...astjsonschema_2.16.3.bb => python3-fastjsonschema_2.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastjsonschema_2.16.3.bb => python3-fastjsonschema_2.18.0.bb} (94%)

diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.3.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
similarity index 94%
rename from meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.3.bb
rename to meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
index 689fe51a33..e0be7b6160 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.18.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/seznam/python-fastjsonschema"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=18950e8362b69c0c617b42b8bd8e7532"
 
-SRCREV = "4f11540d2e8f7c0aeae1230cdbc65a99f1b277c4"
+SRCREV = "756540088687cda351390f687b92e602feaa7dc6"
 PYPI_SRC_URI = "git://github.com/horejsek/python-fastjsonschema;protocol=https;branch=master"
 
 SRC_URI += "file://run-ptest"
-- 
2.41.0


