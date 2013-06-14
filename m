Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDC061AD1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 17:21:19 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id k10so525211wiv.17
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jun 2013 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=M6GnnrP+W07hbw71dyzNpWXFlAuhFQ4/k85aZvPsITQ=;
	b=z2juJsI+ILtN558acKLS4hweFPMQLip67EVOQMPpOA8O1Sb+qEN6phO0gjS/HHO72N
	ZSTwSnVesmYHdMQtw0xVt9aPMVMtXSVEZTrUrNt5b9WYMCHc8vSeZkaC8VS4EvLToDZS
	p83eV8OQKaqSTZCcbhcXzZ6ARub68bhWbS8eO5fUwMo5OWCEe9cZoz1pynYkXnY0443p
	vs2l0tpO2mGrqfEGhCPw1T/U+3e/WteUKOC3Cg+GdZkUBr/OIXod/StjuCUkxRZQeogF
	0od2ku5ognMTx6WJJ4b+IHyH7jNL3AQTXTzZF61vv0mURvRUKOSImtZMceoCf/nrduFX
	IlkA==
X-Received: by 10.180.83.9 with SMTP id m9mr1966388wiy.4.1371230479637;
	Fri, 14 Jun 2013 10:21:19 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id b11sm4604047wiv.10.2013.06.14.10.21.18
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 14 Jun 2013 10:21:18 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Jun 2013 18:20:35 +0100
Message-Id: <1371230436-10343-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.3
Subject: [meta-networking][PATCH 1/2] ipsec-tools: updated to 0.8.1
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
X-List-Received-Date: Fri, 14 Jun 2013 17:21:20 -0000

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../ipsec-tools/files/ipsec-tools-install.patch        | 18 ------------------
 .../recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb   |  7 -------
 .../recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb   |  6 ++++++
 3 files changed, 6 insertions(+), 25 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
 delete mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb

diff --git a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch b/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
deleted file mode 100644
index 85035b1..0000000
--- a/meta-networking/recipes-support/ipsec-tools/files/ipsec-tools-install.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Avoid attempting to install vmbuf.h twice
-
-Upstream-Status: Accepted
-
-Taken from pld-linux.org:
-http://cvs.pld-linux.org/cgi-bin/cvsweb.cgi/packages/ipsec-tools/ipsec-tools-install.patch
-
---- ipsec-tools-0.7.2/src/racoon/Makefile.am~	2008-07-23 13:48:40.000000000 +0200
-+++ ipsec-tools-0.7.2/src/racoon/Makefile.am	2009-07-04 01:43:48.148433975 +0200
-@@ -3,7 +3,7 @@
- sbin_PROGRAMS = racoon racoonctl plainrsa-gen
- noinst_PROGRAMS = eaytest
- include_racoon_HEADERS = racoonctl.h var.h vmbuf.h misc.h gcmalloc.h admin.h \
--	schedule.h sockmisc.h vmbuf.h isakmp_var.h isakmp.h isakmp_xauth.h \
-+	schedule.h sockmisc.h isakmp_var.h isakmp.h isakmp_xauth.h \
- 	isakmp_cfg.h isakmp_unity.h ipsec_doi.h evt.h
- lib_LTLIBRARIES = libracoon.la
- 
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
deleted file mode 100644
index 255246e..0000000
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.7.2.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require ipsec-tools.inc
-
-LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
-
-SRC_URI += "file://ipsec-tools-install.patch"
-SRC_URI[ipsec-tools-0.7.2.md5sum] = "72861f005746ee27984b2ee715ecc629"
-SRC_URI[ipsec-tools-0.7.2.sha256sum] = "08722ff6c62de3e042fef337454f03622a79053108d6dcc686c9c854f9f9e031"
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
new file mode 100644
index 0000000..e8178ce
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -0,0 +1,6 @@
+require ipsec-tools.inc
+
+LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
+
+SRC_URI[ipsec-tools-0.8.1.md5sum] = "d38b39f291ba2962387c3232e7335dd8"
+SRC_URI[ipsec-tools-0.8.1.sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
-- 
1.8.3


