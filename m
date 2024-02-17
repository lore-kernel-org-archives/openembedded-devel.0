Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61411C54766
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:17:24 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.613.1708129038220736169
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:17:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=amWqrW5g;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-59a1a03d09aso852908eaf.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708129037; x=1708733837; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u2mfxGaPyBqTtvtbOlFjtqZ+mtitv9QOab4ZBZhWjnM=;
        b=amWqrW5gzZfVcornxWO5zLWNX7QV4e801gECjjDAQCb8I1SN5xUYUC2fHEU58e1KkP
         qZ0K3C9NPNRgZXUcGnbmaSo9j0sDvowN3Qr7ysA3pFI0du3g1ZiCbrgT1qy4wOTJe0SK
         cHqza7XqjXa/PeOrqZxT9uZv8XuAMeJbnnPS2NKU2DI58Cl9HCIa9x5tU9+ePGE5r5gF
         AWdyHtw6Voi+T0AnhyheOwc7eoYya/GUr2OLtK0PESE+VajF1F9nxGc+sIWYMf9reU3m
         wwoJQ5aJLFi48Ukvv6qgu+6ar7QiYpwmiOrliX3p2nkQgAaesET6hZP/5HXPScP0FcBS
         Qp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708129037; x=1708733837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2mfxGaPyBqTtvtbOlFjtqZ+mtitv9QOab4ZBZhWjnM=;
        b=kNiAaOWe6VwL89TwpnblRL8FP3TOEOdq0DKN8uCzxieLzNJ5gZNxxyrf/+M6vLEmpc
         eyb29myqTBqUnBxdLtyx3uvLJHtTpo5INo+uKupTPILDZia1d0t62ws4bbfQzZz6qmmL
         18n6qAc/Sj+AOiKw0Gm8oaskXEYOQ1bjBq0ZhUWvs+1Jdpu4nXjZxjtrmgx4N3klfiRR
         NjiuFPByuxN7a3Z8vQltmethK/E4MMCqM/a/XtBsR0oWsOevpdfKvOdeDn+FnhRY41VV
         krgtGXcfnlo8WkRlfttQiZXX7cYDKF9j7usMMEUeH63V5A/0mBkiL2b0Fj+IqjWWLQ1B
         ZSsA==
X-Gm-Message-State: AOJu0Yy4Aiiu9zSigaUHmLnYslET6QBTUQwHux64Dtqkt4PYJ8KItOF8
	aCRNfE25gf2PlFNHHjjm4O84lu4upca45OR9JJiycKEmiEdIqMW48zPBaqsN
X-Google-Smtp-Source: AGHT+IFvLmeCJpXg7iBCdFTMPJLfKxo3Z3zO5qCg2KVztqTQca7a8Vog1FGHgI+66zh3tIxvYvf+gQ==
X-Received: by 2002:a05:6358:8087:b0:178:7986:a586 with SMTP id a7-20020a056358808700b001787986a586mr7847752rwk.5.1708129037308;
        Fri, 16 Feb 2024 16:17:17 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.17.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:17:17 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 51/60] python3-platformdirs: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:42 -0800
Message-Id: <e187314ef73c89ff8393d26245d826255bfb5b30.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108821

* Also replace ${PYTHON_PN} with python3
* Sort RDEPENDS for ptest alphabetically

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-platformdirs/run-ptest           |  2 +-
 .../python/python3-platformdirs_4.2.0.bb            | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-platformdirs/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
index ea25f878cc..19c95b374a 100644
--- a/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-platformdirs_4.2.0.bb
@@ -12,15 +12,16 @@ SRC_URI[sha256sum] = "ef0cc731df711022c174543cb70a9b5bd22e5a9337c8624ef2c2ceb8dd
 inherit pypi python_hatchling ptest
 
 DEPENDS += " \
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-appdirs \
-    ${PYTHON_PN}-covdefaults \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-mock \
-    ${PYTHON_PN}-pytest-cov \
+    python3-appdirs \
+    python3-covdefaults \
+    python3-pytest \
+    python3-pytest-cov \
+    python3-pytest-mock \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


