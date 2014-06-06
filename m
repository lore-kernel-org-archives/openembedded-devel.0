Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 63E1F6FA4D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 08:28:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s568SseZ023245
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jun 2014 01:28:54 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 6 Jun 2014 01:28:53 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jun 2014 04:28:47 -0400
Message-ID: <1402043327-31663-3-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1402043327-31663-1-git-send-email-jackie.huang@windriver.com>
References: <1402043327-31663-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] fbset: use BP instead of P to fix multilib build
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
X-List-Received-Date: Fri, 06 Jun 2014 08:28:53 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/fbset/fbset_2.1.bb |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 0639afc..84ea50c 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -22,9 +22,9 @@ inherit autotools-brokensep update-alternatives
 
 do_install() {
     install -d ${D}${sbindir} ${D}${datadir}/man/man8 ${D}${datadir}/man/man5
-    install -m 0755 ${WORKDIR}/${P}/fbset ${D}${sbindir}/fbset.real
-    install -m 0644 ${WORKDIR}/${P}/*.5 ${D}${datadir}/man/man5
-    install -m 0644 ${WORKDIR}/${P}/*.8 ${D}${datadir}/man/man8
+    install -m 0755 ${WORKDIR}/${BP}/fbset ${D}${sbindir}/fbset.real
+    install -m 0644 ${WORKDIR}/${BP}/*.5 ${D}${datadir}/man/man5
+    install -m 0644 ${WORKDIR}/${BP}/*.8 ${D}${datadir}/man/man8
 }
 
 ALTERNATIVE_fbset = "fbset"
-- 
1.7.9.5


