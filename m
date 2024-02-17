Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45863C54764
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:33 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web10.582.1708128987600902214
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgwBOvDW;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59502aa878aso1120653eaf.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128987; x=1708733787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1PzB4oVo3X5jqxgZ2e3hAu4eyIGDD09cQ1dqzGWzL3k=;
        b=SgwBOvDWo3dnp1MJNTt0Mxs/GdxqMdpD6AR7AgfUUEyBH/2QKud5N4V78xnq9Zdvzg
         TETS+ygd1BUFXvvV7qHXfMvxylQmRlV7JnGiCwU0VD431heVdXqer3nJkDDVX8HDohv5
         BB5CgLuJ/gr+I7ETCOhKSctINvIFQGTgDcp+UcWRYvvL84LZjKQt32YnTqYdN5WqIoUb
         8yfdiE69Vzo7c8Y1pKjzqwCPNC3HmwhTGElcq17lNK/eYERztHVZtajwnYvA8ePnrOcc
         Ne0pRK+0/uVjJJC/P3rIBHi8kM2x+qL8UBQ0QSmBtpS76TdICGnTbjK2pKY0eG6prlU+
         /ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128987; x=1708733787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1PzB4oVo3X5jqxgZ2e3hAu4eyIGDD09cQ1dqzGWzL3k=;
        b=p0k5CGMe22k0JNRPd62x37l0v1pQfgXPRzfRu2DzO4nrCx+nUYvbsxXnTi9DNR3B0c
         esOuh82rj/WDo65WCETdHx3h8Q/NGlcxrFfKmhixryUCe7ICbmI212Ro2xp9omHn+Lre
         b92A2RyiXJhfycZ1s41NKGe2fxhss8nZXdz9n++F98xeNp1TMFeNUS2yeEJGz1545N5i
         X6ByNPeW8E2fL0XvwKEfisMeK3JQZWNtyUUpKFOydSpowcYqcN1SDCckEc/OGoIL/0cI
         gO/zuIKzEopdKSoqTkCa9j+8dm56OB3+ECyYKoSSum4zA4n5tLrrviY7z9JGDF6JFyyW
         6BVw==
X-Gm-Message-State: AOJu0YwvW5hWciVzsiYQBY2xuN0yqIDMUpU3FZpm7hjT7ysyWLac9ndg
	/WB6uTMgVp7TLn0pYL6nk5QL8pkqmhrW7GhqcpgVMZ71GjfUwo55Wpq2cHme
X-Google-Smtp-Source: AGHT+IEWG/YdtsB0Vow5AEkRW7XwT2Ung+hM7K3d70wiViDK+iEMZrhJoahfU1nkep1BRY53hPjCjQ==
X-Received: by 2002:a05:6358:e484:b0:175:4f0f:bbab with SMTP id by4-20020a056358e48400b001754f0fbbabmr6022882rwb.22.1708128986611;
        Fri, 16 Feb 2024 16:16:26 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 17/60] python3-pyasn1-modules: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:08 -0800
Message-Id: <9dd77d94739772e0ab50708253a2daf01a5686ba.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108787

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../recipes-devtools/python/python3-pyasn1-modules/run-ptest | 2 +-
 .../recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb  | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest b/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
index d158876fcd..ccd6025be1 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.3.0.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "pyasn1_modules"
 
 inherit pypi ptest setuptools3
 
-RDEPENDS:${PN} = "${PYTHON_PN}-pyasn1"
+RDEPENDS:${PN} = "python3-pyasn1"
 
 BBCLASSEXTEND = "native nativesdk"
 
@@ -21,7 +21,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
-	${PYTHON_PN}-pytest \
+    python3-pytest \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


