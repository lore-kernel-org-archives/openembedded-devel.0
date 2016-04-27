Return-Path: <sujith.h@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id D187260721
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 13:35:06 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id vv3so5616511pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 06:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AQT+vxUYN6PQv1/6KskDd9blhhUllpej+wjKg5ldBIQ=;
	b=jc8j+faf1JqZfyM598b/oClauR/3FPBsSbU5lYLidzDx6/hse0xBX6npLT9iHL+Ak0
	b0dHa2nrMypJxFMm4K3tkbKYs0NNKAhwPrgNOfjBjuWJ77b5w28mvXPhaC0HxRTj3pNI
	Eg4EsI0ROPdJXhoO1XZBdSs/mTWnF2EGtj8whbLa2UyRCGn3TQyy/5qGhbgA7w1/KNe+
	QHWtW8qPO6wGJuew0Zz/XFHJc9Dl5Qz7VMgUMUi4gPVlyBMzfJmlkUkzwJwwPnyxOcLo
	DICIbh9csndV2Lfoo7IR2hMWA3CtEUtyf5UL6fQla4Y51WEIma3j7mU/OJjbRzOQvtUG
	D76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AQT+vxUYN6PQv1/6KskDd9blhhUllpej+wjKg5ldBIQ=;
	b=CX2JytXKweEZunv4JQa/Gkjo+SVPBAN5R1KwwtPD4rPCsRSu2ncyxt7cxoAqLv7rTF
	igvZ52SngMZISfOaOouVAUx4T52Pm40vlX7Cu0J3pHkqqh2oVrGBHFgFhaL+KUDYfo1h
	k30dUJcZxYdm7veBIty8nOintFZuV+S5ulXqjv2S27kNLBHNwcInRKopc4OZQrq4r6u3
	xIS2wM0zJim9rc/0VT8h4zIO8pbS2QRl2mpzV2BQFsh8wphzd9+QEg0W80A+z97pCjue
	EM9MDOEbIZFa4RwswP8+78U+cy8eIWKhG6s32LcZ0SAPMnagyvtgyPUyjalw1SGXGeA7
	UAPQ==
X-Gm-Message-State: AOPr4FWs1zFJ6r0vDAR9zGBKLGRUm3r0KOUAm0BhZwqSlkTMjtpbdVNm0XNurci9Q7nDHw==
X-Received: by 10.66.6.98 with SMTP id z2mr11812758paz.95.1461764107209;
	Wed, 27 Apr 2016 06:35:07 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id h1sm6729480pfh.49.2016.04.27.06.35.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 06:35:06 -0700 (PDT)
From: Sujith Haridasan <sujith.h@gmail.com>
X-Google-Original-From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 19:04:53 +0530
Message-Id: <1461764093-12263-1-git-send-email-Sujith_Haridasan@mentor.com>
X-Mailer: git-send-email 1.9.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH] fbida: use separate builddir
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Apr 2016 13:35:08 -0000

From: Christopher Larson <chris_larson@mentor.com>

Separate builddir from the sourcedir.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith H <sujith.h@gmail.com>
---
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index 8a4c083..7d5dc89 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -14,7 +14,9 @@ SRC_URI = "https://www.kraxel.org/releases/fbida/fbida-${PV}.tar.gz"
 SRC_URI[md5sum] = "09460b964b58c2e39b665498eca29018"
 SRC_URI[sha256sum] = "7a5a3aac61b40a6a2bbf716d270a46e2f8e8d5c97e314e927d41398a4d0b6cb6"
 
-EXTRA_OEMAKE = "STRIP="
+B = "${WORKDIR}/build"
+
+EXTRA_OEMAKE = "STRIP= 'srcdir=${S}' -f ${S}/GNUmakefile"
 
 PACKAGECONFIG ??= "gif png curl"
 PACKAGECONFIG[curl] = ",,curl"
@@ -26,6 +28,7 @@ PACKAGECONFIG[webp] = ",,libwebp"
 PACKAGECONFIG[lirc] = ",,lirc"
 
 do_compile() {
+    sed -i -e 's# fbgs# \$(srcdir)/fbgs#; s#-Ijpeg#-I\$(srcdir)/jpeg#; s# jpeg/# \$(srcdir)/jpeg/#' ${S}/GNUmakefile
     sed -i -e 's:/sbin/ldconfig:echo x:' ${S}/mk/Autoconf.mk
     sed -i -e 's: cpp: ${TARGET_PREFIX}cpp -I${STAGING_INCDIR}:' ${S}/GNUmakefile
 
-- 
1.9.1


