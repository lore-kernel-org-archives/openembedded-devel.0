Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.19671.1621261510137594011
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 May 2021 07:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZgxaRmEk;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id m124so4737389pgm.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7nbdfbOPE8TXD3d13jFySlMIQe+oYAchw3V1tesKTSQ=;
        b=ZgxaRmEklGXetbQZ/bTBfXhGHtUXNu6TVX+enSNVI4VXiX4D4GCCr7duv9LBcbQf7F
         KeaWqFpuQtfbXf2p4OGf4Yk2qA/l6rZ4Cv1f5VV4+8UN/gJZ95+TD6pY7mB/bioOY3wF
         FdqGa0O3/uSQtRqU4SGX5zYTd1l+FbOC3Kqv37Z4k+COSqOl503oygKM2i8liKf/pBGr
         jM7zpvDcZMsFgpRNCWJgJCYHsnaRlFcI0JSLfu/anAMZmCc717RN6QQjw7sNnKqfVGMA
         Y29PYAEiyzSe6w/aRHS5uaGgcQ2kvEkf2aJADUfqJuXn4WfF8ftfzsdZ4SdV/Y15VOdC
         HbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7nbdfbOPE8TXD3d13jFySlMIQe+oYAchw3V1tesKTSQ=;
        b=NzUozHZ9VkYsGXQEBdaxr0mqVAGrtQE2i3rTCi0a3TIho38hIkwolFlh9MNNur4fnH
         s0zGMf1SGcDBM3Nxpbdk/lvnj/3YAFB+rItGqxuYzKqMElp+eTMxLpFCNQINHCINgX/+
         JiOHUFpfXi8IJrMmLXBlQkz/rpsk6xkum0iVl6Kc45jnU4Ttq5gjtZ1aM5YQSQw8wTmh
         aZvyo/yig/927VcVOY3yCYWioJ0lJEESlZnY+bSq2yETyj1ukWNEJBDfEJrcYkuyc9HP
         l+/bWRfuG0Qjh9UctF36ozl76uXfQ5ZgThPwUQnPyyqgCDPTv4GWqRUXz0h3lPmo8LAN
         9iZA==
X-Gm-Message-State: AOAM533hYZe6nwjuhMEHQgW1VEdOMLpp9MNFCtJDg72YASfA7WDhnLee
	CkNBADV3izBGOPuFX9sPr43+Q8UQWWc=
X-Google-Smtp-Source: ABdhPJwJczOXaViaL3Oc7Y4DW+wTT8z9CGDoopTiao/XkkKG/k/Z5O3nHUzY6gt8tqQYEnRj4nq27w==
X-Received: by 2002:a63:1e55:: with SMTP id p21mr24745716pgm.412.1621261509504;
        Mon, 17 May 2021 07:25:09 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:e1a5:920e:5720:62fe])
        by smtp.gmail.com with ESMTPSA id s16sm10872008pga.5.2021.05.17.07.25.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:25:08 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 02/11] ufw: fix python shebang
Date: Mon, 17 May 2021 07:24:55 -0700
Message-Id: <c7150fc61dab6783d31664caa46264e8ee4c1086.1621261426.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1621261426.git.akuster808@gmail.com>
References: <cover.1621261426.git.akuster808@gmail.com>

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
(cherry picked from commit 5194af1afd6b1e834af52e9b38d5ae6e19c637b0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.17.1

