Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C7BC4332F
	for <webhook@archiver.kernel.org>; Sat, 18 Dec 2021 19:00:14 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.8370.1639854013032510644
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F3C6Rma3;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 lr15-20020a17090b4b8f00b001b19671cbebso231181pjb.1
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Dec 2021 11:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uMRFzMO+zX0YEnxGK0gcCj3qAN9+j7EveJJTxA9BtGI=;
        b=F3C6Rma3tglyZjkCE7gabtRnZ+IBloXOo3azzJISN71j8rL75ZuDU3HXW5nSxwn+Zd
         Ylp63vR9TdH8hmd16SIYhT9ePLk9XBUZD/oZH+i7DOkx1ZcD3JDYbLiXAcfBZCfIGAQV
         1RBYNRMf1dSp4V9j8J3fI22itcL5pbuPnHzpLPu8Nn+yFZmCmYic/1lDaqe5EIB1f3iU
         +kGQH8UGd4gV/o+iRyzH2plZzoAOIYSCFs0gKeyog0a5BltgnoEJez45oiFlXDukxqVU
         8TRsJA0QbYCJdqcniaI4SjMeTZGS1imCBr83KKuQmAIqfTbNVDpch/CnpKZn0BX4b2uK
         8m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMRFzMO+zX0YEnxGK0gcCj3qAN9+j7EveJJTxA9BtGI=;
        b=ryl8Ih0EFKiVfyb+47bZmZJrewre1AfHODnRNSbdRCCYQsRErxvpzwBvgXtg8hGJi1
         cWTUmRBabCFwt0BtpC9HQOKmok//Djz+pAFioVK60YVG11rWAaPWgvGToLVZtCYj48s7
         p1EhH0Gy/bTOHyc+vQsBVKms5P/adSl6nbwQ0RlSpXc+GUWd7gQ/TesEuEdwSoUKFR8b
         U2Yk2p+ymHmCDuJkU1SDrR2M/FOmUYm8ePaKIQp5PXDduGWlyiMC/W3hOO0yqytNRiW5
         +CfnyFaNHnthoqRmKNLFxXmdf9TNnnjtl8T4LeOiTp0lttKvcWCu693O8rfhJ1rLnOUZ
         jhbw==
X-Gm-Message-State: AOAM53051xJLuQ8T1jPs4bpL92e2IlsE8hPQWDGtT8PHD383EowXH3kv
	KQ9xFgdOxkFRmm80E9MYYo9Rgz4tUoQ=
X-Google-Smtp-Source: 
 ABdhPJys6QXzw6t1mNQIzpDrjJSQJY1xyS80ySg25EBXk+eHIS31tku/qXGXOaWZWM2uyV0CCcsLIA==
X-Received: by 2002:a17:90a:e514:: with SMTP id
 t20mr10609338pjy.5.1639854012370;
        Sat, 18 Dec 2021 11:00:12 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:8259:344d:2281:ae46])
        by smtp.gmail.com with ESMTPSA id
 j6sm10371127pjv.35.2021.12.18.11.00.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Dec 2021 11:00:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 8/9] libteam: switch to python3
Date: Sat, 18 Dec 2021 11:00:01 -0800
Message-Id: 
 <f0f4dbb3b4c32ad6e36471c2ba974a465cbebb34.1639853918.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1639853918.git.akuster808@gmail.com>
References: <cover.1639853918.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Dec 2021 19:00:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94436

From: Mingli Yu <mingli.yu@windriver.com>

The original fix for team_basic_test.py only change the interpreter
to python3, but still some error as below:
 # ./run-ptest
 File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 35
 print "Usage: team_basic_test.py [OPTION...]"
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 SyntaxError: Missing parentheses in call to 'print'. Did you mean print(...)?

 # ./run-ptest
 RUN #1
 # "ip link add testteamx type team"
 # "teamnl testteamx getoption mode"
 # "ip link del testteamx"
 # "modprobe -r team_mode_loadbalance team_mode_roundrobin team_mode_activebackup team_mode_broadcast team"
 Traceback (most recent call last):
  File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 206, in <module>
    main()
  File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 203, in main
    btest.run()
  File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 180, in run
    self._run_one_loop(i + 1)
  File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 173, in _run_one_loop
    self._run_one_mode(mode_name)
  File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 101, in _run_one_mode
    cmd_exec("teamnl %s getoption mode" % team_name, "*NOMODE*")
  File "/usr/lib64/libteam/ptest/./team_basic_test.py", line 80, in cmd_exec
    raise CmdExecUnexpectedOutputException(output, expected_output)
 __main__.CmdExecUnexpectedOutputException: Command execution output unexpected: "b'*NOMODE*'" != "*NOMODE*"

 So rework team_basic_test.py to fix the above issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...team_basic_test.py-switch-to-python3.patch | 101 ++++++++++++++++++
 ...asic_test.py-use-python3-interpreter.patch |  28 -----
 .../recipes-support/libteam/libteam_1.31.bb   |   2 +-
 3 files changed, 102 insertions(+), 29 deletions(-)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-switch-to-python3.patch
 delete mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch

diff --git a/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-switch-to-python3.patch b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-switch-to-python3.patch
new file mode 100644
index 0000000000..69276aba91
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-switch-to-python3.patch
@@ -0,0 +1,101 @@
+From 06050e79655f0fa7d9daeda1fbd3a9a2c7736841 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Thu, 2 Dec 2021 15:08:25 +0800
+Subject: [PATCH] team_basic_test.py: switch to python3
+
+Switch the script team_basic_test.py to python3
+
+Upstream-Status: Submitted [https://github.com/jpirko/libteam/pull/63]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ scripts/team_basic_test.py | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/scripts/team_basic_test.py b/scripts/team_basic_test.py
+index faabd18..0b64af2 100755
+--- a/scripts/team_basic_test.py
++++ b/scripts/team_basic_test.py
+@@ -1,4 +1,4 @@
+-#! /usr/bin/env python
++#! /usr/bin/env python3
+ """
+ Basic test.
+ 
+@@ -32,11 +32,11 @@ def usage():
+     """
+     Print usage of this app
+     """
+-    print "Usage: team_basic_test.py [OPTION...]"
+-    print ""
+-    print "  -h, --help                         print this message"
+-    print "  -c, --loop-count=NUMBER            number of loops (default 1)"
+-    print "  -p, --port=NETDEV                  port device (can be defined multiple times)"
++    print("Usage: team_basic_test.py [OPTION...]")
++    print("")
++    print("  -h, --help                         print this message")
++    print("  -c, --loop-count=NUMBER            number of loops (default 1)")
++    print("  -p, --port=NETDEV                  port device (can be defined multiple times)")
+     sys.exit()
+ 
+ class CmdExecFailedException(Exception):
+@@ -55,15 +55,15 @@ class CmdExecUnexpectedOutputException(Exception):
+         return "Command execution output unexpected: \"%s\" != \"%s\"" % (self.__output, self.__expected_output)
+ 
+ def print_output(out_type, string):
+-    print("%s:\n"
++    print(("%s:\n"
+           "----------------------------\n"
+           "%s"
+-          "----------------------------" % (out_type, string))
++          "----------------------------" % (out_type, string)))
+ 
+ def cmd_exec(cmd, expected_output=None, cleaner=False):
+     cmd = cmd.rstrip(" ")
+     if not cleaner:
+-        print("# \"%s\"" % cmd)
++        print(("# \"%s\"" % cmd))
+     subp = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE,
+                             stderr=subprocess.PIPE)
+     (data_stdout, data_stderr) = subp.communicate()
+@@ -74,7 +74,7 @@ def cmd_exec(cmd, expected_output=None, cleaner=False):
+         if data_stderr:
+             print_output("Stderr", data_stderr)
+         raise CmdExecFailedException(subp.returncode)
+-    output = data_stdout.rstrip()
++    output = (data_stdout.rstrip()).decode()
+     if expected_output:
+         if output != expected_output:
+             raise CmdExecUnexpectedOutputException(output, expected_output)
+@@ -166,7 +166,7 @@ TEAM_PORT_CONFIG='{"prio": 10}'
+             os.removedirs("/tmp/team_test/")
+ 
+     def _run_one_loop(self, run_nr):
+-        print "RUN #%d" % (run_nr)
++        print("RUN #%d" % (run_nr))
+         self._created_teams = []
+         try:
+             for mode_name in self._team_modes:
+@@ -176,7 +176,7 @@ TEAM_PORT_CONFIG='{"prio": 10}'
+             cmd_exec("modprobe -r team_mode_loadbalance team_mode_roundrobin team_mode_activebackup team_mode_broadcast team");
+ 
+     def run(self):
+-        for i in xrange(self._loop_count):
++        for i in range(self._loop_count):
+             self._run_one_loop(i + 1)
+ 
+ def main():
+@@ -186,8 +186,8 @@ def main():
+             "hc:p:",
+             ["help", "loop-count=", "port="]
+         )
+-    except getopt.GetoptError, err:
+-        print str(err)
++    except getopt.GetoptError as err:
++        print(str(err))
+         usage()
+ 
+     btest = TeamBasicTest()
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch
deleted file mode 100644
index e27e4f3291..0000000000
--- a/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-use-python3-interpreter.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 571c141b434dff13494c6a3afe621f63a8e610e9 Mon Sep 17 00:00:00 2001
-From: Andrey Zhizhikin <andrey.z@gmail.com>
-Date: Mon, 27 Jan 2020 14:29:34 +0000
-Subject: [PATCH] team_basic_test.py: use python3 interpreter
-
-Use python3 since python2 is EOL and has been removed from several
-distributions.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
----
- scripts/team_basic_test.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/scripts/team_basic_test.py b/scripts/team_basic_test.py
-index b05be9e..ad980e8 100755
---- a/scripts/team_basic_test.py
-+++ b/scripts/team_basic_test.py
-@@ -1,4 +1,4 @@
--#! /usr/bin/env python
-+#! /usr/bin/env python3
- """
- Basic test.
- 
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/libteam/libteam_1.31.bb b/meta-oe/recipes-support/libteam/libteam_1.31.bb
index eb59c1e3e9..764eb6fb74 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.31.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.31.bb
@@ -11,7 +11,7 @@ SRC_URI = "git://github.com/jpirko/libteam;branch=master;protocol=https \
            file://0001-include-sys-select.h-for-fd_set-definition.patch \
            file://0002-teamd-Re-adjust-include-header-order.patch \
            file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
-           file://0001-team_basic_test.py-use-python3-interpreter.patch \
+           file://0001-team_basic_test.py-switch-to-python3.patch \
            file://run-ptest \
            "
 SRCREV = "3ee12c6d569977cf1cd30d0da77807a07aa77158"
-- 
2.25.1


