Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.14266.1618412152315078110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 07:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZtlOQeIM;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id j7so5171121pgi.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jHUJp7RKXRYetgjIYIG/Of1ZMvnQ8ODM2gDXBGDoRtI=;
        b=ZtlOQeIMv0SgXfMz8nwazrWoeBEWks+x8wG3muC4fNeAK1plHm+SAD/ov46ZyiNd6W
         qWxLPUuPTOhjc8Nw5hipIg0+q/k0zs1NHmRdqwC3d8BfcwSfCv5aDZzwqJkI6sAIe7is
         K8pBLghWWehIDvnXwDQ2uWKmyIDhNoydrDacGnOJfHpm1q3uK+T8BBWXvsDOsbSblHi9
         9APEh+pp8wFhqIQEuR8nhnQJUODOOb0OZU12fREiNLqJ6SDTv+Q9/NT2VG/vXbBFGawu
         QymK+SXy3sYq7E3X8n6GPw6hj0xc71l9dY3UKFhJ9ufE9mTnFTDRjhMGcqckhFM6XGFF
         oziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jHUJp7RKXRYetgjIYIG/Of1ZMvnQ8ODM2gDXBGDoRtI=;
        b=WTHGBYVhIJilP4O5t68cqhm4ApMpZ7P3pWUrpyWwp1J/+xsaIMYaeoE4NZnDnHmhet
         JZLbF1UfFWpopsZndyNU5ZTyMccswZXQ66rRObPpb7bEeOBLtFgeZECcNcgrQ8cqpNyI
         7ra3MXC9oAkUY4piv0AGtuabj4+acnSFhLr/btUDfQecjGjSyl2jzY4bugfC+Wsi8mvY
         bRgKsbSNhllanh8fJ7UOTQj/GBoUP9llxcOquvb5SByMTRcJXTbMN8JN4nh1gwB9AAdw
         fSb73SOGjF7Qh8UJC971POdmGGY5yQgQELZgqZBXXHNplnvjg8XDQXkeD4yoQFQ4pA9Q
         gQJg==
X-Gm-Message-State: AOAM533Ch109PpiclF2AqhloOVgAQNHVqHoGAranwqwhM5NFInLywxcK
	I/pLMqJNbqKoxAFn6meOw4Gq8EyT5M3z5g==
X-Google-Smtp-Source: ABdhPJxeM9+pYCXzmP4em5GX5LVeEFKWQGmaSMM5hbK2xR+RNtN4kU6+aSmpCxTc5SLSZcDi1CFvew==
X-Received: by 2002:a65:68c5:: with SMTP id k5mr3091471pgt.203.1618412151393;
        Wed, 14 Apr 2021 07:55:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t65sm16178261pfd.5.2021.04.14.07.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:55:51 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 4/5] PEP8 double aggressive E301 ~ E306
Date: Wed, 14 Apr 2021 07:55:45 -0700
Message-Id: <20210414145546.2007092-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414145546.2007092-1-raj.khem@gmail.com>
References: <20210414145546.2007092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/oe-stylize.py                         | 35 +++++++++++++++++++
 .../oeqa/selftest/cases/meta_oe_sources.py    |  1 +
 2 files changed, 36 insertions(+)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 9d95911ae6..cfabb90b10 100755
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
index b17c7950c7..c5a9a27946 100644
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
2.31.1

