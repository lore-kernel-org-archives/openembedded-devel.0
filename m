Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82C0EFCE48
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 20:39:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28485.1772656788243194965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Mar 2026 12:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRlacOtD;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso66445895e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 12:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772656787; x=1773261587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=i2XjclAkLuFhsRJZ/8DMy6ThrYZf9dTSKsRjEDPGffc=;
        b=cRlacOtDWbR3G1mu0cptkb6aIGAEUiSDTryD5H2NWeTbohblLt9R4dn2ZLOhugDixk
         MenvtG0KqxHV/GkM/pE+S/hxYpLTu6ha12lGV5VmeAC56Yfd0ante34W8zPQuJ1xIKws
         bxKn07qs1IVR15QXYOPmKMhl1iKuwhfm5eIKAwgmiQ9uQSwExraU0JkaSGQNCQgdXM66
         jN+nJtzAnpwh/+7A2cMUlaNgUH5OzTW1NVFw9expVKsR0yaNTfauT4XWriPoZglOz6OG
         tAoNX1udNegJgPg00kJqCbM2jWjh4Raj95aP0L+m+sW8qHYbZUNUHksgp9WeTz2zu7Jw
         to2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772656787; x=1773261587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2XjclAkLuFhsRJZ/8DMy6ThrYZf9dTSKsRjEDPGffc=;
        b=mnt3Srwbo+iY7Dihi6vQKS/cGZ8owprHm8WhQmSgHFoRKUPp6nKvQQJBg8ey7TGcy5
         ua+3F6DffFOVy1VOStecMI7cZb600C0KzyrGKi8+6O7L8V42yh8h15huJZkaOS/wWoyr
         1KGXC7KGXWmbUF+2D///kHXB0dqfpmoYqqvne1slSh9d6SlT+pK/418KrQmuZKMlHtGq
         5OfQJSps1qDJPrr4nn68tC9cKjuG1GrPVFzXKSeToh76NWvWEot5sSIMFWL72KRs1utI
         iv8/Hfp99YFpz6y/j+Tcp+p1bYjh1lep14TDcJRSBBd933W4FAApBhelEyG8VO/0nFbE
         6IsA==
X-Gm-Message-State: AOJu0YylzSSgyAdIUkMqegYw6dyzALQrDvAmcoAmdove1cZTyp9ona2M
	AZeCftuv1oVNwerlIpTfnhEVBq6FHlAffl5S3ZcNsP2ASk6vGaQFVCoIHbdveA==
X-Gm-Gg: ATEYQzyiu10A4cofHM+57mkRzlhMOoQc5MYBKfeAkJ0Z7+xEFEU4TZK+CnBX/FDyUPo
	dNY/x9EcdhIgaXm6vVWxXRimDngOyb6qwtMUc6OQTUOL0luacjLQs58xvvF2yi5BAQy2OEsPeYs
	BEj5jFqkIC0L2b+fOYcDOGmqgERHVZo3kIjI68QiUBOn1LHU04zrIp4sQb7slzyqBHHGtcCrcAK
	TqmDEZ63nNJcgcMGJ1AfZq33cMgsSVQo3neO1i3LioGYwf1FzBUYUCZNpGpsEaLtSJsRVM6sgcp
	ssaAT7hDKQPGhRJ0JxOyHPK5GGUNbudocWXyD7p4XatcUdtJy3Mvf3J9JfCemyisfgBqqI69zhj
	dyT8sRANIAVGmuvcjIHEsaWjjI2GXyh52l31ufxOeAQdNmT4izMiLLt3Qa3ThV11ZQCr013bdb5
	1OM3xVlsm/Ufv8NHsCL1l5
X-Received: by 2002:a05:600c:6217:b0:480:39ad:3b7c with SMTP id 5b1f17b1804b1-48519888c8bmr61460325e9.16.1772656786300;
        Wed, 04 Mar 2026 12:39:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187c81adsm75882425e9.6.2026.03.04.12.39.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 12:39:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][scarthgap][PATCH 1/2] gimp: ignore CVE-2025-14424
Date: Wed,  4 Mar 2026 21:39:43 +0100
Message-ID: <20260304203944.2551023-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Mar 2026 20:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124857

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14424

The vulnerbaility was introduced in version 3.0.0, with commit[1].
The recipe version isn't vulnerable - ignore this CVE.

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/a0fc5a025ae3579609730ebabc3c84146385da76

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 8aa5ee09cb..dd3a1e3e1b 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -78,3 +78,4 @@ RDEPENDS:${PN} += "mypaint-brushes-1.0"
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
 CVE_STATUS[CVE-2025-48796] = "cpe-incorrect: The current version (2.10.38) is not affected."
 CVE_STATUS[CVE-2025-14423] = "cpe-incorrect: The vulnerability was introduced in v3.0"
+CVE_STATUS[CVE-2025-14424] = "cpe-incorrect: The vulnerability was introduced in v3.0"

