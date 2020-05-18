Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.43850.1589813417223497596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rzQdiLof;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id u22so4313059plq.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=E1/SRsip2hngb069WN/a01r71kbpTWltH8DTy9Qaf+4=;
        b=rzQdiLof5EywHMCzUn0D1Cf3oHwfH7/kt4U7VrCgzFUR73cO/Ou2noZhkzoeXhxuLa
         FnwY3CXE8KSjZWUoBtxlWtTEkSmx9GJoaDkAgHMJaqI5tzWedXSMIxa8KeSg8Op3ZAD4
         28Qj5ZWS9edbv7FsHIA1hWavpHbWW39oz1BJN3a0HaIi8c10iktcg0VaI80vFCI6AcNn
         DML9vegeCjmD4q3fvtqlRtA0hbvrbz2mwq4N7tKnwexOYT50Znykc34F7ocolb9/XXoW
         U//BjTugkCmaWkcM5pacJTdleWCHHcanZUsR5yNX5/q1DsrO8SEhi1zM9J2y9c9ATzHb
         j3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=E1/SRsip2hngb069WN/a01r71kbpTWltH8DTy9Qaf+4=;
        b=BuINmawPJEcf6ZhDi5aLaV6iu4M4PeZ8Fy0RJD36gExBVEp3aFrswOu5wR9Naf9pvQ
         LxIbO7OO1JryfEUp3UMjGu9BnyD2BokW7M6UUAniJuRYjRVC3OeIlUWRo935iznc77ts
         72zY5dG1PzKdBjRpYSROR0bQpnVo1SQRENOU04b4IKKMfC4Z7dCy88Z7bBW964POA35/
         f/i1jwPPMrA2IuWeL3fm2BzgzSi1Fki4WhDBxhE4eJGMi9wur1l4lDPWG4rlHcoY6K7K
         5Rar1/XPElJ46z1y+Jg1MtMT3mFTwZ80pk6oQOcbzLClVVCDmlvCHlJVGU4VnTWGH63J
         fYVw==
X-Gm-Message-State: AOAM532DDk5fm+trGffPxbGB5vXPkYBRDHUEIhn9A/jmwHHEfqvpJc/3
	Jgq8MP1TSIRQkUzzWVSDXlbNgy59
X-Google-Smtp-Source: ABdhPJxcq+ahXWAYyxgyLGguUR0DsC4prFQiJx51ZHyfYKDlQQN+0yLi4km3m2rq/Kq3mrMXWzliqA==
X-Received: by 2002:a17:90a:c296:: with SMTP id f22mr20219968pjt.137.1589813416474;
        Mon, 18 May 2020 07:50:16 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:15 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/57] python3-markdown: add logging and setuptools to RDEPENDS
Date: Mon, 18 May 2020 07:49:15 -0700
Message-Id: <6740bf60955638d7e0ddf39c17184e342c1f9da7.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Importing the markdown module causes standard ModuleNotFoundErrors
if the logging and pkg_resources modules are unavailable:

root@qemux86-64:~# python3
Python 3.8.2 (default, Apr 27 2020, 08:51:00)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import markdown
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
File "/usr/lib64/python3.8/site-packages/markdown/_init_.py", line 25, in <module>
from .core import Markdown, markdown, markdownFromFile
File "/usr/lib64/python3.8/site-packages/markdown/core.py", line 27, in <module>
import logging
ModuleNotFoundError: No module named 'logging'

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 17426020a8c296986857511e85e3551207db857d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb b/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
index 68cd723acc..cdfe5496ad 100644
--- a/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-markdown_3.0.1.bb
@@ -10,3 +10,5 @@ SRC_URI[md5sum] = "72219f46ca440b657bf227500731bdf1"
 SRC_URI[sha256sum] = "d02e0f9b04c500cde6637c11ad7c72671f359b87b9fe924b2383649d8841db7c"
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "${PYTHON_PN}-logging ${PYTHON_PN}-setuptools"
-- 
2.17.1

