Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91D1FCCD184
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 09:13:52 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.14385.1759828427029644607
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 02:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FIlBD8aA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b40f11a1027so1071031166b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759828425; x=1760433225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj1YA0mC/XVsSPFl9BbbxqFYTcb3aWrDpU8a8AKvcjk=;
        b=FIlBD8aAASx5yPR4/S7UuWw8/L7V2soRXUkWpsH4DXERBkgcwAALVE1tJfTI6zewId
         cPNW8bcJlBgpPWeN5H2+3y1cmAw2nD16ZHQV9mBQOacNdysTkTnxiY0hK9mGHC4HwR9Q
         Ze/W0qhsxlWzKki1j3CQGen+Oerq4Z077/WeEmCBCG4QvA1i7I95/T3oXNsNqpNkJMlD
         OAVLHVWb/5/IJndyXodZtmyyQmYYN6oJYli9BrECZIEQdyf9WwmY8p7f+xf3hSFN8Pui
         JoCvZrDYKyWv2Ha5PthL+k3pwTP0h2qsp7RYu/HQUdP/SjVJlSxG3PgE1N/0RRqzLwz/
         J9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759828425; x=1760433225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gj1YA0mC/XVsSPFl9BbbxqFYTcb3aWrDpU8a8AKvcjk=;
        b=WEH2uk2VkpuN7yWviUkHMLCV0bVNf112obFJL0BetVQeyyOr2yZvk+EuRWEbldOj2B
         x47IG5AM4GRv/NWVcwm7R46Mpvj/2Wa06klDRLCvaFIpw+55EDxf7t/4a+H+0KubZnNH
         0ee6v5RbpH8IAT2EkSl7TWhZ7234fMVGYis733pFb9QhcuS8SpFzU7AFXpYU7z5fQsXa
         Jm6Qe+lfVnIz6D6vxeWrKhYCjqX9b5YOKk2EB6ZvBPl/BBNXuIRjXijwf4rZZtK6YI0n
         PuEGSKLur35V/IGxCiTvcA+kKjQgDzSFdfg7jW+GGqWyuuJgUhu9uHnbWt1KUtL2Pl66
         /+vg==
X-Gm-Message-State: AOJu0YzVV19/k98AxMc+Dwf60PBPen093UiZpcVi0+ndzuQlTKcrWNRR
	sCApDhvtYu91RsTYA3KZ0zpBx2nY21qBH8nTxQInJ/XAFWnG9QLhVGhVAHgVaQ==
X-Gm-Gg: ASbGncsfGAY0WMGN6+7fjHgVUSGEmgM+KLmg+QwO6saBPWde9vfmjLmORhKzpCrNGCj
	HPNx/SIbm6s1GCzCQRF6nncz+HfnvMuXrzGkqESo7ssIiBunoigRInqq7grmRW1ca++pl2WCrO4
	C86R/QB5aZdDZrdLuA02yx84WlkqUCU83rUUfhmW66UJ1TOyO/23jFOFIdGvTIjK0KubPSW5yUQ
	4HaJpSZ4Xs4NWPDfYxblBuamVUDhkRgQhEEjXbizXslNouoXoQV7DLTMmIsKGIlIiD43WklnnKI
	WR3JszDoAAMoPhpkE8AmlqFJgWDopdfC8bGabt18bIZVr2ppAO7AnWZ8nFzokXFNlnS5nBKnPu5
	fKKy/jkq3myru6q1sVfp4izj5YcrqCyIvKDeEAVAKQ68v
X-Google-Smtp-Source: AGHT+IFC3DAUZIZz/k5cit0iXxVEjbQVAWXtmrN3NjguF3Nc4UMqVvK658GUE7cSJsG/SH2I8Lkm3g==
X-Received: by 2002:a17:907:6d0b:b0:b3e:f987:d6a8 with SMTP id a640c23a62f3a-b49c3e6e297mr1906253066b.44.1759828425240;
        Tue, 07 Oct 2025 02:13:45 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5007639379sm56405466b.48.2025.10.07.02.13.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 02:13:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] redis: ignore CVE-2025-27151
Date: Tue,  7 Oct 2025 11:13:44 +0200
Message-ID: <20251007091344.3951668-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 09:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120326

The fix has been backported by upstream, and it is included in the used
version: https://github.com/redis/redis/commit/d0eeee6e31f0fefb510007a8cfdf5dce729a8be9

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.11.bb b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
index a57ee2d05c..83cb4531d2 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.11.bb
@@ -22,6 +22,7 @@ SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e63
 RPROVIDES:${PN} = "virtual-redis"
 
 CVE_STATUS[CVE-2025-21605] = "cpe-incorrect: the used version already contains the fix"
+CVE_STATUS[CVE-2025-27151] = "cpe-incorrect: the used version already contains the fix"
 
 inherit pkgconfig update-rc.d systemd useradd
 

