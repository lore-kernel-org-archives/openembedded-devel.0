Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web08.3494.1618693602522497001
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j/ejnX4l;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id c17so20636236pfn.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eI7V5oG1PDeU+mb9l7Knh14PPQsAlk0st9md0v3hl84=;
        b=j/ejnX4lmdAsouRtD+BZf+QPg/b5nWE/q6MH7h903oxUJroZXErxWeX4RTMnrfpR0w
         Mv6WmZTMDd6PC8Q/9QgqbQhXhZK+Yxejn2V5am6ExZuXJes+q60l8XLJCTMZfkxITLSF
         1u/I3zdz/oyl23Ha1guxnCK8Pu8Jf3/Qx4tj6tvrVknlmbsOubxNtDlFi0PdayghE3z6
         nEwMoFC2bzY2VXd9zCXjByYfmyDaprIvaJ4RAXF6bqYLi1icuD45t+rwLmvlr/qgwYOu
         b3SaF13uODsHQaareTS4ifjElerTpbx48XI95gyLj0hmCtay7QiK+YlTfYHfrX3047lD
         ITaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eI7V5oG1PDeU+mb9l7Knh14PPQsAlk0st9md0v3hl84=;
        b=Bs+w8c34lAXbfQFDM7hKVh13mUV7JF8kAl1Eaeh/jf0RcoJRMn/0xks4tKHbAHl01J
         ufXb5RYf5iIRycB7Pv5MhucNNH4S/B3pQr5lqTbxcLxihZVopx15lwRveiP8JMiXEjQz
         OoXUnCHwmYr88sbRLHJ83GJCyejdXjZfahUZYCIWZ+poAW1hTyOkJJaBzRpKIFpwN8M8
         WNOb6wCGh2dRE2WLYc3RmQK3OMJt+AijuHjKOCxbpWvhVlYVFrKkaNzbsPMvCNGZMK5w
         au8Z5CGheXQuZLf6Ck4MbLasrEGUm9cbs37aEkVSJiUjt3PU4TTe5t0pQGFW+rS6U8iF
         6VjQ==
X-Gm-Message-State: AOAM533WftqdqvwZtaFod+GkuAEemUTdN6VFSpBsM0yrqgDKwV2Kvmi3
	IgBRsiLD/8uBRfRCiyR1jFNEDCPTPZbUPQ==
X-Google-Smtp-Source: ABdhPJzdYsHrXlsR6/mc737avFQQ2CnA9z8F8+tczLJCh4p5vpAXJGlLv6nvrcDZ7ddI6RZk7IipvA==
X-Received: by 2002:a05:6a00:2ce:b029:246:f904:a95 with SMTP id b14-20020a056a0002ceb0290246f9040a95mr13554230pft.64.1618693601879;
        Sat, 17 Apr 2021 14:06:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:41 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 44/50] PEP8 double aggressive E22, E224, E241, E242 and E27
Date: Sat, 17 Apr 2021 14:05:53 -0700
Message-Id: <07531e62854a210ed2a7bd1ce0925e22cae0e22b.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 144c107c42be19cedd58e5971b827c7ca91b7b53)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 7958797059a..9d95911ae6e 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -222,7 +222,7 @@ for v in OE_vars:
 #   No spaces are allowed at the beginning of lines that define a variable or 
 #   a do_ routine
 def respect_rule0(line): 
-    return line.lstrip()==line
+    return line.lstrip() == line
 def conformTo_rule0(line): 
     return line.lstrip()
 
@@ -239,7 +239,7 @@ def conformTo_rule1(line):
 # _Format guideline #2_: 
 #   Tabs should not be used (use spaces instead).
 def respect_rule2(line):
-    return line.count('\t')==0
+    return line.count('\t') == 0
 def conformTo_rule2(line):
     return line.expandtabs()
 
@@ -261,7 +261,7 @@ def respect_rule4(line):
     if r is not None:
         r2 = re.search(r'("?)([^"\\]*)(["\\]?)', r.group(5))
         # do not test for None it because always match
-        return r2.group(1)=='"' and r2.group(3)!=''
+        return r2.group(1) == '"' and r2.group(3) != ''
     return False
 def conformTo_rule4(line):
     r = re.search(varRegexp, line)
@@ -271,7 +271,7 @@ def conformTo_rule4(line):
 #   The correct spacing for a variable is FOO = "BAR".
 def respect_rule5(line):
     r = re.search(varRegexp, line)
-    return r is not None and r.group(2)==" " and r.group(4)==" "
+    return r is not None and r.group(2) == " " and r.group(4) == " "
 def conformTo_rule5(line):
     r = re.search(varRegexp, line)
     return ''.join([r.group(1), ' ', r.group(3), ' ', r.group(5)])
@@ -279,7 +279,7 @@ def conformTo_rule5(line):
 # _Format guideline #6_:
 #   Don't use spaces or tabs on empty lines
 def respect_rule6(line):
-    return not line.isspace() or line=="\n"
+    return not line.isspace() or line == "\n"
 def conformTo_rule6(line):
     return ""
 
@@ -359,7 +359,7 @@ if __name__ == "__main__":
             continue
 
         if line.startswith('}'): 
-            in_routine=False
+            in_routine = False
         keep = line.endswith('\\') or in_routine
 
         # handles commented lines
@@ -381,7 +381,7 @@ if __name__ == "__main__":
                     var = k
                     break
             if re.match(routineRegexp, line) is not None: 
-                in_routine=True
+                in_routine = True
                 line = follow_rule(0, line)
             elif re.match(varRegexp, line) is not None:
                 line = follow_rule(0, line)
@@ -406,14 +406,14 @@ if __name__ == "__main__":
     # write variables and routines
     previourVarPrefix = "unknown"
     for k in OE_vars:
-        if k=='SRC_URI':
+        if k == 'SRC_URI':
             addEmptyLine = True
         if seen_vars[k] != []: 
             if addEmptyLine and not k.startswith(previourVarPrefix):
                 olines.append("")
             for l in seen_vars[k]: 
                 olines.append(l)
-            previourVarPrefix = k.split('_')[0]=='' and "unknown" or k.split('_')[0]
+            previourVarPrefix = k.split('_')[0] == '' and "unknown" or k.split('_')[0]
     for line in olines:
         print(line)
 
-- 
2.17.1

