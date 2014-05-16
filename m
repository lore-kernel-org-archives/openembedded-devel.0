Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3C26A53E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 08:26:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G8QsWL021429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 May 2014 01:26:54 -0700 (PDT)
Received: from pek-hostel-vm07.wrs.com (128.224.153.177) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 01:26:53 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 May 2014 04:26:51 -0400
Message-ID: <1400228812-30966-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] liblockfile: inherit autotools-brokensep
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
X-List-Received-Date: Fri, 16 May 2014 08:26:58 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Seperation of ${B} and ${S} causes a build failure for liblockfile.

The error message is as follows.
make: *** No rule to make target `lockfile.c', needed by `lockfile.o'.  Stop.

Make liblockfile inherit autotools-brokensep to fix this problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../liblockfile/liblockfile_1.09.bb                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
index fa68fd0..0b9fdaf 100644
--- a/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
+++ b/meta-oe/recipes-extended/liblockfile/liblockfile_1.09.bb
@@ -13,7 +13,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/libl/liblockfile/liblockfile_1.09.orig.tar.gz \
 SRC_URI[md5sum] = "2aa269e4405ee8235ff17d1b357c6ae8"
 SRC_URI[sha256sum] = "16979eba05396365e1d6af7100431ae9d32f9bc063930d1de66298a0695f1b7f"
 
-inherit autotools
+inherit autotools-brokensep
 
 # set default mailgroup to mail
 # --with-libnfslock specify where to install nfslock.so.NVER
-- 
1.7.9.5


