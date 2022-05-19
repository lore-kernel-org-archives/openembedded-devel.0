Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E567C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:46:19 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web12.7772.1652967969427075116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R2/yjJ22;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id n10so10078665ejk.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 06:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5cRhCLTiGE6yJFI6EET3XfKSEGK3dSR2BbKt4KxSD6k=;
        b=R2/yjJ22nrLMWjSeRgLuf95J8KspAlp6Eaenpx6O4tdhhhHppO32TMogBBiCpl81Mh
         yxBBxW2g7vqUJSlPJnrc261jCgIRkncz7HfY/Kuh0YVeN/u3wl5BbkRTyBdaKwxQFa8I
         l9+bltpH/QE3ndPgD8oCyeuxUimRI51nhlb54JSa6cchygdz7SPitJxwiKUpF++chjpm
         E7UWZXqlVuafwyaGTR6NXz5b3h2GD2L5I0ct9392DeNa2GktiQUZdTBt9WfSt3cgZyDU
         m+oFsan0u7psQMq+ETYYUiK9LNTtkDk/5trzn0cmlnaTeLRyeG4DJ/jjdLMmRswWe4Ee
         pLAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5cRhCLTiGE6yJFI6EET3XfKSEGK3dSR2BbKt4KxSD6k=;
        b=VXjJLf+fIPamZSt+/L8bLNMUCIeZjxUSCFm8Q44uQmLh5v8dqxT9AVJ34vfg2ixV3j
         9XNDmMP+BaVsGr1ioQh8xDRudIYIKgyGQ1YshhTxQD8vJzBnRDDTdaAklgaHxgPaeKWO
         cVTHbjfhpIofzAEZwvfONtuhbq4OgIeiAc11ATHSYy5oMCml76gkv4Koumqg57yYNO8a
         uU0BvTheg+qx/sOn/dHy8QI3SoDOCywbq0s+9co/MdVwcfoZMzCplvDSQcAl1Hq2fkl8
         bM6eusHYN36YE/M47UIArLfSfGAzU13M1JPJQZo8Nbr8LCSf7AyN05YU4eXLc1crpA2i
         j5oQ==
X-Gm-Message-State: AOAM5332CkhU2gKKdY56JC3EQ8z1zmWncuQdeUEvVHX5qG3nVJHUSzv0
	h0+6AHhh3EZYetQ8zaa7c12jzF2WZOI=
X-Google-Smtp-Source: 
 ABdhPJz9D85uJaWIagnwRdsjOIhCSb28aXdRipt/YUarK4yIiQCesTEB+4uzz+C567GwEa9b1BfnYw==
X-Received: by 2002:a17:907:d28:b0:6f4:6375:5245 with SMTP id
 gn40-20020a1709070d2800b006f463755245mr4355074ejc.12.1652967967611;
        Thu, 19 May 2022 06:46:07 -0700 (PDT)
Received: from Unimatrix08-Focal.lan ([93.68.172.225])
        by smtp.gmail.com with ESMTPSA id
 hv6-20020a17090760c600b006f3ef214e4fsm2118305ejc.181.2022.05.19.06.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 06:46:07 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>,
	Gianfranco Costamagna <locutusofborg@debian.org>
Subject: [meta-oe][PATCH 2/2] sdbus-c++: Bump version from 1.00 to 1.1.0
Date: Thu, 19 May 2022 15:45:59 +0200
Message-Id: <20220519134559.808802-2-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519134559.808802-1-costamagnagianfranco@yahoo.it>
References: <20220519134559.808802-1-costamagnagianfranco@yahoo.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 13:46:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97198

Cherry-pick upstream commit 7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44 to fix build

Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
---
 ...7a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch | 54 +++++++++++++++++++
 .../run-ptest                                 |  0
 ...{sdbus-c++_1.0.0.bb => sdbus-c++_1.1.0.bb} |  5 +-
 3 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++-1.0.0 => sdbus-c++-1.1.0}/run-ptest (100%)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_1.0.0.bb => sdbus-c++_1.1.0.bb} (89%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch
new file mode 100644
index 000000000..641935f68
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch
@@ -0,0 +1,54 @@
+commit 7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44
+Author: Stanislav Angelovic <stanislav.angelovic@siemens.com>
+Date:   Thu Jan 27 13:38:19 2022 +0100
+
+    fix(tests): printer for std::chrono in googletest v1.11.0
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index fbf198c..ec42e55 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -19,7 +19,7 @@ if (NOT TARGET GTest::gmock)
+     if (NOT TARGET GTest::gmock)
+         include(FetchContent)
+ 
+-        message("Fetching googletest...")
++        message("Fetching googletest v${GOOGLETEST_VERSION}...")
+         FetchContent_Declare(googletest
+                             GIT_REPOSITORY ${GOOGLETEST_GIT_REPO}
+                             GIT_TAG        release-${GOOGLETEST_VERSION}
+diff --git a/tests/integrationtests/Defs.h b/tests/integrationtests/Defs.h
+index 2f129a4..2bfc7c9 100644
+--- a/tests/integrationtests/Defs.h
++++ b/tests/integrationtests/Defs.h
+@@ -56,20 +56,18 @@ const bool DEFAULT_BLOCKING_VALUE{true};
+ 
+ constexpr const double DOUBLE_VALUE{3.24L};
+ 
+-/** Duration stream operator for human readable gtest value output.
+- *
+- * Note that the conversion to double is lossy if the input type has 64 or more bits.
+- * This is ok for our integration tests because they don't have very
+- * accurate timing requirements.
+- *
+- * @return human readable duration in seconds
+- */
++}}
++
++namespace testing::internal {
++
++// Printer for std::chrono::duration types.
++// This is a workaround, since it's not a good thing to add this to std namespace.
+ template< class Rep, class Period >
+-static std::ostream& operator<<(std::ostream& os, const std::chrono::duration<Rep, Period>& d)
+-{
++void PrintTo(const ::std::chrono::duration<Rep, Period>& d, ::std::ostream* os) {
+     auto seconds = std::chrono::duration_cast<std::chrono::duration<double>>(d);
+-    return os << seconds.count() << " s";
++    *os << seconds.count() << "s";
++}
++
+ }
+-}}
+ 
+ #endif /* SDBUS_CPP_INTEGRATIONTESTS_DEFS_H_ */
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/run-ptest
similarity index 100%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.0.0/run-ptest
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++-1.1.0/run-ptest
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
similarity index 89%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
index 39f0b4c56..3904ae5fc 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.0.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_1.1.0.bb
@@ -16,10 +16,11 @@ PACKAGECONFIG[with-tests] = "-DBUILD_TESTS=ON -DTESTS_INSTALL_PATH=${libdir}/${B
 
 DEPENDS += "expat"
 
-SRCREV = "65782bbf435d91e5eb6af9ddab110df406a824a9"
+SRCREV = "bca8e81037766a0454740c40307eea32831c101f"
 
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master"
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest \
+            file://7f437a6e06d2ec3abd3e2fd1101ab6aab386bc44.patch "
 
 EXTRA_OECMAKE = "-DBUILD_CODE_GEN=OFF \
                  -DBUILD_DOC=ON \
-- 
2.25.1


