Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.14360.1618412150384149555
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 07:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fQHvF8zn;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d8so10240214plh.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 07:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RNWH0G0LM3XfAhebNUh613jatIPRim+fkwIVfRsKV+c=;
        b=fQHvF8znw/gHkQ8znr5tBWHVD9wPmo48XFxRRYhAMHEjrfj3hDJoXB1aG7BITaThcq
         Lp3i1iln2Q1gouxiGHCh47+eQyWVb5kO8l3XpfU1H2eY/flsU1NXeDwYkY3GRjabC4LF
         NCtMS8nkUR4f02Odty/vSeRDnxk7W4R08gLOe9obwGvKoRuQil2dRVAQ2TVpcD4YBPDY
         gXX7AaWVwiEtLWSCd/EF5vZ0mTddzvH6JOSEhGT0n+7MlL7sZk8PKbMvMIsIGCrtqc6L
         IDifzV0CVp6MT0fjl/MWQI9FXfHL5Wr57OLhghtAiJX5c6Oj21pO/cv4QMF1MpYEIwo6
         yivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RNWH0G0LM3XfAhebNUh613jatIPRim+fkwIVfRsKV+c=;
        b=FjyDSZzYAjx29eRxZY9p7Dn6qL3oktrXUJG1JYKeykTvO+RNRWIagZLebHMfv4sA7O
         UB9vrOfJ7s3Pfu3gj9zXaUFQ00Cx/l0fmbp+rKmbLpTkq1tYMnMrFcxfW0uRhaSpEovq
         Wd3Q7p1aZLnbKEdx62K6e8hWdwRV4F9D3u7DZtM7pFY4JR0Oks8AyR7x/mxLgPaF5V9H
         6cuo8SanWj66jtg1bQpVHe1Vj2CSCClVsrRgH9FX7YSV61Ydr+InRxIIMUcsY2aPvxNF
         mFJ1Y5BEXjP19GuK5qEKXoB27WS58oQdY1aTRo3OblPOUAd8wfeeDZBUFkiKn9tOwsqW
         Q+NA==
X-Gm-Message-State: AOAM533ysEgCI/bc45GKBfmFCT3qOH4W9gs+QU+nqApffMqNYFmzpH1+
	eLI0n6kPLjcEuyKuhg9WhnLkn0i7LvUgFw==
X-Google-Smtp-Source: ABdhPJyOz7kyXrjErROhD5Ed+9IdjjIbu4XgdrgInKvZ6uyv7x7rVeug+bA9HjP/6QXmOAIJzxUEPQ==
X-Received: by 2002:a17:902:a38e:b029:eb:3963:5aee with SMTP id x14-20020a170902a38eb02900eb39635aeemr7849549pla.78.1618412149747;
        Wed, 14 Apr 2021 07:55:49 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id t65sm16178261pfd.5.2021.04.14.07.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 07:55:49 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: persianpros <persianpros@yahoo.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 2/5] PEP8 double aggressive E20 and E211
Date: Wed, 14 Apr 2021 07:55:43 -0700
Message-Id: <20210414145546.2007092-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414145546.2007092-1-raj.khem@gmail.com>
References: <20210414145546.2007092-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: persianpros <persianpros@yahoo.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 contrib/oe-stylize.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/contrib/oe-stylize.py b/contrib/oe-stylize.py
index 6f2b96c381..7958797059 100755
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
2.31.1

