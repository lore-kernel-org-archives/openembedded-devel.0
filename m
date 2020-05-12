Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.6214.1589291729091172011
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2020 06:55:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=eOOGhxw7;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49LzpR1gvkzL9
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2020 15:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589291727;
	bh=PUg6v4rtpbUvNikYotzPhZzBLJyjm5l+luBRnubIhPs=;
	h=From:To:Subject:Date:From;
	b=eOOGhxw7lSyqqeIe5Ib1BIr6ANxqg5y3GsC1I0zGDrIJaCUKPNj7yjH9DLSSmpTx2
	 wk4jmySP30rRu5JTdShCH8EUCmwT0J3mrB09Vu17aqTvcSK58vT2d7Y286BW/oX1Qa
	 zLXyCKts6SM9gqfBI6UoYvTBFLEZlNLTgIJVh1bDs7kmiaANbqzk8ECDsuh4E4P1Wp
	 eStD8IVp5RXrE7amCH0k8/8spqvSCYtqcFbMYItQVLje32bCbL8+PFLQrCL3YhPnLf
	 TmIsbXGgDUJEiu8zRaHQI7FbrNYbFApzHcXE9hmLaGQrgRN8opiNT2JoDrI7NDchJH
	 fMB6yTGkHkXV5p4Qyfrg3TSpDmVNUvvBpRsUA16H5dm5F427B83d7Rvh3QD64Gll9V
	 Qj8sjwCziuy/PzKFqhDscR0TCQX1DuSawSd173W5C5c69IGwgQJhXiQwv87z/Meg6I
	 TGi3Hy6RPqNwMD27drXEPX+infJRbbYkC+zAfO1tcxoYPl3NDTLyN0QWD3GUy+fJBf
	 qaEQUSuF4awqrpYkK0NEl0kan6NSJIRAAYsvv8PG1DZHAIuy+3lWmKjLnjPjk4GAfs
	 oZT1WIuezlzgCBeSJSqMhvr0yHwssX++fL8IlZNqMfOrpUq0e/XlQGoprAZHRyE6vf
	 jbsacv3PfIDQkeIJzvPDyndE=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Subject: [OE-core][PATCH] at-spi2-atk: Remove -fcommon
Date: Tue, 12 May 2020 16:55:22 +0300
Message-Id: <20200512135523.19970-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

This was fixed in upstream version 2.34.0.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/atk/at-spi2-atk_2.34.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
index db62ae8fac..107d312d14 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.34.2.bb
@@ -17,5 +17,3 @@ FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
 FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
 
 BBCLASSEXTEND = "native nativesdk"
-
-CFLAGS += "-fcommon"
-- 
2.17.1

