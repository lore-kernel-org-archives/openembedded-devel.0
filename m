Return-Path: <geoffhp@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84438C531FA
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 01:49:38 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29640.1771552173118875195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 17:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eb8vArdp;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: geoffhp@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-40f387a688dso1252377fac.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 17:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771552172; x=1772156972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TeIU9KKrEHezIPkrgQX1UgjzxmsX46iEl58yvfwcsxE=;
        b=eb8vArdpp0ZtGFbk4ZJIIWc3Lm8ombo4Z2NdJuTssgmqVcoL/LalqLNAf4b/H/UGkh
         /tZx74CnyGbbrztqH0OAJHdAKb3lYp7OD1cWcI5XVE1J8hlhHVLwQ6xjbc4yNoqnRcR0
         Pg/7dqnfMyQ/mx/4Wu0U0G0amHPJ/aFDtPWzKOaI5L5sRyFq282d/yVm31Wrwzkwjrit
         iFcd8ExicLs99wSJWpLCQpj6wKw0zipIwgnYDgWM+IJN0oPAL68iSZp7kL2z+Al/FaOO
         Tn9vjIauNbs8oTYvCGRT2UCHNBeLD5wL8nasyLQjMMYcpnpCgNBn+9KKKV63dPw/liYt
         aqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771552172; x=1772156972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeIU9KKrEHezIPkrgQX1UgjzxmsX46iEl58yvfwcsxE=;
        b=sI6bUROiaqIeKyiEDUB7+06uMdYQ8fpouHCES9XA6gYSBYiUSCwaZulKrdumdkHDiu
         BYt0nwBtYlw3wn2a6fa2fgL4iuaTOVcrbQ1UPURsq7M0xL4pjO3TG6UB80FHJGsiqE/k
         oOEu+bU7Gmw2FG1vS6yvRNaEeV8CZH+tC10jOSyCLhi9fTFU1nt7rJdIWTyj2nFi+b7q
         jPXmZLCx48uqYLYX0X2Q3jCTaWvs3qJxRcRuQjsEon+s7pHwn7Esnkt63x+yyeOCHnXK
         FWfMqwDkUuWMbpviJuEhYqQ+aeA6gtgZSJ5OP0/adZDqI+qYBZlukL/9Ll0JFHiwe/rV
         2olg==
X-Gm-Message-State: AOJu0YycjMmn0JwTUmtlJsuDlJXo1gfa0AnfEuPEr4uXfgnH1J1FW/d5
	QXaW8oej7p0icPyBG09Y4zEe60hu28jN8OkY3lOwlqd45/oJXzh7FypxOQIncQ==
X-Gm-Gg: AZuq6aKPpqyF9h2171hd2iz7F/mPdMK6pPyYXHT5h9a0g6JhIQjUHHqje7RGAewD110
	9FvQjmAIrmwY/PC3Rg/TzbDE9849UnxYCA3Hk5LW7HBi1HEPHB131ynqeuFBa3fpJaWQv1H426A
	W1q0FArX8r6qLO9t+Yg3xiO9Vqitwn9uz21CaMA3SVef3i9Y0JsCTwplUtqwPeCrYr9wNlkpd8k
	Npp/Ev+ES1NyoW3Bb7orJ0rub0AsUEW07kDqjR0g/geBoj2qV2ilmzKrmhObeomNHrDevkjwbLy
	KgtOC3+JUyt/5ixl3Ya1T/bOZR7fzQSq0LH+mp0mI3WU+da0KAIpVr4fg50Toiusj7ILtoGfcH9
	BfoIBkizSSD6RMyt85HSzjqQDwfEtZYWDsJToYFNJGA9olU5BvnSuPAJKo/fmrYVQ7yKuyhioJV
	QEPcl73OH8eH5cfHo4F+BhEKR87imVr6KHlSafcl17KHEQOArkawS/Ja5det3YsYpadT5ga05+T
	oaK5w==
X-Received: by 2002:a05:6871:5b22:b0:409:595b:d9dc with SMTP id 586e51a60fabf-4153a102f93mr2934224fac.44.1771552172092;
        Thu, 19 Feb 2026 17:49:32 -0800 (PST)
Received: from faraday.ACTDEV.local ([207.154.79.109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaf1e858bsm25764049fac.19.2026.02.19.17.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 17:49:31 -0800 (PST)
From: Geoff Parker <geoffhp@gmail.com>
X-Google-Original-From: Geoff Parker <geoffrey.parker@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: geoffhp@gmail.com,
	Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta-python][scarthgap][PATCH] python3-m2crypto: fix python3-m2crypto-native do_configure:prepend()
Date: Thu, 19 Feb 2026 17:49:27 -0800
Message-Id: <20260220014927.412049-1-geoffrey.parker@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Feb 2026 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124519

The recent workaround for https://github.com/swiftlang/swift/issues/69311
breaks python3-m2crypto-native, with error about missing e_os2.h file in
recipe-sysroot-native.

Apply do_configure:prepend to class-target only to fix.

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
index dce459477f..24e6ef9b32 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.40.1.bb
@@ -46,7 +46,7 @@ export SWIG_FEATURES
 
 export STAGING_DIR
 
-do_configure:prepend() {
+do_configure:prepend:class-target() {
     # workaround for https://github.com/swiftlang/swift/issues/69311
     sed -i "/sys\/types.h/d" ${RECIPE_SYSROOT}${includedir}/openssl/e_os2.h
 }
-- 
2.39.5


