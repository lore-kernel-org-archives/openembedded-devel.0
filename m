Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.14302.1618412151360713576
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 07:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j6Zzxd4c;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id 20so6292464pll.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nVjsp3z3mcw1kUAx7WprdYYK1zXCCkfPYzY7H3i294A=;
        b=j6Zzxd4cmIyhYffaTou/9r2oRSR+g8Cw8272hs8Ko2H5XudzJst7jSl104dia51WGL
         kHwkkmNsYinwGE/UbsaphCa7wsUh90s6Dhz/FsZHwO+WAn22KRJEq7N990uHrBdtcZXT
         mx7Og8Fj68UlRHuNanqyWNDxx9FfpMGRRW+az+4tJlLkE6cKR7UkDTO09L13EpU5EM4S
         bL9vK7qFo0yJVLRmRPjA6Vh7t4vSK1d8F62tZAEOJg6ie4aF/LKIRGXEi4Xj5mc/h0u7
         ALHfa2chDCDb7IZ4WTbCB7HAJ8k7dvzVmc0GejpRo/6a8VcORo0cd6tTAbxdhymHSZyv
         RNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nVjsp3z3mcw1kUAx7WprdYYK1zXCCkfPYzY7H3i294A=;
        b=Bgy5xP7PP+IxCVnpDmbcXU8DJXKg+vWW3EZDKSK8U5MqMEDS+pSftWmSOvKwdbcs5N
         pFF8ioazUIyGy20CylTVAYji8iTz7ixX+Kzh7Tc05ZaWDViOO1ZWKeELPGNfGi6Vb7AD
         9tpfZZRaVltDl4w3ujAoSjuDHLwrM0L2KjwmIE7htRlZZKZktgbYrC2BSlmdIcg14PYt
         jnuTSG09/7CHymjmCDKUp0Aoh8mlWEEqgF4kOp37wYr80SxccnIeDWRn2n4ghNlmnQSi
         PFxZcwYp7WTu6D+kL4TA2y8sXQ0YrkEhUzX9acOmXqfyc5JK8Ri3b58aLTJV99BcFfBN
         pOpA==
X-Gm-Message-State: AOAM5305V82QugOoxFCPJqQ7zwDZKV+1Zl3oOIjzt8a4VmXcd78lIKl1
	gDn1oiWKaTt5xncpBhINk25mKdYKdrAm4Q==
X-Google-Smtp-Source: ABdhPJwkQ2aO5A3N48p87hdSExc6HCuBFpShgEHXxCU9cIpWnZtIIu4x+Bohhjfz+WM5R0OWijrdYQ==
X-Received: by 2002:a17:902:d2c8:b029:eb:424b:84c with SMTP id n8-20020a170902d2c8b02900eb424b084cmr6487193plc.71.1618412150652;
        Wed, 14 Apr 2021 07:55:50 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t65sm16178261pfd.5.2021.04.14.07.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:55:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 3/5] PEP8 double aggressive E22, E224, E241, E242 and E27
Date: Wed, 14 Apr 2021 07:55:44 -0700
Message-Id: <20210414145546.2007092-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414145546.2007092-1-raj.khem@gmail.com>
References: <20210414145546.2007092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/oe-stylize.py | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 7958797059..9d95911ae6 100755
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
2.31.1

