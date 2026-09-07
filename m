Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970EFC79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 04:26:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27602.1788755199863262998
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 21:26:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FHQn056Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso2961458a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 21:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755199; x=1789359999; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=icmuinX9//mJxIKVWcJv3L9tPp5grv/qlwdMHAS7ZaY=;
        b=FHQn056Y9gJShefm6AAK3nkXvHL11wP4E4l5Hr38/im9bIP/0pIP1w7Ew9PmLolFeB
         4wI3hdIpBcxeP/FQ4y58tfmWlHxA8BEEFOzECpJKKirUqD/SRwj7PBhsKTM50jEETvbQ
         THIQSJMIJiz8Q9hbnltVF33+tnyOUo0UAuzN9c9YJzLzrqv9jM7iHvNcyWkoHqwyeT5y
         yQ9yBoJsTUuglHO6a7QCqGogfA74j+kASICtfW1BmtAjSn3UGcbIFUGcuj8wDXlUeEH3
         x7LVZkiGuKtplktHtVuqGwu5cmH7u/xj1IsFbfVhPUOjzc6bSaey5gI2OqESKH3cRIEs
         rJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755199; x=1789359999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=icmuinX9//mJxIKVWcJv3L9tPp5grv/qlwdMHAS7ZaY=;
        b=a8VI1497awPPAlbumLDPBFYigb/lHy27LghjtG+AkPfLUrMpWyrcq8o2/o6U4SF2B/
         m+mS3uCT+93QI07li7tPnveAoWCG0IV6IgA9XGVQ3eux9dbClEBR/AzB7JFheMFVEHdV
         E/AL5SNHo5zYr4AR7ZSALFAfSqTBIW7rqmTxXae0eOTySTxxWOuTlDW/RaF+JQlUx1TC
         70bfZAUHKhUzGYzZ5Z7WiubVoREywTPV0I8ZYRJwewIiMq1BSglvAsBj3gGHKOMydCga
         Fm2qFm4ZYslSf7rdNnCDtxUaIP2UrZm4PLejQnMP/nW59tMpbcORYYX43mggLHFXkX2w
         StGg==
X-Gm-Message-State: AFuF++kEbJfUooCzt4Rgt4z7wQaJo+ea0CkD1UfQGp3lb7KOMC4zzvKc
	3SiXHor+kRczEoW4av0UwGpW5OJ1hU+yRh9O3YSTvBLycxYP4UAz3IHDvlwPuA==
X-Gm-Gg: AYBFou119x8fffx6BQ/1L/MXLR7GjyukafhU7/5w8niMDgJEJUTp66qQWwY4P9dJoCH
	GzVI5EKOXY9rd30DAqy2PFTDogvBNjjqvBI8Y47SdpL5s+YW+O6Pt2PSiY30C5ffgKxnRXNZ3gI
	GGCtV1fCrMR13PaFSa6hnJxcx+fVcxJcCnv6e+aAv05uiP6FMwWCqJfzLyAkxZsUthAYLEGnKsq
	/yqO/IYbOOFjR3Mrf7gqG11hjhTYDsjE64AJYB7SgUYlqzJp949qlj14zNDRA5aEgma9BfJpFhT
	e6aHhijaCaVorM1tZTfTRMSavvx/a4fvoP4mZBGism3ggdfJBAI+JljxOBY3Pt8cnbXi5Fpozcw
	DN68hzZPmJcKbBwMSMp37ROrcOFi8Q7tNXWjUhicqqPbiU3/lypRfAT0EaCccw7JAZwTM33gNNO
	2HzzfiHcEwcUc+C1URZ5SvQftHzsDMA4c9LB8GRWNRE088XxD/7DinQ7WVALcTmMuh3Gx8cEnGl
	GzBkw76xZN128lxL/Nhr4nwcpR1SuJ9JfbGlLTWj1dd0FEzwSKHyjXnM3yfTN4r/Gq4UCVFWEIS
	/JRas77D5nWd1E+Ki3L11L2IAX0zjzGxUXwOxO3fI7R2ig0tCyeW0Di5nsyV4F44NkWntmsPEWG
	ITJV60Eh9oneKn7Im9zgibtWkJ6D3JTBnbFEK41USHcM6xtBQvISVBJ93
X-Received: by 2002:a17:90b:3c45:b0:398:9beb:5c19 with SMTP id 98e67ed59e1d1-39b26232bb1mr32287101a91.20.1788755199132;
        Sun, 06 Sep 2026 21:26:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432423f99fsm21954206c88.1.2026.09.06.21.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:26:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] assimp: Do not treat warnings as errors
Date: Sun,  6 Sep 2026 21:26:35 -0700
Message-ID: <20260907042636.1476474-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 04:26:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129800

ASSIMP_WARNINGS_AS_ERRORS defaults to ON, which builds the library with
-Wall -Werror. That leaves the build at the mercy of whatever a new
compiler adds to -Wall: clang 23 enables -Wunused-template there, and the
bundled openddlparser copy carries a template that is never called, so the
build fails with

  contrib/openddlparser/code/DDLNode.cpp:34:20: error: unused function
  template 'releaseDataType' [-Werror,-Wunused-template]

Neither assimp master nor openddl-parser upstream has removed that dead
template, and there is no pending pull request for it, so there is nothing
to backport. Debian, Fedora, Arch and Alpine all turn this option off
rather than patch individual warnings; do the same, which also keeps the
next addition to -Wall from breaking the build again.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/assimp/assimp_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/assimp/assimp_git.bb b/meta-oe/recipes-graphics/assimp/assimp_git.bb
index b2d7a573de..561ef50508 100644
--- a/meta-oe/recipes-graphics/assimp/assimp_git.bb
+++ b/meta-oe/recipes-graphics/assimp/assimp_git.bb
@@ -25,6 +25,7 @@ EXTRA_OECMAKE = "\
     -DCMAKE_INSTALL_LIBDIR=${baselib} \
     -DCMAKE_SKIP_RPATH=ON \
     -DCMAKE_BUILD_WITH_INSTALL_RPATH=OFF \
+    -DASSIMP_WARNINGS_AS_ERRORS=OFF \
 "

 do_install:append() {

