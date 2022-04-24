Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2875C47081
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.14271.1650769812980967757
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XfJ/iTvE;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id h12so15874023plf.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LdQ0EqP+XjLgxxc/2wClxNbGZ/o+tXdM2koIYfM3eYI=;
        b=XfJ/iTvEgDW+RDyb4wqt0BTHTlZy/Kcyjhqt4CA9TchX2DdMNFVjGeVtJgj56w2jlG
         9s9kKNyqn6dZFbJoiaAeuqwl5mdYUMO5Wba8reDKxx3FrnwFKkd6d4ya1IzQ3RJkQdQc
         k7U51rnRYSZ0fjAiYOWRfmmGQAdMcF+sEYAOdNY46Hcnoe8/dYXNseDwiUDOzp3vSYRi
         88CWy3guuFFYpaS0DMerEUpjuEKZokboI8D1BIIpbezeHNLka1JSWtSvrk5ECnM561XM
         DvPXZmX9ofBX3rH3+WtPRPkUaw3JFYltAajVGvSCYWcMcTkLKwyq3RSFJ8MS5rJy0vb3
         HyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LdQ0EqP+XjLgxxc/2wClxNbGZ/o+tXdM2koIYfM3eYI=;
        b=R0//y66P6e1tfje/lU9UJcugfO9F/dh/xbLzf2gaZNTE3CQKIAt4HZVwbrqyujlR3Y
         7chZHnZcSo5zK5/RNX4MimYC/rPT1fZnhUkdRdvu88k/OLWOXKoPWek7AvwR5UPqJ2Ar
         7GU8HUP43STbrNNNJ4Y+DKXIsAOGdFp3I5frtdno00HtsAcD6yL2IvhaBL/3Ry/l7AxB
         33K1fvBWohkyCA0ZSaVZW66MWLwxeffWYOtOGlqJmIgDDiSkUopQ9pLperBL/kV+uW+Y
         CxcqkFfzgcyn/Qubrigmp+47LEW+i50ECtEEoQqbhsAazDEWqv8zUdqxHdcMzqRJ+duw
         ISGA==
X-Gm-Message-State: AOAM5315d+pOVSEq0gbLTEyJKbgKUUs6kea8yMw0lyGifbRQSVY3U3m9
	IKMw3BseBsv+VIQikgX2dyrwoFyiNrF7nA==
X-Google-Smtp-Source: 
 ABdhPJx75nxhVxShU5DSa9nwNjmT8Uu2D1t84LMehWBJZAbYSO9cmPLjqtsoLrIT+wk5GY89EGehUQ==
X-Received: by 2002:a17:902:b092:b0:156:a40f:f716 with SMTP id
 p18-20020a170902b09200b00156a40ff716mr11907133plr.72.1650769812295;
        Sat, 23 Apr 2022 20:10:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/12] gradm: Upgrade to 3.1-202111052217
Date: Sat, 23 Apr 2022 20:09:59 -0700
Message-Id: <20220424031004.3209576-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96744

Fix build when using usrmerge distro features

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gradm/0001-make-Define-SBINDIR-flag.patch | 69 +++++++++++++++++++
 ...903191516.bb => gradm_3.1-202111052217.bb} |  5 +-
 2 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
 rename meta-oe/recipes-support/gradm/{gradm_3.1-201903191516.bb => gradm_3.1-202111052217.bb} (90%)

diff --git a/meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch b/meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
new file mode 100644
index 0000000000..1c0f3bfbae
--- /dev/null
+++ b/meta-oe/recipes-support/gradm/gradm/0001-make-Define-SBINDIR-flag.patch
@@ -0,0 +1,69 @@
+From 12bc62ac26df012fc143913b6e046a3cf5127db2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Apr 2022 09:20:49 -0700
+Subject: [PATCH] make: Define SBINDIR flag
+
+Provides a facility to control install locations of /sbin elements from
+environment
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index deed94c..9190fe9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -25,6 +25,7 @@ MKNOD=/bin/mknod
+ CC=/usr/bin/gcc
+ FIND=/usr/bin/find
+ LIBS := $(shell if [ "`uname -m`" != "sparc64" -a "`uname -m`" != "x86_64" ]; then echo "-lfl" ; else echo "" ; fi)
++SBINDIR=/sbin
+ OPT_FLAGS := -O2
+ # for older versions of grsecurity, comment the above line and uncomment the below:
+ #OPT_FLAGS := $(shell if [ "`uname -m`" != "sparc64" ] && [ "`uname -m`" != "x86_64" ]; then echo "-O2" ; else echo "-O2 -m64" ; fi)
+@@ -136,15 +137,15 @@ lex.learn_pass1.o: lex.learn_pass1.c learn_pass1.tab.h
+ lex.learn_pass2.o: lex.learn_pass2.c learn_pass2.tab.h
+ 
+ install: $(GRADM_BIN) gradm.8 policy grlearn
+-	@mkdir -p $(DESTDIR)/sbin
++	@mkdir -p $(DESTDIR)$(SBINDIR)
+ 	@echo "Installing gradm..."
+-	@$(INSTALL) -m 0755 $(GRADM_BIN) $(DESTDIR)/sbin
++	@$(INSTALL) -m 0755 $(GRADM_BIN) $(DESTDIR)$(SBINDIR)
+ 	@if [ -f $(GRADM_PAM) ] ; then \
+ 		echo "Installing gradm_pam..." ; \
+-		$(INSTALL) -m 4755 $(GRADM_PAM) $(DESTDIR)/sbin ; \
++		$(INSTALL) -m 4755 $(GRADM_PAM) $(DESTDIR)$(SBINDIR) ; \
+ 	fi
+ 	@echo "Installing grlearn..."
+-	@$(INSTALL) -m 0700 grlearn $(DESTDIR)/sbin
++	@$(INSTALL) -m 0700 grlearn $(DESTDIR)$(SBINDIR)
+ 	@mkdir -p -m 700 $(DESTDIR)$(GRSEC_DIR)
+ 	@if [ ! -f $(DESTDIR)$(GRSEC_DIR)/policy ] ; then \
+ 		if [ -f $(DESTDIR)$(GRSEC_DIR)/acl ] ; then \
+@@ -170,15 +171,15 @@ install: $(GRADM_BIN) gradm.8 policy grlearn
+ 		echo "KERNEL==\"grsec\",          MODE=\"0622\"" >> $(DESTDIR)/etc/udev/rules.d/80-grsec.rules ; \
+ 		echo "LABEL=\"permissions_end\"" >> $(DESTDIR)/etc/udev/rules.d/80-grsec.rules ; \
+ 	fi
+-	@if [ -f $(DESTDIR)/sbin/udevadm ] ; then \
+-		$(DESTDIR)/sbin/udevadm trigger --action=change ; \
++	@if [ -f $(DESTDIR)$(SBINDIR)/udevadm ] ; then \
++		$(DESTDIR)$(SBINDIR)/udevadm trigger --action=change ; \
+ 	fi
+ 	@echo "Installing gradm manpage..."
+ 	@mkdir -p $(DESTDIR)$(MANDIR)/man8
+ 	@$(INSTALL) -m 0644 gradm.8 $(DESTDIR)$(MANDIR)/man8/$(GRADM_BIN).8
+-	@if [ -x /sbin/$(GRADM_BIN) ] ; then \
++	@if [ -x $(SBINDIR)/$(GRADM_BIN) ] ; then \
+ 		if [ -z $(DESTDIR) ] && [ ! -f $(GRSEC_DIR)/pw ] ; then \
+-			/sbin/$(GRADM_BIN) -P ; \
++			$(SBINDIR)/$(GRADM_BIN) -P ; \
+ 		fi \
+ 	fi
+ 	@true
+-- 
+2.36.0
+
diff --git a/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb b/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
similarity index 90%
rename from meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
rename to meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
index 0513f0dca0..c82b529f96 100644
--- a/meta-oe/recipes-support/gradm/gradm_3.1-201903191516.bb
+++ b/meta-oe/recipes-support/gradm/gradm_3.1-202111052217.bb
@@ -14,9 +14,9 @@ DEPENDS = "flex-native bison-native ${@bb.utils.contains('DISTRO_FEATURES', 'pam
 SRC_URI = "http://grsecurity.net/stable/${BP}.tar.gz \
            file://0001-Makefile-remove-strip.patch \
            file://0001-Makefile-Append-instead-of-overriding-LDFLAGS.patch \
+           file://0001-make-Define-SBINDIR-flag.patch \
            "
-SRC_URI[md5sum] = "5099c715433981d5a3eed8ded7c5bbc0"
-SRC_URI[sha256sum] = "d3a0b6383ff97a2054941d71133c737efae66afdd8eef59346c031ae15c75ff3"
+SRC_URI[sha256sum] = "2459290f367a47c8a1ce4ea2ec08359799ea33dc15ed4436439596ce88284fb9"
 
 S = "${WORKDIR}/gradm"
 
@@ -35,6 +35,7 @@ do_compile() {
 do_install() {
     oe_runmake 'CC=${CC}'                               \
                'DESTDIR=${D}'                           \
+               'SBINDIR=${base_sbindir}'                \
                'LIBS='                                  \
                'LLEX=${STAGING_BINDIR_NATIVE}/lex'      \
                'FLEX=${STAGING_BINDIR_NATIVE}/flex'     \
-- 
2.36.0


