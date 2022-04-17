Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A426C63715
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.28471.1650200650427641489
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:04:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=00JAXFnf;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.53, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f53.google.com with SMTP id g19so6821052lfv.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/br0CiVkUQdFV50ZjQQAueez25NTksNtf3g2XI3Ntvk=;
        b=00JAXFnf4rv022PF6eH2OWss2Keasbqz7AvRyKw86JmNew/xPlzxm3+HMvAMIHoI3s
         q6kDmo0yoSGXQSWmJWhWf/lAeCfpt9KSP/SAGNnIDMvhKctEU9YRmX7V1imCWMX5jxCb
         0ddvmG+MEXDfF6rKmWZ6grbqPiij0zH33ZXciw9JIh1qNldJ0tRfpdFP/DdsIbGMQOhU
         sMD5vQ0BeJnWr/LGtNUMVPTc5z/N+RbOo1EQUSMOkYX0C+/ilgaODtVsGxEirLbgluqm
         zYbX7MGf5IPN0Ry/VHgDPlOk9hd/TWYega8h3wC49TqgimAzveAuQZo24XpkGwJZKp/l
         7vWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/br0CiVkUQdFV50ZjQQAueez25NTksNtf3g2XI3Ntvk=;
        b=nOe1u7ts9i/iVoTqHh9ajsKAVA3yUf9Dc+dGE5cJ3fNQcHQJVYFofg4G6+Yx+lAhvi
         gcUAYew2eu1dyHVz5m6GICrjTw1PeKn1vdZtkuuq/d2up8irhptgb3+nfJqpmbwSWO5x
         M0v+IpCsqUwJ13590l9JyBFz4GImzoB+Sqh3o/te2D/aB52lZHu1nmTrudxf+2tSoLaZ
         m+hlrdXIOPWOT9lV5aj6Su9eIAK/9t7KK8p0EuE7crrk7mIYH5Uf57x+GV0gnapgkww2
         Fg31Bf/lZ1jfqhMvDiyUmUWa/PJEaJYSTM0HNLUKImw5U7z6PpZ+RR1MIIqRHAF+MbmV
         Hrew==
X-Gm-Message-State: AOAM531/tlqzYvHHk3CpMPJBlMt//Jy+JoP8RAn83Jqw1PZiIbZ7tDOp
	Az9xs/vZCLCwpz15U+3AQiByecP1PtyPk/KCdHo=
X-Google-Smtp-Source: 
 ABdhPJy1X26GvU6d5u5g4tQ/mD2sVWbU1c+rjMfMSeO0pB/Zd1c/fxgNjZggmS69NjlRjNMLeqzFDg==
X-Received: by 2002:a05:6512:2341:b0:448:2465:7cf with SMTP id
 p1-20020a056512234100b00448246507cfmr4906928lfu.474.1650200648105;
        Sun, 17 Apr 2022 06:04:08 -0700 (PDT)
Received: from localhost.localdomain
 (c-9418524e.023-160-67626725.bbcust.telenor.se. [78.82.24.148])
        by smtp.gmail.com with ESMTPSA id
 q14-20020a19f20e000000b0046f78ef7202sm723666lfh.231.2022.04.17.06.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 06:04:07 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libinih: bump to latest revision
Date: Sun, 17 Apr 2022 15:04:05 +0200
Message-Id: <20220417130405.1642845-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96676

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...header-files-without-prefix-dir-inih.patch | 24 -------------------
 meta-oe/recipes-support/inih/libinih_git.bb   |  6 ++---
 2 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch

diff --git a/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch b/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch
deleted file mode 100644
index fb7b85cfd..000000000
--- a/meta-oe/recipes-support/inih/files/0001-include-install-header-files-without-prefix-dir-inih.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-include: install header files without prefix dir inih
-
-The other flavor of inih which adapted by Fedora and Ubuntu installs
-header files to /usr/include directly. And xfsprogs 5.10.0 also checks
-ini.h without extra search path and fails. So install header files
-without prefix dir inih.
-
-Upstream-Status: Submitted [https://github.com/OSSystems/inih/pull/4]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- include/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/CMakeLists.txt b/include/CMakeLists.txt
-index 7a46ee7..4a9033f 100644
---- a/include/CMakeLists.txt
-+++ b/include/CMakeLists.txt
-@@ -1 +1 @@
--install(FILES ini.h INIReader.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/inih)
-+install(FILES ini.h INIReader.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index cf390800b..d54c1e49e 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -8,10 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 PR = "r3"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "c858aff8c31fa63ef4d1e0176c10e5928cde9a23"
-SRC_URI = "git://github.com/OSSystems/inih.git;branch=master;protocol=https \
-           file://0001-include-install-header-files-without-prefix-dir-inih.patch \
-           "
+SRCREV = "0e635abc80127d2f05b8175a141f5e243861855d"
+SRC_URI = "git://github.com/OSSystems/inih.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.25.1


