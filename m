Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.8923.1599871424981547237
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 17:43:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rVkReZb0;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id f2so5658519pgd.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2020 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iaG75a/ovtpE7CjKRYqR2BJa8DS0DrnqpQX8lcsTF1g=;
        b=rVkReZb0bvDAFGfwHnYSz7XYyr03ZaId7mqTr9Q7r3wszULjcK/lblOEET1rIJorR7
         ayEC47zu8V3dRbtvgvpjT6NQA9PaZTbC79CnnMgTe6+r40NyoG6hakG1/CKceGNG6mR4
         ljeF3KJEdl8Kfq8mLK2UFf+pOGIdh//wekcs/Ul3jsHYZq8U/1M4i8KOWyXiHELO+kja
         mmOO4gbkH8MqU0EhBlKyXA8vnDb41r8ONJmQSuhT8Mv3gdPNPWiHCvQka046MiOPsWNr
         3ynxDoMzSCz0NmxFnQKjqkx5wVh3UNP65Wb3EtyCiupmCvpXRehfE3t/8AxketxOcnCM
         NKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iaG75a/ovtpE7CjKRYqR2BJa8DS0DrnqpQX8lcsTF1g=;
        b=W4H2pDWBS+lU0cfZ+CMZtLwb6MmaPtTa/WfNjDBRD6VjOlOFfD2tpKrp8sck1OPyb4
         8TA1KDD91zerLbQNk+JW3fygq9TJZhSR0lkHd9IxB8cEoZFKdOpHO4x3Djk6su03Dvw5
         9uMVl7sJU1aYc2Ezajm8dUe2mBY8TQQKiAgAAw+IT50sIjJ0Y5TD+mhkmUUMe3wGFPjF
         OClMMKEMz4Vc7hYCnjOS4hATFXlkNLh+vSQ/JjBelmpnYQBkD418ewZwysZ7MaWwIsgV
         gxyBvphEP2Bn3JXGWnBk+fyhd56jdPAfzfL+L8cs+xxgsLItqI0a9dtYz4W15/19FBH0
         LHOg==
X-Gm-Message-State: AOAM531jSUBMFBz9+QKOJSo0xUYWOl8jn5mhUwoeARudz006CF9pCKzw
	2VgVfcKWJZBsfziesSBnXlG7DJtxtl/2jw==
X-Google-Smtp-Source: ABdhPJwvJ4lqxoWq642DExxqxQjItohfZ3ageOO2tO5/gY0gt3baFn1W+RZhzYnQ2bWviUUbZ2YCPQ==
X-Received: by 2002:a62:16cd:0:b029:13e:d13d:a13f with SMTP id 196-20020a6216cd0000b029013ed13da13fmr4440167pfw.39.1599871423965;
        Fri, 11 Sep 2020 17:43:43 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::d92c])
        by smtp.gmail.com with ESMTPSA id e1sm3579994pfl.162.2020.09.11.17.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 17:43:43 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stanislav Angelovic <angelovic.s@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] Bump sdbus-c++ version to v0.8.3
Date: Fri, 11 Sep 2020 17:43:41 -0700
Message-Id: <20200912004341.1837778-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanislav Angelovic <angelovic.s@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../sdbus-c++/{sdbus-c++-0.8.1 => sdbus-c++-0.8.3}/run-ptest    | 0
 .../{sdbus-c++-tools_0.8.1.bb => sdbus-c++-tools_0.8.3.bb}      | 2 +-
 .../sdbus-c++/{sdbus-c++_0.8.1.bb => sdbus-c++_0.8.3.bb}        | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-0.8.1 => sdbus-c++-0.8.3}/run-ptest (100%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-tools_0.8.1.bb => sdbus-c++-tools_0.8.3.bb} (88%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_0.8.1.bb => sdbus-c++_0.8.3.bb} (96%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.1/run-ptest
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-0.8.3/run-ptest
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
similarity index 88%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
index 9eaec0f2a8..3b87c22653 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-tools_0.8.3.bb
@@ -8,7 +8,7 @@ inherit cmake
 
 DEPENDS += "expat"
 
-SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
+SRCREV = "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;subpath=tools"
 
 S = "${WORKDIR}/tools"
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
similarity index 96%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
index 82860a82f7..98829765c2 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.1.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_0.8.3.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${B
 
 DEPENDS += "expat"
 
-SRCREV = "3a4f343fb924650e7639660efa5f143961162044"
+SRCREV = "6e8e5aadb674cccea5bdd55141db5dad887fbacd"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
 SRC_URI += "file://run-ptest"
 
-- 
2.28.0

