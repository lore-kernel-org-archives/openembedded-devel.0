Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6FE65D74
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:25:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6P7id016485
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:25:07 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Sun, 20 Apr 2014 23:25:07 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 14:24:52 +0800
Message-ID: <1398061492-31615-5-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
References: <1398061492-31615-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 4/4] ndisc6: allow the package can be empty
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
X-List-Received-Date: Mon, 21 Apr 2014 06:25:06 -0000
Content-Type: text/plain

FILES_${PN} is set to null in original .bb file, this would cause
ndisc6 main package is missing, then one build error will happen:

ERROR: ndisc6 not found in the base feeds (qemux86 i586 x86 noarch any all).

To fix this, need to set ALLOW_EMPTY_${PN} = "1".

Signed-off-by: Xudong.zhu <xudong.zhu@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
index a958e37..066aac2 100644
--- a/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
+++ b/meta-networking/recipes-support/ndisc6/ndisc6_1.0.2.bb
@@ -19,6 +19,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit autotools gettext
 
+ALLOW_EMPTY_${PN} = "1"
+
 # Split into seperate packages since we normal don't want them all
 # The main package is left empty and therefore not created.
 PACKAGES += "${PN}-ndisc6 ${PN}-tcpspray6 ${PN}-rdisc6 \
-- 
1.8.4


