Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1E6C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.23280.1668873505578880690
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A6pXV1Cp;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: akuster808@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id l15so4960886qtv.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oz8V/3RtGKQJS/DCGVTuCXkhgFUOCaCdgLY3o75/T3A=;
        b=A6pXV1CpVycX1O/6QV55lUGCG2NZcjYDeCZYGG/R21rgUUFWXitBuw0SmzZT98X9et
         b6iGg3Jm0X6rsj4kQb7FpjQO7YSiFhMTra737oFjiDMYulUApRXuTN5eQfmiji2EvG0W
         Uf75tnCNMHHwnYlqdNC1re6D4cn23sK/7mgxEDXYSOYVgfxfLwZ8xb/vYRddbtu/7SHV
         WesQ4uAZNQMMyF+Z+4kqw2I4tmoWIK1Z4ua8y1aEvTgY0u1Mqhjmat9WHg7NpVpX86FJ
         SZwnkZe4OTks8+Y0dMa54TGHkuNio91y1IL2YadTv/jzNK85u9nFttDPjv+1o5lkTIU6
         7StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oz8V/3RtGKQJS/DCGVTuCXkhgFUOCaCdgLY3o75/T3A=;
        b=o6LfX/8cGj56FVDBB02snGwengclKLgLJOD5ep6gDzL8SRos6aroWykptXEFaWSTNe
         hIZ9sDu4B9YOAoHA2qcQsS4g+xc2ZXMUZXAycU1lbN+R9bFi/MxSsQtgrAGAW19s5Bed
         p+wBqqOvmESRmleKhcyukP1tctA6w8NDY3AOEGxrByGAiQkQpIpjZzPIf3DGU+Svqq37
         Zv8682YQix4KqW2zZ9P90gXri/tIZUeo6iDNeE1vqKlDZPLd4PWC5zTn9tu3AVNSq7s8
         KVY5jB5jHHPPCOIbWylAD8zEOjRh/tC3UfpLguS0QeFg1w9N9DDtn+8x/mX/65X77A7a
         INFQ==
X-Gm-Message-State: ANoB5pl9xZUjORtu3WIjX8UQHhoOyf/G7u2k4BNqDBIsRufDr7o66UWD
	qCnp7zurZtHOApykArFae79P3barSJCqEw==
X-Google-Smtp-Source: AA0mqf4Wu4hxrUCMaADUjCSuUWCC1Ab2DBjhsCZ7l2FfTJHHWrUKuY5w68oxAR/sIrzQEDcnYa6IEw==
X-Received: by 2002:ac8:7cb0:0:b0:399:9967:435a with SMTP id z16-20020ac87cb0000000b003999967435amr11267679qtv.98.1668873504268;
        Sat, 19 Nov 2022 07:58:24 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 15/35] python3-huey: upgrade 2.4.3 -> 2.4.4
Date: Sat, 19 Nov 2022 10:57:39 -0500
Message-Id: <4b006e829005f0023a4159c77959c5e6dc0c06d2.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99654

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Add is_locked(lock_name) to test whether lock is held.
 Allow raising CancelExecution within a Task, and override retries.
 Add a very basic redis-backed lock that can be acquired more than once (to provide a rudimentary semaphore).
 Add a periodic_task() wrapper for MiniHuey class.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7c7c60edde10932912d4e729c4bc827cb80413c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python3-huey_2.4.3.bb => python3-huey_2.4.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.4.3.bb => python3-huey_2.4.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.4.3.bb b/meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
index f8f4062a64..2f433814ee 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "4fa2f6055d581778c3bcf93fc8c9ce87aecc2a345d5ff35bd955da152c02ef37"
+SRC_URI[sha256sum] = "6a27a7862a7a982c0508ad4e548d95765e3b0d97093a51106f07540837a09c86"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.25.1


