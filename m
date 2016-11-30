Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id D0BE771AA7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2016 12:04:15 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 17B3AB81FA4; Wed, 30 Nov 2016 13:04:07 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Nov 2016 13:04:01 +0100
Message-Id: <1480507445-20746-13-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
References: <1480507445-20746-1-git-send-email-obi@opendreambox.org>
Subject: [meta-networking][PATCH 13/17] samba: add packages samba-dsdb-modules, samba-testsuite and registry-tools
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
X-List-Received-Date: Wed, 30 Nov 2016 12:04:16 -0000

Inspired by Debian.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 9361a09..3f7d9ce 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -131,6 +131,7 @@ do_install_append() {
 }
 
 PACKAGES =+ "${PN}-python ${PN}-pidl \
+             ${PN}-dsdb-modules ${PN}-testsuite registry-tools \
              winbind \
              ${PN}-common ${PN}-base ${PN}-ctdb-tests \
              smbclient"
@@ -184,6 +185,19 @@ FILES_${PN} += "${libdir}/vfs/*.so \
                 ${libdir}/auth/*.so \
 "
 
+FILES_${PN}-dsdb-modules = "${libdir}/samba/ldb"
+
+FILES_${PN}-testsuite = "${bindir}/gentest \
+                         ${bindir}/locktest \
+                         ${bindir}/masktest \
+                         ${bindir}/ndrdump \
+                         ${bindir}/smbtorture"
+
+FILES_registry-tools = "${bindir}/regdiff \
+                        ${bindir}/regpatch \
+                        ${bindir}/regshell \
+                        ${bindir}/regtree"
+
 FILES_winbind = "${sbindir}/winbindd \
                  ${bindir}/wbinfo \
                  ${bindir}/ntlm_auth \
-- 
2.7.4


