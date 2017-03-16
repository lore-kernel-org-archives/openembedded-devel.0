Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCAD87768A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:30:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GEU2O8008389
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:30:02 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:30:01 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:29:53 -0400
Message-ID: <1489674593-21677-4-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] inetutils: use update-alternatives for more manpages
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
X-List-Received-Date: Thu, 16 Mar 2017 14:30:01 -0000
Content-Type: text/plain

To fix:

   file /usr/share/man/man1/dnsdomainname.1 conflicts between attempted installs
   of inetutils-doc-1.9.4-r0.core2_64 and net-tools-doc-1.60+26-r0.core2_64

   file /usr/share/man/man8/syslogd.8 conflicts between attempted installs
   of inetutils-doc-1.9.4-r0.core2_64 and sysklogd-doc-1.5.1-r0.core2_64

   file /usr/share/man/man1/logger.1 conflicts between attempted installs
   of util-linux-doc-2.29.1-r0.core2_64 and inetutils-doc-1.9.4-r0.core2_64

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index 9a065c3f47a9..55eb137ee841 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -144,8 +144,11 @@ ALTERNATIVE_${PN}-traceroute = "traceroute"
 ALTERNATIVE_${PN}-hostname = "hostname"
 ALTERNATIVE_LINK_NAME[hostname]  = "${base_bindir}/hostname"
 
-ALTERNATIVE_${PN}-doc = "hostname.1"
+ALTERNATIVE_${PN}-doc = "hostname.1 dnsdomainname.1 logger.1 syslogd.8"
 ALTERNATIVE_LINK_NAME[hostname.1] = "${mandir}/man1/hostname.1"
+ALTERNATIVE_LINK_NAME[dnsdomainname.1] = "${mandir}/man1/dnsdomainname.1"
+ALTERNATIVE_LINK_NAME[logger.1] = "${mandir}/man1/logger.1"
+ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
 
 ALTERNATIVE_${PN}-ifconfig = "ifconfig"
 ALTERNATIVE_LINK_NAME[ifconfig]  = "${base_sbindir}/ifconfig"
-- 
2.7.4


