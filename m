Return-Path: <texier.pj2@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25087C433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 10:30:02 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.10246.1636453801368867059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E/XhAGhT;
 spf=pass (domain: gmail.com, ip: 209.85.128.51,
 mailfrom: texier.pj2@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id o29so11567872wms.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 02:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3x5dmgglNDvlNr5/YF8aRr4EpvF1dwNhrHLl53gtQQ=;
        b=E/XhAGhTify3SC7FILGKqtC6f8TtWHN3D8wlTHp9kfcD4jWlXYX9sZ/dWd9mpLb5oC
         YgxDJuwUABYi0yVYJNyIuCpY3uDOslS2Ib56S0rutXkWrWrAWUl/c9Y4eN5cAxLnEkca
         DG3r8Ix/RshnKWSzirg2lijE/r2N7zolElcD4WfYbuMeIJW62CuSZisdjucIYb5pPAsp
         Sd+y6eaDNRGqfEzEKId+hzN3KD8EECQtLXy9S22YRDbBU7x/LNHQznmJ5ssYqkRpCbC5
         WQD4yTestO4HzieXlN046nhp/hqV357UH5eYjC3cpmX4aBjcJ0QRxSeNBDBFVL7sTGpB
         JedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k3x5dmgglNDvlNr5/YF8aRr4EpvF1dwNhrHLl53gtQQ=;
        b=GRsxVwSvx97t85OJl03BZCGlXSiasm5kf0GcKIN/OifpDr8k5xpa1dAj8e0LX4pvlK
         1pWFGS/s3wzTGrCCs2is3kJBatrRXHTK6rxn5vqKejEdblfm2EneTW6spwzZ7aiyYsDG
         qj2HqB0s9UwmhAC7Y3LwZt3zoV5+CwQ5ZfnQ/n72q3PJGsmK+HLRK+kty2yx3E7Kq6RZ
         oi3NYU8KaFi+xcgGG39LuKoTsWa5pgIBq1wbl9T4kihodiAB3+XyYraw2CaNTwYqVf+y
         naX4tapZxAVdShirSaTUqzZ25R+uU1I2sYZDsjWp+xMQUMMVmwWZQohvrGO0JIKh9ur8
         OqRQ==
X-Gm-Message-State: AOAM5328k2wDd98ncEYGCLLQuoBqwEbI/AIDOMdS6urfm+D0NoVhSfwh
	/andV/V2XywGRzsledMYgbJhti8xrNx5Nw==
X-Google-Smtp-Source: 
 ABdhPJxs4LUGP8wQcG7f09G9I96pFuY18SL6mpOYyGY2/YY9B+CHshEx9R8D/CmCrmJ2OsgYoZzrHA==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr5874069wmc.165.1636453799744;
        Tue, 09 Nov 2021 02:29:59 -0800 (PST)
Received: from menoah.home ([2a01:cb19:190:c500:853f:c650:afd7:813a])
        by smtp.gmail.com with ESMTPSA id
 o5sm5270837wrx.83.2021.11.09.02.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 02:29:59 -0800 (PST)
From: Pierre-Jean Texier <texier.pj2@gmail.com>
X-Google-Original-From: Pierre-Jean Texier <pierre-jean.texier@lafon.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pierre-jean.texier@lafon.fr>
Subject: [meta-oe][PATCH] libmxml: upgrade 3.2 -> 3.3
Date: Tue,  9 Nov 2021 11:12:04 +0100
Message-Id: <20211109101204.339983-1-pierre-jean.texier@lafon.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 10:30:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93881

mxml 3.3 is a bug fix release. Changes include:

  - Cleaned up usage of free throughout the library
  - Added more error handling to the library
  - Fixed potential memory leak in mxmlLoad* functions
  - Fixed mxmlSaveString with a buffer size of 0
  - Fixed MXML_MINOR_VERSION value in "mxml.h"
  - Fixed POSIX threading support for MingW
  - Fixed some minor memory leaks found by Coverity.

Signed-off-by: Pierre-Jean Texier <pierre-jean.texier@lafon.fr>
---
 .../recipes-support/libmxml/{libmxml_3.2.bb => libmxml_3.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libmxml/{libmxml_3.2.bb => libmxml_3.3.bb} (95%)

diff --git a/meta-oe/recipes-support/libmxml/libmxml_3.2.bb b/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
similarity index 95%
rename from meta-oe/recipes-support/libmxml/libmxml_3.2.bb
rename to meta-oe/recipes-support/libmxml/libmxml_3.3.bb
index 02443e27ff..c8e2167795 100644
--- a/meta-oe/recipes-support/libmxml/libmxml_3.2.bb
+++ b/meta-oe/recipes-support/libmxml/libmxml_3.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://www.msweet.org/mxml/"
 BUGTRACKER = "https://github.com/michaelrsweet/mxml/issues"
 
 SRC_URI = "git://github.com/michaelrsweet/mxml.git;nobranch=1;protocol=https"
-SRCREV = "38b044ed8ca2a611ed9ed3e26c4b46416335194e"
+SRCREV = "0237559fdbcecae34157b547aa2b99e12de305a2"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.25.1


