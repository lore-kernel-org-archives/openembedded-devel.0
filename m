Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08F376FAEB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Mar 2014 17:07:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2014 10:07:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,721,1389772800"; d="scan'208";a="498444645"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2014 10:07:04 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id AF9E76A4083;
	Mon, 24 Mar 2014 10:06:49 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Mar 2014 19:06:55 +0200
Message-Id: <1395680815-22420-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [meta-oe][PATCH] recipes-extended: add recipe for efivar
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
X-List-Received-Date: Mon, 24 Mar 2014 17:08:01 -0000

efivar is is a tool to manipulate UEFI variables.
This is obviously useful only for EFI machines that have
the efivarfs interface enabled in the kernel config (CONFIG_EFIVAR_FS),
and mounted (mount -t efivarfs efivarfs /sys/firmware/efi/efivars).

Sample usage:
GUID: 4a67b082-0a4c-41cf-b6c7-440b29bb8c4f
Name: "LoaderEntrySelected"
Attributes:
    Boot Service Access
    Runtime Service Access
Value:
00000000  62 00 6f 00 6f 00 74 00  00 00                    |b.o.o.t...      |

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta-oe/recipes-extended/efivar/efivar_git.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar_git.bb

diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb b/meta-oe/recipes-extended/efivar/efivar_git.bb
new file mode 100644
index 0000000..2581a49
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Tools to manipulate UEFI variables"
+DESCRIPTION = "efivar provides a simple command line interface to the UEFI variable facility"
+HOMEPAGE = "https://github.com/vathpela/efivar"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "popt"
+
+SRCREV = "c9e1f24a81b5374408bca5616402276e47171cf7"
+PV = "0.7+git${SRCPV}"
+SRC_URI = "git://github.com/vathpela/efivar.git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+        oe_runmake install DESTDIR=${D}
+}
-- 
1.8.5.3


