Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D041DC433EF
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 21:35:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.9764.1646516149840649023
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 13:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pUKILwmo;
 spf=pass (domain: gmail.com, ip: 209.85.221.47,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id u1so17600305wrg.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Mar 2022 13:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=H4SWAFtgZshxJ47TJ8Dt0f0d4JB30v6DOMAO9UL+KkY=;
        b=pUKILwmoPusYQ/eT2+ku8VjfOTEwdpihqu0BL57wwccQlTTkDyLPHRhDe8CYZZwJKf
         VdXpCHqFaN//dFFBKKq8MyX1XJhmhra5FOlc5AX3xKgsH8eHiC4vS1Zc6xtdIk4M3yR1
         ol5s9ilGp42Cv1MZchyHX/tBsh5B5M2duVrxP20NMNArN6AjzVr7ZgnUSoWGIinnb0zF
         m3m8AinIvrEAFRtzLCucH70XH+ObeY/Xm7BaPhN5W8PSQ+3keELCh2m+uMZXo89CpRuJ
         dp1c62bvCbWEi3CMtHUS9+SvvPPDzbcEFa8oWeZjbEydzvJIOkIAESGHI1CO9B7Lg7ij
         EdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=H4SWAFtgZshxJ47TJ8Dt0f0d4JB30v6DOMAO9UL+KkY=;
        b=fXAwsLjt8oTj0HyRVJrk11cx+5QVSvpQDLhcviKu3IumCnpWDnaJqVjdZxkypZioza
         XFqIIst8juDsbK21AO5ouPYATBpuKrl1LhKwkEZKVIu+J7Vl2RV3tqX6xq8Dw+eA5SYs
         79uoXcyaL35BUPvU0S6wLYND8L9dx8snJguobUdwaEvdC+UA7MiYSz3uQN7GvuSsIbav
         KsqARwWcKQIn3ziMR3tw2+WefDdy3PsHuCeq6epZKQ8oi/pifSlXi0AMle5ozujORmk8
         clJ7PRBpdCWonuYLlRBIGXutcoUoB9GHK7TVnOhI4XwDj8fk9pzt8iKXP2rltuhbUxs0
         /AhA==
X-Gm-Message-State: AOAM532qROqbmaTsTe3L4IQ9TCWUy3Q/0wcOqCok9TnlRbsB4Jlm5Ujp
	gNuxF54vP2qiL0l7kOeMNFqzJKF7A7U=
X-Google-Smtp-Source: 
 ABdhPJyrRvGm/4KxLo2N4iUVOj+X5EGCcsBjRWaxdJCbE3+TFRqWfUZNxYDBeh8JgqqmbnEi2VpHYw==
X-Received: by 2002:adf:bc09:0:b0:1f0:2483:48b with SMTP id
 s9-20020adfbc09000000b001f02483048bmr3597550wrg.118.1646516148142;
        Sat, 05 Mar 2022 13:35:48 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 s2-20020a1cf202000000b0038977146b28sm6204174wmc.18.2022.03.05.13.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 13:35:47 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
X-Google-Original-From: Nisha Parrakat <nisha.m.parrakat@bmw.de>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [meta-oe][master][PATCH] libtinyxml2: fix packaging of test files
Date: Sat,  5 Mar 2022 22:35:15 +0100
Message-Id: <20220305213515.5572-1-nisha.m.parrakat@bmw.de>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Mar 2022 21:35:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95806

The xml files inside the resources are to be used for the
run of test named xmltest
they were not getting copied from the source directory to the directory
where xmltest was installed

fixes the below error when code built with cmake
./xmltest
Error opening test file 'dream.xml'.
Is your working directory the same as where
the xmltest.cpp and dream.xml file are?

Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)

Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
---
 ...y_resources_with_tests_in_CMakelists.patch | 30 +++++++++++++++++++
 .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch

diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
new file mode 100644
index 000000000..09245ad36
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
@@ -0,0 +1,30 @@
+The xml files inside the resources are to be used for the
+run of test named xmltest
+they were not getting copied from the source directory to the directory
+where xmltest was installed
+
+fixes the below error when code built with cmake
+./xmltest
+Error opening test file 'dream.xml'.
+Is your working directory the same as where
+the xmltest.cpp and dream.xml file are?
+
+Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
+Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
+
+Upstream-Status: Submitted (https://github.com/leethomason/tinyxml2/pull/902)
+--- a/CMakeLists.txt	2022-03-05 22:00:33.361601287 +0100
++++ b/CMakelist.txt	2022-03-05 22:05:19.953940006 +0100
+@@ -51,6 +51,12 @@
+         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
+     )
+ 
++    # Copy test resources and create test output directory
++    add_custom_command(TARGET xmltest POST_BUILD
++	COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
++	COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
++	COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
++    )
+     set_tests_properties(xmltest PROPERTIES PASS_REGULAR_EXPRESSION ", Fail 0")
+ endif ()
+ 
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
index 7f205987f..06410ab6e 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_9.0.0.bb
@@ -4,7 +4,9 @@ SECTION = "libs"
 LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=135624eef03e1f1101b9ba9ac9b5fffd"
 
-SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/leethomason/tinyxml2.git;branch=master;protocol=https \
+           file://copy_resources_with_tests_in_CMakelists.patch \
+          "
 
 SRCREV = "1dee28e51f9175a31955b9791c74c430fe13dc82"
 
-- 
2.17.1


