Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA18C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:36 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.3055.1752082289944720318
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xmk4JKqz;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b4876dfecso12282861fa.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082288; x=1752687088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S00wi3suuJt+pCO1BDp8VSgVrOEwUDdHyapME4xg3+0=;
        b=Xmk4JKqz/udTvxxc7/zJwx1vwJOcSm3YhykQM0S5NOjh6RodS42dwtvnPFSaNzh4yb
         Vn+E3c5Yu2lbRYvPSeORxC9Fk2V4RCYsJgCijW1X4UTmX/6v8E5uJ3kk4GUuZQE3zU0v
         XW6vwCHHYftuUHeT309llWw+FA9GsxsvDQo/3rbpF6mWkD9fiuygaoSdLf0R8l5AQaPp
         dCUNT6eU7199UIETF3ZEE7QHuF71C444/+LfbaBYzLsxkHeMQ67TJNCO07BYvFJN/DZm
         /e6kJezXw7K8IzfMZ5kJ1+gV7Tm+FqfXgevcLOofwoRjDv/w7P5OpmShEXel1rgQn3jY
         dIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082288; x=1752687088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S00wi3suuJt+pCO1BDp8VSgVrOEwUDdHyapME4xg3+0=;
        b=pDI7zLYvbT4GMI/GbvadD4dH1nSslET+QSbMYVMsoJkqwQTfgYSApHVUteozk5QDA4
         Edikgx5F4JooVuJl+ojV5BcP/2sBk4G5PtntoLQU4CdVYgVNDHOL3RUIk7ajyx3FTNs6
         6eVDtfs1Ah2cbtzc4gwh9mxe2isMgdU84iBNZPzXVXfZ1FIUhlUS9IH8e2pjXWaQDrjC
         wNiQq0/ZHSSG05I5opxPxB2w2fEtaBtuwtXjt/bLsuPG2/cT7X5BM80nsBNZQnXflA12
         7fz/ZzqgFL5kzuZ3uQUrNra+LxP/7K9gukGKHIfOdeayYTYY8Koduu8i3hQizIWBGLUk
         J1IQ==
X-Gm-Message-State: AOJu0Yz/+rdC67a20KcwdWQm6w+PtJVjBn1pFUWNevosCcpXkRPZFPoM
	tb+gs+9InYQZ3y75ULrV5pHosELbXNcr04b6RYkI72fzu4HzAuOzIJcE0SUTfA==
X-Gm-Gg: ASbGncvdjI6MVTOIYbB5eOal620jfKjVnUE7BgiwvAGMvHIRfCcz6+sReangUS56LiO
	43uqJLj7+CFjOkRzve4ldTdKaFSIeiInM0TfLhTpBUf9VOLsok0mrVdWFwebTuP+B1X3AxtMJ8b
	dSZkY+4tACm7cxBGRNsjdIxnExUxTf7Z3qT1CzvtQ61Fots0MckUIrQMp9uB4BP3dzjCHyL80jj
	DvzviLdM47bOKmUciKic1Gwa4k7BD2BU2ImXLXxV5hchaMVgOYHA4VWDPM8kepFoY/zCujOeFS2
	9H9W/73p4enpd4lrtypnRaU89Kx6ZGV6A+vYDA8ZG4gCcZTl2aF2d9i9Y1AJ9vgO/4sog7lW7kK
	5G0Zt/Geeqakgrg==
X-Google-Smtp-Source: AGHT+IGgLjH29Rp9KsT7eOcq/o9/RAZwmkvPjJBQlFjvBGBCT3BacxUenBkQSJjLuimL6dNdAuObZA==
X-Received: by 2002:a05:6512:ba8:b0:553:2a16:2503 with SMTP id 2adb3069b0e04-5590071e6d8mr150729e87.22.1752082287444;
        Wed, 09 Jul 2025 10:31:27 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:25 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 15/20] dlt-daemon: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:49 +0300
Message-ID: <20250709173054.605430-15-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118369

Fix:

| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0003-allow-build-with-cmake-4.patch       | 99 +++++++++++++++++++
 .../dlt-daemon/dlt-daemon_2.18.10.bb          |  1 +
 2 files changed, 100 insertions(+)
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..ac5fec5684
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-with-cmake-4.patch
@@ -0,0 +1,99 @@
+From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 18:18:33 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/755]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt                   | 2 +-
+ examples/example1/CMakeLists.txt | 2 +-
+ examples/example2/CMakeLists.txt | 2 +-
+ examples/example3/CMakeLists.txt | 2 +-
+ examples/example4/CMakeLists.txt | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 94185b8..2a0f619 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -14,7 +14,7 @@
+ #######
+ 
+ # Set minimum Cmake version and setup policy behavior
+-cmake_minimum_required(VERSION 3.3)
++cmake_minimum_required(VERSION 3.5)
+ 
+ if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION} VERSION_EQUAL "3.20")
+     cmake_policy(SET CMP0115 OLD)
+diff --git a/examples/example1/CMakeLists.txt b/examples/example1/CMakeLists.txt
+index 60644a1..44cd053 100644
+--- a/examples/example1/CMakeLists.txt
++++ b/examples/example1/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # DLT example implementation
+ #
+ 
+-cmake_minimum_required( VERSION 2.6 )
++cmake_minimum_required( VERSION 3.5 )
+ project( automotive-dlt-example1 )
+ 
+ #
+diff --git a/examples/example2/CMakeLists.txt b/examples/example2/CMakeLists.txt
+index 66a4f24..a8efbcf 100644
+--- a/examples/example2/CMakeLists.txt
++++ b/examples/example2/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # DLT example implementation
+ #
+ 
+-cmake_minimum_required( VERSION 2.6 )
++cmake_minimum_required( VERSION 3.5 )
+ project( automotive-dlt-example2 )
+ 
+ #
+diff --git a/examples/example3/CMakeLists.txt b/examples/example3/CMakeLists.txt
+index 45b7467..4d4958d 100644
+--- a/examples/example3/CMakeLists.txt
++++ b/examples/example3/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # DLT example implementation
+ #
+ 
+-cmake_minimum_required( VERSION 2.6 )
++cmake_minimum_required( VERSION 3.5 )
+ project( automotive-dlt-example3 )
+ 
+ #
+diff --git a/examples/example4/CMakeLists.txt b/examples/example4/CMakeLists.txt
+index 53a4fad..161c333 100644
+--- a/examples/example4/CMakeLists.txt
++++ b/examples/example4/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # DLT example implementation
+ #
+ 
+-cmake_minimum_required( VERSION 2.6 )
++cmake_minimum_required( VERSION 3.5 )
+ project( automotive-dlt-example4 )
+ 
+ #
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
index 8b48d20aac..82edde6c9d 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/COVESA/${BPN}.git;protocol=https;branch=master \
            file://544.patch \
            file://567.patch \
            file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch \
+           file://0003-allow-build-with-cmake-4.patch \
            "
 SRCREV = "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
 
-- 
2.43.0


