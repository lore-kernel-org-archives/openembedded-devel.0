Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC0560807
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 16:52:03 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s10so5886381wra.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=eexyjQTwUNZjVlmJZIaewKzD8oKGUoT7G1+MS7PP5eM=;
	b=WvVSBNdiujiNBM+PX1JNtVp5Y5dNDt5ThFuelS+Fg1H0UKEfeFGjAYwXJYXyQQMxc/
	RMPxpv3Gaiz57+Dt1jqQVjb8CVi348mlhQSBQxNF1aXClaaHY92HHSiSulnoxYRvN7Ed
	Pd4XLfyifcHN8YZuYec5PZQHTzrNFrZZIBMaLciGIjnHJXTLtE9DKKZdMuC7gdZoQlR+
	k7f84djzIhaFZuIPPhVrhg0f32Xh7Xki/U0O5LfupTbWDcuGFo0QlpWiHB/Qcv5DaHHB
	nfoozrZNyx1LefkxlLKLW1YGzV4oRo7nW++21bAee8qZ2UYYdZMfzP63YPGKqXXKikdB
	L4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=eexyjQTwUNZjVlmJZIaewKzD8oKGUoT7G1+MS7PP5eM=;
	b=ezXuMygI/4PuAgGefPFLxJYnvfNsABIlPfidH49JdC2Mg+Vwys8rFYWuEzU/Z2A5AC
	9uMJ1eo50HWUtj9LnxN11M8J0J9k7MLRv9Tp5WG3m0phfoFSwwtTp9B+mdUfRv0Ls98D
	OFgh7s2wE0uo/+ENC9IzBrZCxLuiZ4pKVWzVe06gF0QQUGm3OaCiI+440kBhK8kXEc4u
	vKnjtXPoBDgTV6uagNYCucMCKUDWXuFHtPMFQJyKyCOoBtdVrnXs7f/GJS9DLvL6TaIm
	2TcMFrcSBA1BPMQyjTDEGxOsM1XgVJvTxK6U75n7XoAmtrxGQye3P08utHK5BAGppmAm
	CPfQ==
X-Gm-Message-State: AElRT7HnJG+tDZRUGjvUtEhmE9c7seYmGOIBZIIXFl7mcinHIZlljGwD
	/42QwPisYjkzVgBoldoutUn0Yw==
X-Google-Smtp-Source: AG47ELu+PhM8GY6KdAn1XKwYwvGnsqYNuX+iTv+dMXk/i9v4FpEm6+AeJSuS11a4o+IFvZK6kkwCAA==
X-Received: by 10.223.138.172 with SMTP id y41mr16550685wry.98.1521651124684; 
	Wed, 21 Mar 2018 09:52:04 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	e18sm5069128wmc.21.2018.03.21.09.52.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 21 Mar 2018 09:52:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 16:52:00 +0000
Message-Id: <20180321165202.1777-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180321165202.1777-1-Martin.Jansa@gmail.com>
References: <20180321165202.1777-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] libqmi: refresh patch
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
X-List-Received-Date: Wed, 21 Mar 2018 16:52:04 -0000

WARNING: libqmi-1.20.0-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-Detect-clang.patch
patching file m4/compiler-warnings.m4
Hunk #2 succeeded at 37 with fuzz 2.

Now at patch 0001-Detect-clang.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
index 4047ffbf23..7be1d3f1b0 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi/0001-Detect-clang.patch
@@ -1,4 +1,4 @@
-From 4cfb728804157e8f3c69e11ba4df449d8f76388f Mon Sep 17 00:00:00 2001
+From 3a95d82ba11d054c8d8abd332f053c787d0f924d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Oct 2016 04:42:26 +0000
 Subject: [PATCH] Detect clang
@@ -12,12 +12,13 @@ compiler are accepted.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
+
 ---
  m4/compiler-warnings.m4 | 29 +++++++++++++++++++++++++----
  1 file changed, 25 insertions(+), 4 deletions(-)
 
 diff --git a/m4/compiler-warnings.m4 b/m4/compiler-warnings.m4
-index de4a8b0..e4ba718 100644
+index 5ba490c..9202274 100644
 --- a/m4/compiler-warnings.m4
 +++ b/m4/compiler-warnings.m4
 @@ -2,10 +2,30 @@ AC_DEFUN([LIBQMI_COMPILER_WARNINGS],
@@ -53,7 +54,7 @@ index de4a8b0..e4ba718 100644
  		      -Wdeclaration-after-statement -Wstrict-prototypes \
 @@ -17,22 +37,23 @@ if test "$GCC" = "yes" -a "$set_more_warnings" != "no"; then
  		      -Wmissing-include-dirs -Waggregate-return \
- 		      -Wformat-security; do
+ 		      -Wformat-security -Wtype-limits; do
  		SAVE_CFLAGS="$CFLAGS"
 -		CFLAGS="$CFLAGS $option"
 +		CFLAGS="$CFLAGS $option $WERROR"
@@ -79,6 +80,3 @@ index de4a8b0..e4ba718 100644
  else
  	AC_MSG_RESULT(no)
  fi
--- 
-1.9.1
-
-- 
2.15.1


