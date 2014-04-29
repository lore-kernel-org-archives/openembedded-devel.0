Return-Path: <mburtin@connected-labs.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 53A47610CD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 10:06:28 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id q59so2022741wes.37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 03:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=lYi28H2xUwaMr44xfoECxfmvBh0yv8gn8enlU1OcjVE=;
	b=S/KcwlBj4YhLAa2WdhvHfOLAn1H7lpq99zLT2Oe9PsZ/dvHlLwVKzKP2epTMzU5448
	ihm1d4raZNmG87mEJ0w9Rpee8RPb3zWQ46Wam9HrlAVATtJH+u3W/gO6RDnBhe7cYsCD
	8vsO/UMF/5JicOYJkoZXXSuBCEEW/LbutFeOiGhZK5jDbTZkb05gRWZ8qWfgqVWa0hgU
	wd+77BC0PGuVcu1KxFONuV+fUEeKMgsuxbANtHTP0ZpfOpEWtKFs2f7mjxZUNMafCGEU
	Vnv9PcY7T0fpoI8mJbfYW+sY6avVb9R56wIjnWm7FSZAuL+PHyuH4j+jpzhKunH+bCcP
	HvzQ==
X-Gm-Message-State: ALoCoQnSDwGr7Bb0OsAZMxGq6yvK35EZHKtrJrOrsC7QQ0D7pWA9qcwZc3U7l3KtXccvBfik4j5F
X-Received: by 10.180.7.227 with SMTP id m3mr19365555wia.59.1398765989013;
	Tue, 29 Apr 2014 03:06:29 -0700 (PDT)
Received: from mburtin-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id q2sm4029633wix.5.2014.04.29.03.06.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 Apr 2014 03:06:28 -0700 (PDT)
From: =?UTF-8?q?Micha=C3=ABl=20Burtin?= <mburtin@connected-labs.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Apr 2014 12:06:22 +0200
Message-Id: <1398765982-22532-1-git-send-email-mburtin@connected-labs.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-ruby][PATCH] ruby: remove obsolete extmk_run.patch
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Apr 2014 10:06:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch does nothing except causing failures from the second build in
the same working directory.

Signed-off-by: Michaël Burtin <mburtin@connected-labs.com>
---
 meta-ruby/recipes-devtools/ruby/ruby.inc             |  1 -
 meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch | 15 ---------------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch

diff --git a/meta-ruby/recipes-devtools/ruby/ruby.inc b/meta-ruby/recipes-devtools/ruby/ruby.inc
index 837e52b..e679f27 100644
--- a/meta-ruby/recipes-devtools/ruby/ruby.inc
+++ b/meta-ruby/recipes-devtools/ruby/ruby.inc
@@ -21,7 +21,6 @@ INC_PR = "r1"
 
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
 SRC_URI = "http://ftp.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
-           file://extmk_run.patch \
            file://extmk.patch \
 "
 
diff --git a/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch b/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
deleted file mode 100644
index 57926f5..0000000
--- a/meta-ruby/recipes-devtools/ruby/ruby/extmk_run.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-============================================================
---- packages/ruby/ruby-1.8.5/extmk_run.patch	d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
-+++ packages/ruby/ruby-1.8.5/extmk_run.patch	d9738b5a71e2f9a98d009af9fd0ef1ceaff9ef48
-@@ -0,0 +1,11 @@
-+--- ruby-1.8.5/common.mk.orig	2006-12-30 13:07:32.000000000 +1100
-++++ ruby-1.8.5/common.mk	2006-12-30 13:08:32.000000000 +1100
-+@@ -56,7 +56,7 @@
-+ 		--make="$(MAKE)" \
-+ 		--mflags="$(MFLAGS)" \
-+ 		--make-flags="$(MAKEFLAGS)"
-+-EXTMK_ARGS    =	$(SCRIPT_ARGS) --extout="$(EXTOUT)" --extension $(EXTS) --extstatic $(EXTSTATIC) --
-++EXTMK_ARGS    =	$(SCRIPT_ARGS) --with-ldflags="%%TARGET_LDFLAGS%%" --with-cflags="%%TARGET_CFLAGS%%" --extout="$(EXTOUT)" --extension $(EXTS) --extstatic $(EXTSTATIC) --
-+ 
-+ all: $(MKFILES) $(PREP) $(RBCONFIG) $(LIBRUBY)
-+ 	@$(MINIRUBY) $(srcdir)/ext/extmk.rb $(EXTMK_ARGS)
-- 
1.9.1


