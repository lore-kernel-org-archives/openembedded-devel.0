Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.1813.1587975006326505900
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 01:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hGJpNrSs;
 spf=pass (domain: gmail.com, ip: 209.85.221.65, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-wr1-f65.google.com with SMTP id s10so19398913wrr.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 01:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=S41nh9+ZV6C4/YHQrm721mzi8dFUrIZ17Tr+tNbu/kc=;
        b=hGJpNrSs5JhjIoLoUO2WW/9rHM2g5066mIv15FwLf67EIW3TjM/2IsWun9/EYknMUv
         MmJzWMNwgPv8t7oKLAP3KnrZjx6My3M/vXZuvGfVgpQgTTyXFVbrZrmhyd48HJMWNkrs
         Su4ol35k72aTxJQzi6Uz/kdXsetBOnSutFrkCx2CWth+AW7RPE7Kyn7SL63X4YqJ8PGv
         OlMxAuPdNVL2zbSEg7lX0N2lwc8It8XQdrZnIKuyzd+U7tpyLg5Z3prtMMFO6Ahw41en
         c8zz44bhJv9A+mPRo8Hlhg+NxLZhPqGNCIILztI5SltbFQ/fO0vXXybNrByfGBRGw9+q
         peFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S41nh9+ZV6C4/YHQrm721mzi8dFUrIZ17Tr+tNbu/kc=;
        b=ZRDJNSo9AS8rhegVAIm8cbxYCke2d4HOmca4WW82KZSiaaGvlEH28ezNJECWvGhsyd
         P8UhiA9fbFbBD9mAfvvQERsP33OLgvheiAthtnG77YfsJHrUy/1/X8rP7ZDxS5AWIAma
         wEP51c07oXC9b7uM6MB7eGuAEip37JHYZ1g5Pgm7b4wtL9hh0tCZrk0Nvaiuf8Ua2j1j
         1AQ9FwSQS4ZFbizILq362VCODap8p364i3gB/SIFxjJYySh4KkkU0BVmroTrnIHXOzLa
         bNm6xOhCgtgVAucAwZgm+LrvwkQFuvE9R8jVfhMILg/RNZXbZeUzp/I21tbP9b0T1bc9
         T3nw==
X-Gm-Message-State: AGi0PuaGmhYMuIGGJFbkBFa0eqjIzRrm9ZlNLYLWEXX+YPahciGUaEqa
	klawIGGCIoLbSr/SLt9GOl7LbP1gPZU=
X-Google-Smtp-Source: APiQypI9tua8ePW7rHnBYeLrN3Q6AmZEsai19lAAkVYf2vh2/UFA8cO66W5KZHC3JJWa4KCJIZZitA==
X-Received: by 2002:adf:e486:: with SMTP id i6mr24943777wrm.377.1587975004475;
        Mon, 27 Apr 2020 01:10:04 -0700 (PDT)
Return-Path: <costamagna.gianfranco@gmail.com>
Received: from localhost.localdomain (mob-31-157-120-237.net.vodafone.it. [31.157.120.237])
        by smtp.gmail.com with ESMTPSA id q143sm15405405wme.31.2020.04.27.01.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 01:10:03 -0700 (PDT)
From: "Gianfranco" <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH] websocketpp: refresh patches to apply cleanly on websocketpp 0.8.2
Date: Mon, 27 Apr 2020 10:09:57 +0200
Message-Id: <20200427080957.1229-1-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 .../websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch   | 2 +-
 meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
index f1d037fae..7a99daf6b 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/0001-Correct-clang-compiler-flags.patch
@@ -18,7 +18,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2d13117..c17354a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -150,7 +150,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+@@ -154,7 +154,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
          endif()
          set (WEBSOCKETPP_PLATFORM_TLS_LIBS ssl crypto)
          set (WEBSOCKETPP_BOOST_LIBS system thread)
diff --git a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
index a1ee627b3..3245d941b 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
+++ b/meta-oe/recipes-support/websocketpp/websocketpp-0.8.2/855.patch
@@ -12,7 +12,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2d13117b..9a46bc10 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -213,7 +213,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
+@@ -217,7 +217,7 @@ if (BUILD_TESTS OR BUILD_EXAMPLES)
      set (Boost_USE_MULTITHREADED TRUE)
      set (Boost_ADDITIONAL_VERSIONS "1.39.0" "1.40.0" "1.41.0" "1.42.0" "1.43.0" "1.44.0" "1.46.1") # todo: someone who knows better spesify these!
  
-- 
2.17.1

