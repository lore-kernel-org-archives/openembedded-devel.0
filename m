Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.38986.1628871924537033369
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Aug 2021 09:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o9hR4ESI;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: jatedev@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id a12so8711429qtb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Aug 2021 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUaKAzDBHHTxCIZ09WSUpY5vGzWLpOstGXpkmAmDZnI=;
        b=o9hR4ESIb0OcjlDvw8yRf3kYIbY6k7QPhJKZ3i8wOp7mwucbCzCQBsXUKCnT5jO9cy
         3HMUuWtWR+GMUBg9cPonJbC2M3udeqXafKyhUr+Q3z047d9MykvyHCeSRWoQb+qhfwX/
         y7SM4C1pCddd/gEUJhyh9LI4+30wOAi12TYguSa4Fg9uiNsl4UwZqbIGWQoZ85ro7ViT
         u7YXB+FVJA++wmuGh8ez1o0tB62nYZteKPI/VB/xjMvlt1VDnLvLBvhb4ly2A/glg3PB
         ruOrVe8DoZyGs6vv0fcL1kNah7XTua7Xj3OQclAkTQ1gkkvdTM9/MMCjINn3ciadKlFO
         e30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZUaKAzDBHHTxCIZ09WSUpY5vGzWLpOstGXpkmAmDZnI=;
        b=prtfbvLzZQU5gyeuP/VVnWwHTLd63AhjchSHzWHX8YAfxCESjchA78vmn9pxNNesRo
         XrMPXI3E1CDUXXGqypj+scc8Uwcoax8hWpc4hVFvQOkCyBo5WMJ5uHudGW2zycNYfhyk
         gJV3YTUQatedqNY5tAsXtPCt5Ndzz1W8tbdkVVK1Q+kYVJALKNOJI3lkAIj5MsVAF65R
         LUKyFMRLR2K4wMimIu34vNJYQWVkPyZSWi+MM1ryF6REpuc/fuNeJtPd/K5nCWZ00uU8
         JwxrVA/qQXPZgYwzBDSw2L1pW2DVfP0N1KM2BmTajmHJpzFOTx3EYKvy+qDle53lJlrz
         tfEg==
X-Gm-Message-State: AOAM533z0DK50fbPyx0YoabvXmE8b2SYc9V4Myn24oEzKM9KYWrcyMg8
	CN7HLqzSepJ5zXGgd3DNRfTOJZGWVGI=
X-Google-Smtp-Source: ABdhPJw3/CwufXBdl6sg5eE+FLKRLw5Oq943vM3h3HWmB2eLvRh8o2hKYWJwiGz0eOV6Va3JbplWAQ==
X-Received: by 2002:ac8:7556:: with SMTP id b22mr2772585qtr.64.1628871923338;
        Fri, 13 Aug 2021 09:25:23 -0700 (PDT)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id b21sm1023992qtt.91.2021.08.13.09.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:25:22 -0700 (PDT)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Nakamura.Kenta@bp.MitsubishiElectric.co.jp,
	akuster808@gmail.com
Cc: Jate Sujjavanich <jatedev@gmail.com>
Subject: [meta-networking][dunfell][PATCH] ufw: Fix interpreter for installed ufw and test ufw
Date: Fri, 13 Aug 2021 16:20:47 +0000
Message-Id: <20210813162047.20015-1-jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Revert patch to setup-only-make-one-reference-to-env.patch and make
patch for python3 interpreter fix apply to runs of setup.py during
self test as well as installs.

Reported-by: Kenta Nakamura <Nakamura.Kenta@bp.MitsubishiElectric.co.jp>
Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 ...to-detect-openembedded-python-interpreter.patch |  8 ++++----
 .../ufw/setup-only-make-one-reference-to-env.patch | 14 ++------------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch b/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
index 85d51ca21..e1fcf0ca5 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/Add-code-to-detect-openembedded-python-interpreter.patch
@@ -1,7 +1,7 @@
 Add code to detect openembedded python interpreter
 
-OE does not use /usr/bin/env as part of the interpreter, so it does not
-update ufw with the interpreter name.
+OE does not use /usr/bin/env as part of the interpreter, Instead, it's a
+full path in sys.executable.
 
 Upstream-Status: Inappropriate (Embedded)
 Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
@@ -17,9 +17,9 @@ index 75c1105..3f9a5e0 100644
                               "-i.jjm",
                               "1s%^#.*python.*%#! " + sys.executable + "%g",
                               'staging/ufw'])
-+        elif '-native/python' in sys.executable and \
++        elif '/python' in sys.executable and \
 +            os.path.basename(sys.executable) in ['python', 'python3']:
-+            print("Detected oe native python " + os.path.basename(sys.executable))
++            print("Detected full path " + sys.executable + ". substituting " + os.path.basename(sys.executable))
 +            subprocess.call(["sed",
 +                             "-i.jjm",
 +                            "1s%python$%"
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
index f487a6fd6..ff704b5a4 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
@@ -14,10 +14,6 @@ detected or specified on the build line.
 Upstream-Status: Inappropriate [ embedded specific ]
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-Added conditional to handle sys.executable without env on python3
-
-Signed-off-by Jate Sujjavanich <jatedev@gmail.com>
 ---
  setup.py | 34 ++++++++++++++++++++++++++++------
  1 file changed, 28 insertions(+), 6 deletions(-)
@@ -47,7 +43,7 @@ index b13d11c..73acdef 100644
          # Now byte-compile everything
          super(Install, self).run()
  
-@@ -107,12 +112,29 @@ class Install(_install, object):
+@@ -107,12 +112,23 @@ class Install(_install, object):
          for f in [ script, manpage, manpage_f ]:
              self.mkpath(os.path.dirname(f))
  
@@ -66,13 +62,7 @@ index b13d11c..73acdef 100644
 -                         'staging/ufw'])
 +        print("Updating staging/ufw to use (%s)" % (sys.executable))
 +
-+        if not re.search("(/usr/bin/env)", sys.executable):
-+            print("Did not find 'env' in sys.executable (%s)" % (sys.executable))
-+            subprocess.call(["sed",
-+                             "-i",
-+                             "1s%^#.*python.*%#! /usr/bin/env " + sys.executable + "%g",
-+                             'staging/ufw'])
-+        elif re.search("(/usr/bin/env)", sys.executable):
++        if re.search("(/usr/bin/env)", sys.executable):
 +            print("found 'env' in sys.executable (%s)" % (sys.executable))
 +            subprocess.call(["sed",
 +                             "-i.jjm",
-- 
2.25.1

