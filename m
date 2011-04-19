Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QCKew-0006mN-FD
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 01:48:42 +0200
Received: by pvc30 with SMTP id 30so115195pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 16:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=+Sbk2AZUyBK0O4pASSAYT7v/Bws8zt0Hdk50C0BR9pM=;
	b=xPYCB2Y2u2HETEi3oQvETO6br1HWxHDwRVtq3qBQPGED2QhBr55kSwKeJ2s6ZfApLs
	Bswbe+Pux1E38tv2/zP3djK2fuFNG6m+oGML0vF+OpK5D3fDD4+i4gm81fDTnkOF7mpo
	1fkN0lVoBpcUOO/8bhli8vyOkM0w/LnZgpc+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=CckbnJJps7K8NvClhPl1leGMQhRYKGVx57NEMKMBovPxFIwoIzyvKkpzhWJhf8c7BC
	XG7ZXHGFsYI+R7HyJRYMsyz0/afj/6GexFPypKHHPL605pvVKT/EDMbEPgjaM8vGZz88
	dYROmRpNbAEOktTO+dflGAEG4QN7zlAwuF1ag=
Received: by 10.68.40.170 with SMTP id y10mr9283966pbk.30.1303256777130;
	Tue, 19 Apr 2011 16:46:17 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id j8sm240833pbc.24.2011.04.19.16.46.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2011 16:46:15 -0700 (PDT)
From: raj.khem@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 16:46:07 -0700
Message-Id: <1303256767-12688-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [meta-oe][PATCH] uclibc-initial_git.bb: Create symlinks to kernel headers
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
X-List-Received-Date: Tue, 19 Apr 2011 23:48:42 -0000

From: Khem Raj <raj.khem@gmail.com>

Without this the toolchain bootstrap will fail
on some compiler versions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/uclibc/uclibc-initial_git.bb |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/uclibc/uclibc-initial_git.bb b/meta-oe/recipes-core/uclibc/uclibc-initial_git.bb
index 4d54cf0..8e5c251 100644
--- a/meta-oe/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta-oe/recipes-core/uclibc/uclibc-initial_git.bb
@@ -21,6 +21,12 @@ do_install() {
 	install -d ${D}${libdir}
 	install -m 755 lib/lib[cm].so ${D}${libdir}
 	# add links to linux-libc-headers: gcc-{cross,crossdk}-intermediate need this.
+        for t in linux asm asm-generic; do
+                if [ -d ${D}${includedir}/$t ]; then
+                    rm -rf ${D}${includedir}/$t
+                fi
+                ln -sf ${STAGING_DIR_TARGET}${includedir}/$t ${D}${includedir}/
+        done
 }
 do_compile() {
 	:
-- 
1.7.4.1



