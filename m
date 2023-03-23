Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B652BC74A5B
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 18:07:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.81104.1679594868992903385
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 11:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bhLGzOVt;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso2886187pjb.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679594868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aeL6637wyVYDkM+kflYnRhRFzl1sa4x1JLOOQ+GW638=;
        b=bhLGzOVtp1yihlpllCdLtjIi/kUytF2TU1yP3oymW2AewLsWCkYTYwA6dufqqmFHT2
         lgUhP1RiIbbZqg4hU+ed7o4u6d7aj+Z4k6iaHHJSR2+KJOeQJC/9ZJcTO5cyMS4ho8ly
         KRU19HN46MFhZgA8/vYG8VGpZ/HJNysImznBkNjnBDfOrwJvl/AHrsa1RL02d9GVUqRl
         iaKRmqMYRDG8gxk98aDbgTK/l/srA2YBtL8yzVVkQSEQcdhpFQFlc5HXp1pPwha5Snq5
         RbfyDQtrpBGrrzzUMSw4NcS9EnySOlX6YOdL9aL4bUu/s5kJqjnnccBhVFdYLPlMpVmT
         B6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679594868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aeL6637wyVYDkM+kflYnRhRFzl1sa4x1JLOOQ+GW638=;
        b=thvL92u7xydC35S5l6Rav/+h3xftTC5qMYUnEn+BMC69MKT3AcHUvtXtk2DC7hUsdN
         qboFhG1aSa9qfU+RRjTHEcy6i8K7DHTdqPgObzCOJhuoC+AQGNOl+O/+xUidhNPcxuD+
         vRsLejvdZK8xesRDGm9v11RJTLw6saIEbYHmBeo7Rbhxsc212HIolUsi9KTHuXefSOZC
         WekWg2/oUBt1TXKpbBkcpX35Rilhqb85Gk1hd8T2uIDC/KdqCQQbbnxnTXjWQnhW7H7z
         i6oJBNesQ9q14uhh2yneicOOUhN5jtL/eHQChs6BbQkzC0CTVQA3MjzP83jxGu3+25gT
         NifA==
X-Gm-Message-State: AO0yUKVGDkZqP24NOvq6Iwz0MNLkfwl6TU0f4i5qwdTNzqezZoqLzcep
	RhVj+5mx65RoLmbk/8r1UUzSFsEpps12/Q==
X-Google-Smtp-Source: AK7set+YYAsky+OnaWsapCN7ZdvNDjdUn9dNkQ9fOOSLx5SYlGSDb0Z/Q/U2cMLgCtT87SdfNZom/A==
X-Received: by 2002:a05:6a20:47e2:b0:da:adbf:7b96 with SMTP id ey34-20020a056a2047e200b000daadbf7b96mr390724pzb.21.1679594868038;
        Thu, 23 Mar 2023 11:07:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id k16-20020aa78210000000b0062614daa92esm12262149pfi.213.2023.03.23.11.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 11:07:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] ettercap: Fix build with libcurl >= 8
Date: Thu, 23 Mar 2023 11:07:45 -0700
Message-Id: <20230323180745.1344761-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 18:07:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101670

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-the-libcurl-version-check-to-consid.patch | 38 +++++++++++++++++++
 .../ettercap/ettercap_0.8.3.1.bb              |  3 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
new file mode 100644
index 0000000000..82456c2f96
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap/0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch
@@ -0,0 +1,38 @@
+From 40534662043b7d831d1f6c70448afa9d374a9b63 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 23 Mar 2023 10:23:14 -0700
+Subject: [PATCH] sslstrip: Enhance the libcurl version check to consider
+ version 8+
+
+Lately curl has released version 8 and hence LIBCURL_VERSION_MAJOR is
+reset to 0, current check assumes major version to be 7 at max and hence
+on systems with libcurl 8+ this check breaks and build fails
+
+Fixes
+
+TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/ettercap/0.8.3.1-r0/git/plug-ins/sslstrip/sslstrip.c:57:2: error: libcurl 7.26.0 or up is needed
+ ^
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/Ettercap/ettercap/pull/1221]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ plug-ins/sslstrip/sslstrip.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plug-ins/sslstrip/sslstrip.c b/plug-ins/sslstrip/sslstrip.c
+index 327bf58a..d9b67c8b 100644
+--- a/plug-ins/sslstrip/sslstrip.c
++++ b/plug-ins/sslstrip/sslstrip.c
+@@ -51,7 +51,7 @@
+ 
+ #include <curl/curl.h>
+ 
+-#if (LIBCURL_VERSION_MAJOR < 7) || (LIBCURL_VERSION_MINOR < 26)
++#if (LIBCURL_VERSION_MAJOR < 7) || (LIBCURL_VERSION_MAJOR == 7 && LIBCURL_VERSION_MINOR < 26)
+ #error libcurl 7.26.0 or up is needed
+ #endif
+ 
+-- 
+2.40.0
+
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index b0958e6975..6c07223b31 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -20,7 +20,8 @@ DEPENDS += "ethtool \
 
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
-SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https"
+SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
+           file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch"
 
 SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
 
-- 
2.40.0


