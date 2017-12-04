Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76991787F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Dec 2017 19:52:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vB4JqXqL025171
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 4 Dec 2017 11:52:34 -0800
Received: from yow-cube2.wrs.com (128.224.56.99) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Dec 2017 11:52:33 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Mon, 4 Dec 2017 14:52:25 -0500
Message-ID: <1512417145-9545-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] inetutils: make -syslog rconflict with other system loggers
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
X-List-Received-Date: Mon, 04 Dec 2017 19:52:33 -0000
Content-Type: text/plain

With oe-core commit cdcebd81c872cb7386c658998e27cf24e1d0447c
[initscripts: don't use update-alternatives] we start seeing a a
rootfs generation failure when both sysklogd and inetutils are present
in the image:

ERROR: do_rootfs: [log_check] : found 1 error message in the logfile:
[log_check] update-alternatives: Error: not linking
.../0.2-r0/rootfs/usr/share/man/man8/syslogd.8 to
/usr/share/man/man8/syslogd.8.inetutils since
.../0.2-r0/rootfs/usr/share/man/man8/syslogd.8 exists and is not a link

As has been done with the other packages which provide system logging
we add an rconflicts to only allow one to exist in a rootfs image at a
time.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 4655bc5..190cd5f 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -169,7 +169,10 @@ FILES_${PN}-hostname = "${base_bindir}/hostname.${BPN}"
 FILES_${PN}-ifconfig = "${base_sbindir}/ifconfig.${BPN}"
 FILES_${PN}-traceroute = "${bindir}/traceroute.${BPN}"
 FILES_${PN}-logger = "${bindir}/logger.${BPN}"
+
 FILES_${PN}-syslogd = "${base_sbindir}/syslogd.${BPN}"
+RCONFLICTS_${PN}-syslogd = "rsyslog busybox-syslog sysklogd syslog-ng"
+
 FILES_${PN}-ftp = "${bindir}/ftp.${BPN}"
 
 FILES_${PN}-tftp = "${bindir}/tftp.${BPN}"
-- 
2.7.4


