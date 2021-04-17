Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.3570.1618693603825360445
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZViDChXZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id a12so20620199pfc.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SNC9Mt03M/i3DcMPve96QZCPqRHpi2jkNLoqe7uiC+M=;
        b=ZViDChXZkbVA2z6tbhiw6CdNc45A6KCWcYisGO7IfHez+JTUVj/hPx1RZo3T9HVMXU
         oz1RGQsYiWu/kO9N4XKvCuFiMTbbNWHgyzj/gtaQx3k6GT404pCI1q6i+hzWnx9j3Cqd
         Lxr+cGu7KfoMaIY7FqmWIcuS5ISKNwjnsdXLM7OeDUln6DHuT9W1ApkTpoZEcWIeNdAI
         jGE1KGi9RVf+yCtx57OcCOIJ1SM0+Et5ByNJwgjF+ypNA8sCfuvRutNI9c+XDgOOH0pP
         rRquogsaUxCHyb3o+yuPIpGLbykdiBbK8ViLX4QcHHur0cTkmMfyYAemmQn4jKOlhHX4
         HoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SNC9Mt03M/i3DcMPve96QZCPqRHpi2jkNLoqe7uiC+M=;
        b=mE1c9H97I394EG1e/BF5IVujFBAu6VkBBqvJUdetWJQ8KSJkj7OhIes5/hskugcula
         GQt/uXT5ZBTsQSutdsIpnFZVwgp4m7s++628StXGkqSsXl7o6CH/tWf0njmIpVksexeY
         JJbiMyginUL2axxxiwixt8uQzWikXlb8NLr6z2FOTTV23JbYy1VfgC4gOLqflh7LQCF7
         VC0WDFwwCCmMy6YQDLU3zkmBiw8yRVOH0jKQonuRmvsp+aD2bC7wytzCqAfsas7flOML
         lV8aL6a+Dxzjl1wOofKnbeDJNqsb9WKoFW25OK/eZuy4EFAHxsFjMr2Ou1beK8sAjep1
         N3mQ==
X-Gm-Message-State: AOAM531OhmyO8+4RCRLbWCnzb4djVRya0r8E6XBP4Vyy5c+V9mUuTO9D
	coafQRP2PhYY4QwI6l22w1OBSwOKNiCQdA==
X-Google-Smtp-Source: ABdhPJzfLsuQpIoBLx+1hqUax2ivJ/BQkB50QbZ05tqwXiuGepdedEiMX5kXQzzl+m3oYesjk/MS5w==
X-Received: by 2002:a62:6585:0:b029:241:cf5d:93b2 with SMTP id z127-20020a6265850000b0290241cf5d93b2mr13407191pfb.15.1618693603136;
        Sat, 17 Apr 2021 14:06:43 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 46/50] PEP8 double aggressive W291 ~ W293 and W391
Date: Sat, 17 Apr 2021 14:05:55 -0700
Message-Id: <afec1a4fcef46c1423a060d84f25b7ec3f9b5ba2.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e0b9cd57fab747a84b5dddc52b7efd64afeff6f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index cfabb90b10f..e1ba1b32188 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -2,12 +2,12 @@
 
 """\
 Sanitize a bitbake file following the OpenEmbedded style guidelines,
-see http://openembedded.org/wiki/StyleGuide 
+see http://openembedded.org/wiki/StyleGuide
 
 (C) 2006 Cyril Romain <cyril.romain@gmail.com>
 MIT license
 
-TODO: 
+TODO:
  - add the others OpenEmbedded variables commonly used:
  - parse command arguments and print usage on misuse
     . prevent giving more than one .bb file in arguments
@@ -19,7 +19,7 @@ TODO:
  - count rule breaks and displays them in the order frequence
 """
 
-from __future__ import print_function 
+from __future__ import print_function
 import fileinput
 import string
 import re
@@ -65,7 +65,7 @@ OE_vars = [
     'RSUGGESTS',
     'RPROVIDES',
     'RCONFLICTS',
-    'FILES',    
+    'FILES',
     'do_package',
     'do_stage',
     'addhandler',
@@ -215,36 +215,36 @@ routineRegexp = r'^([a-zA-Z0-9_ ${}-]+?)\('
 
 # Variables seen in the processed .bb
 seen_vars = {}
-for v in OE_vars: 
+for v in OE_vars:
     seen_vars[v] = []
 
-# _Format guideline #0_: 
-#   No spaces are allowed at the beginning of lines that define a variable or 
+# _Format guideline #0_:
+#   No spaces are allowed at the beginning of lines that define a variable or
 #   a do_ routine
 
 
-def respect_rule0(line): 
+def respect_rule0(line):
     return line.lstrip() == line
 
 
-def conformTo_rule0(line): 
+def conformTo_rule0(line):
     return line.lstrip()
 
-# _Format guideline #1_: 
+# _Format guideline #1_:
 #   No spaces are allowed behind the line continuation symbol '\'
 
 
 def respect_rule1(line):
     if line.rstrip().endswith('\\'):
         return line.endswith('\\')
-    else: 
+    else:
         return True
 
 
 def conformTo_rule1(line):
     return line.rstrip()
 
-# _Format guideline #2_: 
+# _Format guideline #2_:
 #   Tabs should not be used (use spaces instead).
 
 
@@ -256,14 +256,14 @@ def conformTo_rule2(line):
     return line.expandtabs()
 
 # _Format guideline #3_:
-#   Comments inside bb files are allowed using the '#' character at the 
+#   Comments inside bb files are allowed using the '#' character at the
 #   beginning of a line.
 
 
 def respect_rule3(line):
     if line.lstrip().startswith('#'):
         return line.startswith('#')
-    else: 
+    else:
         return True
 
 
@@ -364,8 +364,8 @@ if __name__ == "__main__":
         if True:
             lines.append(line)
         else:
-            # expandtabs on each line so that rule2 is always respected 
-            # rstrip each line so that rule1 is always respected 
+            # expandtabs on each line so that rule2 is always respected
+            # rstrip each line so that rule1 is always respected
             line = line.expandtabs().rstrip()
             # ignore empty lines (or line filled with spaces or tabs only)
             # so that rule6 is always respected
@@ -377,7 +377,7 @@ if __name__ == "__main__":
     in_routine = False
     commentBloc = []
     olines = []
-    for line in lines: 
+    for line in lines:
         originalLine = line
         # rstrip line to remove line breaks characters
         line = line.rstrip()
@@ -393,7 +393,7 @@ if __name__ == "__main__":
             commentBloc = []
             continue
 
-        if line.startswith('}'): 
+        if line.startswith('}'):
             in_routine = False
         keep = line.endswith('\\') or in_routine
 
@@ -415,7 +415,7 @@ if __name__ == "__main__":
                 if line.startswith(k):
                     var = k
                     break
-            if re.match(routineRegexp, line) is not None: 
+            if re.match(routineRegexp, line) is not None:
                 in_routine = True
                 line = follow_rule(0, line)
             elif re.match(varRegexp, line) is not None:
@@ -443,12 +443,11 @@ if __name__ == "__main__":
     for k in OE_vars:
         if k == 'SRC_URI':
             addEmptyLine = True
-        if seen_vars[k] != []: 
+        if seen_vars[k] != []:
             if addEmptyLine and not k.startswith(previourVarPrefix):
                 olines.append("")
-            for l in seen_vars[k]: 
+            for l in seen_vars[k]:
                 olines.append(l)
             previourVarPrefix = k.split('_')[0] == '' and "unknown" or k.split('_')[0]
     for line in olines:
         print(line)
-
-- 
2.17.1

