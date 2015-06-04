Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 92A6275844
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:21:41 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so145659382igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iu2296JyvOpDb3/bkpeQKUfgPAXPmwmx53pdYBIk8ag=;
	b=leGgzBoug8mAxLCzBiJYdl0SiaydvS7fhf4dr6ueuPzZHjB0jlFEn9bIBixilf/yja
	ZLDB9VAo+/k0lWfESbxcmCo5uj0+qDMDzUmzcpUiipNvUs0+3SHr2T9xtLrsIPKf9ydK
	j98uTumNnoC2Y+PfdTQuZQx8+OponQ2KWfZUlJoSiiqD4KS9TfsiPdJl4D27RkA8vNxJ
	x64p1Ria2p54VIhGGCPNIWKISS9VJ4Q/xVxAJumdI6AaBCu07t/PQT7UOt3+kDK5Czr7
	uhvSB6ese3Dod/9mCS0xuNb3Nf0rGb6sYl0cSHV6V6HWTWyp+HuMLxf8aVg6ETLn+bBw
	dbkA==
X-Received: by 10.50.61.234 with SMTP id t10mr36184771igr.19.1433445702773;
	Thu, 04 Jun 2015 12:21:42 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	je10sm9950529igb.15.2015.06.04.12.21.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jun 2015 12:21:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:21:05 -0700
Message-Id: <1433445666-7207-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
References: <1433445666-7207-1-git-send-email-armccurdy@gmail.com>
Subject: [meta-oe][PATCH 6/7] emacs.inc: use x86 over-ride instead of i586
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
X-List-Received-Date: Thu, 04 Jun 2015 19:21:41 -0000

Support i686 without needing to duplicate the i586 over-ride.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-oe/recipes-support/emacs/emacs.inc | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/emacs/emacs.inc b/meta-oe/recipes-support/emacs/emacs.inc
index a1a4965..e706b18 100644
--- a/meta-oe/recipes-support/emacs/emacs.inc
+++ b/meta-oe/recipes-support/emacs/emacs.inc
@@ -36,9 +36,7 @@ FILES_${PN}-dbg += "${libexecdir}/emacs/*/*/.debug ${datadir}/emacs/*/*/.debug"
 TREEDIR = "${WORKDIR}/qemu-treedir"
 
 QEMUARCH= "${TARGET_ARCH}"
-QEMUARCH_i486 = "i386"
-QEMUARCH_i586 = "i386"
-QEMUARCH_i686 = "i386"
+QEMUARCH_x86 = "i386"
 
 # Large stack is required at least on x86_64 host, otherwise random segfaults appear:
 QEMU = "qemu-${QEMUARCH} ${QEMU_OPTIONS} -s 1048576 -L ${TREEDIR} "
-- 
1.9.1


