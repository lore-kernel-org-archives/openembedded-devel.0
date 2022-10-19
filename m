Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 623D1C4332F
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 17:33:33 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.374.1666200808932622290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Oct 2022 10:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwgjZLyF;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id b2so17919743plc.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Oct 2022 10:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UhMVdo0gc3YY5koQPH9awVuiP4rJKOAuY1Y0rzssvw4=;
        b=LwgjZLyFBSzOJsJo7rHpo5AdZwFNZKWk/ZjB/BV/Lzm9NYoKhgzqeDYv8Pg5V5jzcI
         GDZkljZegKJfg5ZTAcv0/Yn1EWvEDAX10tZ+PeO0WL+BevaXZseRJ/J9dyoXFQV9xn3m
         uKR9t4qL0Di51nr8aA/O2g43HKMQKFvn1zcVhwEMeR26L+gpyOuyDBNgSQVMKWK4tRkR
         QdU6WQ9GZc5XFkntIF8UcyaqNP4CVJzzDmVGLwEr+B7oieIIzzEkY/1pmLdIaxkOc41I
         ZC9d5tFMMrM6O+iNum68J53JbSeQ7GpZ8BSczn2GklzCANbr1eW1Ouccs1z4Oqa6r4jR
         hELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UhMVdo0gc3YY5koQPH9awVuiP4rJKOAuY1Y0rzssvw4=;
        b=OsQY/68lCzzw2J3NOTi2VdGAR7bBSVBXoCoZvRhfAjaYoZZxQ4UCxR8kCKubKmAFB5
         mmRwzL3XwpwJasqdtwWpkX7EgzwonlVNeE59RSSgmMWc2YSbAl9HM5ys0Pv74gQO+p2w
         UnO7nIqGJDx8/POXcE8GyVY2ITf2WQQ4zORIDaFczrNIdtGv9Kv7W8V87BtF2hYF4lri
         TRpKB/y1gN/7Oiwrt3Dxk4eI+qpYr5JDbb2nRUYJMLJ79ty8ZJmsw9/bPcF70wOSayh1
         pzoJaSJDaiD2m8ZceZOFJsY3c5pb7rEgT+He99v4yIVXnDZjSJjVQPefcxhSrobU9MjE
         cW5A==
X-Gm-Message-State: ACrzQf0p3B02DsnDO31HIuv2r9EG3euSHPPjyFiwtBoWLdJdBxymx1u7
	67D7Np60bdXZKjT2Df5WyAi5a6LfUD0=
X-Google-Smtp-Source: AMsMyM6EbgDRa1vlH7vG+p5YrNmqEgK9kmJMgAL5bnwlslF0N1Yc3MPlpmYCTTbJKarY8Dle3+I77w==
X-Received: by 2002:a17:90a:a401:b0:20a:da56:b073 with SMTP id y1-20020a17090aa40100b0020ada56b073mr11173181pjp.1.1666200807895;
        Wed, 19 Oct 2022 10:33:27 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::751e])
        by smtp.gmail.com with ESMTPSA id q26-20020aa7843a000000b0056164b52bd8sm11655990pfn.32.2022.10.19.10.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 10:33:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] postfix: Upgrade to 3.7.3
Date: Wed, 19 Oct 2022 10:33:25 -0700
Message-Id: <20221019173325.2818748-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Oct 2022 17:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99247

Fix build on systems with linux 6.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...kedefs-Account-for-linux-6.x-version.patch | 35 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.6.5.bb  | 17 ---------
 .../recipes-daemons/postfix/postfix_3.7.3.bb  | 18 ++++++++++
 3 files changed, 53 insertions(+), 17 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
 delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
 create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch b/meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
new file mode 100644
index 0000000000..ad1704520c
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch
@@ -0,0 +1,35 @@
+From e5ddcf9575437bacd64c2b68501b413014186a6a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2022 10:15:01 -0700
+Subject: [PATCH] makedefs: Account for linux 6.x version
+
+Major version has bumped to 6 and script needs to know that
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ makedefs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/makedefs
++++ b/makedefs
+@@ -613,7 +613,7 @@ EOF
+ 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
+ 		: ${PLUGIN_LD="${CC-gcc} -shared"}
+ 		;;
+- Linux.[345].*)	SYSTYPE=LINUX$RELEASE_MAJOR
++ Linux.[3-6]*)	SYSTYPE=LINUX$RELEASE_MAJOR
+ 		case "$CCARGS" in
+ 		 *-DNO_DB*) ;;
+ 		 *-DHAS_DB*) ;;
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -751,7 +751,7 @@ extern int initgroups(const char *, int)
+  /*
+   * LINUX.
+   */
+-#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5)
++#if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) || defined(LINUX6)
+ #define SUPPORTED
+ #define UINT32_TYPE	unsigned int
+ #define UINT16_TYPE	unsigned short
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
deleted file mode 100644
index 343a8b2df0..0000000000
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require postfix.inc
-
-SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
-            file://main.cf \
-            file://postfix \
-            file://internal_recipient \
-            file://postfix.service \
-            file://aliasesdb \
-            file://check_hostname.sh \
-            file://0001-Fix-makedefs.patch \
-            file://0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch \
-            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
-            file://0004-Fix-icu-config.patch \
-            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-           "
-SRC_URI[sha256sum] = "300fa8811cea20d01d25c619d359bffab82656e704daa719e0c9afc4ecff4808"
-UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb b/meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb
new file mode 100644
index 0000000000..b54a97aeaf
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.7.3.bb
@@ -0,0 +1,18 @@
+require postfix.inc
+
+SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV}.tar.gz \
+           file://main.cf \
+           file://postfix \
+           file://internal_recipient \
+           file://postfix.service \
+           file://aliasesdb \
+           file://check_hostname.sh \
+           file://0001-Fix-makedefs.patch \
+           file://0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch \
+           file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
+           file://0004-Fix-icu-config.patch \
+           file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0006-makedefs-Account-for-linux-6.x-version.patch \
+           "
+SRC_URI[sha256sum] = "d22f3d37ef75613d5d573b56fc51ef097f2c0d0b0e407923711f71c1fb72911b"
+UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.38.1


