Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 47E227F501
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 03:10:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9M3As9X011512
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Oct 2019 20:10:54 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 21 Oct 2019 20:10:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 22 Oct 2019 11:10:51 +0800
Message-ID: <1571713851-35931-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] postfix: split etc from ${PN} to ${PN}-cfg
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
X-List-Received-Date: Tue, 22 Oct 2019 03:10:55 -0000
Content-Type: text/plain

In postinst of ${PN}, call newaliases on etc may fail at do_rootfs
due to host setup. If fail, the postinst will rerun at target first
boot which cause update-alternatives in postinst rerun.

The update-alternatives rerun is not necessary, especially while /usr
is read-only and /etc is writable on target(such as ostree system).
split etc from ${PN} to ${PN}-cfg could avoid affect.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-networking/recipes-daemons/postfix/postfix.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 7781005..de45e08 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -203,7 +203,7 @@ ALTERNATIVE_LINK_NAME[newaliases.1] = "${mandir}/man1/newaliases.1"
 ALTERNATIVE_LINK_NAME[sendmail.1] = "${mandir}/man1/sendmail.1"
 
 PACKAGE_WRITE_DEPS += "postfix-native"
-pkg_postinst_${PN} () {
+pkg_postinst_${PN}-cfg () {
     if [ "x$D" = "x" ]; then
         touch /etc/aliases
         newaliases
@@ -224,7 +224,10 @@ pkg_postinst_${PN} () {
     fi
 }
 
+PACKAGES =+ "${PN}-cfg"
+RDEPENDS_${PN}_class-target += "${PN}-cfg"
 # Exclude .debug directories from the main package
-FILES_${PN} = "${sysconfdir} ${localstatedir} ${bindir}/* ${sbindir}/* \
+FILES_${PN} = "${localstatedir} ${bindir}/* ${sbindir}/* \
                ${libexecdir}/* ${systemd_unitdir}/*"
+FILES_${PN}-cfg = "${sysconfdir}"
 FILES_${PN}-dbg += "${libexecdir}/postfix/.debug"
-- 
2.7.4


