Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C999C021A4
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 19:04:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.29059.1739559876593161579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Feb 2025 11:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j78NfmQC;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43964e79314so18782625e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 11:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739559875; x=1740164675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkRvKolwka5Lc9/Vfaf9ZHwfmkuJsQAgibalheQMyTQ=;
        b=j78NfmQCM4uG5b5NPq4VZ+0BEqHanuZD1mggv5WKQiJ2/mQG0dYaLQn34x+fGQCYma
         FrQz4N4rDeiTnSOfB/3PhnA4IXlFQJfGg3+qkZdv1Tc/qVfZ5zFhrlt55cUWGoQGn4cE
         ogyC6cfTnqIsp4RTtCkL8E/Wb7UTyIf3kVfJkg13ELbRXHrkG0iDhb9y8NtjY681xkUi
         bDGkD4s75vNI8mV9GnvXInxJ/31t4yTd7WmFcza/iCd1L1Ft02Xw5RHCX7vZMLIag1Sa
         41gDWjZgY2glhKaDUAjMZp4sj3qnWpbDC+yzg7uGjYgU0Kj3Z/Q7MSE1y4fr7is+QcJg
         F65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739559875; x=1740164675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RkRvKolwka5Lc9/Vfaf9ZHwfmkuJsQAgibalheQMyTQ=;
        b=r04oH2UBBxOgVR2FRa7+rp6ay8twvcYuvuhSA6qvpk52EXeqYdOzZB3+bMKtPmGgCl
         SE2pW1sdKWwvhqu2lsGqOCT/3aLiUG72b2go+MBcmDJA6qX0aRn8apPrzsAo8rGV9Oj2
         /spIacBmafpng5EEPzvlmGbUgJY1z8q7HNnfX7mzQ9ToUUcfiR7k6AVNChA/hwb/ISyc
         kA8bIp0zj1pAXN20f5YCcXB1bPRVf3RXn5FnSws28J6q1TL2a2vIL9DCWBDLjZgT5hOV
         bKVX3iB+oa9h2vyhVCYWeibjXfepg6ZlW8PuR0ntb7r0IHdXf1wXHAY4s1fRMPAnchho
         FzZQ==
X-Gm-Message-State: AOJu0YzWwdzn7pp1OsvnSsCrEIWCFjz3/YcWT0tqwdpL6L2VTUOipauJ
	KKOJYsV0FqA6eRWI98lrKypIjXGzvTWnO9LB7jNqiBtZRMLsoF46nKXHSg==
X-Gm-Gg: ASbGnctWS4zYi6AwCWdJ9QqVZpUaPBGW3ijrtjdJqsmX8xETDI6n1LlMbeP4sapx0p+
	bQ5ZeMDFxg0unlJGalXnv87lzdFtEZEsvbpGgJ2K71F6uK7fze37ejvwyyU3+8hB7+aC+aSkDSR
	Xa61khn8tt8zctScye3OyuBvsYWH15UJggfCKf3ghcTwbiZUELFMYHBWkFIycqpvvEWHJhfZewa
	bl4Sch+fD/IGw5xTZ93zuKSyyoLcjV3msTpfOBr6NNvU2pwOIfIx6LbJipRdTys1G371JqzcBPG
	GJh/mLYotxIAs9fWbSCN3Uy7za1vuRg=
X-Google-Smtp-Source: AGHT+IHSFw8ZLFEUv6Q7P2N7HvLQwsfTbr20TMcSK7D1i28jn18ET/IuMS51hg8VHKdPdTlkcKmmoA==
X-Received: by 2002:a05:600c:3b25:b0:439:5573:9348 with SMTP id 5b1f17b1804b1-4396e745ac2mr4875725e9.22.1739559874458;
        Fri, 14 Feb 2025 11:04:34 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa7e8sm83350375e9.26.2025.02.14.11.04.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 11:04:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] rygel: drop obsolete PACKAGECONFIG
Date: Fri, 14 Feb 2025 20:04:33 +0100
Message-ID: <20250214190433.388836-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Feb 2025 19:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115491

"lms" plugin has been dropped by the project starting version 0.43.0.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
index 9bede50233..6423d51a31 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.44.1.bb
@@ -35,7 +35,6 @@ PACKAGECONFIG[mpris] = ""
 PACKAGECONFIG[ruih] = ""
 PACKAGECONFIG[media-export] = ""
 PACKAGECONFIG[gst-launch] = ""
-PACKAGECONFIG[lms] = ""
 PACKAGECONFIG[tracker3] = ""
 PACKAGECONFIG[gtk+3] = ",-Dgtk=disabled,gtk+3"
 
@@ -44,7 +43,6 @@ RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'external', ',exte
 RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'mpris', ',mpris', '', d)}"
 RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'ruih', ',ruih', '', d)}"
 RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gst-launch', ',gst-launch', '', d)}"
-RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lms', ',lms', '', d)}"
 RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'media-export', ',media-export', '', d)}"
 RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'tracker3', ',tracker3', '', d)}"
 RYGEL_PLUGINS:append = "${@bb.utils.contains('PACKAGECONFIG', 'playbin', ',playbin', '', d)}"

