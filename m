Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.3520.1618693600941516048
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=egCXHhf+;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id f29so21540805pgm.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZM00H1c59Nz9x8L9091ZUwPKmaOO5z2JCueDZEDd7tQ=;
        b=egCXHhf+W6AIy6qLmfijAk8635RCJ0KvgveCasvWspMeG7yT1naB/KGs0hZYAliZer
         bWvVi23tcoSC2MaWnhguE86idXrI/Z9btbseUrgXqS+EYEwZhsjuT0LoDCUzV+Ee2PxW
         v3/WazHOwp640mZeolc1MWUdkjK0jIPfGRd2L3j7/BBpwSUexv/b0H8yOBh+PFiEoOjW
         ZquW6C1tplv6CWX/NUWoCKEFVNjzp8GdVpElufIk102Ttrd8pOw+oUmAyv6vn8w+Aza4
         DHUyoSbhf0PyYfs8WFSX4epLJx0V/lDg3okkf12DUQBquhfrshpsWx8iTHBXd4M13t0+
         iwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZM00H1c59Nz9x8L9091ZUwPKmaOO5z2JCueDZEDd7tQ=;
        b=rZ+J16VneyHYH+4J9sJh1z1oHZ6lJ+eBPzno1iCqYVgDi3QCUN7wd0z502JAgQ7fm0
         pmWEBiKrhsIKbo0ackvoC+6/+4avLbMuc8qCEt8JVUko72e1D3Gp6VnkRg1ynLIU+VPB
         QdyaoQ+1zHAT6lHb06Q763oKgiM2l0aA+MoVAJJqciiDlg+YlkkyNONnXg1wdNAwCcDH
         U0ASQgdPTlm6eIFOhH9XIKdjO24eER//k+zdgJ6ywEPf6qd6xMAezlHCP8PRiwy8RX1J
         MXjekXvdh4YSjidUvW+EwaEsPo4T8mhqg1yyR1z67wCIftHLIRe7x4g4D4EywYYJMC82
         C7wA==
X-Gm-Message-State: AOAM530w/KfWk19MwmpZnFKVpC0EZP+ptrWtmLiFz6WBrAEDdjf4zfSw
	lVf8T/4+2doFTa0/eu4Prw78M2ZGIJsgjA==
X-Google-Smtp-Source: ABdhPJzek1Vj9BzWKQnhUdZtnCpncLabxWZGi41rTiBPe+lYHoyEjhFmHDALsR2+dHxE5ekxW/1yNA==
X-Received: by 2002:aa7:9312:0:b029:24b:f2b4:d8e6 with SMTP id 18-20020aa793120000b029024bf2b4d8e6mr13259359pfj.31.1618693600394;
        Sat, 17 Apr 2021 14:06:40 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.39
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:39 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 42/50] PEP8 double aggressive E701, E70 and E502
Date: Sat, 17 Apr 2021 14:05:51 -0700
Message-Id: <e8c50177ef44e496ef13011a2f57db5b67805cc6.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fa4f448fbedfe7b78c69821a0ef5da24002932cc)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index ba4b87a74cb..6f2b96c381f 100755
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
2.17.1

