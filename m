Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
 by mx.groups.io with SMTP id smtpd.web11.8643.1586006957511504886
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.196, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f196.google.com with SMTP id r21so384286oij.11
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cx8lDEksbn7sbno0QH/vHrXD/pfH2s+i1aKrXvJO7vA=;
        b=KmWbQ8Nuita74MTRAy/m4zxmaCc9/Up+cVRHLsJyUgqiKfR+cJcj8fEp1j3xQ9POKd
         pIJLQBrvli51Kw55Fm5leZYYDcjjWnkYiFGbVRFzY4xlQjKTduVoE/jP22LZ70k8jR/f
         m2z1ST0PP9wunZbaXac7RTF2NJ1jq9L86BwycKUskGA8L01IfhYio+5/5PZEGYedLTmg
         Mb53UJffLCaEqBdKeDnhtQ/XjnZV8XHatjk5kAIOmbC8ORyZGdXuROH4fNl3zI0rsdhK
         i95SUZRVZgjiAtsMPw3tMH3peCU0LzkMTCkm1QPD1sBVH/8eUtGMnI828pVJaczipriC
         yCuA==
X-Gm-Message-State: AGi0PuayVyIaEiKW39HG9Qu69q/sIE4CDP7u7LDOjApNDFR+qyvh/zQ6
	1WO1mvPz9lMIJizLgK3tBzd29iNKkUA=
X-Google-Smtp-Source: APiQypLxA73IQ3zg+MFSBmY17xTJ1wqA1QCI5s2xJmJyXpQ4jWtQmPkJnFzL9ztIPYN2M3ysYnOS6Q==
X-Received: by 2002:aca:da57:: with SMTP id r84mr6393258oig.79.1586006956629;
        Sat, 04 Apr 2020 06:29:16 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:15 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 08/11] python-tzlocal: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:43 -0400
Message-Id: <20200404132846.16832-8-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-tzlocal.inc   | 8 --------
 .../recipes-devtools/python/python3-tzlocal_2.0.0.bb     | 9 ++++++++-
 2 files changed, 8 insertions(+), 9 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-tzlocal.inc

diff --git a/meta-python/recipes-devtools/python/python-tzlocal.inc b/meta-python/recipes-devtools/python/python-tzlocal.inc
deleted file mode 100644
index 3e423d2278..0000000000
--- a/meta-python/recipes-devtools/python/python-tzlocal.inc
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Library to return tzinfo with the local timezone information"
-HOMEPAGE = "https://pypi.org/project/tzlocal/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
-
-SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"
-SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590"
-
diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb b/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
index 813934c812..3573b29f03 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_2.0.0.bb
@@ -1,2 +1,9 @@
+SUMMARY = "Library to return tzinfo with the local timezone information"
+HOMEPAGE = "https://pypi.org/project/tzlocal/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
+
+SRC_URI[md5sum] = "b14262cecca16ec9220ca8dff2ca7c5d"
+SRC_URI[sha256sum] = "949b9dd5ba4be17190a80c0268167d7e6c92c62b30026cf9764caf3e308e5590"
+
 inherit pypi setuptools3
-require python-tzlocal.inc
-- 
2.17.1

