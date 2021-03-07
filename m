Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.24320.1615139365983526178
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Mar 2021 09:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=cyqcLsAF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id x4so9072338lfu.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Mar 2021 09:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xH8b3RCo3uVxIVYQFGdPTrKHhV7nZKh0gznslFOox2A=;
        b=cyqcLsAF328gPtXWgcdfkSSbwG3OjQYw422dYV195FRNrUjvYZpLZNzpbce6WDX6DI
         tfw/uycaC1fbYeRI0dg1kX3FM0mMt2nAnCiuk0hjygP1FMrKj0JlolfEepOAsNV2hTs8
         O/H6VFZgrNdkJEkUmuMHTutcDPSaORlAhAK0wKG29cJ8XB9w7NApqzgJU6I6GoyfWy/H
         eQOCAQpjY5nD0wZ6ulMG0SF9+Ta5tkjATEPu0FYO3oLLxjQDWck3zTb6WCdny3TFe+d9
         h7NOC8yII7QzfCuILqnJ8Pr4JrF6QJvobN5M4DEg3d5vSFl0KWXTC0Y2zyb9n9eO8uVo
         iItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xH8b3RCo3uVxIVYQFGdPTrKHhV7nZKh0gznslFOox2A=;
        b=UH3Bdx7NB1un5ZyPkQgYrWg5P+cO6xzAdleuJb7K9NTOthRK5KV1qQQtwDS422lWL6
         7JuNxvhfpUepUHtrkiMOPQzj7bL/4KnVntBsOotfzxaoXumFt7mGw1N8Op0I1VXyx3DO
         dCf46ecMq72sorSFsL2SI3RcxQEbaFtFvJ5ztHWRlZPDuuvsBfy/adyN461DVBmZAoHv
         ekaWXDEC7yylcCm2DHsyheSAkt4efuUuV7AN7kDtUXuLb51JxZSKI+wXcGR/Dqek/IgH
         skqqGPVd4QexIZOJ3E960oocHjXEIWc9tSgIrIdNL5QDaOzRufThjvqisUgTkV0nBN3S
         qhag==
X-Gm-Message-State: AOAM531BYm/7Y/Ix3WFWj7Gn5ytRBso59HwEZNlPQEjDAeHThaMggqlQ
	0zJCOzielHZEmEhzRKFdSNIslZGXpCdk5nTe
X-Google-Smtp-Source: ABdhPJy6/mHAgYs7Jx5CAGTJLAYpsD70ipB8wKhIc+p2r2sXrZwEMXiN7SFucysJW9Y0mzq0cJ0DzA==
X-Received: by 2002:ac2:490b:: with SMTP id n11mr11628428lfi.491.1615139363520;
        Sun, 07 Mar 2021 09:49:23 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b31sm1158519ljf.38.2021.03.07.09.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 09:49:23 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libinih: bump to latest revision
Date: Sun,  7 Mar 2021 18:49:21 +0100
Message-Id: <20210307174921.1072640-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Has patch upstreamed.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...header-files-without-prefix-dir-inih.patch | 24 -------------------
 meta-oe/recipes-support/inih/libinih_git.bb   |  3 +--
 2 files changed, 1 insertion(+), 26 deletions(-)
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
index 5beb29281..80bec1bf4 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dae28cbf28207425e0d0b3eb835f4bde"
 PR = "r3"
 
 # The github repository provides a cmake and pkg-config integration
-SRCREV = "c858aff8c31fa63ef4d1e0176c10e5928cde9a23"
+SRCREV = "0e635abc80127d2f05b8175a141f5e243861855d"
 SRC_URI = "git://github.com/OSSystems/inih.git \
-           file://0001-include-install-header-files-without-prefix-dir-inih.patch \
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1

