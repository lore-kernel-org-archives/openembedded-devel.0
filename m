Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F6AFC72B5
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 10:14:11 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28155.1774174447621722141
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 03:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQEvzn4p;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ad9f316d68so16320455ad.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 03:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774174447; x=1774779247; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyZEppuSxuKbgqbU5imBlFxfEzz/EzP9Ndm1QDAGcQk=;
        b=KQEvzn4p+UXa96RtPVPN6JKtLe/VviWnii7XlxoWD9Ql5QuaCzdOLVSy0RKGcE6Vy6
         ktnhm7L7xFqnoIeak6CaURaTatFW4VVPjp0i9wmkfD5ax29a+ESuoXtX41FEWvzLZd5e
         p/aPgQLNYc+YdBBQxiL0vmoGTN5/vBs12sswNxjo1j5IrF8jYdSrFc6JKoi41xM7bdsB
         76ih7oHQsHBqRoW6F+V4N9RC7EMnCXWYYV5Ps+uWTTZuk1lYNssO6bu6FcAVrQh0XIYt
         h3PVLKgIgDM9vmZi+CQ6knCj+6L9wVdAgDi0beleAPJZL2eE9Jc3WPLF9IMQZGdV77QR
         p48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774174447; x=1774779247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kyZEppuSxuKbgqbU5imBlFxfEzz/EzP9Ndm1QDAGcQk=;
        b=LiF20zqF7uNJhvuQvIDyFUgML9E5LWIreD1o9Tj555pgLXs2rY2avXgzINh2jcj4M9
         bVgRbJao9lXkJLioHmpMRxBtrc3PSxeDW8ILktMpR5Yj05urDMPjUgd75de4Drs/Q43q
         1jtttBnvoUalEAFBmZNUUjtowUDTct8cyN3gRLBxTRCIWcFFM0/F3CEqrLYi6Cz+t6u6
         eWnME3+ZQnBnLlUr8WJu2RPEYVIXhnu4OlSQV7Ez4bevOGWA3XC8svi2qJlg7lByQ3Ss
         7XGa7p6TAFrxsVUq87GBg4FnW2sK4Ua19m60dMa/w1SEj8mGICuLyBF3dnZgVB8bUEf2
         5ksQ==
X-Gm-Message-State: AOJu0Yxs6qp+UH+19E/MphZGlg9OKIacufsZueQ6mpRtJptnitEOf57W
	+kCQ1v9ch7fkfvhOj17iMWDfYnjAS78R/h13leAxndn8M0YSKbxy5P9WQXJgJ2Jh
X-Gm-Gg: ATEYQzz1OZhZdv+mHJVm24imlufvFLGszjU7Ikd5OiG+VVFZ9GN5Tio7L5B+WemvmYW
	ATQphcm6iamnuUKXeit4LaDAukqZNd+ZR5n4nZGr0eGNUGyp5yS7mxVJFOXP1EBJCymnyu3LtKE
	hH9jP4zox0rl0yeGMG8iHlNqWNno1QyV60hPfDbrCpsZVGNXAnoUARbuvi7eHAouLs4uuxdz5VH
	4vjzloVJYsifQHurIG04WTBujaxOjzcC+4Seuue44W4/sVJrTR0roHnIwuTEULQzKZm8nrjqd+v
	82a1Xwt8Qic44parvXs8IpN8rmc22t0KYF9f5MxqdZMdmyLQ8fdx5953OBlGrYZBvwVLwkOBwGp
	WyAxHXuU1epDwnQnyBcWLh19fLhtehJwYd5avYb9BWkFZ30jYrAbeJOuHB7OZsC+UD4D6HEIdN/
	8u1Ql+lX5j18ldkh541T4QCcRPf0FwRE1IuO8=
X-Received: by 2002:a17:903:32c3:b0:2ae:57e6:616c with SMTP id d9443c01a7336-2b0826c3a6emr81408385ad.3.1774174446570;
        Sun, 22 Mar 2026 03:14:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm73775575ad.75.2026.03.22.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 03:14:06 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/4] jasper: upgrade 4.2.8 -> 4.2.9
Date: Sun, 22 Mar 2026 23:13:47 +1300
Message-ID: <20260322101350.439083-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 10:14:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125473

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Fixed a bug in the JP2 encoder that caused incorrect handling of
  opacity components in some cases.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 330ecdd2ad03225db3cd0933f1083abed8598a98)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb} (92%)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
similarity index 92%
rename from meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
rename to meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
index e00b56ddbf..b48fff7081 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.8.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae"
+SRC_URI[sha256sum] = "f71cf643937a5fcaedcfeb30a22ba406912948ad4413148214df280afc425454"
 
 UPSTREAM_CHECK_URI = "https://github.com/jasper-software/jasper/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/version-(?P<pver>\d+(\.\d+)+)"

