Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E00227769A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 14:30:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GEU0Tj009340
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 07:30:01 -0700
Received: from yow-cube1.wrs.com (128.224.56.98) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 07:30:00 -0700
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Mar 2017 10:29:52 -0400
Message-ID: <1489674593-21677-3-git-send-email-paul.gortmaker@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
References: <1489674593-21677-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] eject: use update-alternatives for manpage
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

   file /usr/share/man/man1/eject.1 conflicts between attempted installs
   of util-linux-doc-2.29.1-r0.core2_64 and eject-doc-2.1.5-r1.core2_64

Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 0440f0c37075..49a3d74f6fcd 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -33,3 +33,5 @@ ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_PRIORITY[volname] = "100"
 ALTERNATIVE_PRIORITY[eject] = "100"
 
+ALTERNATIVE_${PN}-doc = "eject.1"
+ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
-- 
2.7.4


