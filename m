Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58269C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 14:26:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.15156.1706711214418113846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Jan 2024 06:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=HybarOlb;
 spf=pass (domain: smile.fr, ip: 209.85.167.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso6542647e87.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 06:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706711212; x=1707316012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O6T1LHA7ZgWhYat7ryB5EjaEl3V4tx8PVxQv5HekiE4=;
        b=HybarOlbMxMGnBmlH4+9CAtkOC4uMhppGPZMe+r/Lt4P94V/fY3LAmkeHOxptr4Scc
         McWdBs1VpuTq2u9kfyLNvETlSRxXvZypZfvNVV5/4Ag9yZTOTvlZrmrTOuX6mHSGAbyg
         +C63SfC4EEP7Hl947DUH+Q/ve0A3qq8qEzZKqTm0anpEsuL4mRd5ML/nVXRL2bJDICRP
         1UF74pW+X0C0LuAKzpKXSTRYJIFYl+GM9Z4kDBxN43k3BpJdQjP7w4SJ4sTpuwvba7TB
         oKwImqh3LfjKUpjUE5EnxQXfgs+6EHhOtUb3fX4rfko+hX4+PE11wX292R74kc+Ojhbx
         OA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706711212; x=1707316012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O6T1LHA7ZgWhYat7ryB5EjaEl3V4tx8PVxQv5HekiE4=;
        b=nKwhQ8DSKOSbEQlXsQxA0yhXrGMkIZLiToiv+qMw5vilKeVcm35StTSYg1+yqZiRIh
         Lv6Rn1rf3VHwK4K/QL8m1cOoeo6TDNmonEKeGFcySnJKoU/2AtXpPbqiO09E4bRpj0Sb
         KLoy1V9u/UryIQZ3GPmCOWdIpi9R+Tb7cuntOOE1M98+n72qzT0rn/yU2ajSASJe9SRG
         WYNmcrk5m8dWPSa1vwfDEJYO+Zy+B6sn+6hE6/qlduvzmMN7xBvhTl+9I7IoTMPu3cjg
         BDpsPUgsGR5qGoGeIyQ2diXqAtoM+WZuBflGFwLz2Hir1oARsRQO95YeU67PuKCt7EwO
         GSPw==
X-Gm-Message-State: AOJu0YwUHRRf236ysZ2nysUc2yHJuxS70JvaKlqN+J72ptL/KnjTk4Kn
	zkVMd/ANNbqZTVygpWrIPW3TWlSADao6tGeY21bxqkzOKEEyCDu6AtL3T17JsFXaTP0DAfhQEuR
	tOno=
X-Google-Smtp-Source: AGHT+IErXpKbgaqmkS+G+HUtCGfotnzY2wTLyrc6dpjAvjyb2shzbe1FnUZh4a+L9Yw/tP+HeeePIg==
X-Received: by 2002:ac2:58ea:0:b0:510:d7e:4cbe with SMTP id v10-20020ac258ea000000b005100d7e4cbemr1450588lfo.63.1706711211794;
        Wed, 31 Jan 2024 06:26:51 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ex8-20020a056000248800b0033af81d6dc8sm5000851wrb.87.2024.01.31.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 06:26:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-gnome][PATCH] ibus: backport a reproducibility fix
Date: Wed, 31 Jan 2024 15:26:24 +0100
Message-Id: <20240131142624.1239856-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Jan 2024 14:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108507

This backport fix the ibus-doc reproducibility issue.
The problem: manpages are compressed with gzip with a non-reproducible
timestamp in the header.
The backported fix: do not compress the manpages.

Note: This backported patch is included in version >= 1.5.29 and can be
dropped after upgrading.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-gnome/recipes-support/ibus/ibus.inc      |   1 +
 ...01-makefile-don-t-gzip-the-man-pages.patch | 164 ++++++++++++++++++
 2 files changed, 165 insertions(+)
 create mode 100644 meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch

diff --git a/meta-gnome/recipes-support/ibus/ibus.inc b/meta-gnome/recipes-support/ibus/ibus.inc
index 9579404b3..9d0600c79 100644
--- a/meta-gnome/recipes-support/ibus/ibus.inc
+++ b/meta-gnome/recipes-support/ibus/ibus.inc
@@ -12,6 +12,7 @@ DEPENDS = "unicode-ucd"
 SRC_URI = " \
     git://github.com/ibus/ibus.git;branch=main;protocol=https \
     file://0001-Do-not-try-to-start-dbus-we-do-not-have-dbus-lauch.patch \
+    file://0001-makefile-don-t-gzip-the-man-pages.patch \
 "
 SRCREV = "6a70ab0338206bd1c7d01a4e1874ea0ee5b3a9d3"
 S = "${WORKDIR}/git"
diff --git a/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
new file mode 100644
index 000000000..105e34873
--- /dev/null
+++ b/meta-gnome/recipes-support/ibus/ibus/0001-makefile-don-t-gzip-the-man-pages.patch
@@ -0,0 +1,164 @@
+From 5307c3b310fabeaa52fafe743c5efaca73ccce46 Mon Sep 17 00:00:00 2001
+From: Emil Velikov <emil.l.velikov@gmail.com>
+Date: Sun, 11 Jun 2023 16:16:35 +0900
+Subject: [PATCH] makefile: don't gzip the man pages
+
+Drop the gzip step from the manpages - distributions already do that as
+needed. In addition this resolves the final reproducibility issue with
+ibus.
+
+BUG=https://github.com/ibus/ibus/pull/2514
+
+Upstream-Status: Backport [https://github.com/ibus/ibus/commit/1a25975d9f55f18eab609e4d147dd32689e367f3]
+Note: This commit is included in version >= 1.5.29 and can be dropped
+after upgrading.
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+---
+ bus/Makefile.am        | 6 +-----
+ data/dconf/Makefile.am | 6 +-----
+ setup/Makefile.am      | 6 +-----
+ tools/Makefile.am      | 6 +-----
+ ui/gtk3/Makefile.am    | 6 +-----
+ 5 files changed, 5 insertions(+), 25 deletions(-)
+
+diff --git a/bus/Makefile.am b/bus/Makefile.am
+index e173ee25..d0445d02 100644
+--- a/bus/Makefile.am
++++ b/bus/Makefile.am
+@@ -169,7 +169,6 @@ EXTRA_DIST =                \
+ 
+ CLEANFILES = \
+ 	$(man_one_DATA)            \
+-	$(man_one_files)        \
+ 	$(NULL)
+ 
+ $(libibus):
+@@ -181,14 +180,11 @@ test: ibus-daemon
+ 		$(builddir)/ibus-daemon -v
+ 
+ man_one_in_files = ibus-daemon.1.in
+-man_one_files = $(man_one_in_files:.1.in=.1)
+-man_one_DATA =$(man_one_files:.1=.1.gz) 
++man_one_DATA = $(man_one_in_files:.1.in=.1)
+ man_onedir = $(mandir)/man1
+ %.1: %.1.in
+ 	$(AM_V_GEN) sed \
+ 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
+ 		mv $@.tmp $@
+-%.1.gz: %.1
+-	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
+ 
+ -include $(top_srcdir)/git.mk
+diff --git a/data/dconf/Makefile.am b/data/dconf/Makefile.am
+index 5360f033..2352f770 100644
+--- a/data/dconf/Makefile.am
++++ b/data/dconf/Makefile.am
+@@ -38,15 +38,12 @@ dconfdb_DATA = 00-upstream-settings
+ 		{ rc=$$?; $(RM) -rf $@; exit $$rc; }
+ 
+ man_5_in_files = 00-upstream-settings.5.in ibus.5.in
+-man_5_files = $(man_5_in_files:.5.in=.5)
+-man_5_DATA =$(man_5_files:.5=.5.gz)
++man_5_DATA = $(man_5_in_files:.5.in=.5)
+ man_5dir = $(mandir)/man5
+ %.5: %.5.in
+ 	$(AM_V_GEN) sed \
+ 	    -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
+ 	    mv $@.tmp $@
+-%.5.gz: %.5
+-	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
+ 
+ install-data-hook:
+ 	if test -z "$(DESTDIR)"; then \
+@@ -63,7 +60,6 @@ EXTRA_DIST = \
+ 
+ CLEANFILES = \
+     $(man_5_DATA) \
+-    $(man_5_files) \
+     $(NULL)
+ 
+ MAINTAINERCLEANFILES = \
+diff --git a/setup/Makefile.am b/setup/Makefile.am
+index 34c8f136..b34aa8fc 100644
+--- a/setup/Makefile.am
++++ b/setup/Makefile.am
+@@ -56,20 +56,16 @@ org.freedesktop.IBus.Setup.desktop: ibus-setup.desktop
+ 	$(AM_V_GEN) $(MSGFMT) --desktop --template $< -d $(top_srcdir)/po -o $@
+ 
+ man_one_in_files = ibus-setup.1.in
+-man_one_files = $(man_one_in_files:.1.in=.1)
+-man_one_DATA =$(man_one_files:.1=.1.gz) 
++man_one_DATA = $(man_one_in_files:.1.in=.1)
+ man_onedir = $(mandir)/man1
+ %.1: %.1.in
+ 	$(AM_V_GEN) sed \
+ 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
+ 		mv $@.tmp $@
+-%.1.gz: %.1
+-	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
+ 
+ CLEANFILES = \
+     $(desktop_DATA) \
+     $(man_one_DATA) \
+-    $(man_one_files) \
+     *.pyc \
+     ibus-setup \
+     $(NULL)
+diff --git a/tools/Makefile.am b/tools/Makefile.am
+index 5c18d3d6..1c716136 100644
+--- a/tools/Makefile.am
++++ b/tools/Makefile.am
+@@ -79,15 +79,12 @@ bash_completion_DATA= \
+ bash_completiondir=@datadir@/bash-completion/completions
+ 
+ man_one_in_files = ibus.1.in
+-man_one_files = $(man_one_in_files:.1.in=.1)
+-man_one_DATA =$(man_one_files:.1=.1.gz) 
++man_one_DATA = $(man_one_in_files:.1.in=.1)
+ man_onedir = $(mandir)/man1
+ %.1: %.1.in
+ 	$(AM_V_GEN) sed \
+ 		-e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
+ 		mv $@.tmp $@
+-%.1.gz: %.1
+-	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
+ 
+ EXTRA_DIST = \
+ 	$(man_one_in_files) \
+@@ -96,7 +93,6 @@ EXTRA_DIST = \
+ 
+ CLEANFILES = \
+ 	$(man_one_DATA) \
+-	$(man_one_files) \
+ 	$(NULL)
+ 
+ if ENABLE_EMOJI_DICT
+diff --git a/ui/gtk3/Makefile.am b/ui/gtk3/Makefile.am
+index ab379328..aff035da 100644
+--- a/ui/gtk3/Makefile.am
++++ b/ui/gtk3/Makefile.am
+@@ -242,15 +242,12 @@ panelbinding.o: $(srcdir)/panelbinding.c
+ 
+ MAINTAINERCLEANFILES += extension.c panelbinding.c
+ 
+-man_seven_files = $(man_seven_in_files:.7.in=.7)
+-man_seven_DATA =$(man_seven_files:.7=.7.gz)
++man_seven_DATA = $(man_seven_in_files:.7.in=.7)
+ man_sevendir = $(mandir)/man7
+ %.7: %.7.in
+ 	$(AM_V_GEN) sed \
+ 	    -e 's|@VERSION[@]|$(VERSION)|g' $< > $@.tmp && \
+ 	    mv $@.tmp $@
+-%.7.gz: %.7
+-	$(AM_V_GEN) gzip -c $< > $@.tmp && mv $@.tmp $@
+ 
+ desktop_in_files = \
+     ibus-ui-emojier.desktop.in \
+@@ -278,7 +275,6 @@ CLEANFILES += \
+     $(desktop_DATA) \
+     $(desktop_notrans_files) \
+     $(man_seven_DATA) \
+-    $(man_seven_files) \
+     $(NULL)
+ 
+ endif
-- 
2.39.2


