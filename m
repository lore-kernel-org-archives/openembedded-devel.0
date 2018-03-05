Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 226F17870E
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Mar 2018 03:01:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id i14so6290284pgv.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Mar 2018 19:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=yHOUNqicfE6wdIZsPqruLLRIWnIea8uLWHQ8dTVPZaw=;
	b=GYJPb7AAD8DPNYfDM4xfM/sU3S6AuBUULJcSd0jEosFlJetNwA8UixcpHt1fJ1SLib
	h2hjiZ8oI1LLB4ClK7TxQMSNhJ6zOZR2olh8m2eK+IDa5lsSZbs0u2LHQGsw1MLjDGGD
	lpiy8Qkz5HN6StB07tj/XWsHISBXZZHxfdC1oqkXDLjB5NV3y9gF5WZJcN7A7UIPKQje
	qXAMtzLu2X/UsKp/3YGn+nWC2gk3EbAaV1YBPv3WTwuyAeHSmQkyZsT2m35j2/hxhzp0
	+5bDMgbnaGmtniUUfzfMcPyzXHeKlXIK7m/iz8o9grElvn8QJUdOxIrmcblrdNZ5GdiT
	Kp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yHOUNqicfE6wdIZsPqruLLRIWnIea8uLWHQ8dTVPZaw=;
	b=oTE1OaybwE0Zm3/MoU9sK/VHhKRHpVqzRdscPdVs+R+R7ePaTXliaaqD7OXMYb3aIb
	pzL8DwVNLlOw7N+Op3FnBvu+/lq5KGw4ajatiAcfyuuuAJFOy9xl/GMZtnmVQccGeGR6
	RRR2NtbuuNC0DCbhfiy8meoeVgYwkGj8rkgprfmRzPDtbv45q11fK3eYDD7ZyoPmk62p
	QARW4ysoNO9Ii1qwaZkcCjUWA8J6ZoJ8sId2grYk1Jlsp9u7dw0mny4Kv7ViCCJJVG7j
	wTuXqHM2vTdm4D7fC1WqTZ9jQ5nuyUvVNdvlpQUgUJrv2RIKOO1vTTIG8elhTIZoE3Iu
	G66g==
X-Gm-Message-State: APf1xPBAGBvO8AZNCHEZRWmfFg+NHJGPF7u9G+SbpL32pxuq+V6xO6UH
	9b0VXwxTneg7L0TAXB4xUmGIFg==
X-Google-Smtp-Source: AG47ELvIZ25dxz8QAiZuAOShm37MlbA8NKNf5I1sWhfWmgyIX8HL3jGvg9Crnf8NS6ZeDE5UkVnUmA==
X-Received: by 10.98.73.140 with SMTP id r12mr13761424pfi.229.1520218886344;
	Sun, 04 Mar 2018 19:01:26 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	t85sm24136961pfg.159.2018.03.04.19.01.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 04 Mar 2018 19:01:25 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Mar 2018 19:01:15 -0800
Message-Id: <20180305030116.1901-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [meta-oe][PATCH 1/2] libyui-ncurses: Fix build with musl _nl_msg_cat_cntr in not available
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2018 03:01:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-use-_nl_msg_cat_cntr-only-with-glibc.patch | 40 ++++++++++++++++++++++
 .../recipes-graphics/libyui/libyui-ncurses_git.bb  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch
new file mode 100644
index 000000000..8e3774c1a
--- /dev/null
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses/0001-use-_nl_msg_cat_cntr-only-with-glibc.patch
@@ -0,0 +1,40 @@
+From 4b84f243a70a8c07f6a38dad3c9411fa707f25c9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 4 Mar 2018 17:08:43 -0800
+Subject: [PATCH] use _nl_msg_cat_cntr only with glibc
+
+The musl libc provides libintl (similar to glibc)
+but does not use the same internals,
+so even though we are using the GNU gettext
+the libintl included with the libc does not define
+_nl_msg_cat_cntr and it does not need to.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/NCi18n.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/NCi18n.h b/src/NCi18n.h
+index 165b0e7..bfc4ed7 100644
+--- a/src/NCi18n.h
++++ b/src/NCi18n.h
+@@ -59,12 +59,13 @@ inline void setTextdomain( const char * domain )
+     bindtextdomain( domain,  YSettings::localeDir().c_str() );
+     bind_textdomain_codeset( domain, "UTF-8" );
+     textdomain( domain );
+-
++#if defined(__GLIBC__)
+     // Make change known
+     {
+ 	extern int _nl_msg_cat_cntr;
+ 	++_nl_msg_cat_cntr;
+     }
++#endif
+ }
+ 
+ 
+-- 
+2.16.2
+
diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
index f60c85668..578c71301 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.lgpl-3;md5=e6a600fd5e1d9cbde2d983680233ad02 \
 "
 
 SRC_URI = "git://github.com/libyui/libyui-ncurses.git \
+           file://0001-use-_nl_msg_cat_cntr-only-with-glibc.patch \
           "
 
 SRC_URI_append_class-target = " file://0001-Fix-the-error-of-can-t-find-header-file.patch"
-- 
2.16.2


