Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdS6u-0005dI-JW
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 21:50:30 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4908028eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 12:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HgBiI+C+FWUVp8CDCuAEGgnoijTQGylC60Di+d3FEf4=;
	b=fs6ZiWj/8ySP8EnhrD4lHAjDcMazv6TXBxSdk7XiWxSHg3ZUXUMbDKYUfwnJfB146f
	gpm+cDwjJPY9IcKS/hoqN05kkBUCdFJxPqPfcQGTjGAO66CTF3t+xhBaxTXSDIH5oUPY
	i068NU3aPKlqDR/SDUc0JceMerE6c5E3Q0NcIWNen2kD4yzMBP5hQVIasx/6N9F9CJDt
	G6Ck219Bnpjpta+ARiIQypWjkwFivtJjot8qSyuCRGrqbBGesGlxh9AADB9BBZbCGyUi
	ZULL40/YflQVKMWSf4CehUbNqlBmoUD6SINVtb3FojQEllTmIh4/k5IZ5kHhgAVO7iky
	s9cQ==
Received: by 10.14.177.1 with SMTP id c1mr61849746eem.8.1354048577245;
	Tue, 27 Nov 2012 12:36:17 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d44sm42848171eeo.10.2012.11.27.12.36.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 12:36:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 21:33:57 +0100
Message-Id: <8695490f1bd60cab8a85de5a5d1b19fd6486803e.1354034591.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034591.git.Martin.Jansa@gmail.com>
References: <cover.1354034591.git.Martin.Jansa@gmail.com>
Subject: [PATCH 20/21] e-wm: fix file permissions on sysactions.conf
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
X-List-Received-Date: Tue, 27 Nov 2012 20:50:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index d5f92bb..abee301 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r9"
+PR = "r10"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -32,6 +32,10 @@ do_install_append() {
     # customising - should rather make this simple upstream
     install -m 755 ${WORKDIR}/enlightenment_start.oe ${D}/${bindir}
 
+    # security reasons, e-wm checks that in runtime
+    # xinit[418]: ERROR: CONFIGURATION FILE HAS BAD PERMISSIONS
+    chmod 600 ${D}/${sysconfdir}/enlightenment/sysactions.conf
+
     install -d ${D}/${datadir}/applications/
     install -m 644 ${S}/src/modules/fileman/module.desktop ${D}/${datadir}/applications/efm.desktop
     sed "s#Type=Link#Type=Application#g" -i ${D}/${datadir}/applications/efm.desktop
-- 
1.8.0



