Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5FCC433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 18:06:24 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.22148.1635617184383124669
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=feG55CqO;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso9657325pjt.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 11:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGdN6L2J99hcx5TpLuRuCYPCas94fihEfI4ktt3vRo4=;
        b=feG55CqONDyVO2U5J4xDYGuMtKx3FQqSuEqSzSZ/YgYG4+EbL7sbDq8AmCiyXt0ww+
         rBQg5g+rmoLLjW5u92UG+1G33BYhEzVN7EIO6FS/YU8oDoExJnNSlZF/wZeoQnUbCpYE
         SUJe3fEq/JD0c7/KuvbThUPEgt/33C576ggcZ9ayOuTJmJ39O2Aql979vWm2nGOJwXGI
         HGsT/6YOaRBZUay1v8kfpl1Nrg7cZNWqPyLt7Th9XAokKpcOTtUNOuGP0x+Hl+RqdyIv
         5ez5HQ/a1JIBG+AJat0nbFJT+zRCdPVIsm97MNAZVNt98YpIZ3v6y5lcHjmA8T1mYjAw
         aZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGdN6L2J99hcx5TpLuRuCYPCas94fihEfI4ktt3vRo4=;
        b=FGe7R3i+3imgjad7n1mnzgLJPEAl83MVCazKsWcKg8CVq/jiJHh/YiJPyFN93SwpEh
         Cysxc6OWN3BpWmvDxgY8PQcWE1Ce9G2K+s95lsPT7Pf6pC4zD71THlIvNnN9yq39xQyK
         FNpPEGDd9/6W0xNl9s9Fq6bNT6wOiqwmv56vC85713tUZupBeLARCTarGAdfWrjlv5lE
         Rn9ziM/BZnoBXTahScgqycRvYo0JUsXY6K6hnNTLhT/NdYuZcrzwAPbSZPsWfro6KPFs
         Yso/sTHLBPk0NQG7QZNNwzXnuifyJkABwxYQfufkvKb5kG/rkzH9Dn4XW2ZmYFhNgSqz
         +CFQ==
X-Gm-Message-State: AOAM532Fa3ZThfEzUdAD8Cu24Tnd36pDRLYXuOlnTxBQRg2hU02IbOPk
	hMZVWV2gXQfvA/slM+zbMpzrnMxu90c=
X-Google-Smtp-Source: 
 ABdhPJw/o3LHYiepCFcrTy/7M/U2JT9yCmVuY5vWQqTpU4Fa/k28vLdjueiGqp1vW45CxQOB/EchDg==
X-Received: by 2002:a17:902:d885:b0:141:b4ca:7c80 with SMTP id
 b5-20020a170902d88500b00141b4ca7c80mr8537635plz.88.1635617183534;
        Sat, 30 Oct 2021 11:06:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id y6sm217346pfa.70.2021.10.30.11.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 11:06:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/8] iptraf-ng: Upgrade to 1.2.1
Date: Sat, 30 Oct 2021 11:06:15 -0700
Message-Id: <20211030180618.2200698-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211030180618.2200698-1-raj.khem@gmail.com>
References: <20211030180618.2200698-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 18:06:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93676

Add patch to fix cross build
Fix runtime with systemd

Release notes
https://github.com/iptraf-ng/iptraf-ng/releases/tag/v1.2.0
https://github.com/iptraf-ng/iptraf-ng/releases/tag/v1.2.1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-printd-formatting-strings.patch  | 54 ------------------
 .../0001-make-Make-CC-weak-assignment.patch   | 35 ++++++++++++
 .../iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf  |  1 +
 .../iptraf/iptraf-ng/ncurses-config.patch     | 55 +++++++++++--------
 ...{iptraf-ng_1.1.4.bb => iptraf-ng_1.2.1.bb} | 22 ++++++--
 5 files changed, 85 insertions(+), 82 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-make-Make-CC-weak-assignment.patch
 create mode 100644 meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf
 rename meta-oe/recipes-devtools/iptraf/{iptraf-ng_1.1.4.bb => iptraf-ng_1.2.1.bb} (66%)

diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch b/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch
deleted file mode 100644
index 5b9afd9616..0000000000
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-Fix-printd-formatting-strings.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 86b4d398dbb95e2437b70eba3b30e995ec9be505 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 31 Aug 2017 20:47:50 -0700
-Subject: [PATCH] Fix printd formatting strings
-
-Fixes
-error: format string is not a string literal (potentially insecure) [-Werror,-Wformat-security]
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ipfilter.c | 2 +-
- src/othptab.c  | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/ipfilter.c b/src/ipfilter.c
-index eb17ec7..8c76e4c 100644
---- a/src/ipfilter.c
-+++ b/src/ipfilter.c
-@@ -146,7 +146,7 @@ void gethostparams(struct hostparams *data, char *init_saddr, char *init_smask,
- 				snprintf(msgstr, 60,
- 					 "Invalid protocol input at or near token \"%s\"",
- 					 bptr);
--				tui_error(ANYKEY_MSG, msgstr);
-+				tui_error(ANYKEY_MSG, "%s", msgstr);
- 				doagain = 1;
- 			} else
- 				doagain = 0;
-diff --git a/src/othptab.c b/src/othptab.c
-index 142c9c2..fe395c2 100644
---- a/src/othptab.c
-+++ b/src/othptab.c
-@@ -410,7 +410,7 @@ void printothpentry(struct othptable *table, struct othptabent *entry,
- 				break;
- 			}
- 
--			sprintf(scratchpad, rarp_mac_addr);
-+			sprintf(scratchpad, "%s", rarp_mac_addr);
- 			strcat(msgstring, scratchpad);
- 			wattrset(table->othpwin, ARPATTR);
- 			break;
-@@ -485,7 +485,7 @@ void printothpentry(struct othptable *table, struct othptabent *entry,
- 		wattrset(table->othpwin, UNKNIPATTR);
- 		protptr = getprotobynumber(entry->protocol);
- 		if (protptr != NULL) {
--			sprintf(protname, protptr->p_aliases[0]);
-+			sprintf(protname, "%s", protptr->p_aliases[0]);
- 		} else {
- 			sprintf(protname, "IP protocol");
- 			unknown = 1;
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-make-Make-CC-weak-assignment.patch b/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-make-Make-CC-weak-assignment.patch
new file mode 100644
index 0000000000..625989a14a
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/0001-make-Make-CC-weak-assignment.patch
@@ -0,0 +1,35 @@
+From 223de708552b1ab00ac1a119e82e13deed573036 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 30 Oct 2021 10:22:38 -0700
+Subject: [PATCH] make: Make CC weak assignment
+
+This ensures that if environment overrrides it then its respected, this
+helps cross-compiling cases
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/Makefile
++++ b/Makefile
+@@ -25,7 +25,7 @@ ALL_CFLAGS = $(CPPFLAGS) $(CFLAGS) $(IPT
+ ALL_LDFLAGS = $(LDFLAGS)
+ STRIP ?= strip
+ 
+-prefix = $(HOME)
++prefix ?= $(HOME)
+ sbindir_relative = sbin
+ sbindir = $(prefix)/$(sbindir_relative)
+ mandir = $(prefix)/share/man
+@@ -39,7 +39,7 @@ pathsep = :
+ 
+ export prefix bindir sharedir sysconfdir gitwebdir localedir
+ 
+-CC = cc
++CC ?= cc
+ RM = rm -f
+ INSTALL = install
+ RPMBUILD = rpmbuild
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf b/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf
new file mode 100644
index 0000000000..1c79f0d8c3
--- /dev/null
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/iptraf-ng-tmpfiles.conf
@@ -0,0 +1 @@
+d /run/iptraf-ng 0755 root root -
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch b/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch
index 65b92dade2..8704310406 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng/ncurses-config.patch
@@ -2,11 +2,9 @@ Use pkg-config to search for ncurses libraries
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: iptraf-ng-1.1.4/Makefile
-===================================================================
---- iptraf-ng-1.1.4.orig/Makefile
-+++ iptraf-ng-1.1.4/Makefile
-@@ -205,8 +205,8 @@ endif
+--- a/Makefile
++++ b/Makefile
+@@ -201,8 +201,8 @@ endif
  
  ifndef NCURSES_LDFLAGS
  ifdef NEEDS_NCURSES5
@@ -17,7 +15,7 @@ Index: iptraf-ng-1.1.4/Makefile
  	ifndef NO_PANEL
  		NCURSES_LDFLAGS += -lpanel
  	endif
-@@ -215,8 +215,8 @@ endif
+@@ -211,8 +211,8 @@ endif
  
  ifndef NCURSES_LDFLAGS
  ifdef NEEDS_NCURSESW5
@@ -26,9 +24,9 @@ Index: iptraf-ng-1.1.4/Makefile
 +	NCURSES_CFLAGS := $(shell p[k-config ncursesw --cflags 2>/dev/null)
 +	NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
  	ifndef NO_PANEL
- 		NCURSES_LDFLAGS += -lpanel
+ 		NCURSES_LDFLAGS += -lpanelw
  	endif
-@@ -225,8 +225,8 @@ endif
+@@ -221,8 +221,8 @@ endif
  
  ifndef NCURSES_LDFLAGS
  ifdef NEEDS_NCURSES6
@@ -39,7 +37,7 @@ Index: iptraf-ng-1.1.4/Makefile
  	ifndef NO_PANEL
  		NCURSES_LDFLAGS += -lpanel
  	endif
-@@ -235,8 +235,8 @@ endif
+@@ -231,8 +231,8 @@ endif
  
  ifndef NCURSES_LDFLAGS
  ifdef NEEDS_NCURSESW6
@@ -48,34 +46,45 @@ Index: iptraf-ng-1.1.4/Makefile
 +	NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
 +	NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
  	ifndef NO_PANEL
- 		NCURSES_LDFLAGS += -lpanel
+ 		NCURSES_LDFLAGS += -lpanelw
  	endif
-@@ -246,17 +246,17 @@ endif
+@@ -241,27 +241,27 @@ endif
+ 
  # try find ncuses by autodetect
  ifndef NCURSES_LDFLAGS
- 	ifneq ($(shell ncursesw6-config --libs 2>/dev/null),)
+-	ifneq ($(shell ncursesw6-config --libs 2>/dev/null),)
 -		NCURSES_CFLAGS := $(shell ncursesw6-config --cflags 2>/dev/null)
 -		NCURSES_LDFLAGS := $(shell ncursesw6-config --libs 2>/dev/null)
++	ifneq ($(shell pkg-config ncursesw --libs 2>/dev/null),)
++		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
+ 		ifndef NO_PANEL
+ 			NCURSES_LDFLAGS += -lpanelw
+ 		endif
 -	else ifneq ($(shell ncurses6-config --libs 2>/dev/null),)
 -		NCURSES_CFLAGS := $(shell ncurses6-config --cflags 2>/dev/null)
 -		NCURSES_LDFLAGS := $(shell ncurses6-config --libs 2>/dev/null)
++	else ifneq ($(shell pkg-config ncursesw --libs 2>/dev/null),)
++		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
+ 		ifndef NO_PANEL
+ 			NCURSES_LDFLAGS += -lpanel
+ 		endif
 -	else ifneq ($(shell ncursesw5-config --libs 2>/dev/null),)
 -		NCURSES_CFLAGS := $(shell ncursesw5-config --cflags 2>/dev/null)
 -		NCURSES_LDFLAGS := $(shell ncursesw5-config --libs 2>/dev/null)
++	else ifneq ($(shell pkg-config ncursesw --libs 2>/dev/null),)
++		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
++		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
+ 		ifndef NO_PANEL
+ 			NCURSES_LDFLAGS += -lpanelw
+ 		endif
 -	else ifneq ($(shell ncurses5-config --libs 2>/dev/null),)
 -		NCURSES_CFLAGS := $(shell ncurses5-config --cflags 2>/dev/null)
 -		NCURSES_LDFLAGS := $(shell ncurses5-config --libs 2>/dev/null)
-+		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
-+		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
-+	else ifneq ($(shell pkg-config ncurses --libs 2>/dev/null),)
-+		NCURSES_CFLAGS := $(shell pkg-config ncurses --cflags 2>/dev/null)
-+		NCURSES_LDFLAGS := $(shell pkg-config ncurses --libs 2>/dev/null)
 +	else ifneq ($(shell pkg-config ncursesw --libs 2>/dev/null),)
 +		NCURSES_CFLAGS := $(shell pkg-config ncursesw --cflags 2>/dev/null)
 +		NCURSES_LDFLAGS := $(shell pkg-config ncursesw --libs 2>/dev/null)
-+	else ifneq ($(shell pkg-config ncurses --libs 2>/dev/null),)
-+		NCURSES_CFLAGS := $(shell pkg-config ncurses --cflags 2>/dev/null)
-+		NCURSES_LDFLAGS := $(shell pkg-config ncurses --libs 2>/dev/null)
- 	endif
- 
- 	ifneq ($(NCURSES_LDFLAGS),)
+ 		ifndef NO_PANEL
+ 			NCURSES_LDFLAGS += -lpanel
+ 		endif
diff --git a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
similarity index 66%
rename from meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb
rename to meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
index 6b18953b30..115bbf082b 100644
--- a/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.1.4.bb
+++ b/meta-oe/recipes-devtools/iptraf/iptraf-ng_1.2.1.bb
@@ -24,17 +24,29 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e2b3850593b899b1a17594ed4cc4c731"
 DEPENDS = "ncurses"
 
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/iptraf-ng/iptraf-ng-1.1.4.tar.gz/e0f8df3b7baf2b5106709abc4f8c029a/${BP}.tar.gz \
+SRC_URI = "https://src.fedoraproject.org/repo/pkgs/iptraf-ng/v${PV}.tar.gz/sha512/44d36fc92cdbf379f62cb63638663c3ee610225b9c28d60ee55e62e358f398a6b0db281129327b3472e45fb553ee3dd605af09c129f2233f8839ae3dbd799384/v${PV}.tar.gz \
+           file://iptraf-ng-tmpfiles.conf \
            file://ncurses-config.patch \
-           file://0001-Fix-printd-formatting-strings.patch \
+           file://0001-make-Make-CC-weak-assignment.patch \
            "
-SRC_URI[md5sum] = "e0f8df3b7baf2b5106709abc4f8c029a"
-SRC_URI[sha256sum] = "16b9b05bf5d3725d86409b901696639ad46944d02de6def87b1ceae5310dd35c"
+SRC_URI[sha256sum] = "9f5cef584065420dea1ba32c86126aede1fa9bd25b0f8362b0f9fd9754f00870"
 
-inherit autotools-brokensep pkgconfig
+inherit pkgconfig
 
 CFLAGS += "-D_GNU_SOURCE"
 
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+    install -d -m 0755 ${D}${localstatedir}/{log,lib}/iptraf-ng
+    install -D -m 0644 -p ${S}/iptraf-ng-logrotate.conf ${D}${sysconfdir}/logrotate.d/iptraf-ng
+    install -Dm 0644 ${WORKDIR}/iptraf-ng-tmpfiles.conf ${D}${libdir}/tmpfiles.d/iptraf-ng-tmpfiles.conf
+}
+
+FILES:${PN} += "${libdir}/tmpfiles.d"
 PROVIDES = "iptraf"
 RPROVIDES:${PN} += "iptraf"
 RREPLACES:${PN} += "iptraf"
-- 
2.33.1


