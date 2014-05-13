Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0830B605B2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 May 2014 02:44:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4D2igUI027991
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 19:44:42 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 19:44:41 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 12 May 2014 22:44:39 -0400
Message-ID: <1399949079-24056-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] fbset: add dependency flex-native
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
X-List-Received-Date: Tue, 13 May 2014 02:44:50 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Build fbset failed with:
| flex modes.l
| make: flex: Command not found
| make: *** [lex.yy.c] Error 127

Add dependency flex-native to fix it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/fbset/fbset_2.1.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fbset/fbset_2.1.bb b/meta-oe/recipes-support/fbset/fbset_2.1.bb
index 8a3807e..0639afc 100644
--- a/meta-oe/recipes-support/fbset/fbset_2.1.bb
+++ b/meta-oe/recipes-support/fbset/fbset_2.1.bb
@@ -9,7 +9,7 @@ SUMMARY = "The fbset console tool"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://fbset.c;endline=19;md5=bf326f82cdfcac391af208f019c5603f"
 RRECOMMENDS_${PN} = "fbset-modes"
-DEPENDS = "bison-native"
+DEPENDS = "bison-native flex-native"
 
 PR = "r4"
 
-- 
1.7.9.5


