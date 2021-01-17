Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.21302.1610905593662210741
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 09:46:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SS6Hj1Yd;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id x18so7354899pln.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 09:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9oECxSb3XOzhFEhvQ+EG3Q4lLtYSNud1dIUuecrB1nQ=;
        b=SS6Hj1YdRrjU6LigK9wPns5M4o+TM0nQFxXnWEo7wRiaO8JuvaZOK3Zd5ZwvjeT6Ug
         F58FrUNDa4p7tTzPzKRvnOXWEtUgrWQZbT3xUIC9WXOvma6KCMeNeL2xRg3+yFCS/i3d
         aa1cvaZQRzspbCXP2enyyt+BbDRPKGoByfD7SQ/+OXFwAPbwUCgnr47W41MY0jo9gfjd
         b6+ODF98YRCi/Sp42cxVBPIfDQEI+36XjoNU5IsRCerHLDvi1A1TWQT4GidtkpT8sDnJ
         EilYuQM6u1Gu6lhIi2Q8j7qJhxNaeR7VdCrjRc7XJcwXaulN9l5w0ENdSECQ9RoQ0/NQ
         qn6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9oECxSb3XOzhFEhvQ+EG3Q4lLtYSNud1dIUuecrB1nQ=;
        b=Wi0jvRqpX6EkvAG0BDNB3P2+TJTuU15OFQ2ANPtw2+RFYsAKSXlWM5FDiVq94W2NGj
         fmKDHepFhv6k3RJN+UdSXkRi29KB/BKBbPCHzBspJ5ZeWsQecPLrJdAluXCi7y1idSPg
         HzcHaioOUYnhPxvbL1UGUx51MWGGvKWtDuhUmiuHaxFOGxzt3jfF4Pekhiwv5H0dGbM1
         P8DXysVPDUAOj/QLgdj6UpTQZtz0dxcRm38K7wCvHJ41TBGkQpsgm4cSNiteC+f5slcF
         3bUN/5bMjrH8wkxe5w0nTQzBjzVOkRkkILn8seitSmbfTjuawuG01yxzWhFtKLcHXnje
         wW8g==
X-Gm-Message-State: AOAM533LOEM3u5BLpwtgey56kY4OQM2EdnUYQsRDmk9mgNbdfrcvz8rA
	FL+bA3PcNUxdtliAcZcjT1UqoLk4pT19RA==
X-Google-Smtp-Source: ABdhPJw72UOmKmJUypj4fW7p0Gv03NDKH8LI8HS99FiQ5s1yP1qWLrmNlTFi5/eoIlMNmxNTZI6XGA==
X-Received: by 2002:a17:90a:6401:: with SMTP id g1mr21616021pjj.165.1610905593135;
        Sun, 17 Jan 2021 09:46:33 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:ed67:500f:ea8f:e947])
        by smtp.gmail.com with ESMTPSA id bk18sm10427870pjb.41.2021.01.17.09.46.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 09:46:32 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/28] dlt-daemon: add upstream patch to fix CVE-2020-29394
Date: Sun, 17 Jan 2021 09:46:00 -0800
Message-Id: <0c158538eda581450dbdb5762d668721ba7fe4f0.1610905441.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610905441.git.akuster808@gmail.com>
References: <cover.1610905441.git.akuster808@gmail.com>

From: Gianfranco <costamagna.gianfranco@gmail.com>

More information on: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=976228
| A buffer overflow in the dlt_filter_load function in dlt_common.c in
| dlt-daemon 2.8.5 (GENIVI Diagnostic Log and Trace) allows arbitrary
| code execution because fscanf is misused (no limit on the number of
| characters to be read in a format argument).

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[Fix up for Dunfell context - AK]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dlt-daemon/dlt-daemon/275.patch           | 38 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.4.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
new file mode 100644
index 0000000000..75065eb054
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/275.patch
@@ -0,0 +1,38 @@
+Upstream-status: Backport
+CVE: CVE-2020-29394
+From 7f5cd5404a03fa330e192084f6bdafb2dc9bdcb7 Mon Sep 17 00:00:00 2001
+From: GwanYeong Kim <gy741.kim@gmail.com>
+Date: Sat, 28 Nov 2020 12:24:46 +0900
+Subject: [PATCH] dlt_common: Fix buffer overflow in dlt_filter_load
+
+A buffer overflow in the dlt_filter_load function in dlt_common.c in dlt-daemon allows arbitrary code execution via an unsafe usage of fscanf, because it does not limit the number of characters to be read in a format argument.
+
+Fixed: #274
+
+Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
+---
+ src/shared/dlt_common.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 254f4ce4..d15b1cec 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -404,7 +404,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+     while (!feof(handle)) {
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
+@@ -419,7 +419,7 @@ DltReturnValue dlt_filter_load(DltFilter *filter, const char *filename, int verb
+ 
+         str1[0] = 0;
+ 
+-        if (fscanf(handle, "%s", str1) != 1)
++        if (fscanf(handle, "%254s", str1) != 1)
+             break;
+ 
+         if (str1[0] == 0)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
index 35c638bc78..45724e98ac 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=https \
     file://0002-Don-t-execute-processes-as-a-specific-user.patch \
     file://0004-Modify-systemd-config-directory.patch \
     file://204.patch \
+    file://275.patch \
 "
 SRCREV = "14ea971be7e808b9c5099c7f404ed3cf341873c4"
 
-- 
2.17.1

