Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 99DF37841B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:58 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id p18-v6so6338223wrm.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=hq/0AMrVKMQWhhpf6RXi7dmlxrb4FMr9x+X/MvxRtmY=;
	b=hWfakF8kzKdsNUVyrtLjGGXcUX9es/Wnl3OFZZH+8f/knrJkYMyswXoWy/4z0pyWMv
	uUq73FjCsRn7ynW52QxRsKMrUMyjCDCv5ySaxTRmj1m34p03BOyAiTCdF6bzdEbw35OI
	xMZT5pCmnLPGhhrvczuGNfTeFoVlUAsplaNcK6Sl7vvjDx2UNPfE507U1qPi/g0RHpL0
	gFfglMV7R5Ny3hMUlCrOf9KwCt1s3JAPSjxRj7+DwyAnO+t9syohiWcxqK/mghc+AdHM
	qi/oIUh/Hs+4mYSLdjF8LBj46Hs063PpvQy4AXpU8naIjJ+GYfN8ayR7RoxpK+sxZGzl
	prjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=hq/0AMrVKMQWhhpf6RXi7dmlxrb4FMr9x+X/MvxRtmY=;
	b=jfihojzigvq7b3sjYcN8X5r8h60gOy1MjiPIOWytOwYmW3Oglt8PFIj7Eq4tFpawfs
	xLceIYe/A7bbO43IGFpQ5zAPRoyVCZucdE6PEhRGBZUISLOhBIAn41Hxdbo/mKR0OIez
	rTcmE5N1uOMKDUOOKVIvb+JUhTYGYI0maPg+HpqridhtDWP7HUgxwpRJ8vzHYkxUd8NZ
	iOl0FWQO3ddBIZTVBxibxjB3VI3LgIjR6uF1gmszsqIU2oCefke5paO+6c7SsCB33CPV
	P8447m08ZssMg9E6/1+Vj3zuhcUIXD1Vyqe0NfTVw6IpE4asja1ZVZrWjJKuQer5DlLb
	iR3A==
X-Gm-Message-State: ALKqPwcBBkw38+pPtPJUiGjbGzomQNBQnweQiX4wk3QzXxWXydsBwxEf
	6poAHcGWheTDlI9p+adeqVHN0w==
X-Google-Smtp-Source: AB8JxZrJ8w5+N9e4DrpmRbfWINq7aOTJLi8PQJFruNHPkfWojMRT7lsW/EZOPByemfKmrdqWP7R7Kw==
X-Received: by 2002:adf:be83:: with SMTP id i3-v6mr202740wrh.166.1526066519175;
	Fri, 11 May 2018 12:21:59 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	44-v6sm6608368wrv.47.2018.05.11.12.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:43 +0000
Message-Id: <20180511192145.7811-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 7/9] celt051: make ogg support optional
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
X-List-Received-Date: Fri, 11 May 2018 19:21:58 -0000

* drop PR
* add +git to PV
* and support for native and nativesdk needed for spice
* the old PACKAGECONFIG didn't work, because both options aren't
  recognized as shown by do_configure warning:
  configure: WARNING: unrecognized options: --without-ogg, --disable-oggtest
* XIPH_PATH_OGG macro is provided by libogg so we cannot call it without
  the libogg dependency, so replace it with explicit --enable-tools

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...igure.ac-make-tools-support-optional.patch | 39 +++++++++++++++++++
 .../recipes-support/celt051/celt051_git.bb    | 16 ++++----
 2 files changed, 48 insertions(+), 7 deletions(-)
 create mode 100644 meta-networking/recipes-support/celt051/celt051/0001-configure.ac-make-tools-support-optional.patch

diff --git a/meta-networking/recipes-support/celt051/celt051/0001-configure.ac-make-tools-support-optional.patch b/meta-networking/recipes-support/celt051/celt051/0001-configure.ac-make-tools-support-optional.patch
new file mode 100644
index 0000000000..b0809ee947
--- /dev/null
+++ b/meta-networking/recipes-support/celt051/celt051/0001-configure.ac-make-tools-support-optional.patch
@@ -0,0 +1,39 @@
+From 86df4200c9c33d999df0e8cc3c9771f17a297ec4 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 13 Sep 2017 15:01:54 +0200
+Subject: [PATCH] configure.ac: make tools support optional
+
+* add --enable-tools option
+* XIPH_PATH_OGG macro is provided by libogg so we cannot call
+  it without the libogg dependency
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d4b1a3f..7d6b2dc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,8 +68,14 @@ AC_MSG_RESULT($has_alloca)
+ 
+ AC_CHECK_HEADERS(sys/soundcard.h sys/audioio.h)
+ 
+-XIPH_PATH_OGG([tools="tools"], [tools=""])
++AC_ARG_ENABLE(tools, [  --enable-tools          Compile ogg tools],
++[if test "$enableval" = yes; then
++  [tools="tools"]
++else
++  [tools=""]
++fi],
+ AC_SUBST(tools)
++)
+ 
+ AC_CHECK_LIB(m, sin)
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/celt051/celt051_git.bb b/meta-networking/recipes-support/celt051/celt051_git.bb
index ee3882148e..850704f5af 100644
--- a/meta-networking/recipes-support/celt051/celt051_git.bb
+++ b/meta-networking/recipes-support/celt051/celt051_git.bb
@@ -12,19 +12,21 @@ like Speex, GSM, or G.729."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=375f60ab360d17f0172737036ff155b2"
 
-PV = "0.5.1.3"
-PR = "r0"
+PV = "0.5.1.3+git${SRCPV}"
 
 SRCREV = "5555aae843f57241d005e330b9cb65602d56db0f"
 
-SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https"
+SRC_URI = "git://git.xiph.org/celt.git;branch=compat-v0.5.1;protocol=https \
+    file://0001-configure.ac-make-tools-support-optional.patch \
+"
 
 S = "${WORKDIR}/git"
 
-DEPENDS += "libogg"
-
 inherit pkgconfig autotools-brokensep
 
-PACKAGECONFIG = ""
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG ??= ""
+
+PACKAGECONFIG[ogg] = "--enable-tools,--disable-tools,libogg,"
 
-PACKAGECONFIG[ogg] = "--with-ogg --enable-oggtest,--without-ogg --disable-oggtest,,"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.0


