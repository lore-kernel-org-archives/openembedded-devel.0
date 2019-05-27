Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF907D69E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 14:22:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t1so9206347pgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 May 2019 07:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=G+3cw8oGdbSJ1CU/J0PBbfexYeT0JJSxSNRkCYxt9M4=;
	b=gUvIIaEtSJTzUJj2UXaoo8CyNMdlmqvmvH/ihtXroOurSsACN0mzZ8ixBG+V9o3YgO
	jXncCbLTZ6B2G3WYrEpig53nxX6rG+aK61YNsQnL8vRFd29kRUvsxN6cs4Uz9U9hWsxn
	erYlXgskioByohLjQmodL9+bWkbSmYWbxU3ujB97eUIgHKBi1aqHMeSQvC2kSmWHqkXT
	ijuqaELSQN03ZbEaQhXlgQR30XipJSWS+NwIjMTE6zUoQ2miNzhL4MYbvFfNUoxWOTVm
	uS92cCPGx67GHHHAVmt/BpEm25St/oFeT4SCgbKqXHXgIMHXo7Akb9UlNzysGh8Pinmv
	g+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=G+3cw8oGdbSJ1CU/J0PBbfexYeT0JJSxSNRkCYxt9M4=;
	b=rRpk7e65/b8oDsnfRBY+NRTqpscSgMhU9zRfpOOCZcc3lO46gd9nrKZE6xSiHbdraB
	+4D0cDOlB10LxEdaL3zf3YroM4oYDHKOcsXVsIQDCb8RKBGrpAK8hEph8RZ7mwtPyf+I
	RWXU98cZgbYH78e4YDvxmymatoFvHNcOOybmQYVzWfvowoqSMHX2VdAq1LCS2b0IEZnH
	mmYxvluOOGwQaWSQiGAjz3E6rk0dp1QfM3ajAWSBF4YLQC1eFyhrjZuLPfaAqbiFGl+Z
	qQbCctR20Z7hcrA71aAUAJqF0MRau7ysMDoEPJr2ECi4cqBJ0ja/hTko9koRUh+z5Hjt
	Lx+Q==
X-Gm-Message-State: APjAAAXwJEyTZlUGDPPPciMcaUcm7qNQ6PmTfXpwXfHgmH/K9NQDMYRI
	qYG3HFPg22rulrnQlGecnYd+Q0qj
X-Google-Smtp-Source: APXvYqyPdJQebfyRrBrbdX48fm/a+bx7GoTELyl5RODb4cWCsfpUze15OkPr9M+4oUgOx696rUPIyg==
X-Received: by 2002:a62:d244:: with SMTP id c65mr99476118pfg.173.1558966924476;
	Mon, 27 May 2019 07:22:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:6833:552f:fefb:d39])
	by smtp.gmail.com with ESMTPSA id
	11sm16902190pfu.155.2019.05.27.07.22.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 27 May 2019 07:22:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 May 2019 07:21:58 -0700
Message-Id: <eb7e2899a1dfbb3c6863816f57025cc57c28219f.1558966857.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558966857.git.akuster808@gmail.com>
References: <cover.1558966857.git.akuster808@gmail.com>
Subject: [thud 2/3] netkit-rsh: security fixes
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
X-List-Received-Date: Mon, 27 May 2019 14:22:03 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Fix CVE-2019-7282, CVE-2019-7283

References:
https://nvd.nist.gov/vuln/detail/CVE-2019-7282
https://nvd.nist.gov/vuln/detail/CVE-2019-7283

Patch from:
https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../CVE-2019-7282-and-CVE-2019-7283.patch          | 33 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
new file mode 100644
index 0000000..4381f5b
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/CVE-2019-7282-and-CVE-2019-7283.patch
@@ -0,0 +1,33 @@
+From a7831a16c3e0e1463d5eb08a58af152cb75ca976 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Mon, 15 Apr 2019 06:05:58 +0000
+Subject: [PATCH] Fix CVE-2019-7282 and CVE-2019-7283
+
+Description: Fix CVE-2018-20685 and CVE-2019-6111
+Bug-Debian: https://bugs.debian.org/920486
+Origin: https://github.com/openssh/openssh-portable/commit/6010c0303a422a9c5fa8860c061bf7105eb7f8b2#diff-9f340c228413d5a9a9206ea2ed2bc624R1114
+
+Upstream-Status: Backport [Debian]
+[https://sources.debian.org/src/netkit-rsh/0.17-20/debian/patches/fix-CVE-2018-20685-and-CVE-2019-6111.patch]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ rcp/rcp.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/rcp/rcp.c b/rcp/rcp.c
+index ca61c18..77d8ff8 100644
+--- a/rcp/rcp.c
++++ b/rcp/rcp.c
+@@ -740,6 +740,11 @@ sink(int argc, char *argv[])
+ 			size = size * 10 + (*cp++ - '0');
+ 		if (*cp++ != ' ')
+ 			SCREWUP("size not delimited");
++		if (*cp == '\0' || strchr(cp, '/') != NULL ||
++		    strcmp(cp, ".") == 0 || strcmp(cp, "..") == 0) {
++			error("error: unexpected filename: %s", cp);
++			exit(1);
++		}
+ 		if (targisdir) {
+ 			static char *namebuf;
+ 			static int cursize;
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index d034cd8..6f203c5 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -16,6 +16,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=
             file://netkit-rsh-0.17-rexec-ipv6.patch \
             file://fix-host-variable.patch \
             file://fixup_wait3_api_change.patch \
+            file://CVE-2019-7282-and-CVE-2019-7283.patch \
 "
 
 SRC_URI[archive.md5sum] = "65f5f28e2fe22d9ad8b17bb9a10df096"
-- 
2.7.4


