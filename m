Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.10664.1617328737159163495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OMoSbW2i;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id s11so2720314pfm.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ymVIt08BRhEE1ai6JFlS63Dgjq7AlSPeycHkRgbZ3GI=;
        b=OMoSbW2isYr38iNPHy/0FanCUT72/Z6u87mspaPmQF0Yv/YtaenAPP7vuy99apEpbG
         oQFiUYlZpqSC72CDBr7TJWVXK+mfj7dHSSNuGY5YKddUO4syRm11rxxQ9EFphlyOnZs3
         1umX0VisjTU8ihGSAHNkpO89R3MZaZQpL/ZxfbwiiAjHdvj1WmSOrKzL9cw1XU6ds/gw
         NTu+W2q3wIM6yLTtdj9iP/91Owt0/86OZcspdJmV4f6uqKK4tsFkiP6OdG5Qh0mrftzc
         Tqa0mZahIeb37REna4uZfcYnmPgikNQeLD2cW6r7q9SmboZpz41rn97BuI0QhhBWS62t
         oGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ymVIt08BRhEE1ai6JFlS63Dgjq7AlSPeycHkRgbZ3GI=;
        b=Yrzo/v4bzGWUEfm9+fQ1fU6JX6FSbsiktDttuoQedGQbRRc7ntpFSL8JMoQeAaJ/x3
         zi3CDz8ctKQ2riC1YilThn4rtpQ8naT52gZzLaP20lY7lrBvK/TSkVZUPKCAaT/TvUxG
         RKi3/Z7L8KFmIUCyosIbjY0HAwlMGJTLANX9ILNPc1Uzr0EMtM853seHx1tu/kq0P1BF
         iV1xDsVE4enm8g0hpZGqtLAu/vwRfy1YzAsCwQQPj/blw1M6uHCkH2Nip2Koh0hOt9NB
         CEjGxC2O6o+dZa1FRvCN+cBpcrqHQkdvFIAlAFrq/m/0/eGIVzqUil0E07zeXgPvUNd5
         JqpQ==
X-Gm-Message-State: AOAM5310eHQIb7SzyZRyZhdD12EzaohSsi2jtaqz+TtPdz2oPRVhIvWh
	veEZqjb0aems08hITl7/2sNQU19qvxA=
X-Google-Smtp-Source: ABdhPJybnTpv6W5hc0lvjsQg1ubQrjplho7BrqyPEsJqz/fwZsdAQ4g+QmmL4IMjYhzPkmF2NLKciA==
X-Received: by 2002:a62:7c17:0:b029:1f1:9ef7:163a with SMTP id x23-20020a627c170000b02901f19ef7163amr10063658pfc.51.1617328736511;
        Thu, 01 Apr 2021 18:58:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 11/14] ceres-solver: prevent fetching git hook during do_configure
Date: Thu,  1 Apr 2021 18:58:39 -0700
Message-Id: <fc9256806479e99cef9a89ee4a27d4c895ebaa8e.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

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

