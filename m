Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B40CD484C
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 05:07:09 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.735.1778648712226934108
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 22:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f5APp1sE;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36900945df5so62311a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 22:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778648711; x=1779253511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSm1YmoHNRD9ju//CUZf5Xrvbt6eYvZxeEW+zs7Zh2U=;
        b=f5APp1sEI+/YjlhqLZEXo+zeq5P1IyUkjFqjJbRz9yG6ZjlhGyH+zSNazt6MvyEdMv
         /bHCvXzIRp1vSJPVJqFc1fSbctEf43wlRQLb3j0MTDEMGeu6ry9w/9+PxK+n1XCiQ8g/
         u0M1yU2vrSMMADSiKz99itPiC65R82QDRVFy8m5z4dOo3b6/NknMCccUNkZu2FSdxGBk
         cI7HgbP4bwTjOTP31Y8PywVmscLWfTgT+xQvFSuTr5ftuDxC/tuHg0qGkhwo7+rddFkg
         aobWScDJs9X1okwOLCx4td7KvCgZXgntyT2jml67ttz/Prg+xQeWUOAW6LLl/idpRX1l
         8e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648711; x=1779253511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSm1YmoHNRD9ju//CUZf5Xrvbt6eYvZxeEW+zs7Zh2U=;
        b=apY9oIz8HXP16FPTcm3DkV8AT0WTeCPsW/2+Zf1BK0t81HZWvyB+GJeh75600G/Ci/
         NC1zm7jyHUW/Z0o4gytHjon9ivwXqTt5wNjFBee7DjDYccl17b/b4V04/Tbhfp+lUvX6
         hdwfN5pRmHZFZtuGYvZl2xs3ujlIfN7O/YRtluJOGxrm2Vlifkne2U3m4/vsu7xNkQ1A
         H8TQOOYcehuhtjtzkFjCKipPdsojd8XLRXVI9B8z+0l/FwTHruaundNI+pJEU/UgjZLE
         GdHJku/b70HL5IHTtoHdbDrsecogCVeidGF37FxTX0RW1ON5YrFB/tU8l8vpnV9sA4so
         ADOg==
X-Gm-Message-State: AOJu0Yw35mHOIt4RxzhXEfnljvva17tZFLk9TsxhgD/UJlHITbCVFjPH
	6UYEJwzAkWoG+xZcdpzoknOnmoXWxA9tRn8Xi+qQC32Ju3xEta2bZr+Yh/OCsiKT
X-Gm-Gg: Acq92OF0G2ZL5B9U11qeqYIhCRP9McX6wdywlb4npmOrte06f1q20UZ+siOSkk828I1
	1RfCaA03xW6Q4L7V/gJ0HrWHLKTqHvvCkDV0aDaX97HUTrKThgmq87dQJXmtSCPyY0qYV9yY9CB
	gmovqsupHZGPohw0kbqxTG5BgEyWx/VGOoJ0lYGOO9fT8FVjczQmtcysyI+borM9u3yizhFCaXa
	erFMg0mnsiEZf11h/meIAi+WqeEBToFKqUQN4+waDVAzxKSAsI2lQAycRj8xhEx3KBm52xN2ZTm
	oXZ60Sxjbkd9IR/4gwj8Mhn7BFvx/qSvcTvjIUMmFFVShdqKgYGXQmMgt9RbJMM4Bhf9pAuFJYd
	sZBu8lJ1dMngZrywEnIw3zuoTIMsp4TUp7fagqLohcSlrWqUFprjiWwT0L5x3WfzKG26LWjLWw2
	+bsAlb60q1PfpZA6fLn77goVDurdfqoJu2CsSxIbaZ46c4/4E=
X-Received: by 2002:a17:90b:3a44:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-368f79beb13mr1428618a91.21.1778648711395;
        Tue, 12 May 2026 22:05:11 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf5c58sm1696900a91.1.2026.05.12.22.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:05:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 7/8] postfix: upgrade 3.8.12 -> 3.8.16
Date: Wed, 13 May 2026 17:04:48 +1200
Message-ID: <20260513050450.3515182-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
References: <20260513050450.3515182-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 05:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126950

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

3.8.13
http://www.postfix.org/announcements/postfix-3.10.6.html

3.8.14
http://www.postfix.org/announcements/postfix-3.10.7.html

3.8.15
http://www.postfix.org/announcements/postfix-3.10.8.html

3.8.16
http://www.postfix.org/announcements/postfix-3.11.2.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../postfix/{postfix_3.8.12.bb => postfix_3.8.16.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.12.bb => postfix_3.8.16.bb} (99%)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.8.12.bb b/meta-networking/recipes-daemons/postfix/postfix_3.8.16.bb
similarity index 99%
rename from meta-networking/recipes-daemons/postfix/postfix_3.8.12.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.8.16.bb
index d3c91782e7..1c31130c04 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.8.12.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.8.16.bb
@@ -28,7 +28,7 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
            "
 
-SRC_URI[sha256sum] = "0fdabc9f272ee6c85781750dbd2642920701795f948f2fd3abe7b46a1f5160a9"
+SRC_URI[sha256sum] = "54244c05f71cfa22adc70506b8ef7e17cb55e18ac2595332ec629d8ea0f0e5f4"
 
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.8(\.\d+)+).tar.gz"
 

