Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E3C6C54FB9
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 05:07:37 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.28741.1700543254057993434
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 21:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KyQO27aS;
 spf=pass (domain: mvista.com, ip: 209.85.210.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6c396ef9a3dso4316312b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 21:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1700543253; x=1701148053; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkUkUMVoD9tmIGNh0XXETxZ2p2uYeoRQRuQmcfwK+Bk=;
        b=KyQO27aSsxWYVctPSEczPMu83YHGWP89hckd8cgd7vC36CRWWP/DX0Pd8bE8ZnJ3cE
         mjOouEPPdmbcWMMMfk3kAd0ktXiN0fwCmJ+/kIfLxf4VKhewEp6vfLO3ciqoDvFfnIFK
         OcnqzpgNG3KdtCj4UJhTKl5D5QAH6nMX/zvQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700543253; x=1701148053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkUkUMVoD9tmIGNh0XXETxZ2p2uYeoRQRuQmcfwK+Bk=;
        b=ecsyvILqQPX87/2rvvDsdR2vQaG/P1pB+ENaR5BRTbf6mz/0bJq1Sx2liF/1xUkaS9
         qptNuAjiPsGlKRxMaVxfRWj6oB7eNSLlkusc6ZDln4TiERjtsFlshkUIs4CzrOhVq7E/
         Ni6eyiC+jyxu9wYf+KClAsnk79Ti9XmQvupv3A3xYZzY8y86ycVRLDV70VXcJ8zjnF7x
         pjY809ILDioajv0q0OYivbxZVPu3h0E+2+EGjx/emPiUjcgp7EU611r0NCXDyLJ8mncq
         re3OSpT9h14F87URVTOUWhMvj3RaOsPaO7M7WT0GV+/oA42IAx8xsI1V4Qyaz+sWXipK
         R/dQ==
X-Gm-Message-State: AOJu0YyRfRu5k7w6oXG3XYqX0H3UjHOuBtggDZF2PRoHcXDuIQN1TyIB
	M2WOZZ3JA7BpcijmOMEeK5LeSE65ep2lGc0ksBClXQ==
X-Google-Smtp-Source: AGHT+IGwYpBkhWgAqW990X7YVn+lyUTAc/mYBbBWMFSw+N7zjU9gbZDrYW4f/PLW3urZ74Mkf4+BHA==
X-Received: by 2002:a05:6a20:3d02:b0:18a:da5a:3b17 with SMTP id y2-20020a056a203d0200b0018ada5a3b17mr1309328pzi.5.1700543253044;
        Mon, 20 Nov 2023 21:07:33 -0800 (PST)
Received: from MVIN00016.mvista.com ([103.250.136.177])
        by smtp.gmail.com with ESMTPSA id x10-20020a17090ab00a00b002801ca4fad2sm8090883pjq.10.2023.11.20.21.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 21:07:32 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-oe][dunfell][PATCH] php: CVE-2022-4900 fix potential buffer overflow
Date: Tue, 21 Nov 2023 10:37:27 +0530
Message-Id: <20231121050727.5968-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Nov 2023 05:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106973

Upstream-Status: Backport from https://github.com/php/php-src/commit/789a37f14405e2d1a05a76c9fb4ed2d49d4580d5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../php/php/CVE-2022-4900.patch               | 48 +++++++++++++++++++
 meta-oe/recipes-devtools/php/php_7.4.33.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch b/meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch
new file mode 100644
index 0000000000..4bfd94c9fd
--- /dev/null
+++ b/meta-oe/recipes-devtools/php/php/CVE-2022-4900.patch
@@ -0,0 +1,48 @@
+From 789a37f14405e2d1a05a76c9fb4ed2d49d4580d5 Mon Sep 17 00:00:00 2001
+From: guoyiyuan <yguoaz@gmail.com>
+Date: Wed, 13 Jul 2022 20:55:51 +0800
+Subject: [PATCH] Prevent potential buffer overflow for large value of
+ php_cli_server_workers_max
+
+Fixes #8989.
+Closes #9000
+
+Upstream-Status: Backport [https://github.com/php/php-src/commit/789a37f14405e2d1a05a76c9fb4ed2d49d4580d5]
+CVE: CVE-2022-4900
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ sapi/cli/php_cli_server.c | 11 +++--------
+ 1 file changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/sapi/cli/php_cli_server.c b/sapi/cli/php_cli_server.c
+index c3097861..48f8309d 100644
+--- a/sapi/cli/php_cli_server.c
++++ b/sapi/cli/php_cli_server.c
+@@ -517,13 +517,8 @@ static int sapi_cli_server_startup(sapi_module_struct *sapi_module) /* {{{ */
+ 		if (php_cli_server_workers_max > 1) {
+ 			zend_long php_cli_server_worker;
+ 
+-			php_cli_server_workers = calloc(
+-				php_cli_server_workers_max, sizeof(pid_t));
+-			if (!php_cli_server_workers) {
+-				php_cli_server_workers_max = 1;
+-
+-				return SUCCESS;
+-			}
++			php_cli_server_workers = pecalloc(
++			php_cli_server_workers_max, sizeof(pid_t), 1);
+ 
+ 			php_cli_server_master = getpid();
+ 
+@@ -2361,7 +2356,7 @@ static void php_cli_server_dtor(php_cli_server *server) /* {{{ */
+ 					  !WIFSIGNALED(php_cli_server_worker_status));
+ 		}
+ 
+-		free(php_cli_server_workers);
++		pefree(php_cli_server_workers, 1);
+ 	}
+ #endif
+ } /* }}} */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/php/php_7.4.33.bb b/meta-oe/recipes-devtools/php/php_7.4.33.bb
index 2a82d62ca0..74606e4883 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.33.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.33.bb
@@ -17,6 +17,7 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0001-configure.ac-don-t-include-build-libtool.m4.patch \
            file://0001-php.m4-don-t-unset-cache-variables.patch \
            file://CVE-2023-3824.patch \
+           file://CVE-2022-4900.patch \
           "
 
 SRC_URI_append_class-target = " \
-- 
2.25.1


