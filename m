Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097F2C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:11 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.25690.1651346342183611970
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QpzjT0yj;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id x52so7906582pfu.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=q1CMzz4tWxd3+CvG/BQPD/0B9JbMoFfh+5crc7UWM1A=;
        b=QpzjT0yj1A4kkVnSbpOujYvfsF6puFvk3iuuPn3xiCotSCa8x2nUHAIwtF1fCK2gbW
         rflOEHjJCHDwNKAeRdJt9WcJv84sWZL5glxvIBIGs8Tn4GRupXyxiSFVDTpxLyd59zJN
         +6DBgcwrryC4aVwL4Cmu19SP1Daeen3nr1d2GxNmNd2pcq4FNpLTQ+peo/tJddZCHty2
         izHomzDsL4pZ0nDqWyjVoPyEq/ETTJ3CoF9SJ2paXv89yFdl3TYGG6SZ9GGI+OBf81NF
         DUV6jXW+oVxEYd2igt/zN98gx06rmOCIAlRLv0W/TVvN+ScrmDfFOH5sRYaD+0YEBc6s
         zJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1CMzz4tWxd3+CvG/BQPD/0B9JbMoFfh+5crc7UWM1A=;
        b=1GJc2jbpsR+i6QvkBlTuUmOTOR9gLY9tHsgmpfcTiOzV+/5DblgPOlvD2rZO2s+0tW
         QshLv1XsWfSbQwfQLP1JYdOJmBCGg4XwjDUrFrqIRR7YPajrOA74q1RbMzQz34BnX3hX
         jvaL7EnOIMeciAtunA/ns+vHLKz/VNS5lFXLHmeelA8LAw+E2s1hiInE1w6dzCh+0D++
         dr55qykBTzqmEtP/JuAjTX9LAjpX9hOhtw6m3+L/6JFCHSCbVsbnT3wDyHK+BN2aNngK
         wSpxiukO2WFcDBGGJQ92c6ZAN0vaFuMXh/aN37i4BBlNJMYQztMIjsD3Et73lxcaQinE
         uEpA==
X-Gm-Message-State: AOAM530KL7kPqcfxoCWFSmqO12r0J9f1jixWM+2Ghxgc6/0vFsIyCxMi
	Lz/j7wOvKB4oOjBKL2W49RnqCLkDgnJJUA==
X-Google-Smtp-Source: 
 ABdhPJzMqEszj8QFAZWiMXLNVr5iSYOMYfnK4OcHxxosDRHSfyhvePeJCl4wtiOobUoz3eUcTSEI8w==
X-Received: by 2002:a63:2263:0:b0:399:561e:810b with SMTP id
 t35-20020a632263000000b00399561e810bmr3929427pgm.615.1651346341392;
        Sat, 30 Apr 2022 12:19:01 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 23/39] hexedit: upgrade 1.5 -> 1.6
Date: Sat, 30 Apr 2022 12:18:03 -0700
Message-Id: 
 <c93f488038f3f159d74e3a8081d2dfddf089e3c7.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96890

From: wangmy <wangmy@fujitsu.com>

april 2022
    - 1.6
    - configure script must error-out when (n)curses isn't found
    - Move SIGWINCH handling from handler to NCURSES
    - Make configure.ac compliant with autoconf >= 2.70
    - Check that malloc did not return NULL
    - Fix a possible memory leak in findFile()
    - Prevent division by zero on empty files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c4d4e192f48e98a0386980baa415218cb496048f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/hexedit/{hexedit_1.5.bb => hexedit_1.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/hexedit/hexedit_1.5.bb b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
rename to meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
index e996593135..d2b23b41b4 100644
--- a/meta-oe/recipes-extended/hexedit/hexedit_1.5.bb
+++ b/meta-oe/recipes-extended/hexedit/hexedit_1.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "git://github.com/pixel/hexedit.git;branch=master;protocol=https \
     "
 
-SRCREV = "baf45a289360a39a05253949fb9d1b50e4668d8a"
+SRCREV = "eab92dcaa34b66bc5182772afc9fda4ac8a27597"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


