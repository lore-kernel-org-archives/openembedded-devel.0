Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F15EE7BDB4
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:30:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18536.1771245004027855519
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 04:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=q7yKueg3;
 spf=pass (domain: konsulko.com, ip: 209.85.128.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48379a42f76so17135675e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 04:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1771245002; x=1771849802; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cdHZp5OkzqqY0DmmHOkXXHGsTvHU4b3u3OgzZQN3gs=;
        b=q7yKueg3UKNrR2OyJjYWSvxgMSOP0Zu9LjcQZgYOKxLALhNlYVhjcEx16TyhtybJmv
         Z7Ti1s3YpXHnlhwNzevQvFcbMlOr65xBeJfHkNyZnWHL8yjlqbTUP/sg4JBVQPyMGibF
         rjrVUu+aYT7Zs251BHlvbgbhTNwDI8+Xm5jiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771245002; x=1771849802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9cdHZp5OkzqqY0DmmHOkXXHGsTvHU4b3u3OgzZQN3gs=;
        b=OYCCPtbWFsb+aKiFfj/yXVhrKHHS5Tngq1GuS8EzF95MzMpJ7LiyH/bZqHDAo4WLtf
         gwdPiO4GoYmmCviVhZHIfaBUFc5F0/137jwzidGnF58yxJKb7RCEiNt3x9ZmIbjx8h7K
         Cm0EZizqLYZORp+IAXBU8BwOIgZHk7h0sNdqhZCuv5dMa1asTvMFg7pyb7pyoIV5egmI
         wLw6UsICfbB70WhMFUpyRrEkaSGxEuzU7OKowMsJePil7pW98YhMPvCYfWlj05Vq8WfK
         mhkVjVik0CqAnXdHjN+dHd/7wn/uFmOjDJPFNmj+UwRtGhdOhQM733Ttd45npxMeixdp
         tY2w==
X-Gm-Message-State: AOJu0YwAZfx0MogeNoyzgA0rTqllGKDWefGO8JeCBNUCglKB2aegec8n
	lnfBz0+iy5ulORSULqqhZuvyzqsJroaiWE7ivH+hJDsBvuK8TDWLG6x07kd3u9EEjSaUMJlUcMV
	JU46V
X-Gm-Gg: AZuq6aIU2dWx3gBQojgabt9Bl22UNqAR7c9j8w9tpXbU9IBReKih8fb06FVLr27w33p
	m8RqSob0MC4Z/WR35XBarfZaqGXQ7FBhaLtqiqgww0XCz8BQIBZr0fdBKoSddva7O4sT8QiBi7q
	SQDrOLI10gnHE+3RsbQrANiSUFy6pWlSXOBpfEzQxaQe6dL5Np/u+blWTAcFNXTXfH0HomSy/A0
	LLwtUrVJv7SfAKUpjKhKKjKF+kbsTayoMwcOUHQXFOO/IZWxSlXXvxZckP5gbqkxMz0moESbnoI
	wL0dREDldZRPEi5iFRVSUWcMKS8ugE3WTbNzK4i4n4GFzkFNQczt4TUeyGW5xiRMs7W8w13UavX
	w1Mtk/08K25tbBXEHVdq9JRK0PyADCBtg09a4qYsRvFyKpzJdRadtzXD6IA2Qrf5Ry7KC7leHiR
	t9eI6a9BTLMlcHh04/bhiGj0lIbYVkqrU9TQUz
X-Received: by 2002:a05:600c:4e12:b0:483:56c4:73ac with SMTP id 5b1f17b1804b1-48379bac8d4mr129088115e9.7.1771245001943;
        Mon, 16 Feb 2026 04:30:01 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dcfafcdsm664423415e9.9.2026.02.16.04.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 04:30:01 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-trio: Upgrade 0.32.0 -> 0.33.0
Date: Mon, 16 Feb 2026 14:29:55 +0200
Message-ID: <20260216122955.2642743-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260216122955.2642743-1-leon.anavi@konsulko.com>
References: <20260216122955.2642743-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 12:30:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124422

Upgrade to release 0.33.0:

Bugfixes:

- Start supporting Android's new "android" sys.platform.

Deprecations and removals:

- Both trio.testing.RaisesGroup and trio.testing.Matcher have
  been deprecated. Pytest alternatives pytest.RaisesGroup and
  pytest.RaisesExc (respectively) are considered correct
  replacement.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-trio_0.32.0.bb => python3-trio_0.33.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.32.0.bb => python3-trio_0.33.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.32.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.32.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
index cc23d3070e..8bb4514649 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.33.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "150f29ec923bcd51231e1d4c71c7006e65247d68759dd1c19af4ea815a25806b"
+SRC_URI[sha256sum] = "a29b92b73f09d4b48ed249acd91073281a7f1063f09caba5dc70465b5c7aa970"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3


