Return-Path: <andrea.adami@gmail.com>
Received: from mail-wg0-f49.google.com (mail-wg0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5831E738ED
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 22:50:00 +0000 (UTC)
Received: by wgin8 with SMTP id n8so33449437wgi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2015 15:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/knLSUVLHnz7y1kQUfZuTnRlKGnlSDY3CL5nnSFgtII=;
	b=yZRgYmSa+toBej2918JmW20d4VVImqaGS/gOhGB0z5HegmB4JaegA19BLgeznlhsET
	d95iDx/XwqNsnOKRhAe00+6M4HwbJ7b1fgfEPIYbp8AowaD2yRszG+fDpdlZYYvUv5ia
	yvPuoyYPMQTO0kpId51mKrkLnw/sEsyfxtKpnquimUYNGiQ77FhaUIAJf96B/6ilehM5
	Q3pv1FIq7uZatqjXenZpkdC1NkfBj6ECdLFoDCtxhTKHEfZsZdSESTykGFxOo4OiL6fA
	BxCI78c99/U8ZhqlqfarrSnkJsyKw/KwKEWLcjzNX9LB6eHmG3xEMzbfziUrHwhyQ5HM
	n2wQ==
X-Received: by 10.194.22.40 with SMTP id a8mr10140769wjf.134.1429829401359;
	Thu, 23 Apr 2015 15:50:01 -0700 (PDT)
Received: from T520.homenet.telecomitalia.it
	(host220-62-dynamic.24-79-r.retail.telecomitalia.it. [79.24.62.220])
	by mx.google.com with ESMTPSA id f8sm797835wiy.7.2015.04.23.15.50.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Apr 2015 15:50:00 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Apr 2015 00:49:57 +0200
Message-Id: <1429829397-21433-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH v2] kexecboot-cfg: fix for real ('S') doesn't exist warning
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
X-List-Received-Date: Thu, 23 Apr 2015 22:50:01 -0000

Remove unneeded do_configure_prepend and set S = "${WORKDIR}"
v2 removes commented lines

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index bd861f3..69f3872 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -6,11 +6,8 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 SRC_URI = "file://icon.xpm"
 
-S = "${WORKDIR}/${BP}"
+S = "${WORKDIR}"
 
-do_configure_prepend () {
-    install -m 0644 ${WORKDIR}/icon.xpm ${S}
-}
 do_install_prepend () {
 echo '# /boot/boot.cfg - KEXECBOOT configuration file.
 #
-- 
1.9.1


