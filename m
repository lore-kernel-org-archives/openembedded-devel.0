Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDAAD3B7E5
	for <webhook@archiver.kernel.org>; Sun, 28 Dec 2025 12:11:14 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23593.1766923868821394371
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Dec 2025 04:11:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h7iFTWzI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso75871675e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766923867; x=1767528667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IU/0KgHw7DhMeZLyiahw4mtF3m+V05eHZGuvfk34rCE=;
        b=h7iFTWzIxhseGNM1W9yqYK09UsNwCXxHOtT6Zv+ot2h8FNVYCW8QEN8+TYZbBfx3uz
         YbfmiHdLuJzH/B6jqs9MMyejeFZ400mbaTQSxQ0LEejG5KNDVuVVqvSi+YB9KQoAUDj+
         XLqegNquRR6ik5GDGHfQbK9KbijeRX7pUFAggS1XA/BDLftU0+YZPDrn89a2ERKTS8TK
         9u8qTk62hVkg+tV4jJpnfDG0jGpwHq5a8PqAx/z7gGtxJke/scCJ79IrAZSCYmgXi2lp
         AKkUpPGgUIAhYwJkXR8gL2lRMBfqIwo7oTfOb29EAHhjFqBxACaKGtR09+8WhaiUPVCH
         S9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766923867; x=1767528667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IU/0KgHw7DhMeZLyiahw4mtF3m+V05eHZGuvfk34rCE=;
        b=GswWsvp6+udYV9mMjBOAYj230qzTxSaOQ0OEb/zHi2HNoiu1MuwErPWyXqDsL1hEcx
         AhVenEWlc/L1WLVqRFDbdQsjTUfvtaJ2r+hcQXToupTObx/Cy27aMW6+4tH8SIiqLwrk
         asyG9X5RrBRDquL5EmGOKaVdNfDlLH9kz7eRd7IiGK/i1+/w49FFciq32UYX46zXLtJC
         rt2kbN3xBk06A5NRmE+7Nd+w5G4kJV3/1JzrS634buDMn7sy0QfiML+GAN6n7WdhEclV
         r9jXSqtq2U8gRCO2QBUD0krg/WJc3xnJ7ceafZzhbNYRFLWvH+qZX/hIES2RNbf2Way2
         ZMzA==
X-Gm-Message-State: AOJu0Yzs74kWs+XyFRc5SSZMoaNzB2DeWanf55dmSx/TXzW7dgot3Lgq
	XU7i68/dRN9hAzvtjgIkLN7HBumY/jFIKRQpzNiFsYiBuwMd6YhqS1qwYmW1kw==
X-Gm-Gg: AY/fxX4rT7e1lBueIcyMQWQKHrga9M5Xlp7SYfExHf2KqagFGMpEbsZNpifGsgaxZO2
	/iiNmZ/brwKmvY6/PV54IUpdMXBTBcOEu1BopOCTEdbgnPjC4SWwq4hCEfDAGtkDqNaoot7DPrB
	wQBTHzJZJ7ZOk8+XtP/nMicH2G6SIdnIjDtnHycbkWYFDL8PfZ3LeZYezMAjMKuxlR/LhdaHhzS
	RKKYt9/bY9pPjRj/KcbJoFF0+EJFtBa8FnuWmG58JdUa2YhbdxWTQASt5k+T0zxJD9kOUtSUlCt
	oIRiOljUVEGEa5THw4Q3uhBidb3Ytih1FJmuTj1OGtktK65q44dO8TCmTZtTapt41K99zYCtFSQ
	p0PpVwAu1kun6DvCEE+uY29Jd4Mof5WvbenL3hDpjavsh+sRz011vUzn8U/Y2hOcB+vCQd2eogm
	/shRqJlKhQ
X-Google-Smtp-Source: AGHT+IGLQ1NZOZlOhnpMWHJFSkRWnO7UT8u5EdbNJ2+eP5Guv70m6ANZBRe7ypS3iI0qLmz7NVkGXA==
X-Received: by 2002:a05:600c:8b8c:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d195aaf01mr286813485e9.35.1766923867177;
        Sun, 28 Dec 2025 04:11:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm546859805e9.6.2025.12.28.04.11.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 04:11:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/6] srecord: fix SRC_URI
Date: Sun, 28 Dec 2025 13:10:56 +0100
Message-ID: <20251228121059.1810946-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228121059.1810946-1-skandigraun@gmail.com>
References: <20251228121059.1810946-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Dec 2025 12:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122958

The tarball was moved to a new folder in the SourceForge project,
and the original convenience link stopped working.
Use the direct link instead.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/srecord/srecord_1.64.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/recipes-support/srecord/srecord_1.64.bb
index 5765272ce8..5efd8dfb97 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-3.0-or-later & LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dfcbf2f0a144b97f0931b6394debea7"
 
 SRC_URI = " \
-    http://srecord.sourceforge.net/srecord-${PV}.tar.gz \
+    https://sourceforge.net/projects/${BPN}/files/srecord/${PV}/${BP}.tar.gz \
     file://add-option-to-remove-docs.patch \
     file://libtool.patch \
 "

