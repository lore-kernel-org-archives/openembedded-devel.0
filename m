Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMJML-00024m-Cw
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 13:22:20 +0200
Received: by fxm9 with SMTP id 9so3660315fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=LdfF0GgGauemPFm/HbG9srrbznbcN73VGe1XydiTJsI=;
	b=o2TR5ztAmx8L7rZo3Sl9xg6ykK9gZ+6mGxayzTiEIaA2shL8lq1wEZMnbomkCI+vwd
	VH2CrCfepwRoquThwcN9XwxZF38dE6Avuvp3ZgmVzVi/5bXZj8fLuQRgMLCAOMMSVMZ3
	MrrFzjCkTWLtKOCOCaN5IYnb0Ta6sJLfc0rIg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=m2DbKeCv4pS2UV8GrsaCSnbmZtWJrsZ8jWcC5VIjLHLOw8QWq2gsnprY7a/vibLaPx
	hSNc7E8Zdck5cVsZ4DOIVUHdYcHx8KXoJQ7fyMmfXa+bAqx7Z5/Ml3Ckd6bMO2G60fVp
	dXgtnRLSq7Nsk1ECkCZxC+sL2lV81JWmXpbXk=
Received: by 10.223.143.20 with SMTP id s20mr841113fau.38.1276082264239;
	Wed, 09 Jun 2010 04:17:44 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id y12sm3724727faj.5.2010.06.09.04.17.43
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 04:17:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jun 2010 13:17:33 +0200
Message-Id: <1276082253-26496-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gcc: target gcc should include all libexec binaries, ie lto-wrapper
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
X-List-Received-Date: Wed, 09 Jun 2010 11:22:26 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/gcc/gcc-package-target.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/gcc/gcc-package-target.inc b/recipes/gcc/gcc-package-target.inc
index 0676b53..32b0a48 100644
--- a/recipes/gcc/gcc-package-target.inc
+++ b/recipes/gcc/gcc-package-target.inc
@@ -17,7 +17,7 @@ PACKAGES = "\
 FILES_${PN} = "\
   ${bindir}/${TARGET_PREFIX}gcc \
   ${bindir}/${TARGET_PREFIX}gccbug \
-  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
+  ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/* \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/*.o \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/specs \
   ${gcclibdir}/${TARGET_SYS}/${BINV}/lib* \
-- 
1.7.1



