Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2B8CCF2EA
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:33:00 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33488.1768822371180735058
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z6HffzQI;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so7189707a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768822369; x=1769427169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X3Et9FDK3PfCdICtbm0YbEZIRCcD23Sm/FdzOpEwRnI=;
        b=Z6HffzQIj8lZmNd1Ufa8Dkpku3kAfqhzrukfZOLqP18UVgxFA6y/ydJHk6bOIRe86E
         A98V7r7mkdyzdtSc6VUDUJSDiug3M4Z+8a3Ja4VpLHJtaaTy+DEl+uKQ7+3ZJu7/ZcGr
         iURgexrPGOPkNbR2GrzBAMjvIGEuMuCoZgEAqr9MA+qqdh12x0PDN3EWpN/7+hfU0KOO
         37RGZ3Wud1FxUm4wlOMHihUtO/c0Lf2/JVMbzLU/JmQmy0qO0QEOwy3x8usv+JcbKwTN
         x3Jnrhv++k54mEx0snJXC/PieSL12yxqEV/wSSZmDUPkooOgItCRNKDrx8jjPC//DxaP
         JwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822369; x=1769427169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3Et9FDK3PfCdICtbm0YbEZIRCcD23Sm/FdzOpEwRnI=;
        b=cagAyBNEbld2N23eDrnh7zqBkOWx+VfGvh6df6wdhxiq5ALugeiZre6mFLEnKD+Cs+
         /Q82K2JiSi5epDMJVaEHzE9hyNZcjquil7wQz/uX1VOuyYXXHaUx6TWTK2vO4y8tQY8Z
         SZL4uYMDUe4PRu43eEx2U7ZsavLUbfwYyHP0AsaC6YWwnboJC/n1796hFiT2U70ev50b
         T9m9jDRRDRnYGXjCf6cCa3ymobRf3yCxBmCaFCDW3iAtIhFeD0aoV1UnnShKiDzh5yf+
         eAJcbhPToPkKQtBSEJILGDoIBQ6xjsKF8DICSiZACVGDAimNgAGsRrzj0hdMMigE5E5k
         fg4A==
X-Gm-Message-State: AOJu0YwPPafMIhZG3Nlwx1VUrhnnX+NddU3Ava9gjb0DYOAbpEhz6aKl
	axLhJRLQ60Y+Ulz0xhrh6hWgacK4YD1TcCyHFMbrhvkqPqsnlQqaPKCtpMc92/6C
X-Gm-Gg: AY/fxX6F/W4ca4ysXmHKUdGUVtrpvA+X1kYEQyvIma4c+2hLJD6VMJamM95Xn3MY2mL
	+Fdqe6FQf13JxWAlWhAgDjlnYFQ4qB5VAAGK4fNwuztZ/lmOjoleqjBrQuuHAlE/HLN/rkSVdOz
	6KXMmx/Jdc6fBnJNvwh11YcAyH7Uwg6/NpbvTlF+K3uml4p+7EP82CSmCzZFVe27H0Xg+fSE/Pk
	HU1Kwwmsva91mThodJSuE30NE0PZYHdALQSpK19LnuPmFlMgO/39rCIECuKZli9E0K4JO0pqS4p
	rt70cTB9+qAioRjHwOTaPxqqHF2nOvBoISGRZrdqPL32M4FPsdB+AMeaNq1n8myDWgRGqp6uBIk
	829PtqGMdVHdu01ZcfOE7MvT8hP0SzfH93HnhYSCOhwoKu3PVHV6PKcdVP8NEFIhASh/0ZdsGHT
	I396BoRPS9TjxoVVCOD6VRGCVIR/KzWsOWGany12TUig1fQoykcAdeGEYqK4syZlekeVkJOw==
X-Received: by 2002:a17:907:3e8a:b0:b87:6d6b:1366 with SMTP id a640c23a62f3a-b87930169c0mr990737166b.41.1768822369035;
        Mon, 19 Jan 2026 03:32:49 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.65.mobile.3.dk. [77.241.128.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879516900csm1152229466b.23.2026.01.19.03.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:32:48 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v1] glaze: add recipe
Date: Mon, 19 Jan 2026 12:32:27 +0100
Message-ID: <20260119113241.4139214-1-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 11:33:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123633

---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
new file mode 100644
index 0000000000..48fc3ab081
--- /dev/null
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -0,0 +1,11 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
+
+SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main"
+
+SRCREV = "ddea99c503ac4578cf556e2f6ac0b64e0d9d470f"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF"
+
-- 


