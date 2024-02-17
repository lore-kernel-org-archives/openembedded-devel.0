Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1510C48BF8
	for <webhook@archiver.kernel.org>; Sat, 17 Feb 2024 00:16:12 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.576.1708128966391071772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Feb 2024 16:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YyjLMX0p;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso1304129a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 Feb 2024 16:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708128966; x=1708733766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpIkwf8/OimYCD7671dg1qWNL1lk+HaOUWCbfia9s8I=;
        b=YyjLMX0pWFQzcEAtAjhUZ2vuo+s9gPM1VJ7hMRQUxI2hmTyAogdDGQME40GxfeeSRI
         luaAe3kJGm1Xx/56DdvEdJpEvsn9pDZmshemLJRcKIMcIB7+e8Czy768WvRA5+REAwIy
         fxtry0L431Czdj7vzdtoAqDrTkGU/r6Qe4LpkWzZbDCNpIFjdedp1JgPWyE22KdkvTv6
         CahLOhkDGtnLhw3OCOkzFGpZwz16qG+Rb8PhfvVhuPVYMBPbJJ7VWAcKPsaMGkvttPID
         cHJlaBNoclYq4gmYrhcQBPqTRl/7UZCGYGMEl2OtqFeMVMyVMieHSOd07hBhz6bK178i
         dpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708128966; x=1708733766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpIkwf8/OimYCD7671dg1qWNL1lk+HaOUWCbfia9s8I=;
        b=nxpDIBlf8GNSSXvs8iMc+cwBeXlOd+4xP/ps8bQi20s16cJISi40Z1l7N+VDPdMLqu
         q5vrsmncbzyP57CrX8gRIwtGjedVHHLSLtgP+ta895Zy3QTLqGHPbZWDdwxpestBYdwT
         FYZzTrP2APBf/1FN2QFw7Na6Snj1WbxUBY7RQ9H5EInDFPq/S24LCbeEBYn0m9mTeIpc
         /aC4u+N/4hqKVPn+1x5DwUV0Ppnvh5bW7cgnSsZ1V92WPnYr7u/EwQZe+PZn01fHa2nH
         +uSpRZY5KALyMetgsilwOOCRht5ERkwOKXoTQL21OwI6z05KlZvDiY+pf20+Hi3idHBH
         Cr4A==
X-Gm-Message-State: AOJu0YyJBWDF5UA4CX0k/NG4OL+jHDsAB2Pf2MBhSInKwqlqjYk98iiL
	HH6rYN2P59/EqSUVTcAo3qw/VJ0uMRdA/MCoiBFrL9squWLOi/mjxuVm/GXW
X-Google-Smtp-Source: AGHT+IHvoPr9+innSZcHcs32gq09YuEqk5S9wty6qrbEZWSj5DzKDyyraW4rGNEdkoa6xINSwxoWfw==
X-Received: by 2002:a05:6a20:d903:b0:1a0:785e:c99e with SMTP id jd3-20020a056a20d90300b001a0785ec99emr6840701pzb.54.1708128965650;
        Fri, 16 Feb 2024 16:16:05 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca01:19f0::d846])
        by smtp.gmail.com with ESMTPSA id kt22-20020a056a004bb600b006e0825acbc3sm514781pfb.77.2024.02.16.16.16.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:16:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/60] python3-pytest-lazy-fixture: switch to pytest --automake
Date: Fri, 16 Feb 2024 16:14:55 -0800
Message-Id: <2f7393705c01c72f8fd8004c5a18cadcfc889ca7.1708127759.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708127759.git.tim.orling@konsulko.com>
References: <cover.1708127759.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Feb 2024 00:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108774

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-pytest-lazy-fixture/run-ptest             | 2 +-
 .../python/python3-pytest-lazy-fixture_0.6.3.bb              | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
index b63c4de0d9..8d2017d39c 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
+pytest --automake
diff --git a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
index 32b5677f1a..9c50528fb0 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-lazy-fixture_0.6.3.bb
@@ -20,4 +20,7 @@ do_install_ptest() {
 
 
 RDEPENDS:${PN} += "python3-core python3-pytest"
-RDEPENDS:${PN}-ptest = " python3-unixadmin"
+RDEPENDS:${PN}-ptest = " \
+    python3-unixadmin \
+    python3-unittest-automake-output \
+    "
-- 
2.34.1


