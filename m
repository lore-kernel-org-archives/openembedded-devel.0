Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3Y-0001fo-FR
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:20 +0200
Received: by mail-wi0-f177.google.com with SMTP id hm14so2039672wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=cU07/ky3nz4CwYtO3+/MxMwNdgXDgo8q2cg/JFJrsJc=;
	b=hwJAOLBEEs/9r1T+uKtGL/kLEY8JOOt61fnj47QAVmm2ZVbOeuFiRqCLRZ4FzK3Ytd
	2iJiLM3Nho2zqEI7/XSKDuFxHnCr5oYVRCDlA+0fazA8Vc2T+VLBEd9bUTNl7pTdx/wS
	uIY+oKaWvwXjgBmGsvFRraXZ9CRShd0EjDgFNHgi5NG6mEZK6ZnWV5d6RjX/VmquMr1W
	3qAEYo9UK6KYCq9r/nBnVzNFrX62kwR9EdcJYO/bcgUZmVvTfvT/ZKu4ydyFyVIGBxPw
	4oTXwZV3MPr8DbFkCYjfeEfNUMkh9m5Ecju7qYMwskko5kDP09LX/nNDmqbOR1X1MYkU
	C+vQ==
Received: by 10.216.27.200 with SMTP id e50mr1021021wea.23.1339364510054;
	Sun, 10 Jun 2012 14:41:50 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:45 +0200
Message-Id: <1339364820-2880-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 12/27] elsa: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-efl/recipes-efl/efl/elsa_svn.bb               |    9 +--------
 .../recipes-efl/efl/elsa/xserver-nodm.service      |    0
 .../meta-efl/recipes-efl/efl/elsa_svn.bbappend     |   13 +++++++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)
 rename {meta-efl => meta-systemd/meta-efl}/recipes-efl/efl/elsa/xserver-nodm.service (100%)
 create mode 100644 meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend

diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bb b/meta-efl/recipes-efl/efl/elsa_svn.bb
index b8a4f63..e781ce2 100644
--- a/meta-efl/recipes-efl/efl/elsa_svn.bb
+++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
@@ -4,12 +4,11 @@ LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "e/apps"
 
-PR = "r1"
+PR = "r2"
 
 inherit e gettext
 SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};proto=http;scmdata=keep \
   file://0001-pam-use-common-auth-instead-of-system-auth.patch \
-  file://xserver-nodm.service \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
@@ -18,13 +17,7 @@ EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@base_contains
 PV = "0.0.4+svnr${SRCPV}"
 SRCREV = "${EFL_SRCREV}"
 
-inherit systemd
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "xserver-nodm.service"
-
 RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
 CONFFILES_${PN} += "${sysconfdir}/elsa.conf"
 RCONFLICTS_${PN} += "xserver-nodm-init"
 RREPLACES_${PN} += "xserver-nodm-init"
-RCONFLICTS_${PN}-systemd += "xserver-nodm-init-systemd"
-RREPLACES_${PN}-systemd += "xserver-nodm-init-systemd"
diff --git a/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service b/meta-systemd/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
similarity index 100%
rename from meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
rename to meta-systemd/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
diff --git a/meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend
new file mode 100644
index 0000000..871f687
--- /dev/null
+++ b/meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += "file://xserver-nodm.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "xserver-nodm.service"
+
+RCONFLICTS_${PN}-systemd += "xserver-nodm-init-systemd"
+RREPLACES_${PN}-systemd += "xserver-nodm-init-systemd"
-- 
1.7.4.4



