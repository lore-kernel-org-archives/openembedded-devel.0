Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478DFC10DC1
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 07:44:01 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.15437.1702021433128724067
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 23:43:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fZaH/SEx;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-332fd81fc8dso1710734f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 23:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702021431; x=1702626231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gKlJ5OWDDuOs8IuEPqSCENn1g/pyEhnDDbKzKwSvcqo=;
        b=fZaH/SExkV7zrJg6Dthe4tIP9hnPQUOmHehL6AzyFNIXwhuGvFWYEIKb7rM0KxnnmV
         1PbKKYZbJ301JGV+Kcpy0RKrV6ZkQz8sbH/y/BechIeokf4KTznavJq0Lk1IkTaGNNrC
         Cj79nRCSptPdDk2DayvM7N+pVw/saezmWoT8kTR4W3V4BsqNUEolrruviKHlJ7FltooL
         3tov7uiNEzL0Gnq/uMt4DkwsJboOb1F4aAn0jLQXLR9ZM8w1cmz7Tkj2RpNwdr8E8iJN
         jWlBk6yib0Esl/mPe72+6MsV1zh8HSYPHYCcYO7f5YMcClhDrhJYFUsOlS+bPEZILV2y
         AxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702021431; x=1702626231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKlJ5OWDDuOs8IuEPqSCENn1g/pyEhnDDbKzKwSvcqo=;
        b=tL/Kyte53pMlapSl2/31y+OUI32BIZL5PXnuAJK+YF2EpF5JEd6C0iE7P9P25uOFxO
         KxGZiNkrgLzwhw4DfC3SQhDaw66pl6vMTjqKUGXeDHlwIc4oE5tReJmCQTygW7GXbHfU
         2LWn/b8xykgGTnpAvl/36BQq6WcNLyhdV1ghjGodDgbqbyPrAsfnf/QxMJSfqpGQY9v1
         p6yeBSYp0vU0fu4nyCQjlZ6vUNgifLzFo8CPdKIo3iCgL+cXyEmi6jn7kyK/xXRO1YSY
         tuVB7Wlu01MfCBuNLxn3dm1HvtxtQFQvzbPPfnN7DZonejxweL6RtMc35iYXnSoPwiWX
         6j7Q==
X-Gm-Message-State: AOJu0Yypwg2UGvovwroPmKiUe/9eJdSSZpMepPiVSzU7bmzIexn3XB39
	MHCDv91D+5M7egI+tagSYbo3RZz3B9px2Q==
X-Google-Smtp-Source: AGHT+IFea80NPEefaq27hTDOtJs7ngE3yCGAlsj+QSeX/itJoGyCcGBkyHnPKAQt4c901e1S8btKbg==
X-Received: by 2002:adf:a31a:0:b0:333:2fd2:68f8 with SMTP id c26-20020adfa31a000000b003332fd268f8mr2282501wrb.139.1702021430717;
        Thu, 07 Dec 2023 23:43:50 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.251])
        by smtp.gmail.com with ESMTPSA id w12-20020adfcd0c000000b003334010a849sm1386095wrm.109.2023.12.07.23.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:43:50 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCHv3] xsetroot: upgrade 1.1.2 -> 1.1.3
Date: Fri,  8 Dec 2023 10:43:44 +0300
Message-Id: <20231208074344.24233-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 07:44:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107303

Changelog:

* gitlab CI: stop requiring Signed-off-by in commits
* Handle -Wsign-compare warnings
* Variable scope reductions as recommended by cppcheck
* Build xz tarballs instead of bzip2
* CI: add a basic build test
* Update configure.ac bug URL for gitlab migration
* Update README for gitlab migration

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 v2, used xz instead of gz
 v3, added lixmu package to fix build issue

 .../xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-app/{xsetroot_1.1.2.bb => xsetroot_1.1.3.bb} (66%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
similarity index 66%
rename from meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
rename to meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
index a9a8acf05..7e909f90c 100644
--- a/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.2.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xsetroot_1.1.3.bb
@@ -7,7 +7,7 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6ea29dbee22324787c061f039e0529de"
 
-DEPENDS += "xbitmaps libxcursor"
+DEPENDS += "xbitmaps libxcursor libxmu"
 
-SRC_URI[md5sum] = "5fe769c8777a6e873ed1305e4ce2c353"
-SRC_URI[sha256sum] = "10c442ba23591fb5470cea477a0aa5f679371f4f879c8387a1d9d05637ae417c"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "6081b45a9eb4426e045d259d1e144b32417fb635e5b96aa90647365ac96638d1"
-- 
2.25.1


