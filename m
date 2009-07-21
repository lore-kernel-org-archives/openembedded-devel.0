Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MTJ38-0007RH-Bl
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 19:22:46 +0200
Received: from [10.175.196.247] (213.66.88.59) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A48C368001B005A for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jul 2009 19:08:41 +0200
Message-ID: <4A65F5D8.6060503@atmel.com>
Date: Tue, 21 Jul 2009 19:07:36 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] Fix native perl so it builds on x64 OpenSuSE 11.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jul 2009 17:22:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The native perl build  fails on my x64  OpenSuSE 11.1 machine.
People suggest that disabling ODBM_File will fix this problem.
It works for me...
Any objections to this fix?


From 4d0290104f3065f82ec513d00eb84afd35cd8ef0 Mon Sep 17 00:00:00 2001
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 21 Jul 2009 19:01:18 +0200
Subject: [PATCH] Disable ODBM_File for native perl-5.8.8, since this
will cause
 the build to fail on x64 OpenSuSE 11.1

---
 recipes/perl/perl-native_5.8.8.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/perl/perl-native_5.8.8.bb
b/recipes/perl/perl-native_5.8.8.bb
index 57e9e1c..bde7638 100644
--- a/recipes/perl/perl-native_5.8.8.bb
+++ b/recipes/perl/perl-native_5.8.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.perl.org/"
 SECTION = "libs"
 LICENSE = "Artistic|GPL"
 DEPENDS = "virtual/db-native gdbm-native"
-PR = "r13"
+PR = "r14"
 
 FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}"
 
@@ -43,6 +43,7 @@ do_configure () {
         -Dusethreads \
         -Duseithreads \
         -Duselargefiles \
+    -Dnoextensions=ODBM_File \
         -Ud_dosuid \
         -Ui_db \
         -Ui_ndbm \
-- 
1.6.0.2

-- 
Best Regards
Ulf Samuelsson




