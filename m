Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.1307.1616604446382217343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 09:47:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kJJ6KPQZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id jy13so33984998ejc.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 09:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3XT02vPkF2dJJYR9456o0vJVEZvJpBQLYzCFbk+Xj8o=;
        b=kJJ6KPQZhUoDi/h4a5cjFDJPlwbb0IXMkWWu6hG1W5Q0puGfKWO+VC4xKXM3MyFrOZ
         UhYyGsc3H60xuY9yccpB7NO/2JQ1XXJbhyNvzVHfpifPEp4k8J8M29LFJhp5lgAEAJNo
         6OTb6hFGlVLVz4DgPleeyoZ2XwKR8eNKKx8bgxP4pnJm38zlVAEkSV6zlmKo1+8hxy4k
         PJBba06RPVyelmOqUBrZvm6tMQzhxU4aP+UUTCKFNO/E8sCuJ6wY55jcs3N5S+yebINh
         yGXX8rYeCpo4ChjfttJA8Lyo3gGgwi4Kt7uEwuiUaf+/75RrhFPKjqL4TkBjKYn2jdL4
         nzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3XT02vPkF2dJJYR9456o0vJVEZvJpBQLYzCFbk+Xj8o=;
        b=nFWxiIuar/LaCcK+QxUUdoSvvvZtQogzgoHjsWKnr3OH9vAUybVwVTT1UUp1UeWSD1
         MO4M8nvFdCCzsfsqQoaHf/0J3UFZdxzB836rVqTGHVWXH1nhDX2QDAMtTtmdIN9ZaK3Z
         4sksaDias1wcxMLqn10SLLDOMcnKCdQYyaktg4xGeRHXfnH9YdGLlZOMRgOlp+KXoB4r
         9flzF1CH+T0XC+jhGvol3D9CVdYBzajOBc7AFB8/TKUAJ55Xxj2E2NaJRHCorxRF4UzO
         oPwyXv/xEDqfT1qaJv3oQgM4aw4qVU/plsjSG2NSksLsVboWJcBah7jIC+2K1FcZC0sA
         XR9A==
X-Gm-Message-State: AOAM530WviGKGLPksPcwScz9crzz9CX6lB2+PeWWrt5opM9CmiE+07Op
	xdHQrY9JGYE540jqG3YRKGx0IT2jR88=
X-Google-Smtp-Source: ABdhPJxFlhgGcKdoZ9cYK/J89QDvzSOZ9+YMz0GqTFHRPYo8rIxv+MBHTcz7hMRRmrnEZ2s6FAqrTw==
X-Received: by 2002:a17:906:719b:: with SMTP id h27mr4645133ejk.123.1616604444833;
        Wed, 24 Mar 2021 09:47:24 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w18sm1181985ejn.23.2021.03.24.09.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 09:47:24 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][gatesgarth][PATCH 1/3] ceres-solver: prevent fetching git hook during do_configure
Date: Wed, 24 Mar 2021 17:47:20 +0100
Message-Id: <20210324164722.390705-1-Martin.Jansa@gmail.com>
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

