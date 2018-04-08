Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 77DE175577
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Apr 2018 06:59:16 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s10-v6so3208982plp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Apr 2018 23:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=epPLjdOGqpuZkRD2kWnlHL2Hi99SUAmJ2PfWv2qfoiA=;
	b=jX0dQMwTmJ0YVU7mr+AFKBFldHNI3Ql0E7rFt+fXDMfWoEWRuJzH+hO/6IlEoi1snp
	he0WmuLJqQWP14kUqImjVBxqh9h9hv3/7ZicqUl0HZKI8IHmg9FVyJLpZFxorBTxrejU
	yLiwgKHB/gJKyNxp0ZC/3OD7MijxkshNfqPYJXJWw3xs/zVAyuSfrLYbnUJXjVn2A3rD
	cnYTCKXpizXVwg3wju91xaWZHAOKRHwNC02h2bv6skRIX/Blc9PBR9i41viBO227ld9H
	PBeSxMyIJRSpfWqFxigH9U39jitX31zUcGrx0uBl6peFx+HGc3s/KYQTlV6NV4YbcG6K
	Qypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=epPLjdOGqpuZkRD2kWnlHL2Hi99SUAmJ2PfWv2qfoiA=;
	b=e1A0OWiJ4KbkR1wudTphwtG3/wT+AezjNsmxhsgnXhL7B9OqDVqoYIgWIfHN/zHqRl
	XT3MZgE1fzzQqYu5Th0iGyswwb7PffOjBFW3pdZi1NcP5/mIpMnBKjuQJ1/P8ZIZqj+I
	/vuUPKSMNPrL+47eVC/S/I1YWbsgevEdC5Yqjt0SKQWSBFugqtzSueUig3PEg9DqWYRV
	PcCYeatPDA/rM8v1fNc0zW/QSHbd3+cny/o3wVRNAUEvGQmsHR1TKWA4EUEg868M9SHc
	WPvqn20qGKPVVPAgn5wZbk+S+G/JzQXvr13+RX1tCXkAzVYrHe4/OG0bnaf97PV1iKrc
	PKuA==
X-Gm-Message-State: AElRT7G8ur+7McU8ga4rzpNWxwrqfFHR/BTzvtp1LIAVcKyUST3A5PNe
	r6h4yVmAiESRsI+4WKhLYxc=
X-Google-Smtp-Source: AIpwx48+/rAXMmo1XibexeRBQkq4XLHFW9LjykVEC2+HyycHr1AhMpnZ0iObh8o2li7LLiNZunem8Q==
X-Received: by 2002:a17:902:b101:: with SMTP id
	q1-v6mr33452289plr.3.1523170757794; 
	Sat, 07 Apr 2018 23:59:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:932:e5ef:c5a4:fdbd])
	by smtp.gmail.com with ESMTPSA id
	c186sm20506137pfb.40.2018.04.07.23.59.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 07 Apr 2018 23:59:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sat,  7 Apr 2018 23:58:38 -0700
Message-Id: <1523170729-26321-26-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
References: <1523170729-26321-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 26/37] syslog-ng: refresh patches
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
X-List-Received-Date: Sun, 08 Apr 2018 06:59:16 -0000

WARNING: syslog-ng-3.8.1-r0 do_patch:
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
Applying patch configure.ac-add-option-enable-thread-tls-to-manage-.patch
patching file configure.ac
Hunk #1 succeeded at 147 with fuzz 2 (offset 27 lines).
Hunk #2 succeeded at 489 (offset 105 lines).

Now at patch configure.ac-add-option-enable-thread-tls-to-manage-.patch

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...emory-leak-problem-when-HAVE_ENVIRON-defined.patch |  8 +++++---
 ...e.ac-add-option-enable-thread-tls-to-manage-.patch | 19 ++++++++-----------
 .../syslog-ng/files/fix-config-libnet.patch           | 15 ++++++---------
 .../syslog-ng/files/fix-invalid-ownership.patch       | 13 +++++--------
 4 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
index 2ac9c0b..5d481f2 100644
--- a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
@@ -4,9 +4,11 @@ Upstream-Status: Pending
 
 Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
 ---
---- a/lib/gprocess.c
-+++ b/lib/gprocess.c
-@@ -1421,6 +1421,18 @@
+Index: syslog-ng-3.8.1/lib/gprocess.c
+===================================================================
+--- syslog-ng-3.8.1.orig/lib/gprocess.c
++++ syslog-ng-3.8.1/lib/gprocess.c
+@@ -1432,6 +1432,18 @@ g_process_startup_ok(void)
  void
  g_process_finish(void)
  {
diff --git a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
index cc8d110..c172e4e 100644
--- a/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
@@ -10,13 +10,13 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  configure.ac | 17 +++++++++++------
  1 file changed, 11 insertions(+), 6 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index 474e094..cedca54 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -120,6 +120,9 @@ AC_ARG_ENABLE(memtrace,
- AC_ARG_ENABLE(ssl,
-               [  --enable-ssl        Enable SSL support.],,enable_ssl="auto")
+Index: syslog-ng-3.8.1/configure.ac
+===================================================================
+--- syslog-ng-3.8.1.orig/configure.ac
++++ syslog-ng-3.8.1/configure.ac
+@@ -147,6 +147,9 @@ AC_ARG_ENABLE(gprof,
+ AC_ARG_ENABLE(memtrace,
+               [  --enable-memtrace   Enable alternative leak debugging code.])
  
 +AC_ARG_ENABLE(thread-tls,
 +              [  --enable-thread-tls        Enable Thread Transport Layer Security support.],,enable_thread_tls="no")
@@ -24,7 +24,7 @@ index 474e094..cedca54 100644
  AC_ARG_ENABLE(dynamic-linking,
                [  --enable-dynamic-linking        Link everything dynamically.],,enable_dynamic_linking="auto")
  
-@@ -381,12 +384,14 @@ dnl ***************************************************************************
+@@ -486,12 +489,14 @@ dnl ************************************
  dnl Is the __thread keyword available?
  dnl ***************************************************************************
  
@@ -45,6 +45,3 @@ index 474e094..cedca54 100644
  
  dnl ***************************************************************************
  dnl How to do static linking?
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
index 755803c..553f4a5 100644
--- a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
@@ -10,11 +10,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  configure.ac |   27 +++++++++++++++++----------
  1 files changed, 17 insertions(+), 10 deletions(-)
 
-diff --git a/configure.ac b/configure.ac
-index b1e18b4..8e13025 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -73,6 +73,9 @@ AC_CONFIG_HEADERS(config.h)
+Index: syslog-ng-3.8.1/configure.ac
+===================================================================
+--- syslog-ng-3.8.1.orig/configure.ac
++++ syslog-ng-3.8.1/configure.ac
+@@ -104,6 +104,9 @@ AC_CONFIG_HEADERS(config.h)
  dnl ***************************************************************************
  dnl Arguments
  
@@ -24,7 +24,7 @@ index b1e18b4..8e13025 100644
  AC_ARG_WITH(libnet,
     [  --with-libnet=path      use path to libnet-config script],
     ,
-@@ -768,22 +771,26 @@ dnl ***************************************************************************
+@@ -893,22 +896,26 @@ dnl ************************************
  dnl libnet headers/libraries
  dnl ***************************************************************************
  AC_MSG_CHECKING(for LIBNET)
@@ -61,6 +61,3 @@ index b1e18b4..8e13025 100644
  if test "x$enable_spoof_source" = "xauto"; then
  	AC_MSG_CHECKING(whether to enable spoof source support)
          if test "x$LIBNET_LIBS" != "x"; then
--- 
-1.7.1
-
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch b/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
index faf9672..54ecce5 100644
--- a/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
@@ -10,11 +10,11 @@ Signed-off-by: Ming Liu <ming.liu@windriver.com>
  scl/Makefile.am |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)
 
-diff --git a/scl/Makefile.am b/scl/Makefile.am
-index 57fad5d..2a29ca5 100644
---- a/scl/Makefile.am
-+++ b/scl/Makefile.am
-@@ -14,7 +14,7 @@ scl-install-data-local:
+Index: syslog-ng-3.8.1/scl/Makefile.am
+===================================================================
+--- syslog-ng-3.8.1.orig/scl/Makefile.am
++++ syslog-ng-3.8.1/scl/Makefile.am
+@@ -27,7 +27,7 @@ scl-install-data-local:
  		fi; \
  	done
  	$(mkinstalldirs) $(DESTDIR)/$(scldir)
@@ -23,6 +23,3 @@ index 57fad5d..2a29ca5 100644
  	chmod -R u+rwX $(DESTDIR)/$(scldir)
  
  scl-uninstall-local:
--- 
-1.7.1
-
-- 
2.7.4


