Return-Path: <Alexandru.Moise@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AAAC773219
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 09:23:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7Q9N3cB008213
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2016 02:23:03 -0700 (PDT)
Received: from obsrwr.corp.ad.wrs.com (128.224.19.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 26 Aug 2016 02:23:02 -0700
From: Alexandru Moise <alexandru.moise@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Aug 2016 12:22:56 +0300
Message-ID: <1472203377-13111-1-git-send-email-alexandru.moise@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] vim: split tools directory into vim-tools package
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
X-List-Received-Date: Fri, 26 Aug 2016 09:23:03 -0000
Content-Type: text/plain

Normal install of vim packs with it also the /usr/share/vim/vim*/tools
directory that consist of a bunch of scripts such as "vim132" that
just starts up vim in 132 column mode for VT-100 terminals and
lookalikes.

Created the vim-tools separate package for the tools directory. If
anyone needs these scripts they can be added to the fs image together
with their dependencies.

Signed-off-by: Alexandru Moise <alexandru.moise@windriver.com>
---
 meta-oe/recipes-support/vim/vim_7.4.1689.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.1689.bb b/meta-oe/recipes-support/vim/vim_7.4.1689.bb
index 5e6282b..f94a497 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.1689.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.1689.bb
@@ -78,12 +78,13 @@ do_install() {
 
 PARALLEL_MAKEINST = ""
 
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc"
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-tools"
 FILES_${PN}-syntax = "${datadir}/${BPN}/${VIMDIR}/syntax"
 FILES_${PN}-help = "${datadir}/${BPN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${BPN}/${VIMDIR}/tutor ${bindir}/${BPN}tutor"
 FILES_${PN}-vimrc = "${datadir}/${BPN}/vimrc"
 FILES_${PN}-data = "${datadir}/${BPN}"
+FILES_${PN}-tools = "${datadir}/${BPN}/${VIMDIR}/tools"
 FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/*.vim \
     ${datadir}/${BPN}/${VIMDIR}/autoload \
@@ -97,7 +98,6 @@ FILES_${PN}-common = " \
     ${datadir}/${BPN}/${VIMDIR}/plugin \
     ${datadir}/${BPN}/${VIMDIR}/print \
     ${datadir}/${BPN}/${VIMDIR}/spell \
-    ${datadir}/${BPN}/${VIMDIR}/tools \
 "
 
 RDEPENDS_${PN} = "ncurses-terminfo-base"
-- 
1.9.1


