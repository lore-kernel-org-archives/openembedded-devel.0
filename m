Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 734F3D715DB
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 09:05:04 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3186.1769195388276053123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 11:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=2l6Xwe0J;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5014b7de222so31144471cf.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 11:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769195387; x=1769800187; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=itMByXfJ19aQqRnQBWfoE0nA67VdNYtQylqmYRuKqEo=;
        b=2l6Xwe0Jd3OgxGdNWRjGdfZnefMOm0rqCYx2F57EvnLpL9YrFqC/d5rnQyqYwAzUl2
         0yiv9YpOztyg28h5gK6ywfLCialkEEXlGAl0YAxttSEdXr41bhDUSP69+XJaxmfKTp9f
         wX5QF4ER3lMig80QjjSO8ZfXl8Gfcg2GF3wk+vCPPMqwu+qqJHdpSteacBRrWqqHhMqf
         yujl5RkVsOtPGc7hlaoTs2BQg5V8GDEc+daNiOwclmT19IBCW64INZireoLLdUAKIgfq
         jQrowDgxqhlRra4HuYtqZ8F47tlqEggIykPY2D4hh2oHWbUwtlRWIOowv9KPyfSdFRYh
         +7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195387; x=1769800187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itMByXfJ19aQqRnQBWfoE0nA67VdNYtQylqmYRuKqEo=;
        b=mv3HzGHCg9WSBPNaxdKC4IH3XOzDZy98kHW1agdZl11p0uhpc5eQNsJrRGcOpbKTkA
         oZVXiwR0j2dtuEALeuuz1G+G4tRvsHFf12MxaapUnxWw19fgMyl2aY0tc4Q2rycpTlDu
         L5Kn9wSgL1eetrM1dDp4KXeoX4OS1aXLccdxzcBYaj2E2W0IrazQuj0P4G3Fxztf7ZYD
         WpSyZz28zHwedadL30Tuvt6AvKCAe6xxoJQTmrotaD6/bsfVHKSs32JJrlNJDMULFIdU
         61eJsoU4Wz52njXfPpRMpAWeVd7VW+XRbLjiOKMR4cFWeB9uP/z61mWm6J6MCowp2/Jf
         zr+Q==
X-Gm-Message-State: AOJu0YxlCwOjrh5azUwcBRwfk7Hfj/cLOWbrLEHuNBGblWQvaQ3CLFC3
	/AmGmtdwM00354FEWbQrcWr+ShScL7f3apbWfdQ/9zNPVNYLMUcy28LgtpAZVQMf6u3TbTl7GRS
	/mF9U
X-Gm-Gg: AZuq6aJnBsbGhhWojqvLkJiaGA56ZjP5CgNiP1j/uABygcz9n9LvAh9+Lbi2epLyK5+
	oTujNrQ7uKQfMtQoCxp7wYOjQfUTyXaMHXvS1aAlT4H0PXLmN2U+nWJwhzMoQwjPRvr7fJjwb/x
	vqMjRw5KI18fQoyy10xHJY3/0oFqUf36u9RXH2ca//oNKHnKfv3gVBtNHpZxEPcRpcyMR+Wx6CS
	r2BZBiy+zT91rbvO3LHEZHB7W9TnKRnb2+gMOK64Qv/eU84TKlTEj01u+5vqoTWdJcPX3CkgSgL
	i2FOzM1bJkCAG1BQyZHPqn3HiFPSrFKZfWqlISwBAYPTdIGL3zQspJfY+zOY+2zcW+7byNAPTPI
	ab1KNe6miUE7CBXbNOYFcyHekZKz8Wq9aEdwJTGirZ/R3ploq0tdmfxeun0laagNs9KKNQG92X+
	SQS3vne1/IYhQ6omY=
X-Received: by 2002:ac8:5a8e:0:b0:4ee:168a:9ebb with SMTP id d75a77b69052e-502f7804dd2mr48886681cf.58.1769195386648;
        Fri, 23 Jan 2026 11:09:46 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7f848b9sm21151661cf.25.2026.01.23.11.09.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 11:09:45 -0800 (PST)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsigrokdecode: add Python 3.14 support
Date: Fri, 23 Jan 2026 14:09:44 -0500
Message-ID: <20260123190944.2043526-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 09:05:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123821

Refresh a patch to include python-3.14-embed in the configure.ac file,
so that libsigrokdecode (and by extension, libsigrok, sigrok-cli, etc.)
can build.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../0001-configure.ac-add-py-3.10-support.patch     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
index a051f90c43..2961d23bd9 100644
--- a/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
+++ b/meta-oe/recipes-extended/sigrok/libsigrokdecode/0001-configure.ac-add-py-3.10-support.patch
@@ -1,16 +1,20 @@
-From a5835dfe126bfe6ed0b8197c6578960835bf1fe8 Mon Sep 17 00:00:00 2001
+From 01f08e93a4b5b94d271f5a57baed6473e0511c2c Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 3 Oct 2021 22:08:50 +0200
 Subject: [PATCH] configure.ac: add py 3.10/11 support
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Update to include Python 3.14 support.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 4802f35..e0e468f 100644
+index 4802f35..2eb47a6 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -93,7 +93,7 @@ SR_PKG_CHECK_SUMMARY([srd_pkglibs_summary])
@@ -18,7 +22,10 @@ index 4802f35..e0e468f 100644
  # https://docs.python.org/3/whatsnew/3.8.html#debug-build-uses-the-same-abi-as-release-build
  SR_PKG_CHECK([python3], [SRD_PKGLIBS],
 -	[python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
-+	[python-3.13-embed], [python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
++	[python-3.14-embed], [python-3.13-embed], [python-3.12-embed], [python-3.11-embed], [python-3.10-embed], [python-3.9-embed], [python-3.8-embed], [python-3.8 >= 3.8], [python-3.7 >= 3.7], [python-3.6 >= 3.6], [python-3.5 >= 3.5], [python-3.4 >= 3.4], [python-3.3 >= 3.3], [python-3.2 >= 3.2], [python3 >= 3.2])
  AS_IF([test "x$sr_have_python3" = xno],
  	[AC_MSG_ERROR([Cannot find Python 3 development headers.])])
  
+-- 
+2.52.0
+
-- 
2.52.0


