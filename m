Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.3614.1619494134589826239
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 20:28:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KxL25pFx;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id m11so40422155pfc.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 20:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBXa59e/jXXQCsZ9ShvJE+26tAReHBkG32xAaV128CE=;
        b=KxL25pFxyoxcaQ5nb4m/uF6OG+xZEPcKuqTbi4IjYduBKPlJPD8IBpneHgmJIdCJwF
         /GumRz013576/R75m67EfYD0w4MWEfgve/cCmIO3LDx6OmJo/5Exp6Ec1n6Oq2Tn78Ny
         EGWwPH66BhYFt+oFjNDSFP/SF2nShHuFrLeBrFdPsYtz0zVgON57WktlAiidansor9PP
         5IvAwFpS+G3bNaK9ikFKnnRClvprlBEcjSf4XVDYXuJ2nOME8o2pd4GdRkk2ByJUhgA0
         mnX2J2TauXlz4mwXIVRTuJ7X+I3T58zqk4eM3L11xtgAl2g0eO4wOCyfeIf8M1XQQUgx
         jrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BBXa59e/jXXQCsZ9ShvJE+26tAReHBkG32xAaV128CE=;
        b=M/SsAUoDcaVofpdF8+UwL401ta4t9GWF64fuwDmHwUEojqm3LccLTFp3Da9wiTRHZx
         MxfywnvURy3GD36gmBILFxqs0ZjhDx0LljXfuGRISpPeEhRAMAOMGNpVgzos244sS6uJ
         74QkYpeaxbQtCjeDzeo5TnCcgg4dHkkomVjibEtPmMHVIFCtLkALM4H7+AKgmAQOx0Lv
         VR0f1FH4MgyYJZBJaWcP5WDyd1gv4Zc4pT/pLOk/3OyYoijMG/C1QstyByEeYHl/cwRV
         EhwTAGHglPeRq8jhhhkQn0KKuySRLeZfsh3U6HxjxsFwZlHEGIWHakgz8A7bZNigY5Gg
         7eeA==
X-Gm-Message-State: AOAM531+zuxYAhK7NWjnMoBIih2C0RXeZXY17nD6t07AMzPXjrxssL9M
	cb2vgvYI5y+DnyhshY8+6OQeXohVjRSC6A==
X-Google-Smtp-Source: ABdhPJySZ8GI0qswsbcn85dJXEo7RnssZdjX+H6we1cK4ro8fEYyHB3x1GfDdS6zzdUgXmN9eXb/Zg==
X-Received: by 2002:a63:d456:: with SMTP id i22mr12229571pgj.204.1619494133735;
        Mon, 26 Apr 2021 20:28:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ef3])
        by smtp.gmail.com with ESMTPSA id c125sm944231pfa.74.2021.04.26.20.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Apr 2021 20:28:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Silcet <camorga1@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ufw: fix python shebang
Date: Mon, 26 Apr 2021 20:28:50 -0700
Message-Id: <20210427032850.4087312-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210427032850.4087312-1-raj.khem@gmail.com>
References: <20210427032850.4087312-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Silcet <camorga1@gmail.com>

[meta-openembedded ticket #327] --
https://github.com/openembedded/meta-openembedded/issues/327

The python version in the shebang at the begining of the ufw script
should be the same one as the version the setup.py script was called
with.

The fix in patch "setup-only-make-one-reference-to-env.patch"
depends on sys.executable returning "/usr/bin/env pythonX". However,
it returns "/usr/bin/pythonX". Using sys.version_info we can get the
major version of the python used to called the script and append
that to the shebang line so it works as intended.

Signed-off-by: Silcet <camorga1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...fix-dynamic-update-of-python-shebang.patch | 57 +++++++++++++++++++
 .../recipes-connectivity/ufw/ufw_0.33.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch b/meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch
new file mode 100644
index 0000000000..0bb0315ccd
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/fix-dynamic-update-of-python-shebang.patch
@@ -0,0 +1,57 @@
+From b961a7fceb5654c283c3f987bee593d52abaf1f5 Mon Sep 17 00:00:00 2001
+From: Silcet <camorga1@gmail.com>
+Date: Mon, 26 Apr 2021 07:47:02 +0000
+Subject: [PATCH] ufw: Fix dynamic update of python shebang
+
+[meta-openembedded ticket #327] -- https://github.com/openembedded/meta-openembedded/issues/327
+
+The python version in the shebang at the begining of the ufw script
+should be the same one as the version the setup.py script was called
+with.
+
+The fix in patch "setup-only-make-one-reference-to-env.patch"
+depends on sys.executable returning "/usr/bin/env pythonX". However,
+it returns "/usr/bin/pythonX". Using sys.version_info we can get the
+major version of the python used to called the script and append
+that to the shebang line so it works as intended.
+
+Upstream-status: Pending
+
+Signed-off-by: Silcet <camorga1@gmail.com>
+---
+ setup.py | 21 ++++++---------------
+ 1 file changed, 6 insertions(+), 15 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index ca730b7..941bbf6 100644
+--- a/setup.py
++++ b/setup.py
+@@ -112,22 +112,13 @@ class Install(_install, object):
+         for f in [ script, manpage, manpage_f ]:
+             self.mkpath(os.path.dirname(f))
+ 
+-        # if sys.executable == /usr/bin/env python* the result will be the top
+-        # of ufw getting:
+-        #
+-        #  #! /usr/bin/env /usr/bin/env python
+-        #
+-        # which is not ideal
+-        #
+         # update the interpreter to that of the one the user specified for setup
+-        print("Updating staging/ufw to use (%s)" % (sys.executable))
+-
+-        if re.search("(/usr/bin/env)", sys.executable):
+-            print("found 'env' in sys.executable (%s)" % (sys.executable))
+-            subprocess.call(["sed",
+-                             "-i.jjm",
+-                             "1s%^#.*python.*%#! " + sys.executable + "%g",
+-                             'staging/ufw'])
++        python_major = sys.version_info.major
++        print("Updating staging/ufw to use (python%s)" % (python_major))
++        subprocess.call(["sed",
++                         "-i.jjm",
++                         "1s%^#.*python.*%#! " + sys.executable + "%g",
++                         'staging/ufw'])
+ 
+         self.copy_file('staging/ufw', script)
+         self.copy_file('doc/ufw.8', manpage)
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
index 42fc262589..ee366aa665 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
            file://0003-fix-typeerror-on-error.patch \
            file://0004-lp1039729.patch \
            file://0005-lp1191197.patch \
+           file://fix-dynamic-update-of-python-shebang.patch \
 "
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
-- 
2.31.1

