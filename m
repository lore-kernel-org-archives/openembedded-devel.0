Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CB9C001B0
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 15:20:37 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.11191.1689607235335086805
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 08:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=l/yNR113;
 spf=pass (domain: baylibre.com, ip: 209.85.222.174, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-766b22593faso314686285a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 08:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689607234; x=1690212034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+2oNckU9qRAH+zsSWITsDfCuCC4zC7Ka5GYkoR6cdA=;
        b=l/yNR113ZTrxQuj4i5ML/kYA3i3FKVT0rRfs3yo7ggUI2XsCacsH2dJKxxMngDVcLK
         WaDdwYDsFRl5ZlAED8SDKm0B4guJoFhugg2DssX2RG38L7vsHW9gvITn0Hism/pIJQ6j
         +s/SZYQfcBfdPVgCOTQfc1+oC2MnKqTc0cqEUyThinHG7T59gWr1lL4HrdchVg/MBw/P
         tjOXgEleQIEQAeS1YQnZGBUgiVMzfJEDOvlI0Id/8Go3h/2f+hPLdcx1ukB2tz1p329x
         IYL0nhid2BSpIZXgL1Sr3Njvsjc+gLmPRiI54aKObrjmqsFf4v8B2gzk0U89XY7tiNOj
         zGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689607234; x=1690212034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X+2oNckU9qRAH+zsSWITsDfCuCC4zC7Ka5GYkoR6cdA=;
        b=WimOSUTUHqy6gYMfPKyAdG/qWP+NfopJXheo0yNjfJOLqz3RYC7Ndr4gPR7mPeD5PL
         Wo6/HXoHb+42F7m7ttwZ8NEv7opxkB4nBPu7ZgMPeOdQxUiVbg0+PCDl9//BixKa30xS
         3lboJrhkzdDEZNUfwQjnMMDdljxIqxqploGbyCDIayacCDkCiT4CK8alzS3l1U6rFBSK
         dWFveNo0V7WHxJcl2DuBRhGZKZK2Ju/APpp1canbY1fRQwVjjne68VgEiZKIL4FxheFv
         Iw765QG7s40wJpNB3DDseO7bOM4vIAgvV2jx4BcMIG+aaLwfkKJUEJ6zRiVfaeB/Mxll
         p5JA==
X-Gm-Message-State: ABy/qLZeZ9op6e7piRUpcQrmtnby2Xf8tUyJzSP2TNxhvSew/bTJvZAe
	fr1AEsy5izSJdGQ2+Il0ifBkv7jN5WW8RKz07w0=
X-Google-Smtp-Source: APBJJlHw3qyRY9hP8dkDZagGJBrn3Kq9UyhH9Y1noWx3OJp2PZgYtkyC14jlKBXwaaMIaGNhIkp1Yw==
X-Received: by 2002:a05:620a:4246:b0:767:451f:3eca with SMTP id w6-20020a05620a424600b00767451f3ecamr13701072qko.54.1689607233741;
        Mon, 17 Jul 2023 08:20:33 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a144800b00767d2870e39sm6144226qkl.41.2023.07.17.08.20.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 08:20:33 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/9] python3-alembic: upgrade 1.10.4 -> 1.11.1
Date: Mon, 17 Jul 2023 11:20:24 -0400
Message-ID: <20230717152032.3161667-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jul 2023 15:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103878

There are numerous changes between 1.10.4 and 1.11.1, including several
bug fixes. Changelog: https://github.com/sqlalchemy/alembic/releases

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../{python3-alembic_1.10.4.bb => python3-alembic_1.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.10.4.bb => python3-alembic_1.11.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb b/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
index 071f40bb03..feb2c419bc 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.10.4.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.11.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3023b042cb6002cb398344b51c67093"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "295b54bbb92c4008ab6a7dcd1e227e668416d6f84b98b3c4446a2bc6214a556b"
+SRC_URI[sha256sum] = "6a810a6b012c88b33458fceb869aef09ac75d6ace5291915ba7fae44de372c01"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.41.0


