Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <harvey.tim@gmail.com>) id 1PGxE7-0002lp-Kl
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Nov 2010 18:15:56 +0100
Received: by gxk2 with SMTP id 2so880700gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 09:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=jF02lYvQdoD7qM3v6Qrw9NXuW+1+KcrJNBT8akLlDtw=;
	b=sUkInkEvfSk/pLEuvqxgsc1xL4lsmPjkkFWCEFpRzDHhGOjQtNmbzApxxTuTmGhOtB
	MF+I16IGqiKMrq5HeVhz/lxxyAUQoqyPNDgGxWxLGHEc/M8X8Bg9aSQik9mndG+nD3TW
	fM+mEVmjFoP/PzY2pt7fDwmdC+HSEZQGjdUj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=iJB6yWnY71P5dp8tB34Jt7v4AHwj7mwv8e/X69jvsaW5JYH8MZ06gKL72zwcrufLiL
	ujHnIAMQRaQD5jFJIp/9nTxijdmznZ1oNcZSO8egnYxD3h/amD82nSmaVbj08EmphS2z
	mDscLeuM9BpECTOp+pFvjQ5ccxfNLJ9kABc+o=
Received: by 10.42.217.129 with SMTP id hm1mr2787642icb.43.1289582084065;
	Fri, 12 Nov 2010 09:14:44 -0800 (PST)
Received: from localhost.localdomain
	(adsl-76-205-222-173.dsl.snlo01.sbcglobal.net [76.205.222.173])
	by mx.google.com with ESMTPS id i16sm3848928ibl.12.2010.11.12.09.14.41
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Nov 2010 09:14:42 -0800 (PST)
From: Tim Harvey <harvey.tim@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Nov 2010 09:13:40 -0800
Message-Id: <1289582020-29544-1-git-send-email-harvey.tim@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: harvey.tim@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] vim: fix do_install for those using FILESPATH* overrides
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Nov 2010 17:15:56 -0000

WORKDIR should be used for the source directory of vimrc.  This fixes breakage
for those using FILESPATHBASE/FILESPATHPKG/FILESPATH overrides

Signed-off-by: Tim Harvey <harvey.tim@gmail.com>
---
 recipes/vim/vim_7.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/vim/vim_7.2.bb b/recipes/vim/vim_7.2.bb
index b887ce4..99a8e31 100644
--- a/recipes/vim/vim_7.2.bb
+++ b/recipes/vim/vim_7.2.bb
@@ -11,7 +11,7 @@ VIMX ?= "--without-x"
 
 require vim.inc
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 # 001-411.diff contains 411 patches fetched from upstream
 SRC_URI += "file://001-411.diff;apply=no"
@@ -28,7 +28,7 @@ do_applypatch() {
 addtask applypatch after do_unpack before do_patch
 
 do_install_append() {
-    install -m 0644 ${FILESDIR}/vimrc ${D}/${datadir}/vim
+    install -m 0644 ${WORKDIR}/vimrc ${D}/${datadir}/vim
 }
 
 RCONFLICTS_${PN} = "gvim vim-tiny"
-- 
1.7.0.4



