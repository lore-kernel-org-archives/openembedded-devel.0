Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A23B578931
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id m68so6641860pfm.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yHOUNqicfE6wdIZsPqruLLRIWnIea8uLWHQ8dTVPZaw=;
	b=jahwIBKeDvkrBKkjU4LAigYPraiQ+nH+hppyDyiOV/NCGYhAcGMqsnfsC+8v+36A0H
	5TtdM8qT365i2tfaH0ViJxLUBfaHuPxK+v3/zPsHer914ASavNOm+mWjD1zOUgG81XRz
	8vdE3+H+NxwwtJG3Fu5t0ihqQC7iwVZB4DGK7jKUScgIv2XRDosNanT9LRzVrbHFzzKT
	p5m0n1NwI5PqAeqOyt9P8BCYMGgdqnPZt0F27O7mNZmgEryWNmEgc5LLvNmF5Ew4EiSu
	NOWaG8wrl9yUEq3hjA40159kpl/npbEy3d78jutjMHa9GrIwQtXuLTo+N51qSgrL612k
	ETdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yHOUNqicfE6wdIZsPqruLLRIWnIea8uLWHQ8dTVPZaw=;
	b=Px1etlPiD+IgCzKYGLUMY5uLYCQczJNDHmxxntG80RMXjxOx3mzAoc6xKOLGyS2BC0
	1TrdguCYHeArkoQIL8x2RFDwqhtPXVgkJr5dSXRoRs+NVYz+7cVLE6nz2wZ2dAR4Uc4S
	cf/dkL/CQLN+cU2U8GBxk0ZBQyV9T94kLwrY/EMDLPhses2pCCfuCYJZkJoTwZDNt3lj
	vXIviZ1fpB3ILzzNCUHPwLsNCYAPCWXC7C5dbGIf28iJv36Lf2oKeIz33pQN4XXwHJlN
	4VbfEs5mvScwHafSAJjEVMqEtZBXs1mzGjgRvJ6Lb8dBHiZGs2YKXfazQm3nXReTT0QR
	Mbog==
X-Gm-Message-State: AElRT7Gz32N0GrECjHmgKNYTO45GWz7qWNGYJQMqWzO+K3YuAiEdPau7
	TgQQHZiW7VBf3k59aX1GU7oVpw==
X-Google-Smtp-Source: AG47ELvEZMNrNu3AA8RtJFiAvf9fQxQj73wQJtiIautvZ2EyDHSljN6ZXe3S1WB/vE4fD9fwYedjOQ==
X-Received: by 10.98.234.22 with SMTP id t22mr9252015pfh.56.1521439408373;
	Sun, 18 Mar 2018 23:03:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:54 -0700
Message-Id: <20180319060300.5366-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 12/18] libyui-ncurses: Fix build with musl _nl_msg_cat_cntr in not available
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:28 -0000

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


