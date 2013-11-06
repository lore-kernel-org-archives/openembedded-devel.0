Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 62B306CC86
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2013 00:44:41 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kq14so9609993pab.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2013 16:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cN+98DsXGmCNJvipDXWyksJ3c9h14orAJi0fQpsQSjc=;
	b=Y6mw2kaBMzFQZF6YHJbb66aKBjDgrpzEkIzzprUTy5QDVcOnBbwTrAAZP3bl0jtYn8
	xwZT0LU2bIbDcCJ32Jv11Du8c2EOH5iKrTDlDN/CcBc7BZFf08oINTRBX6rLjDDZS0rX
	6f26cnaTw8lau9ZWddKhHYjqSEEFnRpBV/di46bHtf+AxIVFxMy2IwUGHUZgOTjLaYgp
	rILzOcdlMGPKWaZcl8EVUueZjEmMd/JyJYlSgN+n1T+RCPPphB8iPW49i43EqoCi/c2V
	PwIaovBtQCTco/BBskEI1Yo0RYJnXuefLqrqttiwppGNjb95b2Pn7EofjAAHd8gy2oez
	5aCQ==
X-Received: by 10.66.187.34 with SMTP id fp2mr1174949pac.12.1383698682919;
	Tue, 05 Nov 2013 16:44:42 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id ik1sm37277062pbc.9.2013.11.05.16.44.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Nov 2013 16:44:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2013 16:41:17 -0800
Message-Id: <1383698477-7516-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4.2
Subject: [meta-oe][PATCH] vim: Disable parallel install, it has races
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
X-List-Received-Date: Wed, 06 Nov 2013 00:44:42 -0000

We end up with install errors when using high parallel factor like -j20

errors like

| mkdir: cannot create directory
`/``build/tmp-eglibc/work/ppce500v2-poky-linux-gnuspe/vim/7.4.27-r0/image/usr/share/vim/vim74':
File exists
| mkdir: cannot create directory
`/build/tmp-eglibc/work/ppce500v2-poky-linux-gnuspe/vim/7.4.27-r0/image/usr/share/vim/vim74':
File exists

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/vim/vim_7.4.27.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vim/vim_7.4.27.bb b/meta-oe/recipes-support/vim/vim_7.4.27.bb
index 77507d4..5cb933b 100644
--- a/meta-oe/recipes-support/vim/vim_7.4.27.bb
+++ b/meta-oe/recipes-support/vim/vim_7.4.27.bb
@@ -7,7 +7,7 @@ LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://../runtime/doc/uganda.txt;md5=b779e18be6ed77facc770691c967b8f8"
 
 SRC_URI = "hg://vim.googlecode.com/hg/;protocol=https;module=vim \
-	file://configure.in_remove_CC_quotes.patch;patchdir=.."
+	   file://configure.in_remove_CC_quotes.patch;patchdir=.."
 SRCREV = "v7-4-027"
 
 S = "${WORKDIR}/${PN}/src"
@@ -61,6 +61,8 @@ do_install_append() {
     install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${PN}/vimrc
 }
 
+PARALLEL_MAKEINST = ""
+
 PACKAGES =+ "${PN}-common ${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-data"
 FILES_${PN}-syntax = "${datadir}/${PN}/${VIMDIR}/syntax"
 FILES_${PN}-help = "${datadir}/${PN}/${VIMDIR}/doc"
-- 
1.8.4.2


