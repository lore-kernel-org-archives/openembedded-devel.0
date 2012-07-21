Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsUrn-00036E-Ec
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 10:16:47 +0200
Received: by wibhm11 with SMTP id hm11so1108158wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=RA1VzRnMiE+Rna6rAwYztFZEGFZjTz9eXFswkzLv1YE=;
	b=tj6bzh1J5T3EFMBPrPRgFwcRlNVSfOIbX35uzT9Inx4CzsMYVZ2Tj6Ao2FV3c92Xq1
	fEyMoV91eKYgaCRNn0gWoW9bXCxqPsvekkmK9b98mQr2p1Eh4JfYOR0h+CKjz24dUpoN
	u9agaq1Ml6QoZjxK9QokIBL5Wp7KX3YPZk4nbnUfecj9KUre53w+85QwvupHsKGhSVsi
	LSurhLGTvMQUtf/ya0JZ0Sgk9mrYnI8onWPgiELoH/vKaa1MQ8DR/OWvpyzdWE4IAeXi
	Ryh6D6GXFqCiYwV2lNDTLJSVp6Of3KUoEZgEHEolYNdlzwy0y638GKu7qD2Orf38uXIG
	ucnw==
Received: by 10.216.132.135 with SMTP id o7mr4828685wei.6.1342857923540;
	Sat, 21 Jul 2012 01:05:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y5sm2462528wiw.9.2012.07.21.01.05.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 01:05:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jul 2012 10:05:05 +0200
Message-Id: <cd62fa564aedf24a52cbbdfb48bdd076b8d51276.1342857860.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][PATCH 1/3] phonet-utils: package udev rules
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
X-List-Received-Date: Sat, 21 Jul 2012 08:16:47 -0000

* fixes:
  WARNING: QA Issue: phonet-utils: Files/directories were installed but not shipped
    /lib
    /lib/udev
    /lib/udev/rules.d
    /lib/udev/rules.d/85-phonet-utils.rulesZZ

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../phonet-utils/phonet-utils_git.bb               |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
index 257f012..9a3310e 100644
--- a/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
+++ b/meta-oe/recipes-connectivity/phonet-utils/phonet-utils_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = ""
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "git://gitorious.org/meego-cellular/phonet-utils.git;branch=master;protocol=git"
-PR = "r0"
+PR = "r1"
 S = "${WORKDIR}/git"
 SRCREV = "4acfa720fd37d178a048fc2be17180137d4a70ea"
 PV = "0.0.0+gitr${SRCPV}"
@@ -16,3 +16,4 @@ do_install () {
 	DESTDIR=${D} oe_runmake install
 }
 
+FILES_${PN} += "${base_libdir}/udev/rules.d/85-phonet-utils.rules"
-- 
1.7.8.6



