Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4110D5B85C
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 17:02:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54014.1765818136771823129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 09:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zz74H98J;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso45128715e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 09:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765818135; x=1766422935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a0jL18xIQH0mUbqFiMRFlxzlpqBfOQjBib9hZ2yOQtw=;
        b=Zz74H98J5zmUu1Y/KUgKjueQjQy0enG3pnQeCmIXgBKdomjHhn7eP530l6WLNSisjb
         X471kCBBdGgiBL0PDngRIN+/DDLuszSTYfkql1hpBl4t1U5FrOWAVLOMPh7LtOSTuVL3
         XjfpGQlzVbQ3RIkoqAHatbwUuDx8I4qrx0pVOEkvEzYFS8uEUOdozMZHFz4Z0G7UkFN/
         kMXwdwgJ5cIWPq84tezLWxNdspbY0XryzU7iBEQ9NPELqeOoRHblxAZgtbj/+CQO0Kd+
         bj8XoP0TxP7ql3wtrqjPAuDYehpwAwwf6cQ6gLexPOmBEYFdUw3FR0vx+R8EP6TqvXiC
         zrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765818135; x=1766422935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a0jL18xIQH0mUbqFiMRFlxzlpqBfOQjBib9hZ2yOQtw=;
        b=H6UQIn0sQQaalUMcvT1u9J2tPUQi1cDEimUVRpzGqc9JhEl5kJTAwFp6Z0/mgESa8p
         /2be72QBbs9ExYECQgVriJqSH7+RuOn1fnFcWlIbYHlZBXl+rHMGQYZ43yUniY6wPZTe
         7KkdxV55qeAYz+2xSgdcJTf719DDnanHGsjumwC77afUomoehtPD3yxTvvXz2A+Ncykf
         UqtIPvCYmXCxuHMH7ozGltlmkDnQ4s9yzXcWrTFA7ft/ILVaLnapM6KBmCQ0w/kAXELx
         Z0BacnQBHeKqovFOs8B/M9q0pp4JQW7TV+ZbX3sAf36JI2SodWKlr/VqpYzpU7LLLFJh
         NAeA==
X-Gm-Message-State: AOJu0YxK34gAjUAPOSIcJY2WeUX+FHeewIzbH5MTO+EzVO3391dH0RC2
	oaKcyN5ZAoIHMkdeZkNCiHbPqhanLib3/27/CfL6yhNzbuBMviz1NyJAtBrWog==
X-Gm-Gg: AY/fxX6APzJEG3KYFIwKeLjE5F15UDfNhiZ2bsk32ZmrWCZehrasqJyjKj/brnLgfrm
	Kde+655qpNYskcyYBzgupqGDKMz8q3L6FBX9PpVkwuMfnGzwfDmn9+lJ5VL3L/hfhjYq0QjX1qk
	8fGtWiXP4PGYeC2lTNjPKrJBYCta5kI0ET2uGFPIsI5GcItCUhB94tzEtZIQjpsWLoeAGz2oxT/
	KeaRakjPUBzOSjLSWkrrF6/s6YAUtiSHQuOPHPOlarkkcyRaUl/isVQ+NBU097DgUvBoH83E8Xw
	rX3fEzvnsSV/BLT39yuzevpadNG4Fx8eeNPEobpwprqRXLKoV5heryFRwa0MeIaNqciRxJNVLME
	9OBp79GIRT6JJPIVyUQwXJKM1bMtvspRaFYKQn2B9w5Vvb0TLSE+uyGbX8z7/NmZT6+QzA91SSG
	Vi5lRIXSdH
X-Google-Smtp-Source: AGHT+IH0hRaOhiHwGTK0dz6ksfnspLOBooGgDwa0wcRud3sGAaT9+snLO3oVOu3viplHk4u0c2zF0Q==
X-Received: by 2002:a05:600c:4e90:b0:477:557b:691d with SMTP id 5b1f17b1804b1-47a942cd40dmr93572895e9.25.1765818134781;
        Mon, 15 Dec 2025 09:02:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f4b6e43sm74418205e9.2.2025.12.15.09.02.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:02:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] fio: ignore CVE-2025-10824
Date: Mon, 15 Dec 2025 18:02:09 +0100
Message-ID: <20251215170211.573880-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 17:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122661

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-10824

The upstream maintainer wasn't able to reproduce the issue[1],
and the related bug is closed without further action.

[1]: https://github.com/axboe/fio/issues/1981

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-benchmark/fio/fio_3.39.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.39.bb b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
index 4a94aadf42..2ca52aaecf 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.39.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.39.bb
@@ -45,3 +45,5 @@ do_install() {
     install -d ${D}/${docdir}/${PN}
     cp -R --no-dereference --preserve=mode,links -v ${S}/examples ${D}/${docdir}/${PN}/
 }
+
+CVE_STATUS[CVE-2025-10824] = "disputed: Maintainer could not reproduce the issue, issue is closed without change."

