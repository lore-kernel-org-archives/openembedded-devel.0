Return-Path: <paul.betafive@gmail.com>
X-Greylist: delayed 343 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 22:16:28 UTC
Received: from mail-we0-f174.google.com (unknown [74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id C384A6098B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 22:16:28 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id k48so11909627wev.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 May 2014 15:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Mrlyh5D+GAcF3V9bSd8b08fjub4vFwP+LaAK93RmYXk=;
	b=wg3uhQkGR283NmgdDxvUWf8lguaJhZt1pkGWxj+w4NWkgzDzhHtCQMzBPLUapHVvzC
	x9C+qX+RxR0Gupnn+F1NpOWHCH/r2eUHFistUGVHnHBZz165N23qOHoQRjQH/M103Mtd
	J3xZi/XKRD2HaEh8GdF8PSWIsqy8A3iD1gC3jAj8Jrr0YWA7lugu1anyc21aMcVrFZvx
	VZ3C3kU17XWqk486e5FHyTXwxrfe2m3AWukoA2hkAp+9AA4Ib63O2g5x3cqMYwl8m9Vk
	e1pl3QJN4DaKotmvNR3fuQ5CcFLQpcnBN5Uw9q2hN5pVKsLkzBQRhYPIDkaA4ferl0vM
	0ZWg==
X-Received: by 10.180.90.145 with SMTP id bw17mr53432723wib.43.1401315046125; 
	Wed, 28 May 2014 15:10:46 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	na4sm20209904wic.21.2014.05.28.15.10.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 15:10:45 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 22:10:40 +0000
Message-Id: <1401315040-6563-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.3
Subject: [meta-oe][PATCH] vim: Fix packaging of common data files
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
X-List-Received-Date: Wed, 28 May 2014 22:16:35 -0000

The majority of the vim runtime files have been moved from the package
'vim-data' to the package 'vim-common'. However, 'vim-data' was still in
RRECOMMENDS and 'vim-common' was not, so the runtime files were not being
installed by default.

To fix this, 'vim-data' is removed from RRECOMMENDS and 'vim-common' is added
instead. 'vim-data' is also removed from PACKAGES as it should now be empty.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-oe/recipes-support/vim/vim_7.4.258.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.258.bb b/meta-oe/recipes-support/vim/vim_7.4.258.bb
index 2d3b0c2..cfc82b1 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.258.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.258.bb
@@ -70,7 +70,7 @@ do_install_append() {
 
 PARALLEL_MAKEINST = ""
 
-PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
+PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc"
 FILES_${PN}-syntax = "${datadir}/${PN}/${VIMDIR}/syntax"
 FILES_${PN}-help = "${datadir}/${PN}/${VIMDIR}/doc"
 FILES_${PN}-tutor = "${datadir}/${PN}/${VIMDIR}/tutor ${bindir}/${PN}tutor"
@@ -93,7 +93,7 @@ FILES_${PN}-common = " \
 "
 
 # Recommend that runtime data is installed along with vim
-RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
+RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
 
 ALTERNATIVE_${PN} = "vi"
 ALTERNATIVE_TARGET[vi] = "${bindir}/${PN}"
-- 
1.9.3


