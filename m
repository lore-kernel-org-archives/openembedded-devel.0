Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE3DC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 18:13:15 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.28764.1736964791412302152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 10:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=aiWtll6U;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202501151813088175db959de4727198-fmprbp@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202501151813088175db959de4727198
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 15 Jan 2025 19:13:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=BTPNn40HKl9H4XTfxUDB8zGuby55l5+QsYSIqHhfthg=;
 b=aiWtll6U6WkOIf2Ii3YRiJarTcukqhEvVoozuuiLDzMVKVw8QlBiHjMsjcgLqcNP+V+QPA
 izvaZTwBcUqeP1g+Vy1Qy3NG4KJ/+Dvi2pe+wA8XfDQ19BFZqz8VnhQb4ya5QzxN9DhTZslW
 YV7+pLNuhJE+2Ce+FYkZOCC15hqbaZJrESx0gVtfifC/rxNqfxcnb1+4yAbBnr8IJbUWmILt
 ZyDAVlcuvf7JDMR4iX4Lmu+5/83zuwYRRpcXPk3i4MSetFiBZ0Rga/m/dHV1to26kJOUmiik
 DpBXQZ8cOH7xcJ1B2eZY9ge1LDfwz58YojCLoqFiapE055lawwm8GjIQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 2/3] proftpd: upgrade 1.3.8b -> 1.3.8c
Date: Wed, 15 Jan 2025 19:12:00 +0100
Message-Id: <20250115181201.438102-3-peter.marko@siemens.com>
In-Reply-To: <20250115181201.438102-1-peter.marko@siemens.com>
References: <20250115181201.438102-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114901

From: Peter Marko <peter.marko@siemens.com>

See https://github.com/proftpd/proftpd/blob/1.3.8/RELEASE_NOTES

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../proftpd/files/build_fixup.patch           | 20 +++++++++----------
 .../proftpd/files/contrib.patch               |  8 ++++----
 .../{proftpd_1.3.8b.bb => proftpd_1.3.8c.bb}  |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.8b.bb => proftpd_1.3.8c.bb} (99%)

diff --git a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
index 8126b3619a..2b01d3a682 100644
--- a/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/build_fixup.patch
@@ -30,7 +30,7 @@ diff --git a/Makefile.in b/Makefile.in
 index 9434cbd..13f2e16 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -123,7 +123,6 @@ check: proftpd$(EXEEXT)
+@@ -129,7 +129,6 @@ check: proftpd$(EXEEXT)
  $(DESTDIR)$(localedir) $(DESTDIR)$(includedir) $(DESTDIR)$(includedir)/proftpd $(DESTDIR)$(libdir) $(DESTDIR)$(pkgconfigdir) $(DESTDIR)$(libdir)/proftpd $(DESTDIR)$(libexecdir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(sysconfdir) $(DESTDIR)$(bindir) $(DESTDIR)$(sbindir) $(DESTDIR)$(mandir) $(DESTDIR)$(mandir)/man1 $(DESTDIR)$(mandir)/man5 $(DESTDIR)$(mandir)/man8:
  	@if [ ! -d $@ ]; then \
  		mkdir -p $@; \
@@ -38,18 +38,18 @@ index 9434cbd..13f2e16 100644
  		chmod 0755 $@; \
  	fi
  
-@@ -133,7 +132,6 @@ install-proftpd: proftpd$(EXEEXT) $(DESTDIR)$(includedir) $(DESTDIR)$(localstate
+@@ -139,7 +138,6 @@ install-proftpd: $(DESTDIR)$(includedir) $(DESTDIR)$(localstatedir) $(DESTDIR)$(
  		rm -f $(DESTDIR)$(sbindir)/in.proftpd ; \
  	fi
-	ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
+ 	ln -s $(top_builddir)/proftpd $(DESTDIR)$(sbindir)/in.proftpd
 -	-chown -h $(INSTALL_USER):$(INSTALL_GROUP) $(DESTDIR)$(sbindir)/in.proftpd
  
  install-libs: $(DESTDIR)$(libdir)/proftpd
  	cd lib/ && $(MAKE) install
-@@ -170,11 +168,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
-	$(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ftpshut
-	$(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftptop
-	$(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftpwho
+@@ -177,11 +175,11 @@ install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
+ 	$(INSTALL_SBIN) $(top_builddir)/ftpshut  $(DESTDIR)$(sbindir)/ftpshut
+ 	$(INSTALL_BIN)  $(top_builddir)/ftptop   $(DESTDIR)$(bindir)/ftptop
+ 	$(INSTALL_BIN)  $(top_builddir)/ftpwho   $(DESTDIR)$(bindir)/ftpwho
 -	$(INSTALL) -o $(INSTALL_USER) -g $(INSTALL_GROUP) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
 +	$(INSTALL) -m 0755 $(top_builddir)/src/prxs $(DESTDIR)$(bindir)/prxs
  
@@ -64,7 +64,7 @@ diff --git a/configure b/configure
 index 0a51670..69fa130 100755
 --- a/configure
 +++ b/configure
-@@ -25116,7 +25116,7 @@ _ACEOF
+@@ -25683,7 +25683,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -73,7 +73,7 @@ index 0a51670..69fa130 100755
  _ACEOF
  
  
-@@ -25126,7 +25126,7 @@ _ACEOF
+@@ -25693,7 +25693,7 @@ _ACEOF
  
  
  cat >>confdefs.h <<_ACEOF
@@ -86,7 +86,7 @@ diff --git a/configure.in b/configure.in
 index 50561de..93cad3f 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -4059,8 +4059,8 @@ locale_dir="`eval echo ${locale_dir}`"
+@@ -4248,8 +4248,8 @@ locale_dir="`eval echo ${locale_dir}`"
  AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`", [Define the locale directory])
  
  AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`", [Define the run directory])
diff --git a/meta-networking/recipes-daemons/proftpd/files/contrib.patch b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
index 96c237d386..53f7b89556 100644
--- a/meta-networking/recipes-daemons/proftpd/files/contrib.patch
+++ b/meta-networking/recipes-daemons/proftpd/files/contrib.patch
@@ -14,15 +14,15 @@ diff --git a/Makefile.in b/Makefile.in
 index 9434cbd..8da7d1f 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -163,7 +163,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
+@@ -170,7 +170,7 @@ install-modules: $(DESTDIR)$(libexecdir) $(DESTDIR)$(sysconfdir)
  	test -z "$(SHARED_MODULE_OBJS)" -a -z "$(SHARED_MODULE_DIRS)" -a -z "$(STATIC_MODULE_DIRS)" || (cd modules/ && $(MAKE) install)
  
  install-utils: $(DESTDIR)$(sbindir) $(DESTDIR)$(bindir)
 -	cd contrib/ && $(MAKE) install-utils
 +	cd contrib/ && $(MAKE) DESTDIR=${DESTDIR} install-utils
-	$(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftpcount
-	$(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
-	$(INSTALL_SBIN) $(top_builddir)/ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
+ 	$(INSTALL_BIN)  $(top_builddir)/ftpcount $(DESTDIR)$(bindir)/ftpcount
+ 	$(INSTALL_BIN)  $(top_builddir)/ftpdctl  $(DESTDIR)$(bindir)/ftpdctl
+ 	$(INSTALL_SBIN) $(top_builddir)/ftpscrub $(DESTDIR)$(sbindir)/ftpscrub
 diff --git a/contrib/Makefile.in b/contrib/Makefile.in
 index d1a31af..65d2abc 100644
 --- a/contrib/Makefile.in
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
similarity index 99%
rename from meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
rename to meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
index 0e8942e977..ece5e14109 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-SRCREV = "0a7ea9b0ba9fcdf368374a226370d08f10397d99"
+SRCREV = "30eef4d42d9efbc4aafada28130abca993af99a2"
 BRANCH = "1.3.8"
 
 SRC_URI = "git://github.com/proftpd/proftpd.git;branch=${BRANCH};protocol=https \
-- 
2.30.2


