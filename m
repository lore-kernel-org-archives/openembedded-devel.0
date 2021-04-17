Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.3592.1618693601569402353
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vFSlwMGi;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id q10so21544111pgj.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=yyTa0mofLb4goOH7HTiX8+9+CTv+O5CVdBXVnJGRpRQ=;
        b=vFSlwMGipOfX7ll9AMDz7cSwdFjZEFYGjQIcvvO/5d9BqND/m7iCqtwlBTvLFtDVpI
         CcKlj80xjnNsSGiEA4PvebIB+ZyrwarRd1K4nvzXos9E4AYVfAZ4mh7ZtTiy96ckQr7+
         +5S1NQrNoJf2yZzVRcVWWHU5PxtLjlO8V9r1MO/KIx75BiU9AWWHKMukz5Xr0jm2vGtO
         UIcybMJBaWWVHCAcEJ+KdDcP8hhyuvoY/KPLS7CfPxsNmIehVUBALfpOTonE+/7Q4cyO
         xtj40C5sw12ST++qfjHR8AaQ31p6zUwk8/sO4cr0R2ib/65Lb9dVaWzQTQ6Pvx9/PN65
         ZtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=yyTa0mofLb4goOH7HTiX8+9+CTv+O5CVdBXVnJGRpRQ=;
        b=asouRhvuSe+z3mY1/vnpj/JndQTJF7mCJVqPPCEj4FoO/lxha2P6o2da2BZLAA8WHW
         AxQw8CKxMIleeV1cFqrMDtfmaCxx4TfDI1QRIvec1lUq/3m41ZYBGwaR76OChEfRiBfr
         TZ57pXZCWhvf2o1sAdHSFvdhjFRRIm/WYNbdJJ1nlgmgoP0sV9bpuoCWPdK0hfN9YW2+
         OfU3UMHH+oi4sVCXrMVYsAAth4zWi+ylhfz46zlu/al1AuOJXZnvlb6czkWfEcK41JEL
         JR7zHE1LQs9sZDIs7i8gF98YcGuFByhmA2IwmXJF+VoLSAPUZKhcvjXRbktYAH5t/nyd
         dcVw==
X-Gm-Message-State: AOAM532TDsYVtJLYqYRluo1GcZK0s/5BbuSfA3Bo3lJr/uUMM52MvJqo
	iJEOeQFxJVfj0IBrjDcV3hejasYQ8wMeWA==
X-Google-Smtp-Source: ABdhPJxCJbSyRrrjdJxqEC0EBn2QA1SU/qcnp/Jq/aJMkufMmve3XbQBGKlYXGJtq1yAypQrpM8RGg==
X-Received: by 2002:a62:f84a:0:b029:245:17e4:bde2 with SMTP id c10-20020a62f84a0000b029024517e4bde2mr13174819pfm.64.1618693601013;
        Sat, 17 Apr 2021 14:06:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:40 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 43/50] PEP8 double aggressive E20 and E211
Date: Sat, 17 Apr 2021 14:05:52 -0700
Message-Id: <4099668975309217b316f295b76d3d462c8c0e40.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9c8810de37d10573c4220111a2694f73a2260106)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 contrib/oe-stylize.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 6f2b96c381f..7958797059a 100755
--- a/contrib/oe-stylize.py
+++ b/contrib/oe-stylize.py
@@ -312,10 +312,10 @@ def follow_rule(i, line):
         # if the line still does not respect the rule
         if not rules[i][0](line):
             # this is a rule disgression
-            print ("## Disgression: ", rules[i][2], " in: '", oldline, "'")
+            print("## Disgression: ", rules[i][2], " in: '", oldline, "'")
         else:
             # just remind user about his/her errors
-            print ("## Reminder: ", rules[i][2], " in : '", oldline, "'")
+            print("## Reminder: ", rules[i][2], " in : '", oldline, "'")
     return line
 
 
@@ -389,7 +389,7 @@ if __name__ == "__main__":
                 line = follow_rule(5, line)
             if var == "":
                 if not in_routine:
-                    print ("## Warning: unknown variable/routine \"%s\"" % originalLine.rstrip('\n'))
+                    print("## Warning: unknown variable/routine \"%s\"" % originalLine.rstrip('\n'))
                 var = 'others'
             for c in commentBloc:
                 seen_vars[var].append(c)
-- 
2.17.1

