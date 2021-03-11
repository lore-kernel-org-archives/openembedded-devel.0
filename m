Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.4529.1615460508888784024
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 03:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lX4lopYS;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id bx7so2096926edb.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 03:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfwkHTzqJdPXI0bqncaOiQ/0x+IwzlF7uwHCWBDwwIY=;
        b=lX4lopYS4QoHB5mLWK0KF16rfJRKc63sdgYeyXRKBLvE6JWu7gZzn4g8QIt6WPp5Mt
         2O+71oM+YIAEdQU3bTHJTaUbmonj5wo1bHLZDpscsh1yxn5yG/JhOi0RIq5w+3NIZrP4
         Y0awXU8TMr30eMSIRdYmI8HP2nSWYmZclLAHffjeiOuJbKxL6aOu3wTc0FC1JIE/5app
         0PvK3FebpFVP50/pOpb1ihoXcrqr/zej1WkP7IKQNDDkLjQg9jnUlGC3aTmm8yO42IHy
         j68FY+wX2x6KqUpsxps8it4xh5fwdPOUniv2QVvJMi9ESAxWURiCFq2oF8kBJFTseGVV
         jCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yfwkHTzqJdPXI0bqncaOiQ/0x+IwzlF7uwHCWBDwwIY=;
        b=GxIfZ1Vb4LEpgATLSTe+LPXv849G5ETTc3n8Rn06XQUftf2LQQJp76r3HppEYaxi4M
         Dzsa3NtqnFmRTFBfpvSIL/2OSYbfLbxmphAfTTC+VYypQukyWRoiMD7wQaX2lyeY+B8H
         FP1hCsofOJqkreVXS+/4yRClTgmv5Xozw+vPSVYLax32ZvX6CDypUcqEY39lJS1l6Woq
         IPpGn/e/WfCBWW2Yf3F86iyex8mVbsGGtd/8b6tgiVfkKXHilXAUCGsVDq6nFYslsz97
         Z8hHCNEaMi2EZndXwjiWkxwmqqCkz6ZVmty9K8VdiunMjItlYFjRwG0ofmnME9xxotZ8
         wOoQ==
X-Gm-Message-State: AOAM530igQn1uE+utRhncEl4O7y+vMrPSkQFo/5fGlNxgDG/LT04rhDy
	qo5BkQvQCS89Kywv3+zR5i6ksGGY5zw=
X-Google-Smtp-Source: ABdhPJxO/u1NEnJ2pReo5jAabvz95xfGU8w19HvMfy27ugO65YgcXbsrP6ASzBPgQwTf7gPJhjkjnQ==
X-Received: by 2002:a05:6402:3075:: with SMTP id bs21mr7924316edb.274.1615460506762;
        Thu, 11 Mar 2021 03:01:46 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id da17sm1075241edb.83.2021.03.11.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 03:01:46 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] ceres-solver: prevent fetching git hook during do_configure
Date: Thu, 11 Mar 2021 12:01:44 +0100
Message-Id: <20210311110144.1583996-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* today I've found 2 jenkins jobs stuck way too long sitting in this do_configure
  Bitbake still alive (5000s)
  Bitbake still alive (10000s)
  Bitbake still alive (15000s)
  Bitbake still alive (20000s)
  Bitbake still alive (25000s)
  Bitbake still alive (30000s)
  ... manually killed, the CMake ...
  ERROR: ceres-solver-1.14.0-r0 do_configure: Execution of 'ceres-solver/1.14.0-r0/temp/run.do_configure.39438' failed with exit code 143:
  ...
  | -- Detected Ceres being used as a git submodule, adding commit hook for Gerrit to: ceres-solver/1.14.0-r0/git/.git
  | ceres-solver/1.14.0-r0/temp/run.do_configure.39438: line 213: 39485 Terminated              cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja ...

  I've seen it with dunfell and gatesgarth, but master has the same
  ADD_GERRIT_COMMIT_HOOK function (just in newer ceres-solver release),
  so probably needs the same.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/ceres-solver/ceres-solver_2.0.0.bb    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
index 28d0868c48..7feba4a5a2 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
@@ -13,6 +13,14 @@ S = "${WORKDIR}/git"
 
 inherit cmake
 
+do_configure_prepend() {
+    # otherwise https://github.com/ceres-solver/ceres-solver/blob/0b748597889f460764f6c980a00c6f502caa3875/cmake/AddGerritCommitHook.cmake#L68
+    # will try to fetch https://ceres-solver-review.googlesource.com/tools/hooks/commit-msg durind do_configure
+    # which sometimes gets stuck (as there is no TIMEOUT set in DOWNLOAD)
+    # and we really don't need Gerrit's Change-Id tags when just building this
+    touch ${S}/.git/hooks/commit-msg
+}
+
 # We don't want path to eigen3 in ceres-solver RSS to be
 # used by components which use CeresConfig.cmake from their
 # own RSS
-- 
2.30.2

