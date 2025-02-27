Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD82C197BF
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 19:20:02 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.19489.1740683994291728546
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Feb 2025 11:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fqazNU5c;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54943bb8006so1312619e87.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 11:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740683992; x=1741288792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0aCmr3sg8b9zZwHLR5i37JAZa+hyxJm+kq6dMA5k9Vg=;
        b=fqazNU5caiLCdwSngum8ILxREdKoCu53Fs9GyMKc6qoKRsnJBWpTXYrnNz80VS0WyA
         5RU/MmmOFSweQ92m5p93C+B37BJI+sam8Hstx+Fv+JY3MUdO809m9w518qplTK/Wl+24
         SODCVApdyZT0KapyNpTWGhkuN3hfEm53FzyQ5hqDWM9qs/niH7d8sk4rEuqF1dXeW9U7
         GX6gTlQ2+75PvFT8ePLk3sMKBuOeoqV47/fX0/3DUycQkAKGjgDUA9BijAx3SCsY18t3
         sHk8Re3XQUp7eKEMllGrf0Tpgdif3NjZpmBaHxS1z/7fG7NNzn4toIrX6cVmamM+1RGV
         cIYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740683992; x=1741288792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0aCmr3sg8b9zZwHLR5i37JAZa+hyxJm+kq6dMA5k9Vg=;
        b=PCn6QfNTj6aLcjohXrfNhO5CMjCngg62sr7adF9TSs5vA+pmM5yL0gq7FT398z6Jo8
         XXZlyQ8QPTeCGE8dP+GY9E28oO/QXjtx8oGh0Tm4eGUpEWzKt5MuRfrTUvFN7w6YNm86
         tWldu8w+Rl2MDME4hRzu4giadCin58elrdL7Nbdt2F82Qt2BFyshK6rLGHVVV/5xcgNs
         DQQroudyT4GpokYE5PCME/xD+Ek3oxw2bpXLwfO8OSoq4aP4gjgqc5yBm2f42kPYC4Ih
         gsrSCOieP2zAg3OflJvv4Vafk/sopKqscNlOLVRNTSqcHN2xSSrHjQkJOqqog6Kj2kqL
         yNGw==
X-Gm-Message-State: AOJu0Yz3NasdNbaYE5B3VNJuDU0IjBppEe10X3+Tzj3B+XVcRAiTZqdx
	yCDFXh6OxSEym7b5OIjntlVjxuKGvpZ4Xso/xPlKozIhOVwoWuFZQS5m6RMLeS+p2jb2GpXJCXK
	hZ/A=
X-Gm-Gg: ASbGncsXwhpAC5VY0qXA8L1VuSz17eXROwix8rg+F2oJWT5GjxPrjkWdU3YSQg/XCNN
	k+AAxh+B4xI6Rp0Q+YVvFYRQHKjq6BcV9bx3jg6tH6e3jkWYMQ23olFXv6uLzRPSmYb4OwT1dH8
	pEzV3WkZALcAIrc6Eru0st/Or6tLZFYdHfaYS+GEUHNBfl9TXbIvA2c/XGIJK+0cmhPOwBtISzp
	7JSI1UjWZeofSH9E/2D32jET7laZheBe3ubP9JmEqn3DzBdfLibtLqXW2/I08dZyeKXSAUF9HOr
	4MLC2xMh3r7PdE3cIvoEDzHCQmHdJYcQYhCeknsCHQ==
X-Google-Smtp-Source: AGHT+IFhGyVzhnKVTW9azN5HbyYHNtHPJijJ2trBa9ZOf6+UNDcc3UWV+4Bhri7RvCeuMNqwlZ75JA==
X-Received: by 2002:a05:6512:b01:b0:546:2ea9:6662 with SMTP id 2adb3069b0e04-5494c368d02mr270827e87.51.1740683991752;
        Thu, 27 Feb 2025 11:19:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417b7b3sm235435e87.100.2025.02.27.11.19.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 11:19:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] netperf: fix build failure due to autotools.bbclass change
Date: Thu, 27 Feb 2025 21:19:50 +0200
Message-Id: <20250227191950.295912-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Feb 2025 19:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115700

Recent change to autotools.bbclass broke netperf as it can not now find
proper macros. Remove old workaround and add a proper patch to utilize
ACLOCAL_AMFLAGS option.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 ...0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch | 41 +++++++++++++++++++
 .../recipes-support/netperf/netperf_git.bb    |  7 +---
 2 files changed, 42 insertions(+), 6 deletions(-)
 create mode 100644 meta-networking/recipes-support/netperf/files/0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch

diff --git a/meta-networking/recipes-support/netperf/files/0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch b/meta-networking/recipes-support/netperf/files/0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch
new file mode 100644
index 000000000000..6aba8a4f797f
--- /dev/null
+++ b/meta-networking/recipes-support/netperf/files/0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch
@@ -0,0 +1,41 @@
+From 333e92a2d804420748447e043c6a04affc600e20 Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Thu, 27 Feb 2025 21:09:04 +0200
+Subject: [PATCH] Makefile.am: add ACLOCAL_AMFLAGS
+
+Add ACLOCAL_AMFLAGS, a standard way to tell aclocal where to find
+necessary macros.
+
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Upstream-Status: Submitted [https://github.com/HewlettPackard/netperf/pull/84]
+---
+ Makefile.am | 1 +
+ autogen.sh  | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 2cb9c24f2eec..dc266e34c997 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -19,6 +19,7 @@
+ # OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
+ # USE OR OTHER DEALINGS IN THE SOFTWARE.
+ 
++ACLOCAL_AMFLAGS = -I src/missing/m4
+ AUTOMAKE_OPTIONS = dist-bzip2 dist-zip
+ SUBDIRS = src doc
+ EXTRA_DIST = README.* Release_Notes inet_ntop.c autogen.sh m4
+diff --git a/autogen.sh b/autogen.sh
+index bc8389c24171..1156f42edae6 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -1,5 +1,5 @@
+ #! /bin/sh
+ 
+-aclocal -I src/missing/m4 \
++aclocal \
+ && automake  --add-missing \
+ && autoconf && autoheader
+-- 
+2.39.5
+
diff --git a/meta-networking/recipes-support/netperf/netperf_git.bb b/meta-networking/recipes-support/netperf/netperf_git.bb
index 579a04b86fa0..fa73548d836d 100644
--- a/meta-networking/recipes-support/netperf/netperf_git.bb
+++ b/meta-networking/recipes-support/netperf/netperf_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/HewlettPackard/netperf.git;branch=master;protocol=ht
            file://0001-netlib.c-Move-including-sched.h-out-og-function.patch \
            file://0001-nettest_omni-Remove-duplicate-variable-definitions.patch \
            file://netserver_permissions.patch \
+           file://0001-Makefile.am-add-ACLOCAL_AMFLAGS.patch \
            "
 
 SRCREV = "3bc455b23f901dae377ca0a558e1e32aa56b31c4"
@@ -35,12 +36,6 @@ PACKAGECONFIG[sctp] = "--enable-sctp,--disable-sctp,lksctp-tools,"
 PACKAGECONFIG[intervals] = "--enable-intervals,--disable-intervals,,"
 PACKAGECONFIG[histogram] = "--enable-histogram,--disable-histogram,,"
 
-# autotools.bbclass attends to include m4 files with path depth <= 2 by
-# "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
-do_configure:prepend() {
-    test -d ${S}/m4/m4 && mv -f ${S}/m4/m4 ${S}/m4-files
-}
-
 do_install() {
     sed -e 's#/usr/sbin/#${sbindir}/#g' -i ${UNPACKDIR}/init
     install -d ${D}${sbindir} ${D}${bindir} ${D}${sysconfdir}/init.d ${D}${systemd_system_unitdir}
-- 
2.39.5


