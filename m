Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2txE-0004AQ-4X
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Mar 2011 00:28:36 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so577628bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 16:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=uC1t0bg3mnSCDPgO9ea35wV+hPlH5JTFORCU3t5WbYU=;
	b=oFGK8gZlsuiP/owjJW5hsF/lUUM/TgZ7+dbKxDRLu+2UhuMEzIKcNFJDbmeDvZunWm
	bsqtsRVXULzqL0wGcN/R/1kDuEWxAgimkAJ972bQPEMZA2zyL/98pcCRDqsGY0OsGSpm
	iZMUxj1UWBZCI9n1tRfcob1DhdJbmst92hLeA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ghWfMWgVGzXqEmvz9jSxOgWS4hnoN/bs9U1/Zs0RvdRYnZuyotKzIguBPkAwUN7/0B
	Wzy+RjT1FNejEFLW+DfjgYm14nrlLN4lXfXdm7TMNszP68UsdJa54xMpgT0/vWFTmT3N
	dYM5WHDM4x9zfCJdSnmDC2u7mJe2Zq+S0yvYQ=
Received: by 10.204.144.194 with SMTP id a2mr70020bkv.93.1301009183332;
	Thu, 24 Mar 2011 16:26:23 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id rb14sm316525bkb.21.2011.03.24.16.26.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 16:26:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Mar 2011 00:26:21 +0100
Message-Id: <3854884409bc6ee290e0a0fcc26b452e88f5e052.1301008354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1301008354.git.Martin.Jansa@gmail.com>
References: <cover.1301008354.git.Martin.Jansa@gmail.com>
Subject: [PATCH 8/8] e-wm: add LIC_FILES_CHKSUM and inherit gettext
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
X-List-Received-Date: Thu, 24 Mar 2011 23:28:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index b7ce1b1..baed233 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -1,12 +1,13 @@
 DESCRIPTION = "The Enlightenment Window Manager Version 17"
 DEPENDS = "eet evas ecore edje efreet edbus eeze"
 LICENSE = "MIT BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f523ab5986cc79b52a90d2ac3d5454a2"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
 PR = "r19"
 SRCREV = "${EFL_SRCREV}"
 
-inherit e update-alternatives
+inherit e update-alternatives gettext
 S = "${WORKDIR}/${SRCNAME}"
 
 SRC_URI = "\
-- 
1.7.4.1



