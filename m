Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80122CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 20:14:37 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1243.1762200872590519052
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 12:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F6KhW63j;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47721293fd3so26359925e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 12:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762200871; x=1762805671; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2NY4N50P2ccag4W/pvAI64Yz3+j3uYcHoC7KCVz5bg=;
        b=F6KhW63jTwpcfhpayasQyh9sDA7oJzmYsie+hfkTBwoQIsoY3beBgkxuJKMN89H1DK
         enuDKu5gbEpEf0lKddc2xG0SfcOoLG4sA1YfucUQ6GQYAcg7edFnmdTau21gjoEofUZi
         s1OFbUSl++Umh7tW9oBcA82uDud+80I4c1UKurdln4rw8d1m+0HhVbqmI4yUqRHGyJ52
         B0pprPMnOFL+hFujdp1IUxMKDI3eQ8QuU4T+umPugz8f9g2L/o0vJdBILPpEkenROhfv
         POGUee6EjCC2AAwrIrPPUxZbcCgcNi7T1pTyRR9JDIGIf/WrnNq0MUWEzEpU2JqXJoEH
         yP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762200871; x=1762805671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q2NY4N50P2ccag4W/pvAI64Yz3+j3uYcHoC7KCVz5bg=;
        b=TfR6Dq7SQG7SGDmDF7FOX426fMUZYYFNMa5SworOkFpqcIAtgcIH5lvJPxhimzsdpo
         xim2GX824e+WHd8efJKJXaCXg91OmCJ4GIIPvuMYmo0rBqD0xA34mviU2GevIsOEkFKm
         ZQm/nU5UJcdHcn7o0JUlvJQQHjyQJ1+ju0n1mpQGqdXKZMXJAHcQZUNTGe+yFXXuY2RA
         uJdxp0l/3k8Me0/TFil8epOckK0R3XsQlg/gb8813D24ZgIXPR37ieoeipZk0+ey9BOK
         SoRlIN1WnaPCrs47bn4pQOBAJaHwC7K3eIibVJMnm6iVQp1dGLf8S3cFl5cNj6Jqtbew
         9D/A==
X-Gm-Message-State: AOJu0YwTY1p4EH/WuzzqYX4jGKRw3ZFH5+YoLP2dMmcRvrh0wkV3gCu4
	/nkwAJ5fvMFrQrIYVYyNA1as4yj3Hx2DfLnylNQ5aRGX7I+78bHTEQPYuz8grOBI
X-Gm-Gg: ASbGncuh90ddcOBIOcg3Sc8SGBqVW0ZaZcQ8Y2KGLAB14BEDtYd+Inwev/zyZamg8vQ
	LvHjCMHknkddHoxY0JsIqWu5Na6PZg3HwxPSAzHUWXukqPRHdCcO7X+4VZ9iv1PLKH8kF/b/FUJ
	CWeYVhlubhA/Gz2Jd1U34SGXINgmEruHWTdPSEwGeVV92DPSfKgiOjb8WV4tkzWs+Fr01DVS7PA
	+4HwNMEMClakE7R5mGtRG/Jh/0j6z3z+k3yvfopYNMMBNtW6q5667xBhUWBEIfpXM3FdPEou3Ke
	C7CdiXW4/XpNXo5IpW8pLZGyRfeU2/Y5ewNACPfIkZHxqYw2OMYooeEjhrZT44a7E+PP3x/FbQA
	DWwe199g/bpdigcJlWi9MCPHcz8lBKN98NsYMxLP7TuQZIzMVPMN8SYBvoLAf2zJpwE01u9aTeg
	==
X-Google-Smtp-Source: AGHT+IHfJ0dTloNQ86ZUwkhH8oxVbMow5/gkm0+C2XuJxZBEtQwCHMo3ni8Ui9c0ngAhVuHdUAD2lA==
X-Received: by 2002:a05:600c:1589:b0:475:dc32:5600 with SMTP id 5b1f17b1804b1-47754c542efmr4656725e9.19.1762200870738;
        Mon, 03 Nov 2025 12:14:30 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1a850fsm624900f8f.20.2025.11.03.12.14.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 12:14:30 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mbedtls: upgrade 3.6.4 -> 3.6.5
Date: Mon,  3 Nov 2025 21:14:29 +0100
Message-ID: <20251103201429.2204897-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 20:14:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121283

Contains fixes for CVE-2025-54764 and CVE-2025-59438

Also, add the recipe to the ptest image list, because it was missing.
Ptests passed successfully.

Changelog: https://github.com/Mbed-TLS/mbedtls/releases/tag/mbedtls-3.6.5

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb}              | 2 +-
 meta-oe/conf/include/ptest-packagelists-meta-oe.inc             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_3.6.4.bb => mbedtls_3.6.5.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
index 07ac602d12..e6dfe43092 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.5.bb
@@ -26,7 +26,7 @@ SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls
            file://run-ptest \
            "
 
-SRCREV = "c765c831e5c2a0971410692f92f7a81d6ec65ec2"
+SRCREV = "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
index 78ba1e228c..a54e37562e 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -33,6 +33,7 @@ PTESTS_FAST_META_OE = "\
     libxml++-5.0 \
     libyang \
     lmdb \
+    mbedtls \
     microsoft-gsl \
     minicoredumper \
     minizip-ng \

