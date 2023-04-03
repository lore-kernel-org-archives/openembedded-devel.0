Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D54BC76196
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 20:17:27 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.82837.1680553040332137847
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 13:17:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=D+merdv7;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso157050pjf.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 13:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680553039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wZh9coS8AdBz06m8PT0AI9eg7aUp1nfWy/he1K+LqG0=;
        b=D+merdv7S4Sl6rdu1aFRxNLJ3iWjnB+MRVllvxrGP11+Hekv4/tqBEOcqt24xhve2f
         nf+ftMxSInko5oJFLUN+/pjkQa6B3cvc3wzBU2Kbi3jsnYusDP/ZY9E6+wDQKK6wiM8F
         GamkpUNofPMlzECApqYAlUjWEX5HfnvC2SgpWpGnPef4p/rEDar85/iIkZU/Kn2ufeL3
         /KW/kloQRbdMBtZaaXrpKQSEloepGEFWd4Gy7xEibJwWe4iRkkeS01EILBfUvqpAHmoC
         Xx2/CmyNSDrNumFvRl4Fx0qtUgPrVZStFnNDlvw+hdB/g95js9VyH5Fr7H0li45WrqcX
         o4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680553039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wZh9coS8AdBz06m8PT0AI9eg7aUp1nfWy/he1K+LqG0=;
        b=2vu+BS5Q90IxlGJ2BRZtTn+A8cCSq6cUb0vFBSXUWoEjVUJPBaqm1ldntuUJeGgoiy
         +wpLRWugNSpbbtBAk2/QwWnofmLpsl9Szhqh1KGYRWFeIQLSl0VuIfBg/EXSbnuvqZY5
         UeRbTR2On1LDpA4O/kCKVOS02dGll/0uKeHd3KIT3TgLlcmbhZ9EmgezsyDzuNfjB69x
         ENx3AaBPf6wVhsP2adWcgxmPlaUPBSe+Qe9zpukD87BEd+75CTRwAUEJjw2TX4aP1j0v
         YjkQG0w88qsMQpNZ1liKtJsJcqpxg77K5pVatuOyWh+OwONvm9r8yN3jpUi7/lQm8nLF
         PHKg==
X-Gm-Message-State: AAQBX9dUu7ul3X3v+q4BvKi2kWSt5Sbyudk42MIGCPRvqpn7iEA+6xb2
	f2KXjeD2CBenSlgDxthLuBGcTci5QCWw/Q==
X-Google-Smtp-Source: AKy350Y2I/NNIMyb8fcckXlAXB1WE8NHTa7Lqp8nLNOBsUhXxsih+7Km1vlrMIYQy6OG9HkEDebUrQ==
X-Received: by 2002:a17:90b:3882:b0:23b:4bf6:bbed with SMTP id mu2-20020a17090b388200b0023b4bf6bbedmr143916pjb.24.1680553039461;
        Mon, 03 Apr 2023 13:17:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::2a5b])
        by smtp.gmail.com with ESMTPSA id z3-20020a170902708300b0019f9fd10f62sm6990662plk.70.2023.04.03.13.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 13:17:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] poco: Remove pushd/popd from run-ptest
Date: Mon,  3 Apr 2023 13:17:17 -0700
Message-Id: <20230403201717.2145496-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 20:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101944

This could be worked out without needing to add bash dependency

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/poco/poco/run-ptest | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/poco/poco/run-ptest b/meta-oe/recipes-support/poco/poco/run-ptest
index c479f7ac10..c9896eadee 100644
--- a/meta-oe/recipes-support/poco/poco/run-ptest
+++ b/meta-oe/recipes-support/poco/poco/run-ptest
@@ -1,9 +1,8 @@
 #!/bin/sh
 while read runner; do
-  pushd . >/dev/null
+  oldpath=`pwd` >/dev/null
   cd bin
   echo Testing $runner
   ./$runner-testrunner -all
-  popd >/dev/null
+  cd $oldpath >/dev/null
 done < testrunners
-
-- 
2.40.0


