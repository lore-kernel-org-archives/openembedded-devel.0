Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7EDCD29C5F
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:45:12 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41827.1768848307076240161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C03Z2OGe;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so28255005e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768848305; x=1769453105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=be87N5rZJjPNtarBHA/rrNRwvWa1WBGw8luSmSP04Mk=;
        b=C03Z2OGev+57iiToFylU5cVTERXGbHkn1vqCX3pjzXKSLdhBpV3zGkSKD/BZaLaX1j
         Z2uO29ylbjqpjI6ii80Z8gywsnQ6v9jZzjY+YdlgUc7vn5VAAR2ZzuXAhXT+iRqjHotT
         k2SG9tYlB6FOGhmiaORyNOHrqGu9EtCWISOdvlroNxhsWTflwPQGZGH8bc8Gz4oCz985
         btndGjyMvPz9JYDyXPfhXrmMttceYcIBmhYQWVvhn+pwTXjX9N2k60HUubmyqXXWw76f
         D7WVy8cnuQx7qV+JZ/GhnYA1fv8uarQHGCyUFKFOjgV7b8J0LqKYeIY2dF5RJQMZVRaC
         2cmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768848305; x=1769453105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=be87N5rZJjPNtarBHA/rrNRwvWa1WBGw8luSmSP04Mk=;
        b=Zy5nR6Cfwg087YRhHlZcESjcfTfwQ9QYEDZkHT7VHDY6djExFaMQL14yBvBgvAVc9/
         DWPV/I6zlttPvFvbkGT7MI7T93FK+RXQ8Nu2giIS2Zf1SmJCnIc/BDk7SLOSmbViNQWW
         NnW4R2ackrsjEp2m+WHESJbvR49lpgx7a5w76e0z/DF1o+zPFjk4CO+D8klgoq0vVBHE
         xFRqcCF9R3/IvWApxrW9yxQH4Whjkh/H3p1Fa/hB8jkW9NpKhp0yTFH/kNWj59c4KaRL
         z5ZpLy+Eb+4kASQeL/294+NScqM9WmfEMitUDgCwplW+WwiqFmbQWMKWCAW+gR9o74Dp
         KzLA==
X-Gm-Message-State: AOJu0YxZjFDRMtcQl9m5nbjEvlwW5d2p8HrCoFsrlDzX/LxpWm4TJPzQ
	44ohPYzMXiedmqC0vzUSD5KRV9VEtlL9ypFf2jI53qN7ZJF/VsJb86mOSL9NGw==
X-Gm-Gg: AY/fxX6wjLPaiT8db68w9sDYRfFjNf4z8uSJYm4OfybOz9uoxC6IslxUY0E394Gaz6O
	AwEzG8LRmV+bMxpAaXukUfnRpdBpU0m9EPZjKr0TaK9YzPZXEdYdQ89ue/VdIExXKCWSK+iSoMg
	5UvoGVvEAyEH3agCuWlI2DkafYBS9Mt91bONS+M6EzWprEhxbEkezIGRN1cJRXHjHV9eam6YbxO
	mqU8erqcD69aj4aUZoIdK65fZ05KTidRo7fjZGcZppeP1bIm+STPL5xOvKjDllFNzmQ5ny/+l22
	dfdyDD0HM8bhxOREvUTm2NjDhDiRG5wNCwGtYVx7EMkwI9JFKSp/tmKkUzMycvYh8mzFH+xUkSr
	lGuCqGq41c77YHWZ4groe0FA5H4VGwfhtuwxVmjRlWwGVLHvu+9E8UscbENIAoJ8WqQ6QA2V2mZ
	qzTm46eKyX3fk0ZE896iI=
X-Received: by 2002:a05:600c:548a:b0:475:dd8d:2f52 with SMTP id 5b1f17b1804b1-4801eb12369mr145483995e9.32.1768848305176;
        Mon, 19 Jan 2026 10:45:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e664sm22365714f8f.30.2026.01.19.10.45.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:45:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] influxdb: ignore CVE-2024-30896
Date: Mon, 19 Jan 2026 19:45:02 +0100
Message-ID: <20260119184502.785819-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119184502.785819-1-skandigraun@gmail.com>
References: <20260119184502.785819-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 18:45:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123650

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As mentioned in the comment[1], vulnerability is in
/api/v2/authorizations API which only exists in 2.x, 1.x is not affected.

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-30896

[1] https://github.com/influxdata/influxdb/issues/24797#issuecomment-2514690740

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2f1d7a8597596d8e51a6f6f3b62e7e5f153f6e73)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
index b5d6f16abe..2de787dfe9 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
+++ b/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
@@ -71,3 +71,5 @@ SYSTEMD_SERVICE:${PN} = "influxdb.service"
 
 #cpe-incorrect: Version does not match and only the Jenkins plugin is affected.
 CVE_CHECK_IGNORE += "CVE-2019-10329"
+#not-applicable-config: vulnerability only exists in version 2.x
+CVE_CHECK_IGNORE += "CVE-2024-30896"

