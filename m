Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F9EC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:55:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.11852.1700153738284915293
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:55:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gsT1ifjM;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9e28724ac88so146268866b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700153736; x=1700758536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8R2M5Zxe0QZp7zYTWc0SulCxNmz2jIHza80EvtmKTw=;
        b=gsT1ifjMFUTfm+eblQkQEXLwWQWUFTuBUekCTzoFDKybA1VBeJW5EpcF6ajgzvhJ4A
         HAHNw6vJPcuz4mNilHEtQ5dl/Z8FkA16xpgi0YeePOBqMD22ZPPm5qjPWvLbyJdF79iP
         emAP9sqGkD0dIcbsmfwAZZPbIZ3U+hI8uy4iSqeTdcVPZd1OuRjDgqvraTb/EVElKSjM
         uAg5F7rfJdZHQODFRjp/mD00Ckm0l+ZUGbevzdqNxQkP2GxDHxo7GsfqAMgr7IjF7vXH
         pytsqmMOF68USNFA6pfoJc6FzEtWk4ey6/HcSSb/9siHyOgiW26LQc6GR+XvVVBHIGuy
         uWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700153736; x=1700758536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8R2M5Zxe0QZp7zYTWc0SulCxNmz2jIHza80EvtmKTw=;
        b=ikZZNGm80xMvzNjIefj2wDk/GkleMEw6CbzsbWqzc/LFLyho+hu1PWYgrXY0feAeJL
         3Ty27xPTydUQBqs3FpXqRe3Pcp+FBgn5WB3vEgghpLALe8lmhUq02Nrd1z2TdauEX5h3
         CxXq2NVKMRKmoWzbl/En5zNYHH2ak8v3U7vwuEliD2GzWYpDdbHmGaKGSzfetDWD4eSB
         GFbaya71sAYDECDFUxQkL/9K5HLsra/qiANJw/kS5CpjLbFPriy8jFG9lpg6VeZsYNXO
         f159CB29sy8VjhMGBoHHx5KtMeRqtV14KS9cEQXJ3pcQOmf4bGTKt7PMOnbCSQW4DG+C
         PDZQ==
X-Gm-Message-State: AOJu0Yz8E/BKiqMNAyC3TY1b1LWw/bInExjIuzAxC3j00UaAfTm4FpnD
	t7hoTNmnBMXsPqW68EDLKhfmzhkgYDZXYA==
X-Google-Smtp-Source: AGHT+IGBNTZoMST66JbO3RZNZIOSkY9JwvKheZxgnSlclRTVa/U71KWECcfok9nI3atYFcpj0FYC5A==
X-Received: by 2002:a17:906:1602:b0:9c3:b3cb:29ae with SMTP id m2-20020a170906160200b009c3b3cb29aemr11929421ejd.47.1700153735954;
        Thu, 16 Nov 2023 08:55:35 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id lc12-20020a170906dfec00b009920e9a3a73sm8680888ejc.115.2023.11.16.08.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:55:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] cloc: upgrade 1.94 -> 1.98
Date: Thu, 16 Nov 2023 19:55:27 +0300
Message-Id: <20231116165527.1196891-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106818

Changelog:

- New Languages: Cairo, Carbon, Circom, Containerfile, HolyC, kvlang, Nunjucks, OpenSCAD, P4, Pest, Pony, TEAL, WGSL
- New switch --diff-list-files to run diff given two list files
- Handle comments embedded in OCaml strings
- Write empty JSON and XML structures if the inputs yield zero counts
- Support for long paths on Windows
- Better support for building and running Docker image on Windows
- Better output file names when running with --count-and-diff and --out;
- Resolve internal file handle conflict when running --diff with --sdir or --categorized

- New Languages: Asymptote, CoCoA 5, Constraint Grammar, Hare, Jai, Linker Script, NetLogo, Typst
- Added .editorconfig as an INI extension.
- Added .cppm, .ixx, .ccm, .cxxm, .c++m as C++ extensions.
- Improved handling of trailing slash with --match-d
- --exclude-list-file with --git now works as expected.
- --not-match-d, --not-match-f can now be repeated.
- --quiet mode is now enabled when STDOUT is not a terminal. This makes for cleaner output when piping to other programs.
- New switch --include-content=regex to only count files whose content matches the given regex.
- New switch --only-count-files to only count files. Counts for blank, comment, and code lines will be zero.
- --no-recurse now works on Windows
- Improved exclusion of autogenerated files on Windows.
- Improved handling of path separators with git in PowerShell.
- Resolve nondeterministic --diff output.
- --hide-rate supports all output file types
- Fixed --diff-list-file with unknown listed file.
- Fixed parsing of verbose option in the cloc configuration file.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 meta-oe/recipes-devtools/cloc/{cloc_1.94.bb => cloc_1.98.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_1.94.bb => cloc_1.98.bb} (85%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.94.bb b/meta-oe/recipes-devtools/cloc/cloc_1.98.bb
similarity index 85%
rename from meta-oe/recipes-devtools/cloc/cloc_1.94.bb
rename to meta-oe/recipes-devtools/cloc/cloc_1.98.bb
index 37a21cc3a..ea5f00669 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.94.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.98.bb
@@ -5,7 +5,7 @@ LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
 SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "08212290c4e9b21c7bb1abc0a9b4a365ce1c5eb0d8f3ebb74d50b29559a71a9c"
+SRC_URI[sha256sum] = "5fe0b159eb75718df7308a4f61470eaddf82170733929999e37a3fbb4651cf8a"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 
-- 
2.25.1


