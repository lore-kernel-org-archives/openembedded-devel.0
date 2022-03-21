Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606B7C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 00:51:09 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.25040.1647823868503386206
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Wb4is87M;
 spf=pass (domain: konsulko.com, ip: 209.85.160.175,
 mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f175.google.com with SMTP id t7so10879507qta.10
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 17:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EiF9ESaXpRD3VAfBDxWyU4ogTIGqa8YBYmeJLA0N75Y=;
        b=Wb4is87MFrQpBv00L1MRuj3TAbSqjRTvwanSHPJ0FZh7TgFcmBrIsCcA7Leg5w1cCo
         wDA3xApHzQ6S5DgowlaH9HSbbkw7U4R1Yih2ZOvMJHnXjBJoP0nANxUZgjgf4Xu1NCaM
         tLQp+ME8CxSqLGg4am9PsRTrvbjotnoJHLIWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EiF9ESaXpRD3VAfBDxWyU4ogTIGqa8YBYmeJLA0N75Y=;
        b=GGJqwRYO5TnMaosY0ImoFH+c9pWvTPrllU51oDEXLFsbGFd45Zl6p5p+CrVKzuWSc3
         oEEWex7lcbIzG81zV4thmxf9wsDK9A/jxY765rniwZ1xZ+e1XX2KOmShBmtlEFlSk3NP
         NW2PhWMBjSeSCoL+CZT+ofTULQVm9Yw3GPEEhKWSbNTccQY1BiEGWP1TarhBvChWZWz2
         c6NWRWzbqXioL9emZXdJv3hb93EbkaV8RUKN6zuKlEudO4F7eSXydzh5T9bgMb4LxUjV
         T3Ajq5c2WJqJqXUHeFbJ8EcQ9rfN1tyCTzuRDgD3I6LuKHHa5yIS7HNyYLAHd5umVJ6e
         ypzA==
X-Gm-Message-State: AOAM533Xrw4KmX9u2ghmPmjr1HfUUngjZNZ3gX36FgikQZ32+GtOsl47
	LeYsTEFlIUA75z7MwvFTH6bpM+XJUjQR5A==
X-Google-Smtp-Source: 
 ABdhPJwrUxlrJWFCqm6gyIyFFmRha7ccJ0EUuuVXHxult3Oj0SQKy/HB53FxCCW0+ee4SlPtxoGtxw==
X-Received: by 2002:a05:622a:19aa:b0:2e1:bbde:7434 with SMTP id
 u42-20020a05622a19aa00b002e1bbde7434mr15182988qtc.160.1647823867346;
        Sun, 20 Mar 2022 17:51:07 -0700 (PDT)
Received: from ghidorah.spiteful.org (192-0-174-222.cpe.teksavvy.com.
 [192.0.174.222])
        by smtp.gmail.com with ESMTPSA id
 c20-20020a05622a025400b002e1dd71e797sm10493790qtx.15.2022.03.20.17.51.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 17:51:06 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/8] python3-certifi: Remove
Date: Sun, 20 Mar 2022 20:50:36 -0400
Message-Id: 
 <cacca42520f55af855e2537b1033f9f20345e3e6.1647823458.git.scott.murray@konsulko.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1647823458.git.scott.murray@konsulko.com>
References: <cover.1647823458.git.scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Mar 2022 00:51:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96093

This recipe has been moved to oe-core.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 .../packagegroups/packagegroup-meta-python.bb      |  1 -
 .../python/python3-certifi_2021.10.8.bb            | 14 --------------
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 78722682d..c7ab10066 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -62,7 +62,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-cassandra-driver \
     python3-cbor2 \
     python3-cerberus \
-    python3-certifi \
     python3-chardet \
     python3-charset-normalizer \
     python3-cheetah \
diff --git a/meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb b/meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb
deleted file mode 100644
index 4c376da89..000000000
--- a/meta-python/recipes-devtools/python/python3-certifi_2021.10.8.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Python package for providing Mozilla's CA Bundle."
-DESCRIPTION = "This installable Python package contains a CA Bundle that you can reference in your \
-Python code. This is useful for verifying HTTP requests, for example.  This is the same CA Bundle \
-which ships with the Requests codebase, and is derived from Mozilla Firefox's canonical set."
-HOMEPAGE = " http://certifi.io/"
-
-LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=67da0714c3f9471067b729eca6c9fbe8"
-
-SRC_URI[sha256sum] = "78884e7c1d4b00ce3cea67b44566851c4343c120abd683433ce934a68ea58872"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


