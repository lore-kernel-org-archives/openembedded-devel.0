Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T91i2-0004XX-9V
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 00:35:02 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so4917933wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2012 15:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=7Ug+MB6q4AZsLmyZloA4oZ/YQPfQUIKc3DWaAf/bOWE=;
	b=jhF5A2bkjBG066OSgdpNkumtC6E1TI0I7rarNm73kC3wkIBGYC7U1pwMUTgRhbffBK
	M6ozJCCkH0fTa36tSCdGs1EFECdEq3hiEp4ikLuVwwTz0SNXOwZtnEZrClzcA7V7AHGD
	Ub155BZ7l+QcsbhEfblT+APDzRCses3JaKGtZQcMZQ+htE6GI4Q0lJ/UxEZie9273ZnF
	xZ+H4SUVUL7y2lHIQbhgPEzoicta+0RRnloPHWxKSvWLU6L9DyN9PpdB1aBq2NovhlWZ
	kklLTSTgZxydC/kbpC3XMFxvdlHCCuU9aezLBfDs7WasoLM4OIqgpyIEMHbR0UMjn91q
	FvJg==
Received: by 10.216.95.10 with SMTP id o10mr3997747wef.213.1346797362363;
	Tue, 04 Sep 2012 15:22:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q4sm26261418wix.9.2012.09.04.15.22.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 15:22:41 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2012 00:22:16 +0200
Message-Id: <b1f4da0ff86096aa831b9289800ea3430d7dbcd3.1346790372.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1346790372.git.Martin.Jansa@gmail.com>
References: <cover.1346790372.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 04/10] e-wm: update RRECOMMENDS_-config-mobile
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
X-List-Received-Date: Tue, 04 Sep 2012 22:35:02 -0000

* I've forgot to rename this when illume2 was renamed to mobile

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index 8e70507..a6f56bd 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r5"
+PR = "r6"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -163,7 +163,7 @@ FILES_illume-keyboard-default-terminal = "\
 "
 
 RRECOMMENDS_${PN}-config-default = "${PN}-theme-default"
-RRECOMMENDS_${PN}-config-illume2 = "\
+RRECOMMENDS_${PN}-config-mobile = "\
   illume-keyboard-default-alpha \
   illume-keyboard-default-numeric \
   illume-keyboard-default-terminal \
-- 
1.7.12



