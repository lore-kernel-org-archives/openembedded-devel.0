Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D31CE78A06
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 03:28:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7E3SH5a013072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 20:28:17 -0700
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 20:28:16 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 14 Aug 2018 11:38:48 +0800
Message-ID: <1534217928-13556-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-virtualization][PATCH] lxc: add runtime depends for util-linux-getopt
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
X-List-Received-Date: Tue, 14 Aug 2018 03:28:17 -0000
Content-Type: text/plain

When runing:

    lxc-create -t download -n test

The system reports that the getopt command can't find. This is because
the lxc-download template depends on getopt command. So add the runtime
depends on util-linux-getopt for lxc.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 recipes-containers/lxc/lxc_3.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/lxc/lxc_3.0.1.bb b/recipes-containers/lxc/lxc_3.0.1.bb
index a77dd09..d4bfd92 100644
--- a/recipes-containers/lxc/lxc_3.0.1.bb
+++ b/recipes-containers/lxc/lxc_3.0.1.bb
@@ -25,6 +25,7 @@ RDEPENDS_${PN} = " \
 		gnutls \
 		nettle \
 		util-linux-mountpoint \
+		util-linux-getopt \
 "
 
 RDEPENDS_${PN}_append_libc-glibc = " glibc-utils"
-- 
2.7.4


