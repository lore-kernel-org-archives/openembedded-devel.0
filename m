Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD624CD37B9
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 10:37:59 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46985.1778495869745488955
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 03:37:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nS94Uv/i;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so1759513a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778495868; x=1779100668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnX0leLMxMI9T7ei50M2IKBenxNh3+oo02NcnEfqtUQ=;
        b=nS94Uv/idFjJjqRioqBCWvfzWegPN5LQ5jqHr7ktcTFC1UM6s1s/l27wqWFLOhhITc
         x7rpduQt73cR53MTLx189qq+LY631VrBl0umVYTROcPxPt6jurJuend5sz4Wo3myo+SQ
         +BS7jcn9eahrd33x37wlpg0265xo44PIL7RdIWXJLqqpz8C6zf0yMDll+79W5/8MshiJ
         Zetp83tXCW5brV9qVwL5q/XBCXfOq4clOSzUr+6SWT25tL6DsgacgwaL0yfNWjfciQpS
         EbbKjonoZw57nowdtRaIvkam3SiiyxRebQvwqRJMZFigkuqGSZji7A2DDsRujlQvxzss
         uKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778495868; x=1779100668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnX0leLMxMI9T7ei50M2IKBenxNh3+oo02NcnEfqtUQ=;
        b=hYCRzhxzB8qDaHK7akU/9Gni4OGKigahNG9t/H0UH+zMf0oS8K3Do+0eMQNqJbfUif
         mJiI2vNpTpNnbzUi8zU0WmmYm7+LbluCDLdstaptcguPBF3rDZU4OWReU3rOmZ4BNaWF
         FJNSxbeZJ9m6Z3XsbyrB3QdDmuTshAe4uJZ14n7YB/kD5lz297FtzlVyhuqXFB/BWQwZ
         VgNE1J17RwFAcNv/Norw68tp2RL6J7Fv5vMzCRByIrrH+cw7DHvf2WuJclzpk/TzGf2b
         sEoBvCE5EgBT6uzbsnU23iupJbqsHR8AueOoosNAQf4GbhQO2+QJ7rDnBtG3o7AAsRDr
         0Yww==
X-Gm-Message-State: AOJu0YwBR4QfxbDjIxfUVRsZkCT3vvgKVupLk1UdAk7NtG0G+WlQmYnp
	kGlinoGJw1JEJFMugU+3Xu2b733WuzTfVO5JJ//hTDr9ryNIlJfs8e55BsoRqw==
X-Gm-Gg: Acq92OF8Df1tzMHDiQYvQmrFyfZUb8L4L7EW045/QXJHgAbRD+LAmh5KRtrvAyVFzzR
	rbAB2gFw32ts1V5B3cbqt5yoN442ZK1LHbQFwklwyv5J4Tl1RmvZth1TS8xXHCow6QS2cVSDgSR
	V1/HIgXSuJ+FiqIo6ZHTIWC0U8E3cYkHnIhVqOjQx6EQ6vtQ71rLfAmU2M2SnFEN6u8+ha0I/wp
	EIq+pGlCXrWkVgoL9kOwNtvjRBmT/U++geKGIPSppplzzPtTYHHfifgVjdOnyflb1EhTdE42yah
	1xSabVmh/Oar5Um30lmqguygVi/4RThExzv5JBc+oq+GDOzeDNNIq8tYr7fdcspE+qVsCfn9bPB
	q0qTwc70MfYwEpK+isKWneoWJnr6JfoW5P7/Oj/Agh6xf8VCQmnSHZ4MAAnR827zrxcFxpCHqoe
	KFGttvVuh9VoT2wm4mvOoRvujULiCdesAK5AcWVN869aAY9oA=
X-Received: by 2002:a17:907:9305:b0:ba7:7f6d:be4a with SMTP id a640c23a62f3a-bc56d132a0amr1349560166b.26.1778495867539;
        Mon, 11 May 2026 03:37:47 -0700 (PDT)
Received: from ws.taila4487.ts.net ([80.166.137.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcac11b7084sm473753966b.28.2026.05.11.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:37:47 -0700 (PDT)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [meta-oe][PATCH 1/2] glaze: 7.3.3 -> 7.6.0
Date: Mon, 11 May 2026 12:36:55 +0200
Message-ID: <20260511103655.3350355-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 10:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126842

---
 .../recipes-support/glaze/{glaze_7.3.3.bb => glaze_7.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/glaze/{glaze_7.3.3.bb => glaze_7.6.0.bb} (92%)

diff --git a/meta-oe/recipes-support/glaze/glaze_7.3.3.bb b/meta-oe/recipes-support/glaze/glaze_7.6.0.bb
similarity index 92%
rename from meta-oe/recipes-support/glaze/glaze_7.3.3.bb
rename to meta-oe/recipes-support/glaze/glaze_7.6.0.bb
index e733d166b2..7d0e1d87ae 100644
--- a/meta-oe/recipes-support/glaze/glaze_7.3.3.bb
+++ b/meta-oe/recipes-support/glaze/glaze_7.6.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
 
 SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "dbf6caec935b768546587a413e45d033480c4483"
+SRCREV = "e4d8b406bc509cf236a11bc455fad29a024d5fb2"
 
 inherit cmake
 
-- 
2.54.0


