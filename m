Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF766CCD192
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 14:10:33 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.17686.1760537426121228514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Oct 2025 07:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WOhv5at9;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso48790895e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537424; x=1761142224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Fr0iUmgqaOvcUG8b1DIQhHyIeH1CpIBxcl+YTJ6Rwg=;
        b=WOhv5at9RhQqYJDDtiOFqakT1jpQ/pQ5vK/A/zUrEe3ZdY++Er4D468G4A5jHQfIi1
         3pro90Vrc0vL71bK7sF8hXYmp0nnYMEbq636bqvdWj3xvnboXGD2UXWv/iOJ6dT0Dfy2
         hnERl9liRjszf9nqjy2rc0nP9Q4Q0yDRIsXQIX1dG4LjPU0evaH0lnoGJvaFBGHkXreW
         atkXDPiVShY6C3Rrnwp0XxVUBM7vYxNLu9ZEY/oX7jLmxfpRGgGwrXJTOZdb9M1kBe/3
         JnY7aat/wPjEecPw3Nm7ooERQMOk/Z59ESV1QFCZzOp8G25PpafFgqs6ob638ZgRsP9P
         5wQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537424; x=1761142224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Fr0iUmgqaOvcUG8b1DIQhHyIeH1CpIBxcl+YTJ6Rwg=;
        b=Uz2mAahtyHqRy+j0mDgVbqHcbYkw+z1nuPa9GcQ9RvKQwEC4woIk7BShzvGTp12IFf
         yy0pXtAerdKlkzc29C2LWbKGoQKKeSCpod6D+wLBLyvPM2h72qa98W6BU4udYdy26pwU
         uNgbEsHVtAL+PGrNyvGnscrYAuhMnjk2UwytSmAypUW3AsB0HKKpjXtD+w5H7x3vMv6v
         5bdEbogKQobHp6Jpf5Yh/PaDC9Vv/7s/KcJIEL292HRfjwWS2RShbUd/26HDL6QtZGmR
         DJXJfgDesWt+bhZaZAaHCy6/JDPsctH6vnk+qPQtcu4iDvv+tQvxEsVMzGn/JuiRLFLK
         epUw==
X-Gm-Message-State: AOJu0Yyk+Mzis9ZCkOQrgQOA0Wo5sqVCuZl4Sli0B+wpxAAIYM+Wnk6r
	EScaPAKvn4/DihV3mnSMZ+OAekN2s6S+lpkgR2a+8ecQqjN1ltV0FynAs9xPBA==
X-Gm-Gg: ASbGnctegazdHJtfDfTMtHyJdFK9xI2qd6339h2JsoKMFzn4QZZnhf8vwb/txybAP2B
	8dZ/ryavm40qL4zeF5nUQaW+bkTJYqNqOArWdXxMiJFHO6uXEbh+DXc2E2XCm+7sCFRWCcCkdfO
	eMdb8H9OGh0PxNp9X4+ID502l+d2/Wjg3J5M+z22SljQc/yunDe9C0mS5synHovj4ocPrD/PP8G
	4WWdPjA1CGjDYWwWx6XzqCJEAO7X6yoRU7sF1kqPBv1kK7qSEwexeq5nNGwxsappnJvfcAqC/9q
	dxxke6zFgq03wXb/2t65aySeQWGVEDoGKWpV7+an/EYY9rIX0/uckpE/K/WM268K1sgUTPa0XGz
	3u8ui/njW4esXjfKwiRpijiFXWlWKbYqyTd8Zd9aiBDfEvD4SXQ==
X-Google-Smtp-Source: AGHT+IEqmhPCwzlH25eYvfirHQYH46j5Gyh5kHBfdfWoxsZfgpTNRoOnASIicAMsO28He4OjerHuJg==
X-Received: by 2002:a05:600c:628d:b0:46e:396b:f5ae with SMTP id 5b1f17b1804b1-46fa9aa471cmr207282645e9.16.1760537421467;
        Wed, 15 Oct 2025 07:10:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47101c0371csm30212545e9.7.2025.10.15.07.10.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:10:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] zabbix: upgrade 7.0.9 -> 7.0.19
Date: Wed, 15 Oct 2025 16:10:19 +0200
Message-ID: <20251015141019.1396233-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 14:10:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120711

Release notes:
7.0.19: https://www.zabbix.com/rn/rn7.0.19
7.0.18: https://www.zabbix.com/rn/rn7.0.18
7.0.17: https://www.zabbix.com/rn/rn7.0.17
7.0.16: https://www.zabbix.com/rn/rn7.0.16
7.0.15: https://www.zabbix.com/rn/rn7.0.15
7.0.14: https://www.zabbix.com/rn/rn7.0.14
7.0.13: https://www.zabbix.com/rn/rn7.0.13
7.0.12: https://www.zabbix.com/rn/rn7.0.12
7.0.11: https://www.zabbix.com/rn/rn7.0.11
7.0.10: https://www.zabbix.com/rn/rn7.0.10

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../zabbix/{zabbix_7.0.9.bb => zabbix_7.0.19.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_7.0.9.bb => zabbix_7.0.19.bb} (96%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
similarity index 96%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
index a7c5478b64..28e4cc4eb0 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.19.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "8d7755576f30b5d6099ff5e3574549fc248229c017f9753828565174125069f6"
+SRC_URI[sha256sum] = "30bef0173493b199377c9061b34e8a2e16a28eb0d6f7e9c7b942433e4b75367f"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 

