Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBFCD66004
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jun 2014 00:46:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5D0kgKx001208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jun 2014 17:46:43 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 12 Jun 2014 17:46:42 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 13 Jun 2014 08:46:18 +0800
Message-ID: <1402620392-7425-14-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
References: <1402620392-7425-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 14/14] openflow: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 13 Jun 2014 00:46:42 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

It needs autotools-brokensep, otherwise do_configure error:

run.do_configure.22953: line 109: ./boot.sh: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-protocols/openflow/openflow.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/openflow/openflow.inc b/meta-networking/recipes-protocols/openflow/openflow.inc
index 43af54e..1a226f8 100644
--- a/meta-networking/recipes-protocols/openflow/openflow.inc
+++ b/meta-networking/recipes-protocols/openflow/openflow.inc
@@ -22,7 +22,7 @@ PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools-brokensep
 
 do_configure() {
     ./boot.sh
-- 
1.7.10.4


