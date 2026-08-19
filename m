Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83431C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.923.1787117850860650442
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UcYsbGoj;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d530328efbso5891075ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117850; x=1787722650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z17m7k+JBCoPhRz7ACnEXjNYFOhe7HW247qadpY/exU=;
        b=UcYsbGojXQs/i9DHzisKs1/AIIfVamWPIPNs21WWSwhdfUfF4OU711D7Bi+bGlP/3r
         4I4uW48OdCwrz8+qzdTJiLgrcy99hBe8yJjciLnWT7zAudB0U9RfES5CzurLY8iVGWRR
         wyjQc8fFcVLJ6oHIzMihjQTObq09bKYBz/Rk0iEKq2XuMTtQpoDCiNHDEIm/CFgtLB5A
         7tVsvG9GUhMtU2IZ8kMt9zsM8IUgUQ+KRsbc7+Y9EiMQsNXDqaoCH+DWIwN4hWronPP0
         xevMzds62ZrfAXkfIh63vHJGwgJTDB3V+L0KmHCMGK6f6MYn2/XGbro7OmJl/xVd7EIa
         gaeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117850; x=1787722650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z17m7k+JBCoPhRz7ACnEXjNYFOhe7HW247qadpY/exU=;
        b=H2+kG3g3TBEhAwHhOHKmPx/vU8ABcMCKGCXaoeURRtwJDODTb187QLQc2at937gdhO
         CcgHg5ueH7NkG6fv+/udz+JoqfcJbgSvzveTY2kGpN4bH4y/a/uuTS+V9IX2zxUeBmhE
         E2yxX8m0VdnPqK7/pVLclG+sTwMNfRE/QnU89ryrqjABHEult+Kx9jIppf9qtC3Tzy5w
         vCqzSYyllZ6pe2cRtdF1vrWoZIjcFjS0ZGNo/p6TzslazeRFLY5Uh26ow2rnQF+0nMV/
         d93a3qpdJwCXE6hrj2U83Y2yPnRwfty01Yw1W9ZaFRyA187K8l0tPW1kTntre8HUIM2f
         0UcA==
X-Gm-Message-State: AOJu0Yy7yyP1DCeVU5XVYSL9lJlyVJcN4SievONvONsIyQCjNFMv+FCv
	qw5myafBx967aKyk3Z6lnlNpo0VpyLwXVHn1rpPSM+Q3329rZSmW++gXAZQHRx1V
X-Gm-Gg: AR+sD13kzkVSO8pdN9fvlXz2/vadThC/A9AHPG8psw272DY3u25g2nMOFwQf38IHQvC
	0079W1tTueyfnCAjtfpRQPPuW6+BbVGibmM2nAlIUKWhkCXvybtnp4WoSdWLCWgpp7lfacdvkSB
	f+A66iz/vf/8hA4Tm5rGXEoxhMkweCIz+P2syQ+/Uf0WL+7R/IXsKv/Y+1i0UcfGuOeQNuwxpQl
	rAOeOZeRGaliNE6jXMVpkpUiNSfm9NbfLUlhTUpcRdmAmHjE5RF7wTZ5e2Q8Nf5teAgso910EVM
	M1H5vi0gWw6hw1jiVl9IWgUEfRj/T+7mV2t2ZQRJhxQkGp9tEIEjfjkHl/MaiQEmqb9CDBPzOk9
	KHqx/9If+TEJNwZaoXsOriA4m6OZTo6tQuwr8pxxI+DKZXUB+nIFFmz1nJj7zkNE533NEdC9VgC
	vvuBpFcR3k84U94f937kFaY/1yBucTztvvBmgz3BwA+FZuqGYhiVVmC5iHY22YaSn7lRADqFWS1
	1Fmf2sWr5nd
X-Received: by 2002:a17:90b:5403:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3958084050fmr4077355a91.3.1787117850200;
        Tue, 18 Aug 2026 22:37:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 21/25] libsombok3: add UPSTREAM_CHECK_GITTAGREGEX
Date: Wed, 19 Aug 2026 17:36:25 +1200
Message-ID: <20260819053629.391864-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129265

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add tag in the SRC_URI

Fixes:
$ devtool latest-version libsombok3
...
INFO: Current version: 2.4.0
INFO: Latest version: 2011.5
INFO: Latest version's commit: f5ba2dc3025e36e01ee2555ab46ad3fbbab28248

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
index 8ce8bc050d..2879165366 100644
--- a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
+++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb
@@ -7,7 +7,7 @@ Cluster segmentation described in Annex #29 (UAX #29)."
 LICENSE = "Artistic-1.0 OR GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 
-SRC_URI = "git://github.com/hatukanezumi/sombok.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/hatukanezumi/sombok.git;protocol=https;branch=master;tag=sombok-${PV} \
            file://0001-configure.ac-fix-cross-compiling-issue.patch \
           "
 
@@ -16,6 +16,7 @@ inherit autotools-brokensep pkgconfig
 # sombok-2.4.0
 SRCREV = "0098d85a037ef5c99a648a3669a077781a45e8cc"
 
+UPSTREAM_CHECK_GITTAGREGEX = "sombok-(?P<pver>2(\.\d+)+)"
 
 # Disable libthai support
 EXTRA_OECONF = "--disable-libthai"

