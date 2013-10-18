Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id EC02C6C76F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 04:00:34 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id g10so3119781pdj.21
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2013 21:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/ll06yMOT24WZQV/cRk0Ti0j0J8P/pVLuJXriDtZx+U=;
	b=O3rns9Mg22RP6PlTnr3srnzznOEcQ8mAJj+d5RiJUl4L3uEViy4b5jLy6u+g/JO4te
	z2s7b5Xe4DMxTy6WRn/7JC+Fw2KGiZPcVS8WoVE04Lp0WIU+gK994Z1OF6eSlcSfo+Fu
	jelW5S5eNqMG+deyKUUnnQ7cImGSR4PgolCFci7Lksh9K4QSOs48CW1fBXrFAgGVSV6/
	jbP6kF0inbhAP1oAMimqqLQlLed1nfVTEf5kXw5fHEayx0pFsxRloHAAiLdb2fiLPLCc
	L34Idlz8pFy9zEfSWAGnx5vXqecB1ztUZsQT9Sr9TTpVoyvlN0Kzpu3r/+J7hViyBy2a
	JOTg==
X-Received: by 10.68.209.161 with SMTP id mn1mr838924pbc.173.1382068836814;
	Thu, 17 Oct 2013 21:00:36 -0700 (PDT)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	yh1sm101360167pbc.21.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 21:00:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2013 21:00:14 -0700
Message-Id: <1382068814-12984-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-gnome][PATCH] gnumeric: Fix build failure with newer autotools
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
X-List-Received-Date: Fri, 18 Oct 2013 04:00:36 -0000

Backports from upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnumeric/gnumeric/do-not-use-srcdir.patch             | 15 +++++++++++++++
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |  5 ++++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric/do-not-use-srcdir.patch

diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric/do-not-use-srcdir.patch b/meta-gnome/recipes-gnome/gnumeric/gnumeric/do-not-use-srcdir.patch
new file mode 100644
index 0000000..cc81b1f
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric/do-not-use-srcdir.patch
@@ -0,0 +1,15 @@
+Index: gnumeric-1.12.0/test/Makefile.am
+===================================================================
+--- gnumeric-1.12.0.orig/test/Makefile.am	2011-05-17 17:54:24.000000000 -0700
++++ gnumeric-1.12.0/test/Makefile.am	2013-10-17 20:28:19.920618596 -0700
+@@ -25,7 +25,9 @@
+ #
+ # 90xx: Misc stuff.
+ 
+-TESTS = $(sort $(wildcard $(srcdir)/t[0-9][0-9][0-9][0-9]-*.pl))
++TESTS_EXTENSIONS=.pl
++TESTS = @auto_find_tests@
++
+ SUPPS = common.supp commondots.supp gui.supp t8003-valgrind-pdf.supp
+ 
+ import-db:
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 4f40594..041ab3f 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -7,10 +7,13 @@ DESCRIPTION = "Gnumeric spreadsheet for GNOME"
 
 GNOME_COMPRESS_TYPE = "xz"
 
+inherit gnome
+
+SRC_URI += "file://do-not-use-srcdir.patch"
+
 SRC_URI[archive.md5sum] = "3fd87cca95334b5d8ac922989670fe27"
 SRC_URI[archive.sha256sum] = "037b53d909e5d1454b2afda8c4fb1e7838e260343e36d4e36245f4a5d0e04111"
 
-inherit gnome
 
 EXTRA_OECONF=" --without-perl "
 
-- 
1.8.3.2


