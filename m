Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8EAC77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.54246.1681153120525040489
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=GK+5TzZe;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id xi5so14621936ejb.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153119; x=1683745119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhVaattAVFkxSldh4LfVFZNETAXhhIpQHfxH9vU9WMk=;
        b=GK+5TzZeVnHH6cBf3ALlu8hK4yMO27d7nTWoZx/fDIl54VL/XC/OxU/6/c1ejTqtoV
         xLXQSLKhaG5MYjh+JTCzsOeBlDNs3py06vNvT/y9AALDmCiiTQi4ZqwKNmxTdZz7Lunw
         SOR1ehQoV+UfRw63j1wSMjwBGj65OH7ExH6UMM1agKy5fITfjA+BR4hDuR+AkdJmRk38
         wr1reSzVzIDlPs246ancEB43VUNZ05zVtHcLwNhUqbjtdpyK3AAPksFluzuD+m6mhrkY
         jmp6CDenIjSb7Y7c1fGD1ShLmLcTUwv1/pz6lgxmHrZjB47ykLlduDl73dAW9sH3Jsfh
         wIOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153119; x=1683745119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhVaattAVFkxSldh4LfVFZNETAXhhIpQHfxH9vU9WMk=;
        b=T1wYbJmKrlFX/TcXk+hQxSD127Di7cfnUdY780LfZuiowQa82ReQPCx2CBpjC4peFH
         3ic9lIhXwiln2faVZfi76LAMhSWeVMlSwe/LTLT0ZNjCcHdxUD1fFvTAxma3vCkrLxwe
         jPSCFV5t+qMkdiXhx27AxOMk3moK6Nr9FGkAcwJx6neVJTDssPrlgJMm44EloH4Kbgra
         iTQl4RJW/6IcoV5attbYXh5CYAZqgQ7Z+gOwQpBWijnjvH+uQ7+Fx06o4ZYXe1NCF98J
         yj1aCa7rmB3dIs4PT8KHNC8Fab6PZx4C/O+Dv0HDKokJv7pA9UABZhDOht/dCUNTcda8
         Cl+g==
X-Gm-Message-State: AAQBX9cGKRurCDuFnlc4thvgt9jd65QsqzqXueiKBoNcTf8owy1/6VzA
	uyrrAQ/RN5JVsNx0gqsm9kt+actWvtM=
X-Google-Smtp-Source: AKy350YRgZFtQDnIdcHP7SpbSffm2mSbZZHfTlRqQmi8IOLgSpKO8xjM3PkqwsXioRSAHQgz+5AUGg==
X-Received: by 2002:a17:906:d0da:b0:8b1:3483:e3d5 with SMTP id bq26-20020a170906d0da00b008b13483e3d5mr7379792ejb.48.1681153119037;
        Mon, 10 Apr 2023 11:58:39 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906278600b0093e39b921c8sm5255114ejc.164.2023.04.10.11.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 5/9] postfix: Fix build on systems with linux 6.x
Date: Mon, 10 Apr 2023 20:58:15 +0200
Message-Id: <20230410185819.2416704-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102048

From: Khem Raj <raj.khem@gmail.com>

* cherry-picked from langdale "postfix: Upgrade to 3.7.3" commit
  dd5226bed9cc76f2a26a1dce046d9de98c8b4cb4 without the upgrade.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...kedefs-Account-for-linux-6.x-version.patch | 35 +++++++++++++++++++
 .../recipes-daemons/postfix/postfix_3.6.7.bb  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0006-makedefs-Account-for-linux-6.x-version.patch

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
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb
index e91e677790..17864b8915 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.7.bb
@@ -12,6 +12,7 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
             file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
             file://0004-Fix-icu-config.patch \
             file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+            file://0006-makedefs-Account-for-linux-6.x-version.patch \
            "
 SRC_URI[sha256sum] = "e471df7e0eb11c4a1e574b6d7298f635386e2843b6b3584c25a04543d587e07f"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.40.0


