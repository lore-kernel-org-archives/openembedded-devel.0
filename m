Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.239.1617899817175134149
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 09:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JPOkGdNV;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: akuster808@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id x187-20020a4a41c40000b02901b664cf3220so645631ooa.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 09:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=AZrys87HiYGYZPWmCoY1qSxj2sYvXg9hg70T665/dCM=;
        b=JPOkGdNVZwpdxfHpzT52j/s/dWH5FifnyhgmHATx3mdx880TQINMaPj54Wfdp+hcBg
         8SH3GCjr7++Ih7Z761wm0IBJ10F4dRwLhqV+eFum8GHcK/YoVt5w8jsPKZ7VfQsvztlg
         BbExcrIuQ29OdG1WrPuriiAa80RLD6GWRdBX7sYX5769BVZjaYBDZAZ39J8sF+6dSdzz
         X+ITboDuVN6xK3+wsZOJevbZ6tbLkJwXIyU/O8RlnzZA3vmf2JewmFwd0Pofq36neEhc
         g0CEL2aMKmbepGkJqyvaU5JO2VX35IpbzQ2IpNJnwO0dxFxvHbwVLBhV+9VruQu0FWyz
         jFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=AZrys87HiYGYZPWmCoY1qSxj2sYvXg9hg70T665/dCM=;
        b=QgP8C+U5kF5M2fSZawjWKKX8HiFxEbSgV//1Ow8zQ8LIKHgBSmP1TZ9P/elbZU0mnM
         QPYjH2q0WYIlFEGJKiezYg/HQPZBxybThWH3aRAUkjGOaOET+qfoz1aUiW1TDsBiEw9D
         DKpgpwbTBYzHrmWF5YQAIewoMgGn/S2t0Faga2zLgkkjWFsPznNFZlCkmKwnWP8A5rx7
         YRk/2PCI3dH5mjhPMb15D/pK5fqlVLj1MUe/mHrlMJV1w99dtrBGLyQUQjJJ2kwGMsck
         2cRY2hXY+6lljkq5M1XjEbWbZaKINr++FZv//U37Jt9S1qsSpHwSn4ZRgp0DE9AUOl/I
         m0Xw==
X-Gm-Message-State: AOAM532tddf98uF5BAOox9IP7quzBnL+AqwHpYNR+hLj8A4Hg2C164tk
	23umdaWnb9irFFVafaB1psBPuWa60LQ=
X-Google-Smtp-Source: ABdhPJwg6VnWd1XSmhHszBYCtTYb82n7FylkAX4GSbW663qPJPJQ83Pa7ikPWhFnxpeoQJdgl/1NTw==
X-Received: by 2002:a4a:a5cc:: with SMTP id k12mr8235894oom.37.1617899816400;
        Thu, 08 Apr 2021 09:36:56 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id s131sm4977838oib.14.2021.04.08.09.36.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:36:56 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 47/64] python3-docutils: Upgrade 0.16 -> 0.17
Date: Thu,  8 Apr 2021 09:35:54 -0700
Message-Id: <155b9d8de55d8fb19335fd8b14cd025436f48dd0.1617899100.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617899100.git.akuster808@gmail.com>
References: <cover.1617899100.git.akuster808@gmail.com>

From: Leon Anavi <leon.anavi@konsulko.com>

Upgrade to release 0.17:

- Installing with setup.py now requires setuptools. Alternatively,
  install with pip.
- The generic command line front end tool docutils-cli.py allows
  the free selection of reader, parser, and writer components.
- New, experimental wrapper to integrate the recommonmark Markdown
  parser for use with Docutils.
- pseudoxml-writer got a --detailled option for pretty printing
  text nodes.
- odf/odt-writer improved metadata handling.
- HTML5 writer improvements.
- LaTeX writer improvements.
- Fixes in Arabic mappings and Korean translations.
- directives: Prevent infinte inclusion loops.

License-Update: Fix link to 2-Clause BSD license in COPYING.txt.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
(cherry picked from commit a2964529ec9d7b4a8e9233ec7d7bb66eb9942edc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../{python3-docutils_0.16.bb => python3-docutils_0.17.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-docutils_0.16.bb => python3-docutils_0.17.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-docutils_0.16.bb b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-docutils_0.16.bb
rename to meta-python/recipes-devtools/python/python3-docutils_0.17.bb
index 44b7320cbb5..8605e93b52f 100644
--- a/meta-python/recipes-devtools/python/python3-docutils_0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-docutils_0.17.bb
@@ -2,9 +2,8 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "https://pypi.org/project/docutils/"
 SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & GPL-2.0 & Python-2.0"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
 
-SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
-SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
+SRC_URI[sha256sum] = "e2ffeea817964356ba4470efba7c2f42b6b0de0b04e66378507e3e2504bbff4c"
 
 inherit pypi setuptools3
-- 
2.17.1

