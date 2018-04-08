Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id EA3C575524
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:58:54 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id q9so3728420pff.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yPIRQW35RQtmm3XqbsAUSO4hULGeR09i/h9au1cTwB8=;
	b=MXTAPGHWdn4zOMsz5NgvPP+GT38ggFIfgNxVfKegEU+RthWrwrvCesKdefeKl6mWFB
	kdd5GAyhEKTvXwnv8h1wETYDnEdZmP4tqB/n+by00N6VdlVOD5KjOQHCjYLLpBP0Mx/X
	8BQW1N5Qa2HfC8Bo6OvUmTV6/TF0yM1+cSB1VlvR8E+NwMAIjR7XIFOLEJ/y9ycFdGG8
	LVSKkfBVT4ZGnssPWNzKvVdkdaTYVmiOj9w0Ffqa5amL3ZZQWR8HOGDq58eMSJhnFOJ7
	SqFKPRg42dUp14ATFo8N89W4b72/wS7O2fduw+guw5lSNPCvMcEcmohn3pzQxFWXf1Ko
	gOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yPIRQW35RQtmm3XqbsAUSO4hULGeR09i/h9au1cTwB8=;
	b=h2XSEX8/4Ge8FMyiHMMNsTzy8LId4Xgc78BnqtOPJuvHhCz0A07rLYNjCF8lBoSIXH
	rH4Z1AhqutbAVzFNDvcf33W8lI4f0QRsNfpTPRrQaQCUW5Oz0dvqMl/C/m2XtMnl9BiZ
	pTeZQnywRU3Kmat4WzJ7F/CvW68/AxPby/ciFoCCnTLxC1SZZKMlt25bPoqEio2xZzja
	0za1222IJiZtQQHgnrqlXxC7fwOVu4EysVL4yyTQny019NGiUUnL7dIOLBYiGD2KI1Ph
	JqTDQ8/s0jqwu3LtsXawMPzUW/xfIGLErfSg0aiSNUKeZ4h/eARB8bocemNLKdByJQ+L
	wD6g==
X-Gm-Message-State: AElRT7FSvWMmTzfFG4uwFtNeYEEzyrw7UOavYb3zBX5cGBWKfKbHzQ/w
	w9pFDUsfB8gY+/7FG3Zvo1I=
X-Google-Smtp-Source: AIpwx4/fTMUeov/CmkvkGsYHLWNcZgoo91PvM+RnsaFlNaDIJRm1onAOmMsUrc58NkBfSOk59kI2qQ==
X-Received: by 10.99.6.198 with SMTP id 189mr22411848pgg.131.1523170735809;
	Sat, 07 Apr 2018 23:58:55 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:58:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:16 -0700
Message-Id: <1523170729-26321-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 04/37] libvpx: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:58:55 -0000

WARNING:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
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
checking file build/make/configure.sh
Hunk #1 succeeded at 581 with fuzz 2 (offset 137 lines).
Hunk #2 succeeded at 616 (offset 27 lines).

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libvpx-configure-support-blank-prefix.patch    | 23 +++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
index c7a6e51..6ad7f2b 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
+++ b/meta-oe/recipes-multimedia/webm/libvpx/libvpx-configure-support-blank-prefix.patch
@@ -1,19 +1,28 @@
-Upstream: not yet
+From dc0a5c3d2dd4e79d12a150a246a95c4dc88326f1 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 16 Aug 2011 16:04:35 +0200
+Subject: [PATCH] Upstream: not yet
 
 Fix configure to accept "--prefix=" (a blank prefix).
 
---- libvpx-0.9.1/build/make/configure.sh.orig	2010-06-17 09:08:56.000000000 -0400
-+++ libvpx-0.9.1/build/make/configure.sh	2010-09-23 14:27:48.000000000 -0400
-@@ -444,6 +444,8 @@
+---
+ build/make/configure.sh | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/build/make/configure.sh b/build/make/configure.sh
+index 007e020..04d5cbf 100644
+--- a/build/make/configure.sh
++++ b/build/make/configure.sh
+@@ -581,6 +581,8 @@ process_common_cmdline() {
          ;;
-         --prefix=*)
+       --prefix=*)
          prefix="${optval}"
 +        # Distinguish between "prefix not set" and "prefix set to ''"
 +        prefixset=1
          ;;
-         --libdir=*)
+       --libdir=*)
          libdir="${optval}"
-@@ -587,13 +587,23 @@ process_cmdline() {
+@@ -614,13 +616,23 @@ process_cmdline() {
  }
  
  post_process_common_cmdline() {
-- 
2.7.4


