Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2BDCA0FFF
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 18:57:45 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.30587.1693940261093487801
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 11:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aGhbD5v6;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9936b3d0286so444607366b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 11:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693940259; x=1694545059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTRHwSIK5vkFXSMyhwOJKusvxRddd7U6s35GVhDcVL0=;
        b=aGhbD5v6w3rLDT31491UgWK4sOskU20kJXdTlwW7OfrklZYrcvZ6C3s0tFbhB05U0q
         7LYWVnFblqf90w2+mYpbtqlPsxfWzS6lrCUbzhtwcTvcwl6vPNrX+uaBmdtZLJ04lpKV
         4lBYLAte8ovpRIBBMqcsvtvkAP3OoimcG7cMSCcB23LN3b6AjQGNUhh/FS97DsoY9HQJ
         1vlbkaknTkoLXML2ApuOr47Q2tYx0CHTkW7JYq9kpZ+b9Qc9qtols6AzfeArp5lbqy02
         kSOksGuMThc1affu77Tg8ypWg76uVeq4/NXc5y7pklg+e7GsuCOAj/M3d3QEkCsHhCDR
         OImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940259; x=1694545059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTRHwSIK5vkFXSMyhwOJKusvxRddd7U6s35GVhDcVL0=;
        b=Dd/JjckAYnPiI1qtBW6mvKrrXsrSDP28A0QYQl0rr/aURvkII5ICgehqtXbC/5/nhf
         tc2f6UkRtjD40J17q/lnytcNqKSP9eWsmuaNgHrLpjxy5g9WjJlBXBuAFe+JBlNzgVSN
         +Cb4a/Fe302VNCEpJtewDEnG46H9caFLBdsr/AGPSOd6zyII5plaTYGZf8TwA+e4AvVT
         D+ZuoEKwwdi5aBEO+EhyiZ5FWHj71wpwXPjmFcmK/l1IJidUTWqQau3kXqzlUv3uxZe7
         oLyAD3J8xbNTEZOzj7/8sJbl5ihbgC+fh1LQtRj1uBbfuvl5WoHNRjnhr2Msjc7bTZeg
         sang==
X-Gm-Message-State: AOJu0YxsrLPWdSkGpKadPplLhLihHkI6KeRnXvJ4/j5RelowR2l3+S0I
	EuOab3D9FbMD4ma8qPMFZ1uUMDeeHgE=
X-Google-Smtp-Source: AGHT+IFy3s5h7wAQo4h1njcWeeG7NrS1djorDop+RQH+gZQE+nbglF5W6RhJ1hkgqXmhkPVKbSX/fw==
X-Received: by 2002:a17:907:75ea:b0:9a5:821e:165d with SMTP id jz10-20020a17090775ea00b009a5821e165dmr456934ejc.71.1693940259518;
        Tue, 05 Sep 2023 11:57:39 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id qc8-20020a170906d8a800b009a5f7fb51dcsm7844433ejb.42.2023.09.05.11.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:57:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] webkitgtk: explicitly disable JIT for armv7* with softfp
Date: Tue,  5 Sep 2023 20:57:36 +0200
Message-ID: <20230905185736.1414056-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Sep 2023 18:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104728

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../recipes-support/webkitgtk/webkitgtk3_2.40.5.bb | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
index 7218dbb5ef..5d43f3a8d1 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.40.5.bb
@@ -102,9 +102,21 @@ EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
 
 # ARM JIT code does not build on ARMv4/5/6 anymore
+EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv5 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:armv6 = " -DENABLE_JIT=OFF "
-EXTRA_OECMAKE:append:armv4 = " -DENABLE_JIT=OFF "
+
+# And for armv7* don't enable it for softfp, because after:
+# https://github.com/WebKit/WebKit/commit/a2ec4ef1997d6fafa6ffc607bffb54e76168a918
+# https://bugs.webkit.org/show_bug.cgi?id=242172
+# softfp armv7* fails because WEBASSEMBLY is left enabled by default and JIT gets
+# explicitly disabled causing:
+# http://errors.yoctoproject.org/Errors/Details/734587/
+# PR was sent upstream, but the end result is the same both JIT and WEBASSEMBLY disabled
+# https://github.com/WebKit/WebKit/pull/17447
+EXTRA_OECMAKE:append:armv7a = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+EXTRA_OECMAKE:append:armv7r = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
+EXTRA_OECMAKE:append:armv7ve = " -DENABLE_JIT=${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
 
 EXTRA_OECMAKE:append:mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE:append:powerpc = " -DUSE_LD_GOLD=OFF "
-- 
2.42.0


