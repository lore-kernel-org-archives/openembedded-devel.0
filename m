Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F78C6FA8B
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:33:57 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.19192.1663590826487048450
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eOPISkaY;
 spf=pass (domain: gmail.com, ip: 209.85.219.41,
 mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id d1so21732364qvs.0
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=NzBEqyvg7m6CVXXzvZ7hRSLqmqsN+RgSrZ4Kg7PMdlM=;
        b=eOPISkaYRo+3tQMheSQhrlylz+70tsCy6bEcRxmh9FdMuegZ33DQmFPmkAYhm4aFMa
         5T56vFUCVbdpfw0Syd4IWCSdY0ad3SjY7WeiGbsZu949g+BTrNt7Vi4OPeLkjAtqKjCi
         zSHbf2TQsF8M+GjFaDPuBzijo5xllgbU07Gkx8uHAv87X3osz5SKh4l4QXBQh4gkH997
         EGBn0nQJ3A+hp2/Ke9DiHBo+6Un7E6kaWUJil49z/9At3SO3w3bUjyVn5d9Pmnt6tPuH
         vbkxSVow/FeDnxEe9Z8gQVvIV/V9iLeVhHor7ZAbOAnfpISfHRjUEd8q/8gjGz5mDu+n
         3udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NzBEqyvg7m6CVXXzvZ7hRSLqmqsN+RgSrZ4Kg7PMdlM=;
        b=h+lpTSjKtrwqyKstzp8J+qkISi3Y4Z3Vr17tLA3QT6FYwz6FXO/HUggf1ycFtbUus8
         lmJXNfHgC24x8OvIkl/B1kMh80ZVem0xbqMcTwi7EWcqhODaOTqvFecj7V4NIZTRCEgG
         I8wkejCMZ6bzIogaiwCraRFS8atvWb2+D5SX2j7nmp85O681njtIGftV/kPrYdB4NiGT
         j4ESzjTM7fKmSijiZHzwJmLKCb3HRQnBMcCVZ+vPA6xFFnjYcOMTk4jeqhxuTt/XZ94n
         Nhcd/NxtUuVf1qhbavFgdKJKZTwdJTjdbJdwUymnNDtosaBdbLo5oVBcEQ4TzgFM3/Ms
         bNzQ==
X-Gm-Message-State: ACrzQf2TTbmy5PbRIoEkB++UNtPd7EkRL/MOElFFxXdPfaRoI1T5viSG
	FqPTb26onM6vvDxsGdA2vBvyfarN/mk=
X-Google-Smtp-Source: 
 AMsMyM7KYmgzU7nqTErotebUgebLWlY39wqCFm/+E4z5Fn4aBzpTnD3bsr8GcZuuXVVuvoKQGN0/yg==
X-Received: by 2002:a0c:c547:0:b0:4ac:9897:543f with SMTP id
 y7-20020a0cc547000000b004ac9897543fmr14629789qvi.17.1663590833057;
        Mon, 19 Sep 2022 05:33:53 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:b6ed:2737:547c:2270])
        by smtp.gmail.com with ESMTPSA id
 br41-20020a05620a462900b006ce16588056sm12541040qkb.89.2022.09.19.05.33.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:33:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 11/11] postgresql: make sure pam conf installed when pam
 enabled
Date: Mon, 19 Sep 2022 08:33:38 -0400
Message-Id: 
 <05dcac98473402d87e0af73bbc2c5a6a840abe93.1663590728.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663590728.git.akuster808@gmail.com>
References: <cover.1663590728.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:33:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98862

From: Mingli Yu <mingli.yu@windriver.com>

Update the pam check logic to make sure pam conf installed.

Before the patch:
root@intel-x86-64:~# rpm -ql postgresql | grep pam.d | grep postgresql
root@intel-x86-64:~#

After the patch:
root@intel-x86-64:~# rpm -ql postgresql | grep pam.d | grep postgresql
/etc/pam.d/postgresql
root@intel-x86-64:~#

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a755af4fb5ca2e158b00214bb18e27ba69c200fd)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index bef33e6bb4..60d44ce979 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -205,7 +205,7 @@ do_install:append() {
     # multiple server config directory
     install -d -m 700 ${D}${sysconfdir}/default/${BPN}
 
-    if [ "${@d.getVar('enable_pam')}" = "pam" ]; then
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/pam.d
         install -m 644 ${WORKDIR}/postgresql.pam ${D}${sysconfdir}/pam.d/postgresql
     fi
-- 
2.25.1


