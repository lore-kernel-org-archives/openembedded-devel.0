Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C23C5DF8E
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 04:36:09 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.672.1787286969208141449
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 21:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=X1hvqycT;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9aea40d799so406483a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 21:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787286968; x=1787891768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EQC0DQYU95FK47HR39OY3W5yg2ranCsfjqvB2BYsNcw=;
        b=X1hvqycTk7zVy/Wm2p3IF7Qy5FylQMrfyY5i79zfB4QxyvVricc9erXcXL8GjRBKxF
         m3D6jUh4KAwFgiG6WytW5VoEeDp4mlAyAWvNSXfoZZReFSVsltrYh6cXPcClqTxWAyxl
         C8DK1NLFjndABuH5yUBNRNmTqtFQ3/ecqsXEI+tMoa5RC6FvJJLUE+L80MUuQesRHdHP
         RxXqYKWD8+k4gT3P81KZdjHSC6ob0DFtRUrdC9/z9+W+PmgwuhOyeaVDWrvoJqc8mUof
         8olmj7pSJNfb8J6mkx01brLOy61ue0R6eEHOaHOHLupBm01TtNXAVNUUJnqg0xhJ2u1X
         8E8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787286968; x=1787891768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EQC0DQYU95FK47HR39OY3W5yg2ranCsfjqvB2BYsNcw=;
        b=C8iTW4dnoht5CG8h0tiEmAgV5fngxj55Bw/MH9Czyk87z7GZyHk4C5r8J1YoxAqNL/
         KLKbxq1ms5LcaS/VcKTYXS1p/D2f+lKypcXbl9QxX1FHft7jWoBdF0ANyJm4Ivk0UUch
         RWv8zXfGXX6UMQUAGaUGL/B8otokYDTtDyGzz4RvVxYmYSIDR9Nr6HsL4xNAwGmwsbsb
         okf7a+Coe/kYLIaEWUEpnA7PzEMgRB7d0HVy7YRUTqkErK7gUU5mSRrMjW81ZBaRHbFE
         QoLXULZMoUkDMMmGWq3ewphvEg4D5liPL+Eflg5q1ZKM6Gp3qnUh093+IcILi6BAMFtD
         /jzw==
X-Gm-Message-State: AOJu0YyR/xFxp/P5l6Qe5Dwj2ARQ09ZN8i11owdoJ1WAWAW7h3YwpnGh
	QXt8Olvoj4RfZVQS5uhin4ffWhh4JSg/nvI24Z+hROlaYoADrjBX70a3BO39Sg==
X-Gm-Gg: AR+sD121uJ+ex2Vz3MJPFa9C8GLcJVYW6RpwsYX6jmpkAdAbQmz27I44FewpqR3O545
	i84nmOS3bC9PZ5pVC/rfiz80v/N1HR3RBiWPi5M3D4+4HIHYxin3G7I8EUIVWTzKUItWyjgXdIF
	dOoGNq+yjBoW/fVv76cMsMGY7ax/0drhyLOzJmRf5s+dLB4+aIwsV9VDm4QAC/+7eDlDAW2Ffs4
	Zl8fK1xkLpR13ITk8RNWOy/hR/CFUiWnzA1Y4XeAXfAhqatnlKmS89yqW51GVJhWXM5WmhMzkJ9
	KvWErBeA43r7sP+bhKd5BngJ/Ss2YMUXPDVc1BegZEqaf9zYuB17xY5Ujz+wmWmuCbwmu8MUpne
	qsEtcY3UQV8Tb/hsXnfIe3PDHy5LsZLcELYk4+1fOY2WQZaQNN+YB2f/GzJsZLSVSPr+UU3IpE9
	5aqhPF8SRkxpCkhMZa7xcAdA6gI1VTiC98EIoFw2/Qgqpdox88ixtBDOsHY4Tos2UTxHVAsSHUJ
	rXA8U7H
X-Received: by 2002:a05:6a20:244b:b0:3cb:8280:71f8 with SMTP id adf61e73a8af0-3cd301e87f3mr6233573637.18.1787286968282;
        Thu, 20 Aug 2026 21:36:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([161.29.95.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef6ec40sm23626097eec.7.2026.08.20.21.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:36:07 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 14/15] cmocka: update SRC_URI and add UPSTREAM_CHECK_TAGREGEX
Date: Fri, 21 Aug 2026 16:35:23 +1200
Message-ID: <20260821043525.448011-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
References: <20260821043525.448011-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 04:36:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129409

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version cmocka
...
fatal: https://git.cryptomilk.org/projects/cmocka.git/info/refs not valid: could not determine hash algorithm; is this a git repository?

INFO: Current version: 2.0.2
INFO: Latest version:

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb b/meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb
index 11e8db87d8..26f872a701 100644
--- a/meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb
+++ b/meta-oe/recipes-test/cmocka/cmocka_2.0.2.bb
@@ -7,10 +7,11 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRCREV = "fefa2b8a023121f7235e18ed17249e4012dd144f"
-SRC_URI = "git://git.cryptomilk.org/projects/cmocka.git;protocol=https;branch=stable-2.0;tag=cmocka-${PV} \
+SRC_URI = "git://gitlab.com/cmocka/cmocka.git;protocol=https;branch=stable-2.0;tag=cmocka-${PV} \
            file://run-ptest \
           "
 
+UPSTREAM_CHECK_TAGREGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)"
 
 inherit cmake ptest
 

