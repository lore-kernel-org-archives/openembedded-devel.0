Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgJxv-000058-OG
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 19:45:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3067419eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 10:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=LiA36UeHQ3rCB9MudlIHP9srHK0dysxkqkSTxnIc7bU=;
	b=yi3LRvZWUhWYu2/XKhzGf0O/28OXfhy4QYhiy4nsrTriPKmmymR2shm0kwY4+KdpkZ
	M+XshK4Fv7xDM8dvG3x34O0YrwewYX0xgWq5XeTqcKFJ5fCeL46hhjgqqeeanGrT/TsU
	0e01M10QEu9TG2slEqdwyay9qqCr221oWECpaFTmCNd4/d58YBxfKRMF/lfN++cVST2l
	+B7UuXnPBeE+ju/3y3p5GR3zOJyV8+/ldNINt4hyMGAiA11XFwkD27rzYKU77z97iibl
	zGhEQxTvIJYeuS5H5NXbHEVSITHVnlDrEA2q+ZPVIB7c0uXponqgDiRhgsD0VDoMY7fk
	LeMA==
Received: by 10.14.216.70 with SMTP id f46mr63249635eep.12.1354732239748;
	Wed, 05 Dec 2012 10:30:39 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm10675116eeo.11.2012.12.05.10.30.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 10:30:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 19:30:23 +0100
Message-Id: <bef5b1c61f91ea5f2b28a981c69a9ed35cf27d74.1354731625.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354731625.git.Martin.Jansa@gmail.com>
References: <cover.1354731625.git.Martin.Jansa@gmail.com>
Subject: [PATCH 65/77] samba: remove empty /sbin
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
X-List-Received-Date: Wed, 05 Dec 2012 18:45:08 -0000

* fixes:
samba-3.6.8: samba: Files/directories were installed but not shipped
  /sbin

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba.inc      | 1 +
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index faa2be0..d39a84a 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -88,6 +88,7 @@ do_install_append() {
         install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_winbind.so ${D}${libdir}/libnss_winbind.so.2
         install -m 0644 ${WORKDIR}/${PN}-${PV}/nsswitch/libnss_wins.so ${D}${libdir}/libnss_wins.so.2
 
+	rmdir ${D}${base_sbindir}
 }
 
 
diff --git a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
index 7c54dae..7985199 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.6.8.bb
@@ -3,7 +3,7 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "\
     file://config-h.patch \
-- 
1.8.0



