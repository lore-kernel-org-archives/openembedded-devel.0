Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1224960DD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 09:02:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9G92m6l015813
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 02:02:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 02:02:48 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Oct 2014 17:04:05 +0800
Message-ID: <1413450245-32047-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] vim: add ncurses-terminfo-base as a runtime dependency
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
X-List-Received-Date: Thu, 16 Oct 2014 09:02:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Without this patch, we may have problem using vim.
Steps to reproduce the problem is as follows:
1. Set NO_RECOMMENDATIONS to "1".
2. bitbake core-image-minimal
3. runqemu qemux86
4. On target, execute `vi 1.txt'.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/vim/vim_7.4.373.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.373.bb b/meta-oe/recipes-support/vim/vim_7.4.373.bb
index 81c0ddf..14fee3e 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.373.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.373.bb
@@ -93,6 +93,7 @@ FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/tools \
 "
 
+RDEPENDS_${PN} = "ncurses-terminfo-base"
 # Recommend that runtime data is installed along with vim
 RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
-- 
1.9.1


