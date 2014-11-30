Return-Path: <joe@deserted.net>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1C87204C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 20:40:07 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id z20so7988310igj.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 12:40:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id;
	bh=OEyYkwdozQkjwx4bOejcWXicwUPivwgBCkVmGfJ45ls=;
	b=G0+VfBgadW0tSUuavWYy1SIGa9Y50IY1fk2DrM3OsbhfyrDf+3AJJkPB5MULB6c58e
	QyHhCAUHcNWvahzO9keksok3Iiy3xwo+PapkFmzdP2w9Oa4UIVVdYcf4jYidwsr5D20F
	DU9RN7inW01vp8d+SSi7ZYoBfayKmXXsBQKDVnQKa226go7cEa8mGbdPQ6ygsLkHOF3p
	UAZ9yt+w2GFDHkeg30S3uBL3dXPuKHdVOm33w0SArDOjytvPNZGxFvP4j+tZdYH/a1ah
	qaigoWnfZ3nQN9IVtYyyKii8CKsgDQ7Y+ZB5u2T0P5IjXde2cO1Ren5EHSQH1r/TwTZi
	As9A==
X-Gm-Message-State: ALoCoQnBesTkfELRPk/4gN1gtyH95+YspA31k4eAd47di4BHBinPqkAt9vvQj9+/C7SoDYJPtAdh
X-Received: by 10.42.103.7 with SMTP id k7mr6058499ico.33.1417380008351;
	Sun, 30 Nov 2014 12:40:08 -0800 (PST)
Received: from mir.deserted.net (24-246-4-250.cable.teksavvy.com.
	[24.246.4.250])
	by mx.google.com with ESMTPSA id m2sm8441756ioi.10.2014.11.30.12.40.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 12:40:07 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 15:40:31 -0500
Message-Id: <1417380031-11647-1-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] ufw: Uncomplicated Firewall recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Nov 2014 20:40:13 -0000

Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 .../ufw/ufw/0001-optimize-boot.patch               |  25 +++++
 .../ufw/ufw/0002-lp1044361.patch                   | 118 +++++++++++++++++++++
 .../ufw/ufw/0003-fix-typeerror-on-error.patch      |  20 ++++
 .../ufw/ufw/0004-lp1039729.patch                   |  40 +++++++
 .../ufw/ufw/0005-lp1191197.patch                   |  32 ++++++
 ...dd-an-option-to-specify-iptables-location.patch | 107 +++++++++++++++++++
 .../ufw/setup-only-make-one-reference-to-env.patch |  77 ++++++++++++++
 .../recipes-connectivity/ufw/ufw_0.33.bb           |  45 ++++++++
 8 files changed, 464 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
 create mode 100644 meta-networking/recipes-connectivity/ufw/ufw_0.33.bb

diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch b/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch
new file mode 100644
index 0000000..a1e56b7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0001-optimize-boot.patch
@@ -0,0 +1,25 @@
+Author: Jamie Strandboge <jamie@canonical.com>
+Description: to improve boot speed when disabled, don't source all of
+ ufw-init-functions (which also sources in other files).
+
+Upstream-Status: Inappropriate [ not author ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+Index: ufw-0.31/src/ufw-init
+===================================================================
+--- ufw-0.31.orig/src/ufw-init	2012-03-09 17:07:11.000000000 -0600
++++ ufw-0.31/src/ufw-init	2012-03-17 09:37:51.000000000 -0500
+@@ -18,6 +18,12 @@
+ #
+ set -e
+ 
++# Debian/Ubuntu: small boot speed improvement
++. "#CONFIG_PREFIX#/ufw/ufw.conf"
++if [ "$1" = "start" ] && [ "$2" = "quiet" ] && [ "$ENABLED" = "no" ]; then
++    exit 0
++fi
++
+ if [ -s "#STATE_PREFIX#/ufw-init-functions" ]; then
+     . "#STATE_PREFIX#/ufw-init-functions"
+ else
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch b/meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
new file mode 100644
index 0000000..804c18b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0002-lp1044361.patch
@@ -0,0 +1,118 @@
+Origin: r795, r796
+Description: move netfilter capabilities checking into initcaps(), and call
+ initcaps() only when we need it.
+Bug-Ubuntu: https://launchpad.net/bugs/1044361
+
+Upstream-Status: Inappropriate [ not author ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+Index: ufw-0.33/src/backend_iptables.py
+===================================================================
+--- ufw-0.33.orig/src/backend_iptables.py	2012-09-23 09:58:34.000000000 -0500
++++ ufw-0.33/src/backend_iptables.py	2012-09-23 09:58:36.000000000 -0500
+@@ -160,6 +160,9 @@
+             out += "> " + _("Checking raw ip6tables\n")
+             return out
+ 
++        # Initialize the capabilities database
++        self.initcaps()
++
+         args = ['-n', '-v', '-x', '-L']
+         items = []
+         items6 = []
+@@ -470,6 +473,9 @@
+         if self.dryrun:
+             return False
+ 
++        # Initialize the capabilities database
++        self.initcaps()
++
+         prefix = "ufw"
+         exe = self.iptables
+         if v6:
+@@ -684,6 +690,9 @@
+         except Exception:
+             raise
+ 
++        # Initialize the capabilities database
++        self.initcaps()
++
+         chain_prefix = "ufw"
+         rules = self.rules
+         if v6:
+@@ -830,6 +839,10 @@
+         * updating user rules file
+         * reloading the user rules file if rule is modified
+         '''
++
++        # Initialize the capabilities database
++        self.initcaps()
++
+         rstr = ""
+ 
+         if rule.v6:
+@@ -1073,6 +1086,9 @@
+         if self.dryrun:
+             return
+ 
++        # Initialize the capabilities database
++        self.initcaps()
++
+         rules_t = []
+         try:
+             rules_t = self._get_logging_rules(level)
+Index: ufw-0.33/src/backend.py
+===================================================================
+--- ufw-0.33.orig/src/backend.py	2012-09-23 09:58:34.000000000 -0500
++++ ufw-0.33/src/backend.py	2012-09-23 09:59:03.000000000 -0500
+@@ -21,7 +21,7 @@
+ import stat
+ import sys
+ import ufw.util
+-from ufw.util import warn, debug
++from ufw.util import error, warn, debug
+ from ufw.common import UFWError, config_dir, iptables_dir, UFWRule
+ import ufw.applications
+ 
+@@ -68,6 +68,17 @@
+             err_msg = _("Couldn't determine iptables version")
+             raise UFWError(err_msg)
+ 
++        # Initialize via initcaps only when we need it (LP: #1044361)
++        self.caps = None
++
++    def initcaps(self):
++        '''Initialize the capabilities database. This needs to be called
++           before accessing the database.'''
++
++        # Only initialize if not initialized already
++        if self.caps != None:
++            return
++
+         self.caps = {}
+         self.caps['limit'] = {}
+ 
+@@ -78,14 +89,20 @@
+         # Try to get capabilities from the running system if root
+         if self.do_checks and os.getuid() == 0 and not self.dryrun:
+             # v4
+-            nf_caps = ufw.util.get_netfilter_capabilities(self.iptables)
++            try:
++                nf_caps = ufw.util.get_netfilter_capabilities(self.iptables)
++            except OSError as e:
++                error("initcaps\n%s" % e)
+             if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
+                 self.caps['limit']['4'] = True
+             else:
+                 self.caps['limit']['4'] = False
+ 
+             # v6
+-            nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
++            try:
++                nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
++            except OSError as e:
++                error("initcaps\n%s" % e)
+             if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
+                 self.caps['limit']['6'] = True
+             else:
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch b/meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
new file mode 100644
index 0000000..b259fdf
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0003-fix-typeerror-on-error.patch
@@ -0,0 +1,20 @@
+Origin: r797
+Description: src/backend_iptables.py: fix misplaced parenthesis
+
+Upstream-Status: Inappropriate [ not author ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+Index: ufw-0.33/src/backend_iptables.py
+===================================================================
+--- ufw-0.33.orig/src/backend_iptables.py	2012-09-24 08:51:13.000000000 -0500
++++ ufw-0.33/src/backend_iptables.py	2012-09-24 08:52:00.000000000 -0500
+@@ -1075,7 +1075,7 @@
+             exe = self.ip6tables
+         (rc, out) = cmd([exe] + args)
+         if rc != 0:
+-            err_msg = _("Could not perform '%s'") % (args)
++            err_msg = _("Could not perform '%s'" % (args))
+             if fail_ok:
+                 debug("FAILOK: " + err_msg)
+             else:
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch b/meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
new file mode 100644
index 0000000..695b265
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0004-lp1039729.patch
@@ -0,0 +1,40 @@
+Origin: r803, r804
+Description: Don't call get_netfilter_capabilities() with ipv6 if ipv6 is
+ disabled.
+Bug-Ubuntu: https://launchpad.net/ufw/bugs/1039729
+
+Upstream-Status: Inappropriate [ not author ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+Index: ufw-0.33/src/backend.py
+===================================================================
+--- ufw-0.33.orig/src/backend.py	2012-12-04 09:21:57.000000000 -0600
++++ ufw-0.33/src/backend.py	2012-12-04 09:22:40.000000000 -0600
+@@ -98,15 +98,17 @@
+             else:
+                 self.caps['limit']['4'] = False
+ 
+-            # v6
+-            try:
+-                nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
+-            except OSError as e:
+-                error("initcaps\n%s" % e)
+-            if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
+-                self.caps['limit']['6'] = True
+-            else:
+-                self.caps['limit']['6'] = False
++            # v6 (skip capabilities check for ipv6 if ipv6 is disabled in ufw
++            # because the system may not have ipv6 support (LP: #1039729)
++            if self.use_ipv6():
++                try:
++                    nf_caps = ufw.util.get_netfilter_capabilities(self.ip6tables)
++                except OSError as e:
++                    error("initcaps\n%s" % e)
++                if 'recent-set' in nf_caps and 'recent-update' in nf_caps:
++                    self.caps['limit']['6'] = True
++                else:
++                    self.caps['limit']['6'] = False
+ 
+     def is_enabled(self):
+         '''Is firewall configured as enabled'''
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch b/meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
new file mode 100644
index 0000000..b760d3f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/0005-lp1191197.patch
@@ -0,0 +1,32 @@
+Origin: r816
+Description: add check for -m rt --rt-type 0
+Bug-Ubuntu: https://launchpad.net/bugs/1191197
+Forwarded: yes
+
+Upstream-Status: Inappropriate [ not author ]
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+
+Index: ufw-0.33/tests/check-requirements
+===================================================================
+--- ufw-0.33.orig/tests/check-requirements	2012-08-17 16:12:49.000000000 -0500
++++ ufw-0.33/tests/check-requirements	2013-06-15 07:47:00.000000000 -0500
+@@ -3,7 +3,7 @@
+ # check-requirements: verify all the required iptables functionality is
+ # available
+ #
+-# Copyright 2008-2012 Canonical Ltd.
++# Copyright 2008-2013 Canonical Ltd.
+ #
+ #    This program is free software: you can redistribute it and/or modify
+ #    it under the terms of the GNU General Public License version 3,
+@@ -218,6 +218,9 @@
+             echo -n "icmpv6 with hl ($j): "
+             runcmd $exe -A $c -p icmpv6 --icmpv6-type $j -m hl --hl-eq 255 -j ACCEPT
+         done
++
++        echo -n "ipv6 rt: "
++        runcmd $exe -A $c -m rt --rt-type 0 -j ACCEPT
+     fi
+ 
+     echo ""
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch b/meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch
new file mode 100644
index 0000000..5117423
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/setup-add-an-option-to-specify-iptables-location.patch
@@ -0,0 +1,107 @@
+From c54d36d0582a60fd281cd9287077cea205fd849d Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Thu, 27 Nov 2014 15:20:34 -0500
+Subject: [PATCH] setup: add an option to specify iptables location
+
+When cross-compiling it isn't certain that the location of iptables on the
+target will be the same as on the host.  It also doesn't make sense the
+test the version of the host during setup.  We provide an option to
+specify an alternate iptables directory.  This is assumed to be a
+cross-compile environment and therefore no attempt is made to verify the
+version of iptables to be used.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ setup.py | 69 ++++++++++++++++++++++++++++++++++++----------------------------
+ 1 file changed, 39 insertions(+), 30 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 6fb3751..b13d11c 100644
+--- a/setup.py
++++ b/setup.py
+@@ -225,41 +225,50 @@ shutil.copytree('src', 'staging')
+ os.unlink(os.path.join('staging', 'ufw-init'))
+ os.unlink(os.path.join('staging', 'ufw-init-functions'))
+ 
++iptables_set = 0
+ iptables_exe = ''
+ iptables_dir = ''
+ 
+-for e in ['iptables']:
+-    for dir in ['/sbin', '/bin', '/usr/sbin', '/usr/bin', '/usr/local/sbin', \
+-                '/usr/local/bin']:
+-        if e == "iptables":
+-            if os.path.exists(os.path.join(dir, e)):
+-                iptables_dir = dir
+-                iptables_exe = os.path.join(iptables_dir, "iptables")
+-                print("Found '%s'" % iptables_exe)
+-            else:
+-                continue
+-
+-        if iptables_exe != "":
+-            break
+-
+-
+-if iptables_exe == '':
+-    print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
+-    sys.exit(1)
+-
+-for e in ['ip6tables', 'iptables-restore', 'ip6tables-restore']:
+-    if not os.path.exists(os.path.join(iptables_dir, e)):
+-        print("ERROR: could not find required binary '%s'" % (e), file=sys.stderr)
++if "--iptables-dir" in sys.argv:
++    iptables_dir = sys.argv[sys.argv.index("--iptables-dir") + 1]
++    iptables_exe = os.path.join(iptables_dir, "iptables")
++    iptables_set = 1
++    print("INFO: iptables manually set: '%s'" % (iptables_exe))
++    sys.argv.remove(iptables_dir)
++    sys.argv.remove("--iptables-dir")
++
++if not iptables_set:
++    for e in ['iptables']:
++        for dir in ['/sbin', '/bin', '/usr/sbin', '/usr/bin', '/usr/local/sbin', \
++                    '/usr/local/bin']:
++            if e == "iptables":
++                if os.path.exists(os.path.join(dir, e)):
++                    iptables_dir = dir
++                    iptables_exe = os.path.join(iptables_dir, "iptables")
++                    print("Found '%s'" % iptables_exe)
++                else:
++                    continue
++
++            if iptables_exe != "":
++                break
++
++    if iptables_exe == '':
++        print("ERROR: could not find required binary 'iptables'", file=sys.stderr)
+         sys.exit(1)
+ 
+-(rc, out) = cmd([iptables_exe, '-V'])
+-if rc != 0:
+-    raise OSError(errno.ENOENT, "Could not find version for '%s'" % \
+-                  (iptables_exe))
+-version = re.sub('^v', '', re.split('\s', str(out))[1])
+-print("Found '%s' version '%s'" % (iptables_exe, version))
+-if version < "1.4":
+-    print("WARN: version '%s' has limited IPv6 support. See README for details." % (version), file=sys.stderr)
++    for e in ['ip6tables', 'iptables-restore', 'ip6tables-restore']:
++        if not os.path.exists(os.path.join(iptables_dir, e)):
++            print("ERROR: could not find required binary '%s'" % (e), file=sys.stderr)
++            sys.exit(1)
++
++    (rc, out) = cmd([iptables_exe, '-V'])
++    if rc != 0:
++        raise OSError(errno.ENOENT, "Could not find version for '%s'" % \
++                      (iptables_exe))
++    version = re.sub('^v', '', re.split('\s', str(out))[1])
++    print("Found '%s' version '%s'" % (iptables_exe, version))
++    if version < "1.4":
++        print("WARN: version '%s' has limited IPv6 support. See README for details." % (version), file=sys.stderr)
+ 
+ setup (name='ufw',
+       version=ufw_version,
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
new file mode 100644
index 0000000..ff704b5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw/setup-only-make-one-reference-to-env.patch
@@ -0,0 +1,77 @@
+From be53eea06a5655fdc98f47a73be8277b65bb42ed Mon Sep 17 00:00:00 2001
+From: Joe MacDonald <joe_macdonald@mentor.com>
+Date: Tue, 11 Nov 2014 21:41:14 -0500
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
+---
+ setup.py | 34 ++++++++++++++++++++++++++++------
+ 1 file changed, 28 insertions(+), 6 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index b13d11c..73acdef 100644
+--- a/setup.py
++++ b/setup.py
+@@ -64,7 +64,7 @@ class Install(_install, object):
+         real_sharedir = os.path.join(real_prefix, 'share', 'ufw')
+ 
+         # Update the modules' paths
+-        for file in [ 'common.py' ]:
++        for file in [ 'common.py', 'util.py' ]:
+             print("Updating " + file)
+             subprocess.call(["sed",
+                              "-i",
+@@ -91,6 +91,11 @@ class Install(_install, object):
+                              "s%#SHARE_DIR#%" + real_sharedir + "%g",
+                              os.path.join('staging', file)])
+ 
++            subprocess.call(["sed",
++                             "-i.jjm",
++                             "s%/sbin/iptables%" + iptables_exe + "%g",
++                             os.path.join('staging', file)])
++
+         # Now byte-compile everything
+         super(Install, self).run()
+ 
+@@ -107,12 +112,23 @@ class Install(_install, object):
+         for f in [ script, manpage, manpage_f ]:
+             self.mkpath(os.path.dirname(f))
+ 
++        # if sys.executable == /usr/bin/env python* the result will be the top
++        # of ufw getting:
++        #
++        #  #! /usr/bin/env /usr/bin/env python
++        #
++        # which is not ideal
++        #
+         # update the interpreter to that of the one the user specified for setup
+-        print("Updating staging/ufw to use %s" % (sys.executable))
+-        subprocess.call(["sed",
+-                         "-i",
+-                         "1s%^#.*python.*%#! /usr/bin/env " + sys.executable + "%g",
+-                         'staging/ufw'])
++        print("Updating staging/ufw to use (%s)" % (sys.executable))
++
++        if re.search("(/usr/bin/env)", sys.executable):
++            print("found 'env' in sys.executable (%s)" % (sys.executable))
++            subprocess.call(["sed",
++                             "-i.jjm",
++                             "1s%^#.*python.*%#! " + sys.executable + "%g",
++                             'staging/ufw'])
++
+         self.copy_file('staging/ufw', script)
+         self.copy_file('doc/ufw.8', manpage)
+         self.copy_file('doc/ufw-framework.8', manpage_f)
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
new file mode 100644
index 0000000..467f2a8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Uncomplicated Firewall"
+DESCRIPTION = "UFW stands for Uncomplicated Firewall, and is program for \
+managing a netfilter firewall. It provides a command line interface and aims \
+to be uncomplicated and easy to use."
+HOMEPAGE = "https://launchpad.net/ufw"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
+
+SRC_URI = " \
+           https://launchpad.net/ufw/0.33/0.33/+download/ufw-0.33.tar.gz \
+           file://setup-add-an-option-to-specify-iptables-location.patch \
+           file://setup-only-make-one-reference-to-env.patch \
+           file://0001-optimize-boot.patch \
+           file://0002-lp1044361.patch \
+           file://0003-fix-typeerror-on-error.patch \
+           file://0004-lp1039729.patch \
+           file://0005-lp1191197.patch \
+"
+SRC_URI[md5sum] = "3747b453d76709e5a99da209fc0bb5f5"
+SRC_URI[sha256sum] = "5f85a8084ad3539b547bec097286948233188c971f498890316dec170bdd1da8"
+
+inherit setuptools distro_features_check
+
+RDEPENDS_${PN} = " \
+                  iptables \
+                  python \
+                  python-modules \
+                 "
+
+RRECOMMENDS_${PN} = " \
+                     kernel-module-ipv6 \
+"
+
+FILES_${PN} += " \
+                ${sbindir}/* \
+                ${datadir}/ufw/* \
+                ${base_libdir}/ufw/* \
+                ${sysconfdir}/ufw/* \
+                ${sysconfdir}/default/ufw \
+"
+
+REQUIRED_DISTRO_FEATURES = "ipv6"
+
+DISTUTILS_BUILD_ARGS_append = " --iptables-dir /usr/sbin"
+DISTUTILS_INSTALL_ARGS_append = " --iptables-dir /usr/sbin"
-- 
1.9.1


