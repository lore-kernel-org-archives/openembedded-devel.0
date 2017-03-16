Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 05FA072FB0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:29:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GETxJj005676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:30:00 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:29:59 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:29:51 -0400
Message-ID: <1489674593-21677-2-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] inetutils: bump priority to avoid conflict issue
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
X-List-Received-Date: Thu, 16 Mar 2017 14:29:59 -0000
Content-Type: text/plain

To fix:

 [log_check] Warn: update-alternatives: logger.1 has multiple providers
 with the same priority, please check
 tmp/work/genericx86_64-overc-linux/cube-graphical-builder/0.2-r0/rootfs/usr/lib/opkg/alternatives/logger.1
 for details

In that file we see:
 /usr/share/man/man1/logger.1
 /usr/share/man/man1/logger.1.util-linux 80
 /usr/share/man/man1/logger.1.inetutils 80

Since most people would probably expect the util-linux version, we
drop inetutils by one.

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index b42b197fdd19..9a065c3f47a9 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -107,7 +107,7 @@ ${PN}-rsh ${PN}-rshd"
 PACKAGES =+ "${PN}-tftpd-dbg ${PN}-telnetd-dbg ${PN}-rshd-dbg"
 NOAUTOPACKAGEDEBUG = "1"
 
-ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_PRIORITY = "79"
 ALTERNATIVE_${PN} = "talk whois"
 ALTERNATIVE_LINK_NAME[talkd]  = "${sbindir}/in.talkd"
 ALTERNATIVE_LINK_NAME[uucpd]  = "${sbindir}/in.uucpd"
-- 
2.7.4


