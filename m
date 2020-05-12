Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.6182.1589291727526660098
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=tHXoP7QX;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpP5JYvzCY
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291725;
	bh=5xYHGHvTkCTjbdsY6QKQdV6wPENFsc9LB/Ltd1rbRpc=;
	h=From:To:Subject:Date:From;
	b=tHXoP7QXIQ6X+55YqsCzXzFbmZSBthcBucZxL9zZafJefZSj/DLlNWmaRcvv/yb5N
	 Qb0r+CkjmsyWqb0DTprO3YIPwvyYPklGn3lDZ5/6Oi7zcjO8F346TaQGxOSyjvx7Un
	 3I+Jaot1I6kJIG5N0DdOFlN3S8ZevyG9JScUDBjr7KKuF4h7DQvXZSoI3KRGlVt/mi
	 DlLlMq61jzPWB9X2KmqUO0IQPdRJ5YuiXEO9OBpNz1aT47BtamdcAK3irqAFV2xxLy
	 psvTI/6qx2Bupp3VfM6YopyhAP9kG+ss3pcAPjnkyOBZGp/uOBUmeEdy5rCwEeeVmo
	 Og+NPagZTc+LRHx3QjI4ppxMDlYsI90aatsjdKGGcJbtfYTc3eyCCfS3G56dH7vjWO
	 EfPi1sxdSEJi9fUPwveksItFh7vf/OJ7149Ce4zzY75p4C7+Vo5i1h5Azf8hFTF/vB
	 MUugg2bq3G+BydZLhdQXe6DGlN8qajhmkinB94GUDveS4MIva/dpn+5wGHI3I69GvS
	 GV6Vjz8rtLFHTvqZ3zlVTzDOEOrJ2qFTKO2Ktp2ceUzq16JdhQLnX+RASnWIk6ujW4
	 H5g2L2+xVboDrrXE1tKaa93VMWqdNTTOhkHz3MC3il052ZwbiTNnvvb0NlUFNCUuev
	 S5ZO6C1og+ZpxCL0xwdwZqYY=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] xorg-xserver: Remove -fcommon
Date: Tue, 12 May 2020 16:55:18 +0300
Message-Id: <20200512135523.19970-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 1.20.8.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
index 3f7fbe85b8..26815feb33 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.8.bb
@@ -9,8 +9,6 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
 SRC_URI[md5sum] = "a770aec600116444a953ff632f51f839"
 SRC_URI[sha256sum] = "d17b646bee4ba0fb7850c1cc55b18e3e8513ed5c02bdf38da7e107f84e2d0146"
 
-CFLAGS += "-fcommon"
-
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
 
-- 
2.17.1

