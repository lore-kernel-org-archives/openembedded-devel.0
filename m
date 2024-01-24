Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32C4C46CD2
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 06:26:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.16875.1706077571705276641
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Jan 2024 22:26:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KPHMups2;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1d75c97ea6aso19047085ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 22:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706077571; x=1706682371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gL02L6SfT8xCcgi821nn7rlNLkrKCcGe38FhbAW1F6A=;
        b=KPHMups2oG1xIQ3QwpHJEdw51sXd2UQbocxdMEtp9f6qkaGJQ1cP0TdihPGF64c987
         lW87lHBbMEEjsMYkGKXyHHUsyeOkO19z3gCi/OmUHrKaIC5GrTBmNlGalr0EENDOX39C
         XfzDtJakDLDsw/t87rZ645sSEr7OymZkg9SVYG+Blb91QiMZuLMNxDdQLi9qjXLZP0jY
         Tu0Tg6ISB/TrYizUEPFnEsmD4PktZW/cP3aWvdJGc9fg8TJwYS6aikJS2vWpZwb71wpe
         anPGf+ZnxSbBoqMfF9oEz1I9O9HNl4ozOGoAGzHRjbN8ruTO16sY4Vcl532JnlhV/04g
         py3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706077571; x=1706682371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gL02L6SfT8xCcgi821nn7rlNLkrKCcGe38FhbAW1F6A=;
        b=RxL6ppyUCH0lVJviFLemRAZOn2B0dO7zi33rfgd0I8byPxvxh05VmvDp5IF5jGXzKF
         nntzgnSTkD9qCLkX0MmCPHNHJE/oN6JQADZtBkRP15mR7j8ESfM0K8mIjqllYd6sKHmA
         MmnVEvQrSiFWsOJtB0f3CAa0h0ocsqUhZrFSZJ9NEo59obN866CPY1PzYs7G1ZWYP38l
         58vMtgK9qlShU2tMz28wbHDptV2/cofDTgFs0E7442fj33ohqAe0e4d0Fn3uQXglPkaX
         edwXaIag0BB6qcOPAtNmePfbyDtpLpSQ2el/ZpJKi2FJXmQY4y9xr0FMvLZiRT5B7Dfg
         Z8Wg==
X-Gm-Message-State: AOJu0Yy46pKO9gK1qYMh9u4MQfzVj+vN2WRTSi++WADbT/yIF4S+XFTc
	WtrJWS90OriqkYeQTDVXR/g/cT3cMQmLtZYj91UcEpsxSmVYvSFjOsum1jiNgPc=
X-Google-Smtp-Source: AGHT+IH1XumNb0MwGDk9BA76zpfc0Nssm7OXccb9aiy/9v4i3+9Ew1suUzQ0YYg1eHBk3/TzaLHQ3g==
X-Received: by 2002:a17:902:c24d:b0:1d4:2c93:39e2 with SMTP id 13-20020a170902c24d00b001d42c9339e2mr486653plg.61.1706077570499;
        Tue, 23 Jan 2024 22:26:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::907b])
        by smtp.gmail.com with ESMTPSA id o13-20020a170902778d00b001d50ca466e5sm9710569pll.133.2024.01.23.22.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 22:26:10 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ndctl: Update to v78
Date: Tue, 23 Jan 2024 22:26:07 -0800
Message-ID: <20240124062607.294166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jan 2024 06:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108443

Drop patches, they are not needed anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...01-build-set-HAVE_STATEMENT_EXPR-var.patch | 60 -------------------
 ...n-Use-pkg-config-to-detect-iniparser.patch | 41 -------------
 ...001-util-Correct-path-to-iniparser.h.patch | 28 ---------
 .../ndctl/{ndctl_v73.bb => ndctl_v78.bb}      | 11 ++--
 4 files changed, 4 insertions(+), 136 deletions(-)
 delete mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch
 delete mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch
 delete mode 100644 meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch
 rename meta-oe/recipes-core/ndctl/{ndctl_v73.bb => ndctl_v78.bb} (79%)

diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch
deleted file mode 100644
index 486d6c07be..0000000000
--- a/meta-oe/recipes-core/ndctl/ndctl/0001-build-set-HAVE_STATEMENT_EXPR-var.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From b06d16ec2d4aefc4cf1675e9dd6314956bc32d69 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Thu, 7 Apr 2022 14:36:58 +0800
-Subject: [PATCH] build: set HAVE_STATEMENT_EXPR var
-
-The v73 version tries to build and run a test program at compile
-time to check whether compiler supports sizeof and expression statements
-and sets HAVE_STATEMENT_EXPR accordingly. This requires EXEWRAPPER_ENABLED
-in meson.bbclass to be True and qemu-usermode to be working.
-
-In cases when EXEWRAPPER_ENABLED is False, build fails with error:
-
-| ../git/meson.build:213:0: ERROR: Can not run test applications in
-this cross environment.
-
-We don't really need to do this as these have been supported since gcc3 and can set the configs to 1.
-
-The autotools implementation also used to set it to 1 so this doesn't change anything:
-
-https://github.com/pmem/ndctl/blob/v72.1/configure.ac#L70
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- meson.build | 18 ++----------------
- 1 file changed, 2 insertions(+), 16 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 42e11aa..e8d218b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -210,22 +210,8 @@ conf.set('ENABLE_DESTRUCTIVE', get_option('destructive').enabled())
- conf.set('ENABLE_LOGGING', get_option('logging').enabled())
- conf.set('ENABLE_DEBUG', get_option('dbg').enabled())
- 
--typeof = cc.run('''
--  int main() {
--    struct {
--      char a[16];
--    } x;
--    typeof(x) y;
--
--    return sizeof(x) == sizeof(y);
--  }
--  '''
--)
--
--if typeof.compiled() and typeof.returncode() == 1
--  conf.set('HAVE_TYPEOF', 1)
--  conf.set('HAVE_STATEMENT_EXPR', 1)
--endif
-+conf.set('HAVE_TYPEOF', 1)
-+conf.set('HAVE_STATEMENT_EXPR', 1)
- 
- if target_machine.endian() == 'big'
-   conf.set('HAVE_BIG_ENDIAN', 1)
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch
deleted file mode 100644
index ee172c3a69..0000000000
--- a/meta-oe/recipes-core/ndctl/ndctl/0001-meson-Use-pkg-config-to-detect-iniparser.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 44516eee75696c84849c0f7aa632e2456b101813 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Mar 2022 00:57:03 -0700
-Subject: [PATCH] meson: Use pkg-config to detect iniparser
-
-Add iniparser dependency to util subdir
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build      | 2 +-
- util/meson.build | 1 +
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 42e11aa..4209320 100644
---- a/meson.build
-+++ b/meson.build
-@@ -160,7 +160,7 @@ cc = meson.get_compiler('c')
- 
- # keyutils and iniparser lack pkgconfig
- keyutils = cc.find_library('keyutils', required : get_option('keyutils'))
--iniparser = cc.find_library('iniparser', required : true)
-+iniparser = dependency('iniparser', required : true)
- 
- conf = configuration_data()
- check_headers = [
-diff --git a/util/meson.build b/util/meson.build
-index 784b279..8e9ae9a 100644
---- a/util/meson.build
-+++ b/util/meson.build
-@@ -12,5 +12,6 @@ util = static_library('util', [
-   'iomem.c',
-   ],
-   include_directories : root_inc,
-+  dependencies : iniparser,
- )
- util_dep = declare_dependency(link_with : util)
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch b/meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch
deleted file mode 100644
index fe2612ce94..0000000000
--- a/meta-oe/recipes-core/ndctl/ndctl/0001-util-Correct-path-to-iniparser.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c212d228c25cb583f52a6d31e9f0ec7bc1f9c506 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Mar 2022 01:10:02 -0700
-Subject: [PATCH] util: Correct path to iniparser.h
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- util/parse-configs.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/parse-configs.c b/util/parse-configs.c
-index c834a07..1b7ffa6 100644
---- a/util/parse-configs.c
-+++ b/util/parse-configs.c
-@@ -4,7 +4,7 @@
- #include <dirent.h>
- #include <errno.h>
- #include <fcntl.h>
--#include <iniparser.h>
-+#include <iniparser/iniparser.h>
- #include <sys/stat.h>
- #include <util/parse-configs.h>
- #include <util/strbuf.h>
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-core/ndctl/ndctl_v73.bb b/meta-oe/recipes-core/ndctl/ndctl_v78.bb
similarity index 79%
rename from meta-oe/recipes-core/ndctl/ndctl_v73.bb
rename to meta-oe/recipes-core/ndctl/ndctl_v78.bb
index da649d578b..aeaa982833 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v73.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v78.bb
@@ -10,19 +10,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74a614eac8b2657a4b8e6607421a0883"
 
 inherit meson pkgconfig bash-completion systemd
 
-SRCREV = "dd58d43458943d20ff063850670bf54a5242c9c5"
-SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https \
-           file://0001-util-Correct-path-to-iniparser.h.patch \
-           file://0001-meson-Use-pkg-config-to-detect-iniparser.patch \
-           file://0001-build-set-HAVE_STATEMENT_EXPR-var.patch"
+SRCREV = "a871e6153b11fe63780b37cdcb1eb347b296095c"
+SRC_URI = "git://github.com/pmem/ndctl.git;branch=main;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>v\d+(\.\d+)*)"
 
-DEPENDS = "kmod udev json-c keyutils iniparser"
+DEPENDS = "kmod udev json-c keyutils iniparser libtraceevent libtracefs"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "-Ddestructive=enabled"
+EXTRA_OEMESON += "-Ddestructive=enabled -Diniparserdir=${STAGING_INCDIR}/iniparser"
 
 PACKAGECONFIG ??= "tests ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
-- 
2.43.0


