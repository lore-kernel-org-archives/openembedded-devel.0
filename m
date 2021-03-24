Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.1237.1616604473089821146
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OS6aOs0W;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id e7so28336263edu.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3XT02vPkF2dJJYR9456o0vJVEZvJpBQLYzCFbk+Xj8o=;
        b=OS6aOs0W2UNr6ZyRfZ0+B1MPytXX6rVF9BvZKWLCw8Q0Pi14dBxv1/8f07efM6v/IE
         XZ6B7tVsNhLJu2RvBz2Hno50PJnWBF/5V9OUrM94vYFHY50Oh3NDNoMl2UmMtyLWm5CU
         a5fdIVqGKlgDBs5pZKH3ct+5nue8laQ6E2R8DooBvjbnk6rnruFDPANjTW+es1pc3WkO
         pwavSH3szKdt5mdJTopAuo6bjiOzIkcaN/IyAStiURF43DvbPdBQAsZ/JtoIFj8DVvDQ
         Ln1peHDxUBhherHmvbxQ2Jr6FRyGGk96wG9kYPPpzNqmEAf12Lb2SuEjpRSZwd8Fucn3
         WIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3XT02vPkF2dJJYR9456o0vJVEZvJpBQLYzCFbk+Xj8o=;
        b=E7QzMfFyrH5COPR+EPHcTgiZZHYsGdbLzJ3DjF1E8NwDvZ3y48eplPnGTknWgRi4mm
         gtCwnI6IWBDDgcf0wdblPxfET5upuhxrbCYrT6vw0+orVR9kXs16GvmNsUb68ewYg0J+
         mx+pINtJceYMelYDeqHE2PRyHO/FjNrhuVEc+353vkBwojoiM5EsabR/2JhG2J43NpBr
         OJVQtGKTN0Jncz28FKF6xn8eN1hRHC/QtnxVZHnVtIUJgHjHdcZx88GzwOnk/7bFzt09
         wcO545sS2H0KYD6vlDf+XQ/oHYwqlSoM6StgP0nrwirhpm2smAEcvoanfqfoEHJ4K9xc
         PNIg==
X-Gm-Message-State: AOAM530Ftr522TKv+2GHYlL8LfAi3Rtya/1AlNdMeghTXJ3ioUa4I+nx
	IjrhWB5wSmH3xP1H3sbj6kbCzGnnZjs=
X-Google-Smtp-Source: ABdhPJy+RgIlPqqxAt4iQR3glFX/EYxBEHfUapEGZxHsWaWG+OdYuee2IOz+GKOC2ghPR1eTr/utCQ==
X-Received: by 2002:a05:6402:170f:: with SMTP id y15mr4441049edu.127.1616604471510;
        Wed, 24 Mar 2021 09:47:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id m9sm1188987ejo.65.2021.03.24.09.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][dunfell][PATCH 1/4] ceres-solver: prevent fetching git hook during do_configure
Date: Wed, 24 Mar 2021 17:47:46 +0100
Message-Id: <20210324164749.390872-1-Martin.Jansa@gmail.com>
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
 .../recipes-support/ceres-solver/ceres-solver_1.14.0.bb   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
index ac463038aa..105610be5a 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
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

