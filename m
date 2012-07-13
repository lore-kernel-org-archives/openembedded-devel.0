Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSc-00085u-42
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:52 +0200
Received: by bkcik5 with SMTP id ik5so2247669bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=+9XJVDdXesle169uzCk+6l/0pHJR7KCLcW6+Jc6c+X4=;
	b=P6ieSzTOyf4q2pbhB4tiGJ5NtZBhvM2YG5Kgbbh5t9lux2VzZTmVZmP6gyHeYWx9kk
	h5GN8VPBG8hLRN8NGv5Bb0O4m/l/L7DQ6sgRxos8tAKzyU2zLtXoc/UDyedx+4qA7HGw
	CxvjQzhOY58b73082kFBHlIEqlYrl5iVAbv1xc82EKek4kgUy4E6IPhaAIH3rXWOPzlg
	Rr3o/qkFkNL81WBnOhVceSryrLCoi2vuZOVY1ne2BMMkYvsTDWFwY5My+GV/u7Lbzp6l
	4+4Y4HoBPWH9Y6sEO2LSz/WEPnuydeBz2xM/eE0nVZnOT6Lo90lDWeSQ4kAdcCQWsMqC
	5oEA==
Received: by 10.204.152.145 with SMTP id g17mr108390bkw.120.1342168292217;
	Fri, 13 Jul 2012 01:31:32 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:25 +0200
Message-Id: <1342168240-7760-18-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 17/32] elsa: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:57 -0000
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
index 0000000..ac0d2bc
--- /dev/null
+++ b/meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend
@@ -0,0 +1,13 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
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
1.7.6.5



