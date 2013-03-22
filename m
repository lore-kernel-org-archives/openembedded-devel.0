Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ6Ei-0007hi-RU
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Mar 2013 18:58:49 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so8140812wib.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2013 10:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=5D3Xq89X+CUJupu8k/Q0XkmmIwxNbvXcHdlB8z+S0/Q=;
	b=I/Lz33BUl/Fv96MHZlzs1Y7YFi1j0mY2VSODV+VNgQ9htJJNZNLcfgzgMdFmTTMuQD
	p+6SLGi9MGSQeUD9jPhSkvnxaYbx2fYa67stmYA39u8j5tZtb/28pKg5WYK49Q2RZc5o
	1V+s+biGaiNQp+WtMaig7YiPKrjX5lqwdrYyANIoht19y5g+NLs1cPP/lscz5mXLYJul
	15WAiWmOLvXOf6/h1zRHbQOPYKD4iNzVho+LgNb0GGW9FGySoEK0UFNfPi5/NKP9hCWP
	+5VJK5xXg6LOoU9l0FrXXRMYYg2ecrchE709dNzRkXQFwfeEFN2nLA2BA4fiBlzzGjK5
	cUHA==
X-Received: by 10.194.22.5 with SMTP id z5mr4832721wje.5.1363974107022;
	Fri, 22 Mar 2013 10:41:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id dm9sm12260880wib.3.2013.03.22.10.41.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 10:41:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 17:38:32 +0000
Message-Id: <72a013f90006d9ba3c3ff023d1963d01a9f1aec2.1363973088.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
In-Reply-To: <cover.1363973088.git.ross.burton@intel.com>
References: <cover.1363973088.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnjNLfVC1CapCPKk8e0Dbgl5VEsMj2nxPNlG25IvlE/CUL8UhPWMFOAHmLowzEtfXKD1iNy
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 12/22] systemd: check for systemctl first, and don't force systemd to be installed.
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
X-List-Received-Date: Fri, 22 Mar 2013 17:59:30 -0000

With both sysvinit and systemd features enabled these postinsts may actually run
on a target without systemd, so check that systemctl is present before using it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/systemd.bbclass |   27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 564cd72..cca2152 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -24,19 +24,23 @@ if [ -n "$D" ]; then
     OPTS="--root=$D"
 fi
 
-systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+if type systemctl >/dev/null; then
+	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
-if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-    systemctl start ${SYSTEMD_SERVICE}
+	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+		systemctl start ${SYSTEMD_SERVICE}
+	fi
 fi
 }
 
 systemd_prerm() {
-if [ -z "$D" ]; then
-    systemctl stop ${SYSTEMD_SERVICE}
-fi
+if type systemctl >/dev/null; then
+	if [ -z "$D" ]; then
+		systemctl stop ${SYSTEMD_SERVICE}
+	fi
 
-systemctl disable ${SYSTEMD_SERVICE}
+	systemctl disable ${SYSTEMD_SERVICE}
+fi
 }
 
 python systemd_populate_packages() {
@@ -56,14 +60,6 @@ python systemd_populate_packages() {
             bb.error('%s does not appear in package list, please add it' % pkg_systemd)
 
 
-    # Add a runtime dependency on systemd to pkg
-    def systemd_add_rdepends(pkg):
-        rdepends = d.getVar('RDEPENDS_' + pkg, True) or ""
-        if not 'systemd' in rdepends.split():
-            rdepends = '%s %s' % (rdepends, 'systemd')
-        d.setVar('RDEPENDS_' + pkg, rdepends)
-
-
     def systemd_generate_package_scripts(pkg):
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
 
@@ -156,7 +152,6 @@ python systemd_populate_packages() {
             systemd_check_package(pkg)
             if d.getVar('SYSTEMD_SERVICE_' + pkg, True):
                 systemd_generate_package_scripts(pkg)
-                systemd_add_rdepends(pkg)
         systemd_check_services()
 }
 
-- 
1.7.10.4



