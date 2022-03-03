Return-Path: <nishaparrakat@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5466DC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 10:28:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.9361.1646303293987285510
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mk0AKkX0;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: nishaparrakat@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so3841721wms.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 02:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id;
        bh=2LVEGnJnoJirsgxq12HDp7E/E4TCVyZSZ3win2f+K3g=;
        b=mk0AKkX0tjwAJj75gmGXiWPAVJzGepI6v+rZCOoLNd16kHRBkKIPHHSd80Cl+9fu3S
         YDhAaW/+JzQoODB/anDR49Mx06y821k2RzRThSCvEhrKaFTw8CK7jqekTqfpHrCUFW1S
         rsuQ/kNW2hdkXPOcUevkxldvwiCkQN/2RSAEPez7frKk3sDspY69k2ulbPEXhHDCT5+I
         8m0PlfRoB69XYiYMsfvf7MtIBX88omJ0rR5AWWdx8uOu44VefRuHlZlK5WRE76xZGfNv
         oYLMZLXdATBAW03GUeSAUCIBqEwM9ff78XjyMUkM5YnKd5my3TY8EGaxS5Z/MgW9Tm8K
         Y5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=2LVEGnJnoJirsgxq12HDp7E/E4TCVyZSZ3win2f+K3g=;
        b=KwOTupZHJfwb2aJYfokBLjJwOr2OJ2MGUYRmesRjd0cDlamCDQJCs1XVoJlcGP7ZEi
         G/SLjcquzkJ+EJLsn9AR0UpmD8fvWoSPpXrYty9ct7oriuwq7Z/9oRzVdsswBKxg6iEU
         /9Th/HEWxEzvwU+aeURMrpw8JCWGQ4chB1GBIcY/1Fij1F3IBP9OAuDhM937ZE7bDWdJ
         Lco4PxYwNMtwviTx/oJx/XDv/3KfWNHNfyP3lKOgE8pmyHrssPZwF73Uo7Zh5OH5jBGH
         Q8nRFPiMrlnoOCWJXe1XqOBwawMtAE6WIxji7PCcW//FQPurB0SoRYe7LvYRwBoDp+/L
         lXuQ==
X-Gm-Message-State: AOAM531hnhEsYvHAS3khAzKCFdHlf2xr1x3mNbFbxBi9Lt9OZj249oxQ
	AWi47FiU6fcNgooX7fY/MZL+K5fltwg=
X-Google-Smtp-Source: 
 ABdhPJyYbaYLrBBBbNVu5jiIFpAVOygyCvRRFH1/vaVnsR7NooEMQ+XObi1B9w1B5Kt1QEwXSMOAFg==
X-Received: by 2002:a05:600c:350f:b0:381:738e:d678 with SMTP id
 h15-20020a05600c350f00b00381738ed678mr3200009wmq.124.1646303292285;
        Thu, 03 Mar 2022 02:28:12 -0800 (PST)
Received: from nishap-at-office.bmw-carit.intra ([212.118.206.70])
        by smtp.googlemail.com with ESMTPSA id
 o204-20020a1ca5d5000000b0038331f2f951sm8928694wme.0.2022.03.03.02.28.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 02:28:11 -0800 (PST)
From: Nisha Parrakat <nishaparrakat@gmail.com>
X-Google-Original-From: Nisha Parrakat <nisha.m.parrakat@bmw.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH] libtinyxml2: fix packaging of test files
Date: Thu,  3 Mar 2022 11:27:58 +0100
Message-Id: <20220303102758.36283-1-nisha.m.parrakat@bmw.de>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 10:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95737

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
 ...y_resources_with_tests_in_CMakelists.patch | 31 +++++++++++++++++++
 .../libtinyxml2/libtinyxml2_9.0.0.bb          |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch

diff --git a/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
new file mode 100644
index 000000000..ac05dc2ae
--- /dev/null
+++ b/meta-oe/recipes-support/libtinyxml2/files/copy_resources_with_tests_in_CMakelists.patch
@@ -0,0 +1,31 @@
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
+--- a/CMakeLists.txt	2022-03-01 12:28:46.780447542 +0000
++++ b/CMakeLists.txt	2022-03-01 12:28:55.951951478 +0000
+@@ -50,7 +50,12 @@
+         COMMAND xmltest
+         WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
+     )
+-
++     # Copy test resources and create test output directory
++    add_custom_command(TARGET xmltest POST_BUILD
++        COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/resources $<TARGET_FILE_DIR:xmltest>/resources
++        COMMAND ${CMAKE_COMMAND} -E make_directory $<TARGET_FILE_DIR:xmltest>/resources/out
++        COMMENT "Configuring xmltest resources directory: ${CMAKE_CURRENT_BINARY_DIR}/resources"
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


