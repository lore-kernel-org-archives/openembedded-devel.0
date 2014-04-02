Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEE1F6F5BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Apr 2014 07:26:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s327QcvF013665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 2 Apr 2014 00:26:39 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 2 Apr 2014 00:26:38 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Apr 2014 15:27:25 +0800
Message-ID: <1396423645-26893-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH] inetutils: add -dbg packages for tftpd, telnetd and rshd
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
X-List-Received-Date: Wed, 02 Apr 2014 07:26:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The packages tftpd, telnetd and rshd conflict with the ones
provided by netkit, so add the corresponding -dbg packages
for them to avoid the following confliction between the dbg
package of inetutils and netkit:

error: file /usr/sbin/.debug/in.rexecd conflicts between attempted installs of inetutils-dbg-1.9.1-r1.0.armv7a_vfp_neon and netkit-rsh-dbg-0.17-r0.0.armv7a_vfp_neon
error: file /usr/sbin/.debug/in.telnetd conflicts between attempted installs of inetutils-dbg-1.9.1-r1.0.armv7a_vfp_neon and netkit-telnet-dbg-0.17-r0.0.armv7a_vfp_neon

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../inetutils/inetutils_1.9.1.bb                   |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index e7f1987..0e47015 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -80,6 +80,12 @@ ${PN}-tftp ${PN}-logger ${PN}-traceroute ${PN}-syslogd \
 ${PN}-ftp ${PN}-ftpd ${PN}-tftpd ${PN}-telnet ${PN}-telnetd ${PN}-inetd \
 ${PN}-rsh ${PN}-rshd"
 
+# The packages tftpd, telnetd and rshd conflict with the ones
+# provided by netkit, so add the corresponding -dbg packages
+# for them to avoid the confliction between the dbg package
+# of inetutils and netkit.
+PACKAGES += "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
+
 ALTERNATIVE_PRIORITY = "80"
 ALTERNATIVE_${PN} = "talk whois"
 ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
@@ -141,18 +147,22 @@ FILES_${PN}-rsh = "${bindir}/rsh.${BPN} ${bindir}/rlogin.${BPN} ${bindir}/rexec.
 
 FILES_${PN}-rshd = "${sbindir}/in.rshd ${sbindir}/in.rlogind ${sbindir}/in.rexecd \
                     ${sysconfdir}/xinetd.d/rsh ${sysconfdir}/xinetd.d/rlogin ${sysconfdir}/xinetd.d/rexec"
+FILES_${PN}-rshd-dbg = "${sbindir}/.debug/in.rshd ${sbindir}/.debug/in.rlogind ${sbindir}/.debug/in.rexecd"
 RDEPENDS_${PN}-rshd += "xinetd tcp-wrappers"
 RCONFLICTS_${PN}-rshd += "netkit-rshd"
 RPROVIDES_${PN}-rshd = "rshd"
 
 FILES_${PN}-ftpd = "${bindir}/ftpd.${BPN}"
+FILES_${PN}-ftpd-dbg = "${bindir}/.debug/ftpd.${BPN}"
 RDEPENDS_${PN}-ftpd += "xinetd"
 
 FILES_${PN}-tftpd = "${sbindir}/in.tftpd ${sysconfdir}/xinetd.d/tftpd"
+FILES_${PN}-tftpd-dbg = "${sbindir}/.debug/in.tftpd"
 RCONFLICTS_${PN}-tftpd += "netkit-tftpd"
 RDEPENDS_${PN}-tftpd += "xinetd"
 
 FILES_${PN}-telnetd = "${sbindir}/in.telnetd ${sysconfdir}/xinetd.d/telnet"
+FILES_${PN}-telnetd-dbg = "${sbindir}/.debug/in.telnetd"
 RCONFLICTS_${PN}-telnetd += "netkit-telnetd"
 RPROVIDES_${PN}-telnetd = "telnetd"
 RDEPENDS_${PN}-telnetd += "xinetd"
-- 
1.7.9.5


