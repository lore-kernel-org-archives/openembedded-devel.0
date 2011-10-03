Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigG-0005Ww-7o
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:40 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=bAP23W/OvYF2gR0nRzDXlUzZg6qbTq/w/1mMa6RVoyw=;
	b=cDMs5nH/zcayLJArb4Ig0STONgMO9hvYPBWcWJo5/B0+bokthTaLrstd2+NuQyATTW
	2C/R2NaGyNFG8KNtMSoww3tOPry1KulyX+O8CDnMkhkbYyvvtvOkYnjT2Z7HAFCUXNNC
	tMUMIviZNGIigIaMVQi1K3FlgPM6POjupiom8=
Received: by 10.204.137.208 with SMTP id x16mr4050663bkt.373.1317648610205;
	Mon, 03 Oct 2011 06:30:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b17sm13225074bkd.8.2011.10.03.06.30.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:19 +0200
Message-Id: <6d83548c2ca9337123124b34fe7bf5630a333424.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 21/25] elementary: fir order of PACKAGES
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
X-List-Received-Date: Mon, 03 Oct 2011 13:35:40 -0000

* -accessibility needs to be after -dbg
  fixes ERROR: QA Issue: non debug package contains .debug directory: elementary-accessibility path /work/armv4t-oe-linux-gnueabi/elementary-2_0.7.0+svnr63721-r11/packages-split/elementary-accessibility/usr/lib/elementary/modules/access_output/linux-gnueabi-arm-0.7.0/.debug/module.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/elementary_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/elementary_svn.bb b/meta-efl/recipes-efl/efl/elementary_svn.bb
index fda1622..0cfa821 100644
--- a/meta-efl/recipes-efl/efl/elementary_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary_svn.bb
@@ -21,7 +21,7 @@ do_compile_append() {
                   elementary.pc
 }
 
-PACKAGES =+ "${PN}-configs ${PN}-accessibility"
+PACKAGES += "${PN}-configs ${PN}-accessibility"
 
 RDEPENDS_${PN} = "\
   ${PN}-themes \
-- 
1.7.7



