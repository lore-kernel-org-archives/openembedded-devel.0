Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66591F33A7B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:52:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45916.1772722308857936712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Mar 2026 06:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OtRznEOL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c944bb62so1543445f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 06:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772722307; x=1773327107; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=poVnRGeZqO14j5sGVv3oU+Y4QzUpSs8TRHPBPh2FvXs=;
        b=OtRznEOLWWnDpsucfRr62AJQoqRJ6WCgCgtCGMQtzVBgprmM+tDVcFLI9m/5Zf5gB1
         lPLQh/za1TWnSHruHddiPN1IK9lVWp+AJzXEWiFQg7h3JMTHItbL4dtUoeRBNrrwTM5D
         0zBqeC+w5+D0rupefsGgTLSbL4u4bJi5ulzRvDDBPSjdNyfeeUIVrBMFo/V/Kf4VDqpD
         UpqGYuXuI4KfOTdU/mtjMyikC0yEgo/v+F7OJDlfHxJl9pKqwCjfX65LGB1gDBvHwBlj
         OMjjZHaPGT9qVRBXygFrgE6KEZlcbcx/RcIGaO3llR/CGFQqgvMH4vFxRoZR5VGL6tVW
         5tBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772722307; x=1773327107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poVnRGeZqO14j5sGVv3oU+Y4QzUpSs8TRHPBPh2FvXs=;
        b=Nc86wZFWaw5Tiz4DnhKr9cYl7ZoCsgpaKzfDD288k0cSOHnH2N52+bROEfp4euzmrK
         ErA6ozeUQhxGfS+yGEsr4OzV8xmdbJC6IUhF7OC24ZO58jlnP3ol6Dp61uhbPhEpcaKl
         4wgniSZX8YhNtphojDwjwJn9bzPlSbKfyDGLbSYgnZpR0FKslgk58I04FKYv6mpZs88Z
         QOdLD15qUNqeJg6ZpqFlWu8m0dVNgdCjwSyepm1bzf0qrC1msqrAUQHuAUlz6/J6ZIZ8
         XExmZ7mMhP3/p996msTZ1iSprXLhf4zZG26O/6ADc9OnHiI8z0ol4orIXAVWB3M/90Kg
         Jtog==
X-Gm-Message-State: AOJu0YzKrb+Fqbe6n22S+uaxwLAOs4ufmLgYA+BznXxYr2oTcUxedy0d
	DF0Z5roG54Fm3zkzC7R8MYDkA/0iX0Ubs+C6jSMD6yiC2n0FGaW/HSFCDhX1dg==
X-Gm-Gg: ATEYQzwcL8GDAeQBoWibWyFRPjzpZEJ4ZrtVURFHAdspGDYCDUhCGD+oFwPDpYZX8Us
	mAIIu7hhyVR85Oa6PpbWdvI/AlnUsszqdX5x4Cudw5HLmfs6TySHsKnm3tDiGULsXycihId7Bay
	rZrrkjbOarlo70VUzM/bsjnQ81tVQs9OrfpVHbtwoYs9e3eBH2p5LvRmn9x+jVIvF5SRzIzOQwG
	q6FTgl6J3mQd1mgAIA78ExWjehRfKN1/k6ugXcbcymo2zMf5JvO3gRwo/emko/lkhaeisrA0J+K
	Tnk8ttSP9cAsw3CvKl8U8rcDBIQv+G8tLsgWp4Qy9tA2LA3Z8kbv+42gw0rES7oWp5cPPN5pHx5
	IeRzpu3RB+OFIU3pjUxX/g9z89R4DEdTsJT1vVFA2TqwvugXzjYNsaa1H/B7yoiCZCDti9zzptx
	R9Te9B62JP0OniB7fbXGGisJ3LcKxqjnc=
X-Received: by 2002:a05:6000:310e:b0:439:c5a5:c1fb with SMTP id ffacd0b85a97d-439d72053camr147968f8f.4.1772722307109;
        Thu, 05 Mar 2026 06:51:47 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm49302136f8f.24.2026.03.05.06.51.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 06:51:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/4] protobuf: ignore CVE-2026-0994
Date: Thu,  5 Mar 2026 15:51:43 +0100
Message-ID: <20260305145146.3068524-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Mar 2026 14:52:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124878

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-0994

The vulnerability impacts only the python bindings of protobuf, which
is in a separate recipe (python3-protobuf, where it is patched).

Ignore this CVE in this recipe due to this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 398fa05aa8bf7ce17dc40ed99edfc6a88feeb541)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
index e54dffd2cd..00c2360793 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.8.bb
@@ -23,6 +23,8 @@ S = "${WORKDIR}/git"
 
 CVE_STATUS[CVE-2024-7254] = "fixed-version: The vulnerability has been addressed and the fix is included in version v4.25.8"
 
+CVE_STATUS[CVE-2026-0994] = "cpe-incorrect: the vulnerability affects only python3-protobuf recipe"
+
 inherit cmake pkgconfig ptest
 
 PACKAGECONFIG ??= ""

