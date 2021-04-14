Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.14343.1618412153097309356
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 07:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PYPbBts+;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so10979727pjv.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EyFyv/vxmxxXFSKZqT6L2CMSBiu0OS7wgaqdu5Mck20=;
        b=PYPbBts+ZPSQH4GCssYf5UxSl22gMj+wJKtGm8DFUnq3TzFLZczMhKULnXBrRB8u7f
         yCj5UYObZFKW88VC7AbcUxPQ7K2vdZfxQe3aTUz998jDM2lFtpqMR4uN8bW22gsVcn2U
         Yx8YHJiYNMxEymiEYDheqPY5unbXuLk5y6Ioi2uE3YHGNDZNY+oAxmx54GyDjqRP3SFD
         aqgX3SBnPS558PD9a8nON98TwaCFbOzHAYiWMiMjKpivje/GcHyuijU5j48iZo4QlTgz
         1U33EVPoxcoFCUk+NLx3C5u/oFRhNcTaUfXf6V0trBSJcz/zjUanmhUbWoKr1I3dYWf6
         X66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EyFyv/vxmxxXFSKZqT6L2CMSBiu0OS7wgaqdu5Mck20=;
        b=i/Oj5MZ3NESKL0ILLehzm5bPgT9KS/ueCuUvC35MM+1sOxeCK3XqsLQnVQjXgmEIkY
         1sjh+81hXU0sQHm97Y3x/0yfpfenzFHaMRk1A7P0VIPOX1x7DRQkPDa1wXUQq8BAt/F1
         etc/5PrNvXrGvppLdPuucTTk8zQnYDrH1GpgOMozVc8QYRHhexho9EphxkW0xQoCB4ax
         fBUaTPlrvHuPXG2lLdtv1RNbY4/UElldQiVhcctOyVs8RqdHhttOJsjzURZMrQ3iFJwK
         U5x5WG3dLtBVABT8K8YNvOHM+k3WxCxRn26v6t9WBJEBrjDQd/8u8wsKC4Yz3PKdfjcT
         FpCw==
X-Gm-Message-State: AOAM533o3yDEsOgGBK0L/lprNq6RYqLdQWtfcrmAatKgYwYd0wyqeqMy
	vwt7FVsSN75XvMTm0CO9ttWi2Gxgtv+Ikg==
X-Google-Smtp-Source: ABdhPJwDUOo5eNGuYb/7CUjUFJMiOJGy4fI6DSWwUGuWHob01YHyRLZ73k8s4Jz05yokLChI6g1X8g==
X-Received: by 2002:a17:90b:3512:: with SMTP id ls18mr4076789pjb.10.1618412152357;
        Wed, 14 Apr 2021 07:55:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t65sm16178261pfd.5.2021.04.14.07.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:55:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 5/5] PEP8 double aggressive W291 ~ W293 and W391
Date: Wed, 14 Apr 2021 07:55:46 -0700
Message-Id: <20210414145546.2007092-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414145546.2007092-1-raj.khem@gmail.com>
References: <20210414145546.2007092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/oe-stylize.py | 43 +++++++++++++++++++++----------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index cfabb90b10..e1ba1b3218 100755
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
2.31.1

