Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440C6EB28DB
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 07:33:00 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6639.1770363173260541382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Feb 2026 23:32:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Py0CprJf;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so225697666b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 23:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770363172; x=1770967972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8ow0G/RM40JfOcDLKdejGJVRENpjlmOzOOZ2Ep/vCo=;
        b=Py0CprJfAS8WGEvgBP+FJLIT8YfrF4t4vgIWNIEE9wd0qgiGVYiKuvqHotwryFOhpW
         /h/dnqojjiPs6KZNzyOMZ5CG2Sc84yRgfcaCABKrpOCF01t0wbGA/woh5PFj1VMecRbi
         a921mCABKqf3NXM3Sng2hWjK9nEfzzsIPh1FVBw92vngWjzJzlZIzP7AFEnnML0GTKwo
         v5vl1Uvd8V9Mf/zocEa0KgLif6HITqitv8gzB/HvlScX/mBRHuTT21q2HA4a3/I7XpV2
         4vw4NLuL9uPKt6DT9xFV12aFdSAeIQrm1H50lk1AZDYHOFlFj0kZSCc7O4msDu6M2hga
         hSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770363172; x=1770967972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8ow0G/RM40JfOcDLKdejGJVRENpjlmOzOOZ2Ep/vCo=;
        b=azm6izsmKXbakUuRpTuSj6J3p2k1mSIDzsNeWj1OEiEAKAqzoLPi18UMyFWHyXqrrV
         lwwVEtMl/006WsIO411s9HPKjtJ8XwXlrZJiJTPHBKnXZrU9HjkzdAhS44MnPczFLJLL
         CPjZ3Jd3cP9m53Gj72sFtYfFjPM559mMaCCj4lCaeWrnpUGh9vSZjJsdnfWIK4igTVdx
         PCcGp6gG9xUlOykLOUirCSRt1yrOCRhbdYYJU21D5x6t2l8mGDwg0jaRLXcMR3nMSprL
         CgAadMPSwaOHUjGPjyhuHjnI91iczAQgLSVy0qwUdHwWX5FhGHAdbGbOuanTGdsZan3h
         5OFQ==
X-Gm-Message-State: AOJu0YwnuWpU1CUvc2Kup/3gAzR2Cndf9VsGc8qN+wYWBNfD7pdtD1I8
	eyzGXC1Xi77jF91ixhVKhsQrchfVFzch6j0ITIb/c8nUtNKhtU956qQBwMCeVMNW
X-Gm-Gg: AZuq6aIKZ/UUalIEI2mgG+bcWN9zhAu8IlDUmgjJMjUjVmcyCwqownvvZrfzMJORXzL
	Rw4KL8axi8VHINZlhVzjF7uZEQaT1pKIZHEG+GOz03MYIy8zimUdoCocsMS0Y/3VKFtWg1Gh5am
	wkjioadObsoApAOw8PjK0bV6L2PHPIyWvS6OAt+I6z082JOCRhh1oN0ora4n63pj8RZqLTL9k2p
	u4YJHT4xAtVPhLfJapYNMosxUzKYGI2B3ELkNotITM7y5Q2fEy7LoiPlsa8hFxw7yppMj/emF0F
	BMEd4B3yl4Yk/eDaq3DQkNic49uUiT9G+Gn2wFU/iZa1tatYI5YKZgLNIBaXWTs27jjNFzVGqgN
	kV0WL4QS2KUvJAQZRntIGc19itNr+B+mIVItMLbLlOFmeB+8CKikTIq33toeK1Mnb/F4kq8aopF
	at52wjdgtYBOxS2+ULvythhAc2So+wwYSEWVGcvRcYbN7S0Al/DatRmMxZxzvWvPmn7cJ9WA==
X-Received: by 2002:a17:907:c23:b0:b88:5e4c:f842 with SMTP id a640c23a62f3a-b8edf39a1a2mr100316866b.47.1770363171452;
        Thu, 05 Feb 2026 23:32:51 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.38.mobile.3.dk. [77.241.128.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacb18aesm59346366b.41.2026.02.05.23.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 23:32:51 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH v2 1/1] glaze: include cmake files in glaze-dev package
Date: Fri,  6 Feb 2026 08:32:09 +0100
Message-ID: <20260206073208.340688-3-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260206073208.340688-2-frederikbraendstrup@gmail.com>
References: <DB5PR02MB10213DB563D39B743A315F251EF99A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <20260206073208.340688-2-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 07:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124228

The cmake files should be included in the glaze-dev package.
Without this patch, an application using the following

    find_package(glaze)
    target_link_libraries(myprogram PUBLIC glaze::glaze)

Would fail with the following error (with tmpdir redacted)

    CMake Error in deps/vesl/src/Platform/CMakeLists.txt:
      Imported target "glaze::glaze" includes non-existent path

        "$TMPDIR/recipe-sysroot/usr/share/include"

      in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:

      * The path was deleted, renamed, or moved to another location.

      * An install or uninstall procedure did not complete successfully.

      * The installation package was faulty and references files it does not
      provide.

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
index e481290b9c..42be0a8bca 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -17,6 +17,8 @@ do_install:append() {
     rmdir -p --ignore-fail-on-non-empty ${D}${datadir}/${BPN}
 }
 
+FILES:${PN}-dev += "${datadir}/cmake/${BPN}/*.cmake"
+
 # Glaze is a header-only C++ library, so the main package will be empty.
 ALLOW_EMPTY:${PN} = "1"
 
-- 


