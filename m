Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDCD672FB0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:29:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2GETwr9008370
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:29:59 -0700 (PDT)
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:29:58 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:29:50 -0400
Message-ID: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] Fix doc pkg conflicts
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
X-List-Received-Date: Thu, 16 Mar 2017 14:29:58 -0000
Content-Type: text/plain

Something must have enabled more strict checking on doc package confilcts
as these recently showed up:

 Error: Transaction check error:
   file /usr/share/man/man1/dnsdomainname.1 conflicts between attempted installs of inetutils-doc-1.9.4-r0.core2_64 and net-tools-doc-1.60+26-r0.core2_64
   file /usr/share/man/man8/syslogd.8 conflicts between attempted installs of inetutils-doc-1.9.4-r0.core2_64 and sysklogd-doc-1.5.1-r0.core2_64
   file /usr/share/man/man1/eject.1 conflicts between attempted installs of util-linux-doc-2.29.1-r0.core2_64 and eject-doc-2.1.5-r1.core2_64
   file /usr/share/man/man1/logger.1 conflicts between attempted installs of util-linux-doc-2.29.1-r0.core2_64 and inetutils-doc-1.9.4-r0.core2_64

 [log_check] Warn: update-alternatives: logger.1 has multiple providers with the same priority, please check rootfs/usr/lib/opkg/alternatives/logger.1 for details

An accompanying series has already been sent to oe-core.

Paul Gortmaker (3):
  inetutils: bump priority to avoid conflict issue
  eject: use update-alternatives for manpage
  inetutils: use update-alternatives for more manpages

 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb | 7 +++++--
 meta-oe/recipes-support/eject/eject_2.1.5.bb                      | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.7.4


