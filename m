Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.24813.1606077479284699500
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2020 12:37:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=su/vfsvV;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id l11so7812127plt.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2020 12:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nhk6HAVnIQQn4WLIT0v2PagoSKwzLaw+im73AF4dugA=;
        b=su/vfsvVs2WTU2E+jDQnGFAlGLlLItElcnkIhL5wXQ0R1zziqyBl4QDO1M/0d+YZj4
         oKNoxCifqG/DTB6L6DH42iIFSz9TvgvZ+1kmos/Fw4/NMCoSwwDTGs1R0QszEKkPF6lr
         mbIILRT8UhTxqix+v1F2JyWZ7Y6D91ZLGFSvwmSG0Ri8GMGSd22xE9SaeRgj3AC6pp+e
         bx14FcmUBy5ZvXVu34qbQg58jZOPFXdO4Sbw/yDtcKUsKKJru0jAAU3I+9Ndova6ixBX
         kU1h7u8E6VTYwE8BbxSttFeCIoeQ7K0YAgPpYbFnb2GiiXNlBeHEkjO9yc4+ZQuqdhLl
         2ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nhk6HAVnIQQn4WLIT0v2PagoSKwzLaw+im73AF4dugA=;
        b=pH6Qi6P7kbp4eOd4JgPptvKUcEe8c1it3hy95+m9mqCT67++6AL2bIpZD7B9yDFtdK
         +LF7VUFuB1Dm5J7EVC1rYnQr9MAP0yTE4HfZyV4Y9bvI9FzE3ERfV9IgmcB7/QjJt1s4
         hTBYcq9Mx0i5a2qVVxKC/ryrAa0BG0aF6JwsManQ9IJLIRXbg22qyWTt67MQK/AHJHDC
         iGxrzUcED55oa7flND65it4U+TctSf1qIXtJ1spYuAxQiizS9mb2VHB1QaxMqoS3LRPx
         +3vdOE7/+6yxFCMZDcpi9di0JwYNeTXUiYEvc+aNV6k0uaHtOtQBHRhJOO2wB7hWLZwG
         /rXQ==
X-Gm-Message-State: AOAM532ZbejNJDArJL1psrihpejzOsJXj5IkWGpmFWzW/3ZvyE2pVTP0
	NWIpKop9B8tfLPB5zpHxy8jxd6xWzXr4KQ==
X-Google-Smtp-Source: ABdhPJwduTqHeex4n0YaEv924BzVowOqZQuQGKI55UAty7/OBiz/v6uEFChN47SYwKgdRAjkmu/ekw==
X-Received: by 2002:a17:902:b7c2:b029:d9:c8f:e06b with SMTP id v2-20020a170902b7c2b02900d90c8fe06bmr21444215plz.29.1606077478389;
        Sun, 22 Nov 2020 12:37:58 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id g4sm8957166pgu.81.2020.11.22.12.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 12:37:57 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/2] musl-nscd: Add missing deps on flex and bison during build
Date: Sun, 22 Nov 2020 12:37:51 -0800
Message-Id: <20201122203751.2535670-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201122203751.2535670-1-raj.khem@gmail.com>
References: <20201122203751.2535670-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix check for flex

Fails in do_compile at times see below

cp dist/src/nsswitch.yy.c obj/src/nsswitch.yy.c
cp: cannot create regular file 'obj/src/nsswitch.yy.c': No such file or directory
Makefile:78: recipe for target 'obj/src/nsswitch.yy.c' failed
make: *** [obj/src/nsswitch.yy.c] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>
---
 ...e-Check-for-flex-if-lex-is-not-found.patch | 29 +++++++++++++++++++
 .../recipes-devtools/musl/musl-nscd_git.bb    |  3 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch

diff --git a/meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch b/meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch
new file mode 100644
index 0000000000..691aa3d2ac
--- /dev/null
+++ b/meta-oe/recipes-devtools/musl/musl-nscd/0001-configure-Check-for-flex-if-lex-is-not-found.patch
@@ -0,0 +1,29 @@
+From 4d09032741475c4e9d3de62c8187597f3f72f934 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 22 Nov 2020 12:32:01 -0800
+Subject: [PATCH] configure: Check for flex if lex is not found
+
+lex is already checked by this time, therefore check should be to find
+flex
+Upstream-Status: Submitted [https://github.com/pikhq/musl-nscd/pull/12]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 256824a..4c94568 100755
+--- a/configure
++++ b/configure
+@@ -249,7 +249,7 @@ printf "checking for lex... "
+ trylex ${CROSS_COMPILE}lex
+ trylex lex
+ trylex ${CROSS_COMPILE}flex
+-trylex lex
++trylex flex
+ printf "%s\n" "$LEX"
+ test -n "$LEX" || echo "$0: cannot find lex. Will try to use pre-provided source."
+ 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
index 94a506ae71..83125a1ba4 100644
--- a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
+++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
@@ -7,11 +7,14 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
 SECTION = "utils"
 
+DEPENDS += "flex-native bison-native flex bison"
+
 PV = "1.0.2"
 
 SRCREV = "af581482a3e1059458f3c8b20a56f82807ca3bd4"
 SRC_URI = "git://github.com/pikhq/musl-nscd \
            file://0001-Fix-build-under-GCC-fno-common.patch \
+           file://0001-configure-Check-for-flex-if-lex-is-not-found.patch \
           "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.29.2

