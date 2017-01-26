Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB32C772D0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 23:18:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0QNICq4010623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jan 2017 15:18:13 -0800
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 26 Jan 2017 15:18:12 -0800
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Jan 2017 18:18:11 -0500
Message-ID: <1485472691-7321-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] inetutils: register hostname.1 man page as an alternate
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
X-List-Received-Date: Thu, 26 Jan 2017 23:18:14 -0000
Content-Type: text/plain

The coreutils has a hostname command; this package already dealt
with that existing as an alternate, but for some reason it did not
do the same with the manpage of the same name.  The conflict varied
from intermittent to "why does this keep happening to me?!?".

Mark gets credit for the fix; he didn't want to bear witness to yet
another premature death of a USB keyboard and suggested the change
here; which I then largely just confirmed as functional, since I
happened to "be so lucky" as to have the reproducer.

The failure showed up in do_rootfs as follows:

ERROR: cube-graphical-builder-0.2-r0 do_rootfs: [log_check] cube-graphical-builder:
found 1 error message in the logfile: [log_check] update-alternatives:
Error: not linking tmp/work/qemuarm64-overc-linux/cube-graphical-builder/0.2-r0/rootfs/usr/share/man/man1/hostname.1
to /usr/share/man/man1/hostname.1.coreutils since
tmp/work/qemuarm64-overc-linux/cube-graphical-builder/0.2-r0/rootfs/usr/share/man/man1/hostname.1
exists and is not a link

Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index a8c40254bad7..e3c27817661d 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -143,6 +143,9 @@ ALTERNATIVE_${PN}-traceroute = "traceroute"
 ALTERNATIVE_${PN}-hostname = "hostname"
 ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
 
+ALTERNATIVE_${PN}-doc = "hostname.1"
+ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
+
 ALTERNATIVE_${PN}-ifconfig = "ifconfig"
 ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
 
-- 
2.7.4


