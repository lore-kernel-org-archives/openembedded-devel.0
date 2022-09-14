Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B88EC6FA8E
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 12:03:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.5281.1663157007033181157
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q3xstD/8;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id bz13so25359776wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 05:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hiQ3FwrnUE3Q0p8nRoUSDU8oUiJufcXHxvilsmXPsXs=;
        b=q3xstD/820I/+9EZqW+uK1fbSytv6NHuQLydNNDUWkxfP1MFoAdBMLTUEICjFeQKr2
         f3U/f4xLaxfPtx0dZpFyI5L/jiMp49QTtmXaNzWYohT1nGT+kzgwk2FjItrQwx8TX7BX
         bE1byRjlvZ1u9oZGUkggn1LTR6ApZCRsLUUqSzlk+UHP99tD7NLqzpT2EWR4EXPx5C+J
         o4gZdGxlbNuK2YBksozFQ9/CBdioMaD13uGig8ar6CLhYdwyKQZpFY9bXhtLqMwMzoqf
         10nUSeMp+sjFgROuy/6KAw03LTY9FRZNi5Lo2DwQGMSbd/VGuuzQ9ZwAgiMTrmRJcDhz
         mBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hiQ3FwrnUE3Q0p8nRoUSDU8oUiJufcXHxvilsmXPsXs=;
        b=vVhavbUwgizuiiN7o9NupttlI12BxWssrsgBuYYDVeemFtuAXEFxlFgkvx8JNlukGu
         cCPrr6IK/oBFYqpHjWc65v6xKE82JOHoomA2U6/wdhdP1G6qw6QxUt2PygiHkRmPx/sy
         B/3NghTIlC5HZ1C8mDLC326KRzJgjbi+eX8/F/D68Pb1ecGnWg71NvnIeWWFxP499EZq
         E1Ba77QDCECWKnFz+ZOloVO2xo7z88V5lJQfEOMNEj4g/RwZMI4GFy+lziW6hSxWM0Kv
         WSpkU3+Nm8r/iUtvzoVjqfrKkF6Ws80MOjYDUxNuin0KGprFpzp7DQZb+s0lIAUZhNFm
         DONA==
X-Gm-Message-State: ACgBeo2k4PAgGAS01ZsZ3/FIpF7A0ycwewidM3S5BU7O6ci2K3IQJ8nH
	W3ccHurCRpNNf9agpoSXLYAyQvFVP9ONcw==
X-Google-Smtp-Source: 
 AA6agR5oQYDzyJuLsa1AJKMX3OMjXTTu1FqJM9CPj4kSoELddWYkRkiUI8cBMdg+f3H2xZ1z2zqCKA==
X-Received: by 2002:adf:fd05:0:b0:22a:292f:1908 with SMTP id
 e5-20020adffd05000000b0022a292f1908mr19084574wrr.85.1663157005378;
        Wed, 14 Sep 2022 05:03:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a5d6081000000b0022a2dbc80fdsm13286233wrt.10.2022.09.14.05.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 05:03:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/8] mozjs-91: backport a python 3.11 compatibility patch
Date: Wed, 14 Sep 2022 14:03:10 +0200
Message-Id: <20220914120316.551377-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220914120316.551377-1-alex@linutronix.de>
References: <20220914120316.551377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 12:03:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98796

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mozjs/mozjs-91/py-3.11.patch              | 211 ++++++++++++++++++
 .../mozjs/mozjs-91_91.13.0.bb                 |   1 +
 2 files changed, 212 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch b/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
new file mode 100644
index 000000000..71da8225a
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91/py-3.11.patch
@@ -0,0 +1,211 @@
+
+# HG changeset patch
+# User ahochheiden <ahochheiden@mozilla.com>
+# Date 1654151264 0
+# Node ID f54162b2c1f2fe52c6137ab2c3469a1944f58b27
+# Parent  6e7776492240c27732840d65a33dcc440fa1aba0
+Bug 1769631 - Remove 'U' from 'mode' parameters for various 'open' calls to ensure Python3.11 compatibility r=firefox-build-system-reviewers,glandium
+
+The 'U' flag represents "universal newline". It has been deprecated
+since Python3.3. Since then "universal newline" is the default when a
+file is opened in text mode (not bytes). In Python3.11 using the 'U'
+flag throws errors. There should be no harm in removing 'U' from 'open'
+everywhere it is used, and doing allows the use of Python3.11.
+
+For more reading see: https://docs.python.org/3.11/whatsnew/3.11.html#changes-in-the-python-api
+
+Differential Revision: https://phabricator.services.mozilla.com/D147721
+
+Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/f54162b2c1f2fe52c6137ab2c3469a1944f58b27]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+diff --git a/dom/base/usecounters.py b/dom/base/usecounters.py
+--- a/dom/base/usecounters.py
++++ b/dom/base/usecounters.py
+@@ -3,17 +3,17 @@
+ # file, You can obtain one at http://mozilla.org/MPL/2.0/.
+ 
+ import collections
+ import re
+ 
+ 
+ def read_conf(conf_filename):
+     # Can't read/write from a single StringIO, so make a new one for reading.
+-    stream = open(conf_filename, "rU")
++    stream = open(conf_filename, "r")
+ 
+     def parse_counters(stream):
+         for line_num, line in enumerate(stream):
+             line = line.rstrip("\n")
+             if not line or line.startswith("//"):
+                 # empty line or comment
+                 continue
+             m = re.match(r"method ([A-Za-z0-9]+)\.([A-Za-z0-9]+)$", line)
+diff --git a/python/mozbuild/mozbuild/action/process_define_files.py b/python/mozbuild/mozbuild/action/process_define_files.py
+--- a/python/mozbuild/mozbuild/action/process_define_files.py
++++ b/python/mozbuild/mozbuild/action/process_define_files.py
+@@ -31,17 +31,17 @@ def process_define_file(output, input):
+ 
+     config = PartialConfigEnvironment(topobjdir)
+ 
+     if mozpath.basedir(
+         path, [mozpath.join(topsrcdir, "js/src")]
+     ) and not config.substs.get("JS_STANDALONE"):
+         config = PartialConfigEnvironment(mozpath.join(topobjdir, "js", "src"))
+ 
+-    with open(path, "rU") as input:
++    with open(path, "r") as input:
+         r = re.compile(
+             "^\s*#\s*(?P<cmd>[a-z]+)(?:\s+(?P<name>\S+)(?:\s+(?P<value>\S+))?)?", re.U
+         )
+         for l in input:
+             m = r.match(l)
+             if m:
+                 cmd = m.group("cmd")
+                 name = m.group("name")
+diff --git a/python/mozbuild/mozbuild/backend/base.py b/python/mozbuild/mozbuild/backend/base.py
+--- a/python/mozbuild/mozbuild/backend/base.py
++++ b/python/mozbuild/mozbuild/backend/base.py
+@@ -267,17 +267,17 @@ class BuildBackend(LoggingMixin):
+         If an exception is raised, |mach build| will fail with a
+         non-zero exit code.
+         """
+         self._write_purgecaches(config)
+ 
+         return status
+ 
+     @contextmanager
+-    def _write_file(self, path=None, fh=None, readmode="rU"):
++    def _write_file(self, path=None, fh=None, readmode="r"):
+         """Context manager to write a file.
+ 
+         This is a glorified wrapper around FileAvoidWrite with integration to
+         update the summary data on this instance.
+ 
+         Example usage:
+ 
+             with self._write_file('foo.txt') as fh:
+diff --git a/python/mozbuild/mozbuild/preprocessor.py b/python/mozbuild/mozbuild/preprocessor.py
+--- a/python/mozbuild/mozbuild/preprocessor.py
++++ b/python/mozbuild/mozbuild/preprocessor.py
+@@ -526,17 +526,17 @@ class Preprocessor:
+             if not options.output:
+                 raise Preprocessor.Error(
+                     self, "--depend doesn't work with stdout", None
+                 )
+             depfile = get_output_file(options.depend)
+ 
+         if args:
+             for f in args:
+-                with io.open(f, "rU", encoding="utf-8") as input:
++                with io.open(f, "r", encoding="utf-8") as input:
+                     self.processFile(input=input, output=out)
+             if depfile:
+                 mk = Makefile()
+                 mk.create_rule([six.ensure_text(options.output)]).add_dependencies(
+                     self.includes
+                 )
+                 mk.dump(depfile)
+                 depfile.close()
+@@ -855,17 +855,17 @@ class Preprocessor:
+         self.checkLineNumbers = False
+         if isName:
+             try:
+                 args = _to_text(args)
+                 if filters:
+                     args = self.applyFilters(args)
+                 if not os.path.isabs(args):
+                     args = os.path.join(self.curdir, args)
+-                args = io.open(args, "rU", encoding="utf-8")
++                args = io.open(args, "r", encoding="utf-8")
+             except Preprocessor.Error:
+                 raise
+             except Exception:
+                 raise Preprocessor.Error(self, "FILE_NOT_FOUND", _to_text(args))
+         self.checkLineNumbers = bool(
+             re.search("\.(js|jsm|java|webidl)(?:\.in)?$", args.name)
+         )
+         oldFile = self.context["FILE"]
+@@ -909,17 +909,17 @@ class Preprocessor:
+ 
+     def do_error(self, args):
+         raise Preprocessor.Error(self, "Error: ", _to_text(args))
+ 
+ 
+ def preprocess(includes=[sys.stdin], defines={}, output=sys.stdout, marker="#"):
+     pp = Preprocessor(defines=defines, marker=marker)
+     for f in includes:
+-        with io.open(f, "rU", encoding="utf-8") as input:
++        with io.open(f, "r", encoding="utf-8") as input:
+             pp.processFile(input=input, output=output)
+     return pp.includes
+ 
+ 
+ # Keep this module independently executable.
+ if __name__ == "__main__":
+     pp = Preprocessor()
+     pp.handleCommandLine(None, True)
+diff --git a/python/mozbuild/mozbuild/util.py b/python/mozbuild/mozbuild/util.py
+--- a/python/mozbuild/mozbuild/util.py
++++ b/python/mozbuild/mozbuild/util.py
+@@ -231,17 +231,17 @@ class FileAvoidWrite(BytesIO):
+     enabled by default because it a) doesn't make sense for binary files b)
+     could add unwanted overhead to calls.
+ 
+     Additionally, there is dry run mode where the file is not actually written
+     out, but reports whether the file was existing and would have been updated
+     still occur, as well as diff capture if requested.
+     """
+ 
+-    def __init__(self, filename, capture_diff=False, dry_run=False, readmode="rU"):
++    def __init__(self, filename, capture_diff=False, dry_run=False, readmode="r"):
+         BytesIO.__init__(self)
+         self.name = filename
+         assert type(capture_diff) == bool
+         assert type(dry_run) == bool
+         assert "r" in readmode
+         self._capture_diff = capture_diff
+         self._write_to_file = not dry_run
+         self.diff = None
+diff --git a/python/mozbuild/mozpack/files.py b/python/mozbuild/mozpack/files.py
+--- a/python/mozbuild/mozpack/files.py
++++ b/python/mozbuild/mozpack/files.py
+@@ -549,17 +549,17 @@ class PreprocessedFile(BaseFile):
+         self.defines = defines
+         self.extra_depends = list(extra_depends or [])
+         self.silence_missing_directive_warnings = silence_missing_directive_warnings
+ 
+     def inputs(self):
+         pp = Preprocessor(defines=self.defines, marker=self.marker)
+         pp.setSilenceDirectiveWarnings(self.silence_missing_directive_warnings)
+ 
+-        with _open(self.path, "rU") as input:
++        with _open(self.path, "r") as input:
+             with _open(os.devnull, "w") as output:
+                 pp.processFile(input=input, output=output)
+ 
+         # This always yields at least self.path.
+         return pp.includes
+ 
+     def copy(self, dest, skip_if_older=True):
+         """
+@@ -606,17 +606,17 @@ class PreprocessedFile(BaseFile):
+             return False
+ 
+         deps_out = None
+         if self.depfile:
+             deps_out = FileAvoidWrite(self.depfile)
+         pp = Preprocessor(defines=self.defines, marker=self.marker)
+         pp.setSilenceDirectiveWarnings(self.silence_missing_directive_warnings)
+ 
+-        with _open(self.path, "rU") as input:
++        with _open(self.path, "r") as input:
+             pp.processFile(input=input, output=dest, depfile=deps_out)
+ 
+         dest.close()
+         if self.depfile:
+             deps_out.close()
+ 
+         return True
+ 
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
index c3ee75086..4c1aa3447 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.13.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0006-Fix-build-on-powerpc.patch \
            file://0001-util.configure-fix-one-occasionally-reproduced-confi.patch \
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
+           file://py-3.11.patch \
            "
 SRC_URI[sha256sum] = "53be2bcde0b5ee3ec106bd8ba06b8ae95e7d489c484e881dfbe5360e4c920762"
 
-- 
2.30.2


