Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BCFE7AD52
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 13:15:20 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137782.1766668515232937522
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 05:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QUt3IdDb;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso37953465e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 05:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766668513; x=1767273313; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=skw8Unui1c89Hgjl+hdQ1LKpdHrOyNqCPLfQO75fD20=;
        b=QUt3IdDbrBwSn9yPXxjKno+7bUqRIzMpz7nRtLRp3HElKvWV5L5TcHx7/c2Z1dGgFf
         V0FfPo3WuhKmBtVguiXUZTMt/PzL4himHGKfMma7OftmS+gMGlUcmmrfmL5YiSOfyjih
         rzx4Vnx85fs8YFhRH9ohWds5rhZetqzi2W155TqsMdLZuUVqvpINk1SibXajCk4PSgmM
         DTXAeRrDcpmHXFZ0OClpiFXbB22oF4wZTvKqHWeiJU6rXQ4FjwpDNBU2YbVEDfnq5y+M
         hrQVgGvv7RNrm7iV7Mb+3h19L/lSmeFGhVMJuvSl2UEeGlUN6V8IeFDeBqWDivKdOC5m
         5jfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766668513; x=1767273313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skw8Unui1c89Hgjl+hdQ1LKpdHrOyNqCPLfQO75fD20=;
        b=lD4OfNc6iSZ9mgPMJKvFA711HoDQHPaAmVElHzxwkVYn/LikbE3gGKtwAba9gYeJHU
         ut8cM5Xq8qKpuMdvfh3y27wDt5G3R02C6z23u2p5S7FBWObV66QUbhM+ltizUY+zcC5+
         +zsSq/OYSdlFGq5N4n1uWZ45PoxidJZ61RQWVwZs1h55sr4ry2ozSCLCbwQqblHbSchJ
         54ALe97g+/4Dobei2gtOX5rtX6ZJTU1zTpk+J8axq0PTa1ZJR2/ORylyQvvMJDbrqjRT
         faATcljHHNuMZ3RP83VbUnKf+LNzoTAaTDftGpIH1lHF9CQ74fZJBqHzIJC6tx77dB4k
         OmOg==
X-Gm-Message-State: AOJu0Yz6lHn6LsiHvYUEA46Ecq6PWhJ9G24VDmVzKaPd6ehg0PVwAzGU
	pdxGc88V/ktPiqJXCTneHEGPo6Oi/CX1OVYG1NNPQwEoI9Q0AwgCDUsSmQ3O4w==
X-Gm-Gg: AY/fxX5CsM0pmzX7L2A49gqOEBa4wqPA1wdpL03x8tYyvKvjyqWGUPl9aQM7HpuNQ/r
	jiyuLepmS51zbkP3boW47f7CjRgkjsewoNC+6NaJ9TY3bXXP4NOTWi6BAYydaENTTfIMj6lxt7f
	fSrckbf3tAPfleO+lVUXFWWIXRNCxtkLmSOiNQO5KqDJws7F7i+3qfemLoRSZBmzjUx2VS+iG41
	v+KiP41IwX9eYPbA5qXFqDPNy9RPp2uylciN/Q1ytscw72l8ALye8m/z9mP5VPa1P9VI8LSsFR9
	2vMNKgl3lpK4MU4o6T4iWqhkIgAXjYTs36g2PHc8eupBQH56esfIOKtbY+RpR1ECmEQroEn1kqQ
	bsgbfH1qo+TEwIxyR29ifutoDkjNuQBdMlOImsePcARZDkQvcBq2m4mQQUsXgIUc2iLfHyXn6OX
	s0BrL+q0N2
X-Google-Smtp-Source: AGHT+IGVx8UosOQz6Ac0ixHvkq+zzXSmwtYWNxDk8B9wfSQGvUcOvUg0cc6ugUVVmIuF1Rv3XBK16Q==
X-Received: by 2002:a05:6000:430b:b0:430:f736:7cc with SMTP id ffacd0b85a97d-4324e3ebf79mr22158847f8f.1.1766668513168;
        Thu, 25 Dec 2025 05:15:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm39962571f8f.5.2025.12.25.05.15.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 05:15:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] smarty: extend CVE_PRODUCT
Date: Thu, 25 Dec 2025 14:15:12 +0100
Message-ID: <20251225131512.2706664-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 13:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122921

Some CVEs assign smarty-php as the vendor to the corresponding CPE.
E.g CVE-2024-35226[1] is tracked with smarty-php:smarty by mitre
(NVD tracks it without CPE).

[1]: https://cveawg.mitre.org/api/cve/CVE-2024-35226

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.7.0.bb b/meta-oe/recipes-support/smarty/smarty_5.7.0.bb
index e7281a30b5..1d21c7eedf 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.7.0.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.7.0.bb
@@ -34,4 +34,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 
 RDEPENDS:${PN} = "php"
 
-CVE_PRODUCT = "smarty:smarty"
+CVE_PRODUCT = "smarty:smarty smarty-php:smarty"

