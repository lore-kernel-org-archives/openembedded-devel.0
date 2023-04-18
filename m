Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E71CC77B71
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 04:36:01 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.955.1681792559942454698
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 21:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KAD2KSq5;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5140cca9dbbso2042030a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681792559; x=1684384559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aXplqtk3IsEKPOGfjopAvBenxbmcldFh0z70wR22c0=;
        b=KAD2KSq5mezCJ7Ch6K7/KBFv5yrEkJBiDNnQRPwbgQ6yN+hHwXIOC5gTdEewTCjoiw
         Q9AxIlXfiniVmYvg2SPrIGNM5IEpYR9eYslMTkDrIljyY3TqWFit2pnKnE9yPY7sp07m
         4Gw7suLfriUl2JJIKGMijVN99GLQgjTJlMmxrl8V8OzrbYgpNqrv8Ddtz51gsHjMOBl0
         cHGc62h+BI2tDgfMiUkhl3wq8AUNdLCXESQRrpNRfrqAwV+ShpR1BuPDZhZBMmfuQ3ZS
         kwGXRZ4NsdTxNihw0b/2xblgQhguFsc6Ip5bXKiJJvDJ9AJv28rii0zTL5xRlZa0id4Y
         qEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681792559; x=1684384559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aXplqtk3IsEKPOGfjopAvBenxbmcldFh0z70wR22c0=;
        b=lkZzZNt9Qpgun0D7R9x/f/EyoIlfxO7dsThEZkgvLirYGpWvvMqQ+NhB+8j4HLLG6f
         fYiNUX89ds2j7agSA3khFj1TRttesEyaoT32jCzY4vHN71OLuEt7Jk624d4M5ATQW3iv
         M7R7OCVG7EfZ5O+KfyKNW9eiqX3St+JkFpWUH7ucvU/4F04qaBcke6cQpsY9aOV2KnJm
         0NrKXAdLV2zvLBSykbq6YziIEr540TOGth+G1mqKedKU7e7wMF8PWvcxsIIPHyl7Uekv
         o7yhO3We4D8a2MoGfkyBYLo3TArCq3d/aYVcMR77LSvVqUogHlE+AOGOfDaed7i7FN3q
         hH5A==
X-Gm-Message-State: AAQBX9f6l3BHWG7PMwNFxCbJ5i2cz8eSbFRoQXK6c6dR/LGMrB2tBSqt
	qUl65HkIK3Vs7Q8U8yjhwqM/oLJaIhzlaQ==
X-Google-Smtp-Source: AKy350YYFC/2WEsSjpgOQODD23hKyXoUNgDFhDz3dGmvvxq0g9ajZFCn6oG7h7BTcCEAikXClWub/Q==
X-Received: by 2002:a17:90b:4397:b0:247:2874:a6a6 with SMTP id in23-20020a17090b439700b002472874a6a6mr889625pjb.2.1681792558766;
        Mon, 17 Apr 2023 21:35:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902a60100b001a671a396efsm8508064plq.214.2023.04.17.21.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 21:35:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] grilo: Fix buildpaths in generated header file
Date: Mon, 17 Apr 2023 21:35:55 -0700
Message-Id: <20230418043555.1657262-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230418043555.1657262-1-raj.khem@gmail.com>
References: <20230418043555.1657262-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Apr 2023 04:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102132

grl-type-builtins.h gets generated during compilation and it uses
absolute paths to source files in comments. This is flagged by packager
therefore remove the buildpath

Fixes
WARNING: grilo-0.3.15-r0 do_package_qa: QA Issue: File /usr/src/debug/grilo/0.3.
15-r0/src/grl-type-builtins.h in package grilo-src contains reference to TMPDIR
[buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
index d51a27f01a..526a8593dc 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.15.bb
@@ -26,3 +26,6 @@ PACKAGECONFIG[test-ui] = "-Denable-test-ui=true, -Denable-test-ui=false, gtk+3 l
 # Once we have a recipe for 'totem-plparser' this can turn into a PACKAGECONFIG
 EXTRA_OEMESON = "-Denable-grl-pls=false"
 
+do_compile:append() {
+        sed -i -e 's,${B}/../,,' ${B}/src/grl-type-builtins.h
+}
-- 
2.40.0


