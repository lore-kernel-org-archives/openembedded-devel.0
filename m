Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0617EC44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:39:02 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11402.1784590737835373311
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IvoG86e+;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9aea40d799so3527817a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590737; x=1785195537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpInjAou1E6xPyfmLqhJjQtRZ/ZWUuVjkL6x3EMZXxQ=;
        b=IvoG86e+x58FlTOpC/HzwjYkfH3AJAhPQGtD4g2S6pVrgynCGVDvGtTRUuu4cx8yZe
         skOz9e0EsLj7kvACuGiaBSOywdxvh5N8xcTsgi2bioxxDR1hYgRfDohims6tiDv+Hwbt
         SdnObQQAcpTsHRP+FVTUPvs6Re8BTFHMX4+t7+OK3XZGgcgZTmLGPtWzeZLv0XU7dMm1
         8QWPp7YqANQDt7bd8837cm3r/fsGHuVPSxXnCtbTR9sfGZwbuX9FZ/j0JNFwh6Jr+/hh
         KFOKwllnSWM4cCd2yNMm+F8Z+ppkLNawK8yHdE0W9nadp9Q8vtTOhAo8iTbAw5fXdpvK
         rJUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590737; x=1785195537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpInjAou1E6xPyfmLqhJjQtRZ/ZWUuVjkL6x3EMZXxQ=;
        b=E4EL/Mt4hjfCYorI0KJe4Aeh/XBQ/b2anhQ+rzozWngGoD4SWhTYK2WWqsa8SGGBU6
         nMciSTcyVNY9eTqVTc3UwzaBIlhmF2RBdkJDSzJEH+aks2Qe/EElkXfpJeS0AMeJcTwR
         1oTnXYpkeIrNtWe7xwGb0z1g7ypZy9eTs9kLN4ueAz8WLPqt8d/oOp3tk92g0wJNJ7BA
         HlfPqLD/riiKwkvEsjv6NhH7UqajWd7vK3SgQ47ZrtBrI+HhI2G7C/BhEqWuo7bpa9WR
         Kp7G29bZWCPmhDX50sxxzpC9rh9Sz0HidhVdMoGrGOmpkZtglK0fagjwUNfzlZJ653o+
         ih7w==
X-Gm-Message-State: AOJu0YxTljStJaTF0i9yzHBA9Cd7uLuiQqT2Qwdqw/pgO/EjjHD0mnMv
	OGvWvGyENyAZXgoFkjrefnjrsPVuG1ThDOz9DgmWRiktiCv4Ue+iaSxMMvqgmA==
X-Gm-Gg: AfdE7cmjFwnCv0HqwtKBuqOpqy5ImyAolAuNU7Mawkbx3NacuyRhIDQaMsDUPwWcFJs
	zcJ0SRByRJ7Uhs1stOPjfKEUS2I0EmL+2DqAqefDUwA0iF6gUcZ6chIQNFcQxeeXgL1zFHJjTPN
	TdveihIJmXkhkDj/2uPkc2dAh7/cs5bhmE4TnRdT8ZSZMDbhMuDc+Po8z86SxCC16YJU1sgBgqi
	sBCqSqyhenrd/sVU4zn8B6/OZODaWlQA/TfheWhmynwTRqCoOuK0kmsGyXYgQedQ/QOTq41vFvK
	2MtnIgFHFeB7GIYPfdO2upmOP0gDLhEdMiQPWyiKv9elwiNaNoVD3+ufo2Tyf8vMHa9/aChkER3
	oczsVFNkDKeiuTHJpDesRTfEo2S8803zDAWRsusR3EiIrNJGu5Y1HgzOXfJfg+yUvyI/D8Xy+tQ
	2ZvWcc1JV7AAQ8nrk=
X-Received: by 2002:a05:6a21:48f:b0:3c1:817:7938 with SMTP id adf61e73a8af0-3c3ada3e378mr18260037637.67.1784590737210;
        Mon, 20 Jul 2026 16:38:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 13/30] libnvme: upgrade 1.16.1 -> 1.16.2
Date: Tue, 21 Jul 2026 11:37:54 +1200
Message-ID: <20260720233811.2324493-13-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128314

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 83c7ce82cf562735d6b6ef71db0b4df734632f8f)

Changelog:
https://github.com/linux-nvme/libnvme/releases/tag/v1.16.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnvme/{libnvme_1.16.1.bb => libnvme_1.16.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.16.1.bb => libnvme_1.16.2.bb} (93%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb b/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
similarity index 93%
rename from meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
index fbbe141487..aab4d03ed2 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "becae3d874b40bfedede672b4b2f58ae8c3be3b5"
+SRCREV = "07d6c32c10fd63fad141cd0120314a055695de32"
 
-SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master;tag=v${PV}"
 
 
 inherit meson pkgconfig

