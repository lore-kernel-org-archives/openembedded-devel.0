Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.14264.1618412149861533381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 07:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lUVzJYyU;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id cu16so8400893pjb.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCLGIf84E0IWgI5sFFmc4w3DpkHl3SKgt1pu25YvbGU=;
        b=lUVzJYyUjRWSSvAM2jcgneJSlSepkVq9NRvq9W8EqWj0YrZx/wS5JRykgSbtohE1Ot
         XPEhrJznkmWfRmrXXCF7UhDt6+4v+1UVRTQI/D3zd/oBy+v4hyrxXKnCm5FkZUuyInWL
         /qdcPdB1+0nNSO/xTuaNcBFB9SMN4L2h7GTyVfkUHvHla2tz6ZxayoeozKwd8h0bUGjE
         jardORrrTtYk3M3Mxu02ncNGohA/x7uhMNnZBvruRdrC0JajhEGBZJqEfgaRLUW8Mz+8
         VUfuBgF3O7o+QAbavGypnS69lDHqaqmN07c5fxYmIlyA3j2DX6OaoJO+bZwbjueIXjyV
         4USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NCLGIf84E0IWgI5sFFmc4w3DpkHl3SKgt1pu25YvbGU=;
        b=Ehscm9cozNdza525twpJwjYf73BmkRNzyspL3kFLDb7ZpnEueSW5N020VNqZO0dpae
         TeORO28Y8N9VQZgUqbSXtMVih6Me3scn1UaoETBUUJUmVvfySuufjc2BudpvrbsVFrqP
         2YcnxYblOJm/9iqnaHCNVnedpCybklsyHKPaemKumsp9k9uElOhpsggMxF/zQgeNefAO
         BzX+BofvvJFZp1oXxAp16ZInA6VQOhkUBEncngD9dyKtwVeUJAk8u5qfF+qUYr3X4Za8
         IBY1ag+5tiAA3P+S/4UYqQrgi9A3QXfGH3yH+N50bSbJm4TPy8s1DbiGx/rq4WQabBvs
         fImw==
X-Gm-Message-State: AOAM530k7xo1rLBqgTUKMqRHNBnFnil4YXOy5zOcoJ6h+Ec1YZDl9eOc
	F+WNrfxAQlWDMqr0IOVM5uJfmgsvWhDgPw==
X-Google-Smtp-Source: ABdhPJyHYcccCQHl5T3BQsufL5RnPKvd61BoR9XOrF/zum/fkJq3YA10lHKAEyw98LSthwU3Dd0ZZQ==
X-Received: by 2002:a17:902:e8d5:b029:e6:cabb:d07 with SMTP id v21-20020a170902e8d5b02900e6cabb0d07mr37826974plg.3.1618412148973;
        Wed, 14 Apr 2021 07:55:48 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t65sm16178261pfd.5.2021.04.14.07.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:55:48 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 1/5] PEP8 double aggressive E701, E70 and E502
Date: Wed, 14 Apr 2021 07:55:42 -0700
Message-Id: <20210414145546.2007092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/oe-stylize.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index ba4b87a74c..6f2b96c381 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -353,7 +353,8 @@ if __name__ == "__main__":
         # ignore empty lines
         if line.isspace() or line is '':
             # flush comments into the olines
-            for c in commentBloc: olines.append(c)
+            for c in commentBloc:
+                olines.append(c)
             commentBloc = []
             continue
 
@@ -370,7 +371,8 @@ if __name__ == "__main__":
             continue
 
         if var in seen_vars:
-            for c in commentBloc: seen_vars[var].append(c)
+            for c in commentBloc:
+                seen_vars[var].append(c)
             commentBloc = []
             seen_vars[var].append(line)
         else:
@@ -389,24 +391,29 @@ if __name__ == "__main__":
                 if not in_routine:
                     print ("## Warning: unknown variable/routine \"%s\"" % originalLine.rstrip('\n'))
                 var = 'others'
-            for c in commentBloc: seen_vars[var].append(c)
+            for c in commentBloc:
+                seen_vars[var].append(c)
             commentBloc = []
             seen_vars[var].append(line)
-        if not keep and not in_routine: var = ""
+        if not keep and not in_routine:
+            var = ""
 
     # -- dump the sanitized .bb file --
     addEmptyLine = False
     # write comments that are not related to variables nor routines
-    for l in commentBloc: olines.append(l)
+    for l in commentBloc:
+        olines.append(l)
     # write variables and routines
     previourVarPrefix = "unknown"
     for k in OE_vars:
-        if k=='SRC_URI': addEmptyLine = True
+        if k=='SRC_URI':
+            addEmptyLine = True
         if seen_vars[k] != []: 
             if addEmptyLine and not k.startswith(previourVarPrefix):
                 olines.append("")
             for l in seen_vars[k]: 
                 olines.append(l)
             previourVarPrefix = k.split('_')[0]=='' and "unknown" or k.split('_')[0]
-    for line in olines: print(line)
+    for line in olines:
+        print(line)
 
-- 
2.31.1

