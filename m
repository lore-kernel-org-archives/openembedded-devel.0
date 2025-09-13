Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C52CAC587
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 09:25:47 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.1847.1757755545728739863
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 02:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NXkmo/ka;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62f1987d53aso172562a12.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757755544; x=1758360344; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yICyVNSqR/lZvOJIaB3sGRoOQjz1lqAjRzbtwpDtlpE=;
        b=NXkmo/kavgwMmwJlcM5FrOIo5gl63ywp6/7IL3QQu1R17WQ0UN2TeRnSOAu5uX3xa1
         agUSzd+n/PUw7RNxSXeqrAbJ7i09DDreW0DAYklmulnS1aEEumS/DS7GQcTf4uR3gD7e
         Uk+TYYwxGAaK9sGBP8+EhE5CsMLlabvi/ARKO8rlpAca566uspi7OHcWGxRB4m28bAnO
         HpFDyX0JNj2puTUxFuS18yo746wG6EXzZtrPd3OsJg8zT4SvWr9olqLI14wQ2ad2an2U
         urEVIg1Ci72wM6OD1CdR6Iqwe5eMsu0sC9Slr4ykIEYs1Bow8/XPZ9Zx+yJRp/KRo1Xe
         F1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757755544; x=1758360344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yICyVNSqR/lZvOJIaB3sGRoOQjz1lqAjRzbtwpDtlpE=;
        b=h9MCmNlttBfAGjJxhnlQ348rvopfNyny1HDeqv3+u/jY0/BhaJchEFa1zMIWDYF85L
         Aod9USQyydgwpsvwVbLgxJlhOCiEQor1E2Mk+WjHr2Rzn3su6hqfEgeBX0xGaSZNHxZH
         smIbHmL+PPEDf8r6yd+Eos3bxFfRowUd+vJXAsdXFNiueh7KMB8RlQ8JCu83vj78O7es
         NaRH2xh9uDYFAGBMI4kznWkmpgHr9/W9rV0ns3UWy5fHZttQdf/TGyozH/NTnC8iOs2y
         GTl3l61dhLQavVPnbjw0jhjVWn6SmeQMoIa5l3cphLkyztF95o8aY4EnR3EAjDMUanYi
         W16w==
X-Gm-Message-State: AOJu0Yyo1o4PP9JEwc3ZjMegF2BwKN3HiQfVVvUQMEuxQ9Gcl0pST9hr
	OvGQ+SFzvvQ596SMEHJ0VgIoJTVlKFEuzeldiWi6mTIYmJdoyuQmn5fCA01NHQ==
X-Gm-Gg: ASbGncvLPtXvBRRT4kSpcL5EZSKdZc/DoVT4PmllJ1PENTAcFoLaHiWjLHfwbsJnvSI
	9mbheMK0GKkI7x3B7iI7RnJcp08U2sEual69F83ONfEH6sp/q6INX7mdV3RZMDgpYMqQnXVML8E
	Wvu/fuGN+Yd9EEnE3zIrCBDnooxDfalEVV9NNS7T6dhriK+12Q6UP09bwjQWI4LASCj/+faiAhE
	//twhvYHkKyx9MWn0/rDvsUeI0DrrXdkW0Ch+MQpWgcOZuNRo/AeUNJw5DOqzcl2Yw7+1vKyVHe
	kivJcverbBVW7v1nnQpGyJf2hrJTNyK7CDU90BBmDMcUqwpEniaoqyp7tTDZDcVAPLfKZPWpTSf
	Js0fOd3TNNuJYMLv206l2
X-Google-Smtp-Source: AGHT+IHlTXY9ZSamcqVivOp5TP7v3KsFgsWqhp1W1vwm1MkBq5CS+rlqYHdwX6dwsbwyjtPimP9B0w==
X-Received: by 2002:a05:6402:44d2:b0:62b:50f5:295d with SMTP id 4fb4d7f45d1cf-62ed80df1f7mr4897410a12.11.1757755543800;
        Sat, 13 Sep 2025 02:25:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62ec81dfa51sm4544955a12.52.2025.09.13.02.25.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 02:25:43 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH] libiodbc: use gnu17 and ignore incompatible-pointer-types to allow building with gcc-15
Date: Sat, 13 Sep 2025 11:25:42 +0200
Message-ID: <20250913092542.2064791-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 09:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119381

From: Martin Jansa <martin.jansa@gmail.com>

A fix was sent in:
https://lists.openembedded.org/g/openembedded-devel/message/116537
but it causes issues with clang as well as older gcc as reported on
ML and also in upstream PR:
https://github.com/openlink/iODBC/pull/111

Use gnu17 until this is properly resolved to avoid:
http://errors.yoctoproject.org/Errors/Details/852861/

In file included from ../../libiodbc-3.52.16/iodbc/execute.c:94:
../../libiodbc-3.52.16/iodbc/execute.c: In function '_ReBindParam':
../../libiodbc-3.52.16/iodbc/execute.c:643:49: error: too many arguments to function 'hproc3'; expected 0, have 8
  643 |       CALL_DRIVER (pstmt->hdbc, pstmt, retcode, hproc3,
      |                                                 ^~~~~~

http://errors.yoctoproject.org/Errors/Details/853276/
../../libiodbc-3.52.16/iodbcinst/unicode.c: In function 'dm_AtoUW':
../../libiodbc-3.52.16/iodbcinst/unicode.c:1565:16: error: initialization of 'ucs4_t *' {aka 'unsigned int *'} from incompatible pointer type 'wchar_t *' {aka 'long int *'} [-Wincompatible-pointer-types]
 1565 |   ucs4_t *us = dest;
      |                ^~~~

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index 644c3ba07b..0478ef3403 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -31,3 +31,9 @@ EXTRA_OECONF += " --prefix=/usr/local \
 
 inherit multilib_script
 MULTILIB_SCRIPTS = "${PN}:${bindir}/iodbc-config"
+
+# avoid http://errors.yoctoproject.org/Errors/Details/852861/
+CFLAGS += "-std=gnu17"
+# http://errors.yoctoproject.org/Errors/Details/853276/
+# libiodbc-3.52.16/iodbcinst/unicode.c:1565:16: error: initialization of 'ucs4_t *' {aka 'unsigned int *'} from incompatible pointer type 'wchar_t *' {aka 'long int *'} [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"

