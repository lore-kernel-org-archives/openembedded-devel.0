Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E93CA5FA0
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:44 +0000 (UTC)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35370.1790506297163522246
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bjDGBY0h;
 spf=pass (domain: gmail.com, ip: 74.125.228.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c6so1430649b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506296; x=1791111096; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zd7rwhka/C5QB3YsgPvCE6bELUsmpqA38luE7ZgBrdo=;
        b=bjDGBY0hWlISgayqqB37TmsA7cxAxFnl/95zdHXIjIKdqPKCO+5FdDb07KFciYiu0c
         L+oh8Hcy3RcU+VCJmOSaF14YxaCl2w7V1pAFCcAfGuJFmFSG9DLEaWuLajU/k2Z+dlSZ
         n8cZY17gx337NFIZas+Lf6pbh+7spjIg3Xmp5mK96esnMhrrzheQAEvNN1xrAgyx8Rqi
         GxavGO3omk0gyIeL1bT73O2YtCIcKKxqqDDVVGrgGwd6LJXwIeL7rVN4kl5ZZn6dW7mY
         GGXyA398+gyf8XfbAxluil9y4c/IrO7RFzb6xR4CCaSsCVYc91hYGr+EF50RPtLaJjwW
         HBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506296; x=1791111096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zd7rwhka/C5QB3YsgPvCE6bELUsmpqA38luE7ZgBrdo=;
        b=d1V5SqguHRHCkQzUjfuKfeZufAmFST3Sm1ZdzdWuJHA6dULlUJGBlEcbM10bodSHhe
         iTKgvJ5JjT5paW0avyr8Ak9HDYco+ajK7w1w3o7gb4DEp6pyRhE2Ys695sHycnxA9kzN
         CB1sr+ngvQN5dAXikfeMHDlhEfTz/ezw4YizloEnIgsyPvzL5+XsZfxJRvSAepaPDQQx
         uZcKsHdlaTBDW1cjlx7GpRLvDSWfK4rUwIAsYdvfBTzd5kKGxP/6SZqXymykrl1+Tbgm
         tiZORNC4ILrv03MKj2FdEXamqeITqJYT+xwRbMjGW5QBpCc8nyBn/Y1ULFE6TILAExsj
         0mOA==
X-Gm-Message-State: AFuF++kGeiJJ572k1OMuurCyqQO38mJnQ/ym/2qthXGYjv/EuGIxUuxQ
	pgS8bs4i50K5rvPUqIVNdP8oLLfYRXwpa8/uGkrbRbEfQy0kce/AHyXiVgzxXA==
X-Gm-Gg: AYBFou3hzO1kMXYuisv5X+yPfxC0j+vLrO1PvE62nJ0qeYMvrAf1g4/mHyDszr9osoM
	dzhvLyq6alRpEw/ayGUSZ6gUtDO8BKSZlpqDMQXd/WyR/UDgkFXoyxWy+u5eu8uD587C2K84gYe
	A4S96xmbSp2AMkElhVXTDGEbZOlj1crg2UpHFidTjcnPFFyw2/4BSMci/EZ6bCX+sEEEaoSFGzZ
	8G7iIBIfpyM60lLiQaJR8tGAVUIbWTGVShz/R6PPcoA8cGTHf6ibtcN805t2q9cQITSKuAl0bvo
	wenILwM3gL9rUrSe7CjNFCtSYfdBSexVKm6sCTQRXf8w8BF4W/XjnjjbohgFrayaw4HKUkPKCEO
	PzfCI99ngw0/5Jfh/T42ZaNBdA9EewYA3EuqxCXWe+Lpp8RZpgl62YJNwWmtOSFSIPdSDZncd8l
	no8xRihAmdkIC+SvlK0qVLkACYqUMlijSpCaLJ2Q4iYGEFhguYcxgdBTKWP5PjZnGBawKssso8a
	/uQom4BmuofW8EARGZeu/o=
X-Received: by 2002:a05:6a20:3d82:b0:3d7:b90:acba with SMTP id adf61e73a8af0-3de0e703d77mr9633777637.6.1790506296504;
        Sun, 27 Sep 2026 03:51:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:51:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 31/35] librelp: upgrade 1.12.0 -> 1.13
Date: Sun, 27 Sep 2026 23:49:58 +1300
Message-ID: <20260927105002.1832451-31-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130365

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/rsyslog/librelp/blob/v1.13/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../rsyslog/{librelp_1.12.0.bb => librelp_1.13.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/rsyslog/{librelp_1.12.0.bb => librelp_1.13.bb} (97%)

diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
similarity index 97%
rename from meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
rename to meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
index 21ec9f25f7..479905f728 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.13.bb
@@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 
 DEPENDS = "gmp libidn zlib"
 
-SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
+SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=main;tag=v${PV} \
            file://run-ptest \
 "
 
-SRCREV = "dab30db5108ef4bb5b6f9135e0428b57be7c4085"
+SRCREV = "bedc657e519568b25f611c8efc83eab6ac1068e9"
 
 CVE_PRODUCT = "rsyslog:librelp"
 

