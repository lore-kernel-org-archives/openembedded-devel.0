Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74D9660232
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Oct 2014 01:22:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O1M2et009885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Oct 2014 18:22:03 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 18:22:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Oct 2014 09:22:01 +0800
Message-ID: <1414113721-6978-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] inetutils: inherit texinfo
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
X-List-Received-Date: Fri, 24 Oct 2014 01:22:09 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

inherit texinfo to use native command instead of host command

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
index 2bae3ee..e46133e 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
 SRC_URI[md5sum] = "aa1a9a132259db83e66c1f3265065ba2"
 SRC_URI[sha256sum] = "0423ea40a160cd4630f817e247df5c08ecc625378d2bb56a0509117a36a89913"
 
-inherit autotools gettext update-alternatives
+inherit autotools gettext update-alternatives texinfo
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'ipv6', '', 'file://fix-disable-ipv6.patch', d)}"
 noipv6="${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6 gl_cv_socket_ipv6=no', d)}"
-- 
1.7.10.4


