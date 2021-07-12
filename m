Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.5813.1626055717886021379
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RG6VWiM7;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: jatedev@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 77so14746631qkk.11
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jul 2021 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ik6WdCJF41SVattEv6WI0qdZa93AOI0ai3aTI6cXQMA=;
        b=RG6VWiM7lKMvzX6t2XJv9k3yexpTevjvli8MzFphdr20SihEHbjtKgTkFWlPC17plE
         NFIb+blqK9J0VqllI+EmkIgl1f01TrqKT7exQb76DryHm8WTWpCy6t5/IHP8Kgbw6la/
         jM3Y1eZeQRdepbI+LR7LwruM3lFYvIyP3EsfkVwPGnY6Vbfp+rQgQ4XWca7MTovl6Rtd
         rXu8dZOuTfk3zMw3e8HwSuyNuOqQ6duo3z6vTSdnWop7nRl7ALU9VNlTJxekbsvajgUL
         83dNIxzihZQSWmEaKotqueJd2Gh/4fMIEcxAv2Cy+OhtbwgW4wObXMg1FOzOe6KO10X4
         U/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ik6WdCJF41SVattEv6WI0qdZa93AOI0ai3aTI6cXQMA=;
        b=rV9A9kN47XNPn8nZ7jqLcAlWGFEitRX5vQxuQWoF9fQNgb95u99xugRziuZ+UB9vJr
         ERIYVEdehZ0rC9rJ/uuxdCCd2BLaiewXoyGfIGHSy3NbOjZ+FKTb+mZkinxybHQ/BLj0
         46j0XfCjz6Ai0W0PTzb38uzoTL8CiLC29vn9NbmPvPBbdi+DS2HooAfRd03iaIOa3BNv
         u1pNfnHyo3gWdn0pLDhrlbfmoKymIg1gEn7p8iOuYEgADomWhtCVUgk5/KsYltBTY7qN
         XUklU8EYQTag2xvRlZgHD+eDSb/ySX00OsWn1/9ObgxhEuLb4WrE022KIqjUAl1LDaCo
         55Mg==
X-Gm-Message-State: AOAM530m9kxdBRejBoUYc4otS4osqxJfEJVNyPxFx9GduYBXoBhadMOM
	sGvTXbRUTL9c9HP2Ow4/dR5ueyE4LHg=
X-Google-Smtp-Source: ABdhPJyiUW2obnZ1euIlseK01ChMxIB3FzRfsDuV8iFetPgEenKx4LlMdOG+RC4juFvJWRu49dulQA==
X-Received: by 2002:a37:4096:: with SMTP id n144mr48911720qka.271.1626055716705;
        Sun, 11 Jul 2021 19:08:36 -0700 (PDT)
Return-Path: <jatedev@gmail.com>
Received: from localhost.localdomain ([63.148.217.19])
        by smtp.gmail.com with ESMTPSA id u12sm2906419qke.58.2021.07.11.19.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 19:08:36 -0700 (PDT)
From: "Jate Sujjavanich" <jatedev@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com
Subject: [meta-networking][dunfell][PATCH 1/2] ufw: bump version to 0.36 and add services
Date: Mon, 12 Jul 2021 02:08:18 +0000
Message-Id: <666258028fe30ecc46e97db1d15448d9addd3ad2.1626055148.git.jatedev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626055148.git.jatedev@gmail.com>
References: <cover.1626055148.git.jatedev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit brings the version of ufw up to 0.36 since version 0.33
had some problems:
* The setup.py calls sed to replace some variables in the source
code with the correct paths. However, this is done using a hardcoded
path and conflicts with distutils
* The python shebang was not properly corrected in setup.py, leading
to a script that only run if there is a python symlink to python2 or
python3

The first issue is addressed by the bump in version, while the second
one is fixed in patch 0003 of the recipe.

Also, the new version provides examples for systemd service and
sysvinit scripts to autostart ufw. These are added into the recipe
now.

Signed-off-by: Silcet <camorga1@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
(cherry-picked from commit 0a0894b)
---
 .../ufw/ufw/0001-optimize-boot.patch          |  37 ++++--
 ...option-to-specify-iptables-location.patch} |  41 +++---
 .../ufw/ufw/0002-lp1044361.patch              | 118 ------------------
 .../ufw/ufw/0003-fix-typeerror-on-error.patch |  20 ---
 .../0003-only-make-one-reference-to-env.patch |  73 +++++++++++
 .../ufw/ufw/0004-lp1039729.patch              |  40 ------
 .../ufw/ufw/0005-lp1191197.patch              |  32 -----
 ...setup-only-make-one-reference-to-env.patch |  77 ------------
 .../ufw/{ufw_0.33.bb => ufw_0.36.bb}          |  33 +++--
 9 files changed, 140 insertions(+), 331 deletions(-)
 rename meta-networking/recipes-connectivity/ufw/ufw/{setup-add-an-option-to-specify-iptables-location.patch => 0002-add-an-option-to-specify-iptables-location.patch} (87%)
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
 delete mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
 rename meta-networking/recipes-connectivity/ufw/{ufw_0.33.bb => ufw_0.36.bb} (65%)

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch b/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch
index a1e56b7ca..28068bba1 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch
@@ -1,18 +1,31 @@
-Author: Jamie Strandboge <jamie@canonical.com>
-Description: to improve boot speed when disabled, don't source all of
- ufw-init-functions (which also sources in other files).
+From 92fcdbc1a57086e4decc1597217c0739dc16342a Mon Sep 17 00:00:00 2001
+From: Silcet <camorga1@gmail.com>
+Date: Tue, 27 Apr 2021 05:34:59 +0000
+Subject: [PATCH] Author: Jamie Strandboge <jamie@canonical.com>
+Description:
+to improve boot speed when disabled, don't source all of  ufw-init-functions
+(which also sources in other files).
 
 Upstream-Status: Inappropriate [ not author ]
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
 
-Index: ufw-0.31/src/ufw-init
-===================================================================
---- ufw-0.31.orig/src/ufw-init	2012-03-09 17:07:11.000000000 -0600
-+++ ufw-0.31/src/ufw-init	2012-03-17 09:37:51.000000000 -0500
-@@ -18,6 +18,12 @@
- #
- set -e
+The patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded) as of commit id
+2cc1bd9dd060f5002c2fde7aacba86fe230c12af.
+
+Signed-off-by: Silcet <camorga1@gmail.com>
+---
+ src/ufw-init | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/ufw-init b/src/ufw-init
+index 3505a02..dde37f0 100755
+--- a/src/ufw-init
++++ b/src/ufw-init
+@@ -31,6 +31,12 @@ if [ "$1" = "--datadir" ] && [ -s "$2" ]; then
+ fi
+ export DATA_DIR="$datadir"
  
 +# Debian/Ubuntu: small boot speed improvement
 +. "#CONFIG_PREFIX#/ufw/ufw.conf"
@@ -20,6 +33,6 @@ Index: ufw-0.31/src/ufw-init
 +    exit 0
 +fi
 +
- if [ -s "#STATE_PREFIX#/ufw-init-functions" ]; then
-     . "#STATE_PREFIX#/ufw-init-functions"
+ if [ -s "${rootdir}#STATE_PREFIX#/ufw-init-functions" ]; then
+     . "${rootdir}#STATE_PREFIX#/ufw-init-functions"
  else
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch b/meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch
similarity index 87%
rename from meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch
rename to meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch
index 511742338..884fa1647 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0002-add-an-option-to-specify-iptables-location.patch
@@ -1,6 +1,6 @@
-From c54d36d0582a60fd281cd9287077cea205fd849d Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Thu, 27 Nov 2014 15:20:34 -0500
+From 808577f8464f542076840d0d93fe168a5f79442c Mon Sep 17 00:00:00 2001
+From: Silcet <camorga1@gmail.com>
+Date: Tue, 27 Apr 2021 05:40:03 +0000
 Subject: [PATCH] setup: add an option to specify iptables location
 
 When cross-compiling it isn't certain that the location of iptables on the
@@ -13,15 +13,21 @@ version of iptables to be used.
 Upstream-Status: Pending
 
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+The patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded) as of commit id
+2cc1bd9dd060f5002c2fde7aacba86fe230c12af.
+
+Signed-off-by: Silcet <camorga1@gmail.com>
 ---
- setup.py | 69 ++++++++++++++++++++++++++++++++++++----------------------------
- 1 file changed, 39 insertions(+), 30 deletions(-)
+ setup.py | 65 ++++++++++++++++++++++++++++++++------------------------
+ 1 file changed, 37 insertions(+), 28 deletions(-)
 
 diff --git a/setup.py b/setup.py
-index 6fb3751..b13d11c 100644
+index 09204d3..2343bc9 100644
 --- a/setup.py
 +++ b/setup.py
-@@ -225,41 +225,50 @@ shutil.copytree('src', 'staging')
+@@ -246,41 +246,50 @@ shutil.copytree('src', 'staging')
  os.unlink(os.path.join('staging', 'ufw-init'))
  os.unlink(os.path.join('staging', 'ufw-init-functions'))
  
@@ -43,14 +49,6 @@ index 6fb3751..b13d11c 100644
 -        if iptables_exe != "":
 -            break
 -
--
--if iptables_exe == '':
--    print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
--    sys.exit(1)
--
--for e in ['ip6tables', 'iptables-restore', 'ip6tables-restore']:
--    if not os.path.exists(os.path.join(iptables_dir, e)):
--        print("ERROR: could not find required binary '%s'" % (e), file=sys.stderr)
 +if "--iptables-dir" in sys.argv:
 +    iptables_dir = sys.argv[sys.argv.index("--iptables-dir") + 1]
 +    iptables_exe = os.path.join(iptables_dir, "iptables")
@@ -70,10 +68,16 @@ index 6fb3751..b13d11c 100644
 +                    print("Found '%s'" % iptables_exe)
 +                else:
 +                    continue
-+
+ 
+-if iptables_exe == '':
+-    print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
+-    sys.exit(1)
 +            if iptables_exe != "":
 +                break
-+
+ 
+-for e in ['ip6tables', 'iptables-restore', 'ip6tables-restore']:
+-    if not os.path.exists(os.path.join(iptables_dir, e)):
+-        print("ERROR: could not find required binary '%s'" % (e), file=sys.stderr)
 +    if iptables_exe == '':
 +        print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
          sys.exit(1)
@@ -102,6 +106,3 @@ index 6fb3751..b13d11c 100644
  
  setup (name='ufw',
        version=ufw_version,
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch b/meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
deleted file mode 100644
index 804c18bc9..000000000
--- a/meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-Origin: r795, r796
-Description: move netfilter capabilities checking into initcaps(), and call
- initcaps() only when we need it.
-Bug-Ubuntu: https://launchpad.net/bugs/1044361
-
-Upstream-Status: Inappropriate [ not author ]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-Index: ufw-0.33/src/backend_iptables.py
-===================================================================
---- ufw-0.33.orig/src/backend_iptables.py	2012-09-23 09:58:34.000000000 -0500
-+++ ufw-0.33/src/backend_iptables.py	2012-09-23 09:58:36.000000000 -0500
-@@ -160,6 +160,9 @@
-             out += "> " + _("Checking raw ip6tables\n")
-             return out
- 
-+        # Initialize the capabilities database
-+        self.initcaps()
-+
-         args = ['-n', '-v', '-x', '-L']
-         items = []
-         items6 = []
-@@ -470,6 +473,9 @@
-         if self.dryrun:
-             return False
- 
-+        # Initialize the capabilities database
-+        self.initcaps()
-+
-         prefix = "ufw"
-         exe = self.iptables
-         if v6:
-@@ -684,6 +690,9 @@
-         except Exception:
-             raise
- 
-+        # Initialize the capabilities database
-+        self.initcaps()
-+
-         chain_prefix = "ufw"
-         rules = self.rules
-         if v6:
-@@ -830,6 +839,10 @@
-         * updating user rules file
-         * reloading the user rules file if rule is modified
-         '''
-+
-+        # Initialize the capabilities database
-+        self.initcaps()
-+
-         rstr = ""
- 
-         if rule.v6:
-@@ -1073,6 +1086,9 @@
-         if self.dryrun:
-             return
- 
-+        # Initialize the capabilities database
-+        self.initcaps()
-+
-         rules_t = []
-         try:
-             rules_t = self._get_logging_rules(level)
-Index: ufw-0.33/src/backend.py
-===================================================================
---- ufw-0.33.orig/src/backend.py	2012-09-23 09:58:34.000000000 -0500
-+++ ufw-0.33/src/backend.py	2012-09-23 09:59:03.000000000 -0500
-@@ -21,7 +21,7 @@
- import stat
- import sys
- import ufw.util
--from ufw.util import warn, debug
-+from ufw.util import error, warn, debug
- from ufw.common import UFWError, config_dir, iptables_dir, UFWRule
- import ufw.applications
- 
-@@ -68,6 +68,17 @@
-             err_msg = _("Couldn't determine iptables version")
-             raise UFWError(err_msg)
- 
-+        # Initialize via initcaps only when we need it (LP: #1044361)
-+        self.caps = None
-+
-+    def initcaps(self):
-+        '''Initialize the capabilities database. This needs to be called
-+           before accessing the database.'''
-+
-+        # Only initialize if not initialized already
-+        if self.caps != None:
-+            return
-+
-         self.caps = {}
-         self.caps['limit'] = {}
- 
-@@ -78,14 +89,20 @@
-         # Try to get capabilities from the running system if root
-         if self.do_checks and os.getuid() == 0 and not self.dryrun:
-             # v4
--            nf_caps = ufw.util.get_netfilter_capabilities(self.iptables)
-+            try:
-+                nf_caps = ufw.util.get_netfilter_capabilities(self.iptables)
-+            except OSError as e:
-+                error("initcaps\n%s" % e)
-             if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
-                 self.caps['limit']['4'] = True
-             else:
-                 self.caps['limit']['4'] = False
- 
-             # v6
--            nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
-+            try:
-+                nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
-+            except OSError as e:
-+                error("initcaps\n%s" % e)
-             if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
-                 self.caps['limit']['6'] = True
-             else:
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch b/meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
deleted file mode 100644
index b259fdf78..000000000
--- a/meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Origin: r797
-Description: src/backend_iptables.py: fix misplaced parenthesis
-
-Upstream-Status: Inappropriate [ not author ]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-Index: ufw-0.33/src/backend_iptables.py
-===================================================================
---- ufw-0.33.orig/src/backend_iptables.py	2012-09-24 08:51:13.000000000 -0500
-+++ ufw-0.33/src/backend_iptables.py	2012-09-24 08:52:00.000000000 -0500
-@@ -1075,7 +1075,7 @@
-             exe = self.ip6tables
-         (rc, out) = cmd([exe] + args)
-         if rc != 0:
--            err_msg = _("Could not perform '%s'") % (args)
-+            err_msg = _("Could not perform '%s'" % (args))
-             if fail_ok:
-                 debug("FAILOK: " + err_msg)
-             else:
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch b/meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
new file mode 100644
index 000000000..556d4459d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0003-only-make-one-reference-to-env.patch
@@ -0,0 +1,73 @@
+From 42170d379eddc12bd2d1fe84dc268882d8eb4d64 Mon Sep 17 00:00:00 2001
+From: Silcet <camorga1@gmail.com>
+Date: Mon, 3 May 2021 08:59:28 +0000
+Subject: [PATCH] setup: only make one reference to env
+
+If sys.executable happens to be '/usr/bin/env python' or something
+similar, the setup script will result in 'ufw' getting /usr/bin/env
+repeated on the top line.  This causes an error at runtime.  Perform a
+quick sanity check on sys.executable before doing the substitution.
+
+While we're at it, change the default value of 'exe' to the one we either
+detected or specified on the build line.
+
+Upstream-Status: Inappropriate [ embedded specific ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+The patch was imported from the OpenEmbedded git server
+(git://git.openembedded.org/openembedded) as of commit id
+2cc1bd9dd060f5002c2fde7aacba86fe230c12af.
+
+A previous change had modified the way the python shebang was updated to
+follow the same version as the one used to call setup.py. However, it
+used a regex that was not matching anymore. To fix this, the regex
+condition is removed so the shebang line is substituted with the sys.executable
+value. Later in the installation distutils finds the string with the path
+of sys.executable and replaces it with "#! /usr/bin/env python3".
+
+Signed-off-by: Silcet <camorga1@gmail.com>
+---
+ setup.py | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 2343bc9..f8a638b 100644
+--- a/setup.py
++++ b/setup.py
+@@ -64,7 +64,7 @@ class Install(_install, object):
+         real_sharedir = os.path.join(real_prefix, 'share', 'ufw')
+ 
+         # Update the modules' paths
+-        for fn in [ 'common.py' ]:
++        for fn in [ 'common.py', 'util.py' ]:
+             # 'staging' is used with just 'install' but build_lib is used when
+             # using 'build'. We could probably override 'def build()' but this
+             # at least works
+@@ -97,6 +97,12 @@ class Install(_install, object):
+                                  "-i",
+                                  "s%#SHARE_DIR#%" + real_sharedir + "%g",
+                                  f])
++                                
++                subprocess.call(["sed",
++                                 "-i.jjm",
++                                 "s%/sbin/iptables%" + iptables_exe + "%g",
++                                 f])
++
+ 
+                 if fn == 'common.py' and 'UFW_SKIP_CHECKS' in os.environ and \
+                    os.environ['UFW_SKIP_CHECKS'] != '':
+@@ -123,10 +129,12 @@ class Install(_install, object):
+             self.mkpath(os.path.dirname(f))
+ 
+         # update the interpreter to that of the one the user specified for setup
++        # Distutils searches for the string of sys.executable and replaces it 
++        # with the "#! /usr/bin/env pythonX" shebang on a later step
+         print("Updating staging/ufw to use %s" % (sys.executable))
+         subprocess.call(["sed",
+                          "-i",
+-                         "1s%^#.*python.*%#! /usr/bin/env " + sys.executable + "%g",
++                         "1s%/.*python.*%" + sys.executable + "%g",
+                          'staging/ufw'])
+         self.copy_file('staging/ufw', script)
+         self.copy_file('doc/ufw.8', manpage)
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch b/meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
deleted file mode 100644
index 695b26567..000000000
--- a/meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Origin: r803, r804
-Description: Don't call get_netfilter_capabilities() with ipv6 if ipv6 is
- disabled.
-Bug-Ubuntu: https://launchpad.net/ufw/bugs/1039729
-
-Upstream-Status: Inappropriate [ not author ]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-Index: ufw-0.33/src/backend.py
-===================================================================
---- ufw-0.33.orig/src/backend.py	2012-12-04 09:21:57.000000000 -0600
-+++ ufw-0.33/src/backend.py	2012-12-04 09:22:40.000000000 -0600
-@@ -98,15 +98,17 @@
-             else:
-                 self.caps['limit']['4'] = False
- 
--            # v6
--            try:
--                nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
--            except OSError as e:
--                error("initcaps\n%s" % e)
--            if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
--                self.caps['limit']['6'] = True
--            else:
--                self.caps['limit']['6'] = False
-+            # v6 (skip capabilities check for ipv6 if ipv6 is disabled in ufw
-+            # because the system may not have ipv6 support (LP: #1039729)
-+            if self.use_ipv6():
-+                try:
-+                    nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
-+                except OSError as e:
-+                    error("initcaps\n%s" % e)
-+                if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
-+                    self.caps['limit']['6'] = True
-+                else:
-+                    self.caps['limit']['6'] = False
- 
-     def is_enabled(self):
-         '''Is firewall configured as enabled'''
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch b/meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
deleted file mode 100644
index b760d3fd3..000000000
--- a/meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Origin: r816
-Description: add check for -m rt --rt-type 0
-Bug-Ubuntu: https://launchpad.net/bugs/1191197
-Forwarded: yes
-
-Upstream-Status: Inappropriate [ not author ]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
-
-Index: ufw-0.33/tests/check-requirements
-===================================================================
---- ufw-0.33.orig/tests/check-requirements	2012-08-17 16:12:49.000000000 -0500
-+++ ufw-0.33/tests/check-requirements	2013-06-15 07:47:00.000000000 -0500
-@@ -3,7 +3,7 @@
- # check-requirements: verify all the required iptables functionality is
- # available
- #
--# Copyright 2008-2012 Canonical Ltd.
-+# Copyright 2008-2013 Canonical Ltd.
- #
- #    This program is free software: you can redistribute it and/or modify
- #    it under the terms of the GNU General Public License version 3,
-@@ -218,6 +218,9 @@
-             echo -n "icmpv6 with hl ($j): "
-             runcmd $exe -A $c -p icmpv6 --icmpv6-type $j -m hl --hl-eq 255 -j ACCEPT
-         done
-+
-+        echo -n "ipv6 rt: "
-+        runcmd $exe -A $c -m rt --rt-type 0 -j ACCEPT
-     fi
- 
-     echo ""
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
deleted file mode 100644
index ff704b5a4..000000000
--- a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From be53eea06a5655fdc98f47a73be8277b65bb42ed Mon Sep 17 00:00:00 2001
-From: Joe MacDonald <joe_macdonald@mentor.com>
-Date: Tue, 11 Nov 2014 21:41:14 -0500
-Subject: [PATCH] setup: only make one reference to env
-
-If sys.executable happens to be '/usr/bin/env python' or something
-similar, the setup script will result in 'ufw' getting /usr/bin/env
-repeated on the top line.  This causes an error at runtime.  Perform a
-quick sanity check on sys.executable before doing the substitution.
-
-While we're at it, change the default value of 'exe' to the one we either
-detected or specified on the build line.
-
-Upstream-Status: Inappropriate [ embedded specific ]
-
-Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
----
- setup.py | 34 ++++++++++++++++++++++++++++------
- 1 file changed, 28 insertions(+), 6 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index b13d11c..73acdef 100644
---- a/setup.py
-+++ b/setup.py
-@@ -64,7 +64,7 @@ class Install(_install, object):
-         real_sharedir = os.path.join(real_prefix, 'share', 'ufw')
- 
-         # Update the modules' paths
--        for file in [ 'common.py' ]:
-+        for file in [ 'common.py', 'util.py' ]:
-             print("Updating " + file)
-             subprocess.call(["sed",
-                              "-i",
-@@ -91,6 +91,11 @@ class Install(_install, object):
-                              "s%#SHARE_DIR#%" + real_sharedir + "%g",
-                              os.path.join('staging', file)])
- 
-+            subprocess.call(["sed",
-+                             "-i.jjm",
-+                             "s%/sbin/iptables%" + iptables_exe + "%g",
-+                             os.path.join('staging', file)])
-+
-         # Now byte-compile everything
-         super(Install, self).run()
- 
-@@ -107,12 +112,23 @@ class Install(_install, object):
-         for f in [ script, manpage, manpage_f ]:
-             self.mkpath(os.path.dirname(f))
- 
-+        # if sys.executable == /usr/bin/env python* the result will be the top
-+        # of ufw getting:
-+        #
-+        #  #! /usr/bin/env /usr/bin/env python
-+        #
-+        # which is not ideal
-+        #
-         # update the interpreter to that of the one the user specified for setup
--        print("Updating staging/ufw to use %s" % (sys.executable))
--        subprocess.call(["sed",
--                         "-i",
--                         "1s%^#.*python.*%#! /usr/bin/env " + sys.executable + "%g",
--                         'staging/ufw'])
-+        print("Updating staging/ufw to use (%s)" % (sys.executable))
-+
-+        if re.search("(/usr/bin/env)", sys.executable):
-+            print("found 'env' in sys.executable (%s)" % (sys.executable))
-+            subprocess.call(["sed",
-+                             "-i.jjm",
-+                             "1s%^#.*python.*%#! " + sys.executable + "%g",
-+                             'staging/ufw'])
-+
-         self.copy_file('staging/ufw', script)
-         self.copy_file('doc/ufw.8', manpage)
-         self.copy_file('doc/ufw-framework.8', manpage_f)
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
similarity index 65%
rename from meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
rename to meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
index 42fc26258..8e35dc01e 100644
--- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.36.bb
@@ -1,3 +1,4 @@
+
 SUMMARY = "Uncomplicated Firewall"
 DESCRIPTION = "UFW stands for Uncomplicated Firewall, and is program for \
 managing a netfilter firewall. It provides a command line interface and aims \
@@ -7,23 +8,18 @@ SECTION = "net"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
-SRC_URI = " \
-           https://launchpad.net/ufw/0.33/0.33/+download/ufw-0.33.tar.gz \
-           file://setup-add-an-option-to-specify-iptables-location.patch \
-           file://setup-only-make-one-reference-to-env.patch \
+SRC_URI = "https://launchpad.net/ufw/0.36/0.36/+download/ufw-0.36.tar.gz \
            file://0001-optimize-boot.patch \
-           file://0002-lp1044361.patch \
-           file://0003-fix-typeerror-on-error.patch \
-           file://0004-lp1039729.patch \
-           file://0005-lp1191197.patch \
-"
+           file://0002-add-an-option-to-specify-iptables-location.patch \
+           file://0003-only-make-one-reference-to-env.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://launchpad.net/ufw"
 
-SRC_URI[md5sum] = "3747b453d76709e5a99da209fc0bb5f5"
-SRC_URI[sha256sum] = "5f85a8084ad3539b547bec097286948233188c971f498890316dec170bdd1da8"
+SRC_URI[md5sum] = "6d8ab1506da21ae003f4628f93d05781"
+SRC_URI[sha256sum] = "754b22ae5edff0273460ac9f57509c3938187e0cf4fb9692c6a02833fff33cfc"
 
-inherit setuptools3 features_check
+inherit setuptools3 features_check systemd update-rc.d
 
 RDEPENDS_${PN} = " \
                   iptables \
@@ -43,6 +39,19 @@ RRECOMMENDS_${PN} = " \
                      kernel-module-nf-recent \
 "
 
+do_install_append() {
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/doc/systemd.example ${D}${systemd_unitdir}/system/ufw.service
+
+    install -d ${D}${sysconfdir}/init.d/
+    install -m 0755 ${S}/doc/initscript.example ${D}${sysconfdir}/init.d/ufw
+}
+
+SYSTEMD_SERVICE_${PN} = "ufw.service"
+
+INITSCRIPT_NAME = "ufw"
+INITSCRIPT_PARAMS = "defaults"
+
 # Certain items are explicitly put under /lib, not base_libdir when installed.
 #
 FILES_${PN} += " \
-- 
2.25.1

