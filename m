Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58E06C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.593.1708128997669816385
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+hhXY0r;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e2775c377aso124656b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128997; x=1708733797; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9a8m2F2dYl7PCCmc02PaCJMzZ3OP4K8UOAaCebfAjg=;
        b=U+hhXY0rF/XskYROfBTOGvcbtAVa8S8tC7Kgbp8JWambkNA86D694ISdpE4t4ybc7M
         IlR5btW01ZAvPPNYNlcGYE7WuaXhDUpXmfYAaVkl3nkiopngyjyvSTr+4LbwtT07P1ms
         TnfohFG8Tc6gcQvQMps8GH/tCa9kKQWH1uGPd5eaconRX+fzmYwu47X2LUSTiCwL6Kun
         s+LzzGFlILmEf+ph/3AGxlD1Vn714M7ShDnfUuHi4+IkC4aSLt4O4CI7QVDEUYDZyqhJ
         XG8Jt7ssoVSkBO80lodlSdoxYbECwow/ykIv9xUO6EjkamVYb782JHc4tIP66MGqasLX
         OnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128997; x=1708733797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9a8m2F2dYl7PCCmc02PaCJMzZ3OP4K8UOAaCebfAjg=;
        b=qeWM4GhvldSgcHoxFGvCJX3PBNfjSn76QZLcw3B9udgLMahenlSZ9KURg/dLIcnddK
         HDI0Qh5IXN9EDGqyLgFrgeoh2/CglHRvfqXNUA3K8PNaEATMQSGw4YrKQz1ALAkQKF+0
         KZvjiVqQSeXzO4TUyglR0+kkctndHqDepFRcp15nVwxgs9bB4uMdIK7w7D08k43I9i5p
         kNBrceC1EPNDvnEbn/R5uxy7jAsNwpKblffajIr7OGdQNQc0fdh05PZgVRi/cdXW95mS
         IJ1G69o6H1oKVDentXZ9YFrqBJKdpkIAXSytztYas83olwzvY1VRbBGGIuw4G8kUTlVm
         JMfw==
X-Gm-Message-State: AOJu0YxAaZBnqmQl9lTkVKafoydHkAk+FuO7KeARrH3I0LvdsOVDLQNH
	3oT1/VPrSXI4vSHsRMNtuPYbl2ofNUK0/jIRpepyj6RxFtoAhtLDzzezn1Zv
X-Google-Smtp-Source: AGHT+IGuGFFrWzSOy6znDqo/GaoFpJJ34sV2GvrBF3WUscA61SaUj8ZZe3WirbKuMcEIocU/h/hpFA==
X-Received: by 2002:a05:6a00:1995:b0:6e1:1843:2e8e with SMTP id d21-20020a056a00199500b006e118432e8emr7220693pfl.0.1708128996911;
        Fri, 16 Feb 2024 16:16:36 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:36 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 24/60] python3-prettytable: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:15:15 -0800
Message-Id: <917a2526f5a3d6a11efa444d62fe88880e366988.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108794

* Also replace ${PYTHON_PN} with python3

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-prettytable/run-ptest      |  2 +-
 .../python/python3-prettytable_3.9.0.bb       | 21 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-prettytable/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
index c1e394d9b3..ba75057f59 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_3.9.0.bb
@@ -20,22 +20,23 @@ SRC_URI += " \
 "
 
 DEPENDS += "\
-    ${PYTHON_PN}-hatch-vcs-native \
+    python3-hatch-vcs-native \
 "
 
 RDEPENDS:${PN} += " \
-	${PYTHON_PN}-math \
-	${PYTHON_PN}-html \
-	${PYTHON_PN}-wcwidth \
-	${PYTHON_PN}-json \
-	${PYTHON_PN}-compression \
-	${PYTHON_PN}-importlib-metadata \
+	python3-math \
+	python3-html \
+	python3-wcwidth \
+	python3-json \
+	python3-compression \
+	python3-importlib-metadata \
 "
 
 RDEPENDS:${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-pytest-lazy-fixture \
-    ${PYTHON_PN}-sqlite3 \
+    python3-pytest \
+    python3-pytest-lazy-fixture \
+    python3-sqlite3 \
+    python3-unittest-automake-output \
 "
 
 do_install_ptest() {
-- 
2.34.1


