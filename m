Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.55393.1585587479254708641
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2020 09:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=oTGbrLIa;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 441B3600BB;
	Mon, 30 Mar 2020 18:57:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585587476;
	bh=ehvgtH/3LfMmco/wyiZEor80d/aQ5h9Fc+PJ/7/8goI=;
	h=From:To:Cc:Subject:Date:From;
	b=oTGbrLIaVZKuwr1RFRnPQjSiebUEp99Zh8b++HKELvM0Ph7+AtDSb/5YKpBJkEwvm
	 u68d2ilNL8y4IVXwRsLOf18ZYfqAoMwPxzeZ9wJtqYr91LJers9yU9/DT7fFKjLxL0
	 pnXVdnjANHyaEU2Tfeba9VuM5UEqO46ojgKrDfhvtEexOLTY9YTPRbQh4lwNJeft5n
	 Nv146+4Q7GTEaa4KDzjH6rmBwWJxySjZ0R8Wk9lCLjJ6qP8tlzLRMBBfiXWemcOpvq
	 Ct+V/Gi5nBveVmubTb4oQIp2uC/S8Kb24dzt23ky/4wCgrjAKDd9uKZ1QultiBWubi
	 56RtCE3WWuzeQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH] iwd: upgrade 1.5 -> 1.6
Date: Mon, 30 Mar 2020 18:57:15 +0200
Message-Id: <1585587435-8840-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

This includes the following changes:

ver 1.6:
	Fix issue with handling missing AP stop events.
	Fix issue with handling out-of-order disconnect events.
	Fix issue with handling missing auth/assoc support.
	Fix issue with handling omitted EAP-TLS-CACert.
	Fix issue with handling OWE PTK derivation.
	Add support for internal frame exchange API.
	Add support for MAC randomization and override.
	Add support for per-network MAC addresses.

Also remove patch applied upstream

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...-Avoid-redirection-of-input-and-output-fi.patch | 38 ----------------------
 .../iwd/{iwd_1.5.bb => iwd_1.6.bb}                 |  6 ++--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.5.bb => iwd_1.6.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
deleted file mode 100644
index 80126a8..0000000
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 46fc0e197598579dc05e42f137e84f86a9b926e9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 4 Nov 2019 16:38:04 -0800
-Subject: [PATCH] Makefile.am: Avoid redirection of input and output files
-
-Ensure that directory is created before its written to
-
-This can cause a build race in a highly parallelised build where a directory is not yet created but
-output file is being written using redirection e.g.
-
-rst2man.py --strict --no-raw --no-generator --no-datestamp < ../git/monitor/iwmon.rst > monitor/iwmon.1
-/bin/sh: monitor/iwmon.1: No such file or directory
-make[1]: *** [Makefile:3544: monitor/iwmon.1] Error 1
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- Makefile.am | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8c69d9f4..35a25fc0 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -629,8 +629,9 @@ SED_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
- 		< $< > $@
- 
- if RUN_RST2MAN
--RST2MAN_PROCESS = $(AM_V_GEN)$(RST2MAN) --strict --no-raw --no-generator \
--			--no-datestamp $< $@
-+RST2MAN_PROCESS = $(AM_V_GEN)$(MKDIR_P) $(dir $@) && \
-+			$(AM_V_GEN)$(RST2MAN) --strict --no-raw \
-+			--no-generator --no-datestamp $< $@
- else
- RST2MAN_PROCESS = $(AM_V_GEN)test -f $@ || \
- 		{ echo "Generated manual page $@ does not exist"; false; }
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.5.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.5.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
index 4d4c699..10ac03e 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.5.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.6.bb
@@ -5,10 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "ell"
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
-           file://0001-Makefile.am-Avoid-redirection-of-input-and-output-fi.patch \
-           "
-SRCREV = "1ee7b985aaa294447d073bfe1242744784278a8e"
+SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
+SRCREV = "ad97f4f945b828425ff288e905523e11b330d41d"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.7.4

