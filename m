Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F3257D258
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Oct 2019 06:18:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9M6IRgY009393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Oct 2019 23:18:28 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 21 Oct 2019 23:18:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 22 Oct 2019 14:18:25 +0800
Message-ID: <1571725105-38038-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571713851-35931-1-git-send-email-hongxu.jia@windriver.com>
References: <1571713851-35931-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH V2] postfix: split /etc from ${PN} to ${PN}-cfg for ostree
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
X-List-Received-Date: Tue, 22 Oct 2019 06:18:28 -0000
Content-Type: text/plain

In postinst of ${PN}, call newaliases on etc may fail at do_rootfs
due to host setup. If fail, the postinst will rerun at target first
boot which cause update-alternatives in postinst rerun.

For ostree system, /usr is readonly, /etc is writable, the
update-alternatives will be failed when run on target since it
needs write files in /usr. Split the postinst into two packages
can fix the problem:
* update-alternatives runs at do_rootfs
* newaliases runs at do_rootfs or first boot, it needs write files
  in /etc when run at first boot, while /etc is writable for ostree.

For non-ostree, everything will be OK as normal

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


