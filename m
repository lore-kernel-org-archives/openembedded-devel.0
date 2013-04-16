Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3p1-0006dN-2d
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:13:12 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811911"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:54:03 +0100
Message-Id: <87eea2c03a8d1e0060bdeeaaddc1b0aed3ed4023.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 9/9] atftp: move to meta-networking and tweak
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
X-List-Received-Date: Tue, 16 Apr 2013 11:13:17 -0000

* Add origin and Upstream-Status to patches
* Set SUMMARY instead of DESCRIPTION
* Add ${PN}d to PACKAGES instead of atftpd to be consistent with the
  rest of the recipe

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-daemons}/atftp/atftp/atftpd.service                 |    0
 .../recipes-daemons}/atftp/atftp_git.bb                         |    4 ++--
 .../files/atftpd-0.7_circumvent_tftp_size_restrictions.patch    |    5 +++++
 .../atftp/files/atftpd-0.7_unprotected_assignments_crash.patch  |    7 +++++++
 .../recipes-daemons}/atftp/files/atftpd.init                    |    0
 5 files changed, 14 insertions(+), 2 deletions(-)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/atftp/atftpd.service (100%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/atftp_git.bb (95%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch (98%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch (95%)
 rename {meta-oe/recipes-extended => meta-networking/recipes-daemons}/atftp/files/atftpd.init (100%)

diff --git a/meta-oe/recipes-extended/atftp/atftp/atftpd.service b/meta-networking/recipes-daemons/atftp/atftp/atftpd.service
similarity index 100%
rename from meta-oe/recipes-extended/atftp/atftp/atftpd.service
rename to meta-networking/recipes-daemons/atftp/atftp/atftpd.service
diff --git a/meta-oe/recipes-extended/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
similarity index 95%
rename from meta-oe/recipes-extended/atftp/atftp_git.bb
rename to meta-networking/recipes-daemons/atftp/atftp_git.bb
index 3e55881..09451bc 100644
--- a/meta-oe/recipes-extended/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Advanced TFTP server and client"
+SUMMARY = "Advanced TFTP server and client"
 SECTION = "network"
 HOMEPAGE = "http://packages.debian.org/atftp"
 LICENSE = "GPLv2"
@@ -38,7 +38,7 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/atftpd.service ${D}${systemd_unitdir}/system
 }
 
-PACKAGES =+ "atftpd"
+PACKAGES =+ "${PN}d"
 
 FILES_${PN} = "${bindir}/*"
 
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch b/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
similarity index 98%
rename from meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
rename to meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
index 9aeb351..280b570 100644
--- a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
+++ b/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_circumvent_tftp_size_restrictions.patch
@@ -8,6 +8,11 @@ hardwared BLOCKSIZE setting of 1432).
 block rollover
 http://www.compuphase.com/tftp.htm
 
+Patch originally from OpenSUSE:
+https://build.opensuse.org/package/show?package=atftp&project=openSUSE%3A12.2
+
+Upstream-Status: Pending
+
 Index: git/tftp_def.h
 ===================================================================
 --- git.orig/tftp_def.h	2012-11-19 16:28:50.221027144 -0800
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch b/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
similarity index 95%
rename from meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
rename to meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
index 6faf5f9..28fba6c 100644
--- a/meta-oe/recipes-extended/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
+++ b/meta-networking/recipes-daemons/atftp/files/atftpd-0.7_unprotected_assignments_crash.patch
@@ -1,3 +1,10 @@
+Avoid assigning thread data outside of mutex lock
+
+Patch originally from OpenSUSE:
+https://build.opensuse.org/package/show?package=atftp&project=openSUSE%3A12.2
+
+Upstream-Status: Pending
+
 Index: git/tftpd_list.c
 ===================================================================
 --- git.orig/tftpd_list.c	2012-10-24 21:48:47.000000000 -0700
diff --git a/meta-oe/recipes-extended/atftp/files/atftpd.init b/meta-networking/recipes-daemons/atftp/files/atftpd.init
similarity index 100%
rename from meta-oe/recipes-extended/atftp/files/atftpd.init
rename to meta-networking/recipes-daemons/atftp/files/atftpd.init
-- 
1.7.10.4



