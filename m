Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.3593.1618693603054248150
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X4+wuqk9;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id kb13-20020a17090ae7cdb02901503d67f0beso4414191pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MbdqBHGzrjJWSa7XawSN1x2tQui7yCa29L3/CtMhfx0=;
        b=X4+wuqk9t69LgTXnx0VsLkh+mZZookDwaDmpYlNrIB4EAyZI0Ft9wSTSEtoGnw82M3
         2wzhqkYKhgUVdZ+7b9X6A250kcxU9TYNiq2ERapomkC3XokPoSHj96rJOnYyq/Xrzzzi
         ZpCeEhxO6+qQmKNRO0G0vt66lp+f4RfiBEOWHc7ISDcPSIuT5ZKmBt43tlq9ApkJMe6+
         RgdWNGGRB4UF98OTp6usrvwRUOrSF2UehF34fjK82Acj5fU7Y30Zz8GmPdaSeE4Q3emm
         ic96757sDx66rBDZZmv8XEpDQypFJmc8nT5TRZF7KZR+M7NGdHAwcjKEKfCrEbOiZpZt
         uSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MbdqBHGzrjJWSa7XawSN1x2tQui7yCa29L3/CtMhfx0=;
        b=jLNbLa+NeemjhbBCUknVw8IoK3mpfvd+vCSE21hONHr+e+wagE7lWGUDPHHGOYWHBV
         ottkX/mqqSOOSB4t+ebMTJN9LkeeV5YU/nYHlT8LEKqm2DruMX/J3q49KzhzCGqX7e3w
         Z9DCKO34q44vvUq++ljjhcZJ9WaoiThy+uvFbBck4yifU6BGHbgKO0Z65Qj5wRyeeLzN
         FjPYnDwuclo2MzQAum8qDzAxKbFnGHcJC2/cgXyR9XIrDMQ79Bt38ae6ErgTAnHWTVSD
         AG63PNCJtVHzmqrEen9Mma4WHLAx6kPSPRwyfyte2cquNRMaN/vvnX3P/md5d5zIfwdH
         AUGg==
X-Gm-Message-State: AOAM5324cfXfeXilkCZiDBqOO3vuaSWuGcaDN+Qh5Bu3ywTRDNDg1Tfw
	xKhghdub5v8SGlYtljGWShRU4px2xQJEVA==
X-Google-Smtp-Source: ABdhPJyP1JlcHc5JWTjyyYF+PkuftcqExpjx8nnpJlprFVrXFE3VNWXqRXKbkYkZNn4Kw25QEWqv/g==
X-Received: by 2002:a17:902:b705:b029:e6:f027:adf8 with SMTP id d5-20020a170902b705b02900e6f027adf8mr16035561pls.72.1618693602496;
        Sat, 17 Apr 2021 14:06:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 45/50] PEP8 double aggressive E301 ~ E306
Date: Sat, 17 Apr 2021 14:05:54 -0700
Message-Id: <40fb89213b1a232afc920a25692d054768858b3d.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit af6838a62c53dab71941b2cc31f0e32387cd30e0)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py                         | 35 +++++++++++++++++++
 .../oeqa/selftest/cases/meta_oe_sources.py    |  1 +
 2 files changed, 36 insertions(+)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 9d95911ae6e..cfabb90b10f 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -221,41 +221,59 @@ for v in OE_vars:
 # _Format guideline #0_: 
 #   No spaces are allowed at the beginning of lines that define a variable or 
 #   a do_ routine
+
+
 def respect_rule0(line): 
     return line.lstrip() == line
+
+
 def conformTo_rule0(line): 
     return line.lstrip()
 
 # _Format guideline #1_: 
 #   No spaces are allowed behind the line continuation symbol '\'
+
+
 def respect_rule1(line):
     if line.rstrip().endswith('\\'):
         return line.endswith('\\')
     else: 
         return True
+
+
 def conformTo_rule1(line):
     return line.rstrip()
 
 # _Format guideline #2_: 
 #   Tabs should not be used (use spaces instead).
+
+
 def respect_rule2(line):
     return line.count('\t') == 0
+
+
 def conformTo_rule2(line):
     return line.expandtabs()
 
 # _Format guideline #3_:
 #   Comments inside bb files are allowed using the '#' character at the 
 #   beginning of a line.
+
+
 def respect_rule3(line):
     if line.lstrip().startswith('#'):
         return line.startswith('#')
     else: 
         return True
+
+
 def conformTo_rule3(line):
     return line.lstrip()
 
 # _Format guideline #4_:
 #   Use quotes on the right hand side of assignments FOO = "BAR"
+
+
 def respect_rule4(line):
     r = re.search(varRegexp, line)
     if r is not None:
@@ -263,33 +281,48 @@ def respect_rule4(line):
         # do not test for None it because always match
         return r2.group(1) == '"' and r2.group(3) != ''
     return False
+
+
 def conformTo_rule4(line):
     r = re.search(varRegexp, line)
     return ''.join([r.group(1), ' ', r.group(3), ' "', r.group(5), r.group(5).endswith('"') and '' or '"'])
 
 # _Format guideline #5_:
 #   The correct spacing for a variable is FOO = "BAR".
+
+
 def respect_rule5(line):
     r = re.search(varRegexp, line)
     return r is not None and r.group(2) == " " and r.group(4) == " "
+
+
 def conformTo_rule5(line):
     r = re.search(varRegexp, line)
     return ''.join([r.group(1), ' ', r.group(3), ' ', r.group(5)])
 
 # _Format guideline #6_:
 #   Don't use spaces or tabs on empty lines
+
+
 def respect_rule6(line):
     return not line.isspace() or line == "\n"
+
+
 def conformTo_rule6(line):
     return ""
 
 # _Format guideline #7_:
 #   Indentation of multiline variables such as SRC_URI is desireable.
+
+
 def respect_rule7(line):
     return True
+
+
 def conformTo_rule7(line):
     return line
 
+
 rules = (
     (respect_rule0, conformTo_rule0, "No spaces are allowed at the beginning of lines that define a variable or a do_ routine"),
     (respect_rule1, conformTo_rule1, "No spaces are allowed behind the line continuation symbol '\\'"),
@@ -303,6 +336,8 @@ rules = (
 
 # Function to check that a line respects a rule. If not, it tries to conform
 # the line to the rule. Reminder or Disgression message are dump accordingly.
+
+
 def follow_rule(i, line):
     oldline = line
     # if the line does not respect the rule
diff --git a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
index b17c7950c7e..c5a9a279465 100644
--- a/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
+++ b/meta-oe/lib/oeqa/selftest/cases/meta_oe_sources.py
@@ -6,6 +6,7 @@ import tempfile
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
 
+
 class MetaOESourceMirroring(OESelftestTestCase):
     # Can we download everything from the OpenEmbedded Sources Mirror over http only
     def test_oe_source_mirror(self):
-- 
2.17.1

