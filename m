Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65E047833B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jul 2017 06:49:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O6nhpK003646
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jul 2017 23:49:43 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 23 Jul 2017 23:49:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Jul 2017 14:49:22 +0800
Message-ID: <20170724064922.13560-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] pam-ssh-agent-auth: add new recipe
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
X-List-Received-Date: Mon, 24 Jul 2017 06:49:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

A PAM module which permits authentication via ssh-agent.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../pam/pam-ssh-agent-auth_0.10.3.bb               | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb

diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
new file mode 100644
index 000000000..42b648e8b
--- /dev/null
+++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
@@ -0,0 +1,46 @@
+SUMMARY = "pam-ssh-agent-auth"
+DESCRIPTION = "A PAM module which permits authentication via ssh-agent."
+HOMEPAGE = "http://sourceforge.net/projects/pamsshagentauth/"
+SECTION = "libs"
+LICENSE = "openssl & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.OpenSSL;md5=8ab01146141ded59b75f8ba7811ed05a \
+                    file://OPENSSH_LICENSE;md5=7ae09218173be1643c998a4b71027f9b \
+"
+
+SRC_URI = "http://sourceforge.net/projects/pamsshagentauth/files/pam_ssh_agent_auth/v${PV}/pam_ssh_agent_auth-${PV}.tar.bz2"
+SRC_URI[md5sum] = "8dbe90ab3625e545036333e6f51ccf1d"
+SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f47a763"
+
+DEPENDS += "libpam openssl"
+
+# This gets us ssh-agent, which we are almost certain to want.
+#
+RDEPENDS_${PN} += "openssh-misc"
+
+# Kind of unfortunate to have underscores in the name.
+#
+S = "${WORKDIR}/pam_ssh_agent_auth-${PV}"
+
+inherit autotools-brokensep
+
+# Avoid autoreconf.  Override the --libexec oe_runconf specifies so that
+# the module is put with the other pam modules.  Because it cannot, in general,
+# do a runtime test, configure wants to use rpl_malloc() and rpl_realloc()
+# instead of malloc() and realloc().  We set variables to tell it not to because
+# these functions do not exist.
+#
+do_configure () {
+    oe_runconf --without-openssl-header-check  --libexecdir=${base_libdir}/security \
+               ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
+}
+
+# Link with CC.  Configure cannot figure out the correct AR.
+#
+do_compile () {
+    oe_runmake  LD="${CC}" AR="${AR}"
+}
+
+# This stuff is not any place looked at by default.
+#
+FILES_${PN} += "${base_libdir}/security/pam*"
+FILES_${PN}-dbg += "${base_libdir}/security/.debug"
-- 
2.11.0


