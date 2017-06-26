Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f45.google.com (mail-pg0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id C60D877972
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 05:35:02 +0000 (UTC)
Received: by mail-pg0-f45.google.com with SMTP id u62so43540615pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jun 2017 22:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3HDZcs4FCCPH42q/EG7aIILGEeLBWazpcvtmvZa0dlE=;
	b=PMWI4vxZtDoOLc7vSpQozB0rKLTbY43RuPNba1CQ+qJeI+KHGjlXZJn+S5FUZTnSU2
	LgCYqGYfRM/OQDYSF//X3cLB7VAGfFzOig4WeWZ8uYUMDXVes3cfTyldhT1DNQ9TAb9T
	INadKhLJxKg+aD7bw5x6cVhhgWAILa1/oS93iaDx7oyB2R/Be1nUy5UNY8XNkwRw0MEv
	qWa4LrBWy53yrETsGeyaWZp+xFwcWX/LdnajxidqYbmZbPQJGjFsMq4bJ2Vsr1ZNWTOq
	efvjNt2kesZBnYB03MKzQzDJk9QWMw2Dpvga+UHonK34juZsXQ+NjjfOA+JCGwZK4s1Z
	kB2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3HDZcs4FCCPH42q/EG7aIILGEeLBWazpcvtmvZa0dlE=;
	b=JCexcN6MV+ZiX5u8EPheBh/lRssGPKGPi8HMQBWEGyCAzhsZ03hTLcSaSkkllNNtv/
	oZdsFvISdI/OkA0JvTjy3TINkW+Wb5w3tHBIEEHRF7Iet1SUlfdXo2wOqenTn+ADIDYn
	eRClREr/8jQP4KzUhU19jeJYm41V2P9qaXuXgasmLrLIIRDLKHrPAtuHuf9E4+JggrDM
	GkQspzJocjR+hPyv+qVndQZZ4bcAIrRVi7vHRAF4GnzsA6sDsBGdL2zAJ6yMtr8ohASh
	POOSI7iBtBSpgrPSxLcG+m/MYB7e8O384PWv/u50/JAm0Yu0rvm7ncKPBMNmLdMkRjl2
	YJUg==
X-Gm-Message-State: AKS2vOydft0N89FdlbW+rMc9Us6fNxjq0jcn2UtALemqL5cMIU9sJiZx
	Kyryw8mP76723fbw
X-Received: by 10.98.7.11 with SMTP id b11mr20133698pfd.188.1498455303339;
	Sun, 25 Jun 2017 22:35:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	x64sm23932432pfk.20.2017.06.25.22.35.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Jun 2017 22:35:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Jun 2017 22:34:43 -0700
Message-Id: <20170626053446.37959-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170626053446.37959-1-raj.khem@gmail.com>
References: <20170626053446.37959-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] gpm: Use sigemptyset() API for glibc as well
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
X-List-Received-Date: Mon, 26 Jun 2017 05:35:03 -0000

glibc has removed __sigemptyset

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-sigemptyset-API-instead-of-__sigemptyset.patch | 34 ++++++++++++++++++++++
 meta-oe/recipes-support/gpm/gpm_git.bb             |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch

diff --git a/meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch b/meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch
new file mode 100644
index 000000000..a9198166a
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm/0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch
@@ -0,0 +1,34 @@
+From 52e6cf052b1f938fcca1bc24d578fe0bfd972988 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 25 Jun 2017 07:25:33 -0700
+Subject: [PATCH] Use sigemptyset API instead of __sigemptyset
+
+__sigemptyset has been removed from glibc public
+API headers in upcoming (2.26) release onwards
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/prog/gpm-root.y | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/prog/gpm-root.y b/src/prog/gpm-root.y
+index 5126c65..76c896c 100644
+--- a/src/prog/gpm-root.y
++++ b/src/prog/gpm-root.y
+@@ -1196,11 +1196,7 @@ int main(int argc, char **argv)
+                                                         LOG_DAEMON : LOG_USER);
+    /* reap your zombies */
+    childaction.sa_handler=reap_children;
+-#if defined(__GLIBC__)
+-   __sigemptyset(&childaction.sa_mask);
+-#else /* __GLIBC__ */
+    sigemptyset(&childaction.sa_mask);
+-#endif /* __GLIBC__ */
+    childaction.sa_flags=0;
+    sigaction(SIGCHLD,&childaction,NULL);
+ 
+-- 
+2.13.1
+
diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 69f12d9b8..51c4dd639 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -12,10 +12,12 @@ SRCREV = "1fd19417b8a4dd9945347e98dfa97e4cfd798d77"
 DEPENDS = "ncurses"
 
 SRC_URI = "git://github.com/telmich/gpm;protocol=git \
+           file://init \
            file://no-docs.patch \
            file://processcreds.patch \
            file://gpm.service.in \
-           file://init"
+           file://0001-Use-sigemptyset-API-instead-of-__sigemptyset.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.13.1


