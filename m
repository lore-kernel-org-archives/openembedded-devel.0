Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.5927.1617634478616338080
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Apr 2021 07:54:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=km2PLmUM;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id h25so8293131pgm.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Apr 2021 07:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ymVIt08BRhEE1ai6JFlS63Dgjq7AlSPeycHkRgbZ3GI=;
        b=km2PLmUMuSFp6o96msE/Qn1IptHKW4hAwwxeqDyq9lO3C5ar0/g0n+urKQs7B3gENl
         ysLu+DjyRzhCAAmf7ojW1k7P/zQjesxG8cfCcyi4Yq05VhQgTPuTfD3FKEgviMWB4jPJ
         7MbxVJzvaNH4BaRkHFZm2JAGWf13RnchzUirS82TdIQQaxzkpNgC4P6eU/DQJBkoJ51Q
         25CD5/7+d7eK0GIgNiCDKn9X2o2hdk36BYqp/1/vsAm3BrJ9wv+Ih9yj98PiR+5SciC3
         DOM0CdhTdIOSUTQP9rI90C2tzDUhl2KOPBzCHwKATlpu0zmsczkiT0w2wb/gbNwJUG1S
         ra4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ymVIt08BRhEE1ai6JFlS63Dgjq7AlSPeycHkRgbZ3GI=;
        b=SmEdQDjIOIacjeeeeWt+eZ0Xtd3X7OorSJptfT17esTBKea3BalV80THIqGYWySesW
         DlG4k6iQ5EDUvs4Xp+PlwObBWgM8CZ+Rke2lyxcc17LdYkBfnWv7JVmaS6yDG3ccY9DM
         lN7CnzTezQJpY/cZSDWQFo3C5ZpllB+6HcKUQkpxFm7WVMs2NUFwJshiHo+savSLZmeR
         4eSu3ZqZKHkOAqvWxsRp7I1uHcrZQZzqPqFAndVE4FYHCRhXJHGSVIxlN/+fHJkwfJog
         7Q5m1FMw6pgdUiEzpigxu4dbPQ6AskidE7fFYmAfrxk+SNNMz/IqTfMdoc2dt0Sowx7k
         Q6qA==
X-Gm-Message-State: AOAM530befcHhAuEMjjDWEe4+us12hjPpar/7YjUqMz1MCV1zF4gIoWR
	PVBAZdPqwW6FpZLzIg8aRVLr/97D5gE=
X-Google-Smtp-Source: ABdhPJxjhzaTlFirmIkSr2tNVSczInjL1U1GY6lLODEfidnFEEpz3gBRq3MIa8+cBySq+xRRG8HR1g==
X-Received: by 2002:a63:1c06:: with SMTP id c6mr18076534pgc.380.1617634477970;
        Mon, 05 Apr 2021 07:54:37 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:cb2:3225:c999:3d47])
        by smtp.gmail.com with ESMTPSA id k11sm16501654pjs.1.2021.04.05.07.54.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 07:54:37 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Dunfell patch review 07/11] ceres-solver: prevent fetching git hook during do_configure
Date: Mon,  5 Apr 2021 07:54:20 -0700
Message-Id: <4178447710d7a36badf2323e8cf3039a5cbaf3a1.1617634345.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617634345.git.akuster808@gmail.com>
References: <cover.1617634345.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

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
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/ceres-solver/ceres-solver_1.14.0.bb   | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
index ac463038aac..105610be5aa 100644
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
2.17.1

