Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6A16A6A94D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Sep 2013 07:01:38 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id r10so2899741pdi.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Sep 2013 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Nw43nrcUWRbZnhDzlcniLigWleW0ls4LxXX1NXwMtbI=;
	b=uSeakLpJ1Gq2zs7bSPT+qjMvMXDm1AQYQRZBEXpyDM4AfY+Z+6AWG1oVVaAa4M2cjm
	u+MdihpHAclrfYa6+Gaaw1U/xZeKcJ/MNNQCfBtGclZiSi1r+E1Iucl0gfnWZgipEWZs
	zoIHDf8PXLX0YjStez8TbomxHIKvFnmkGlKTcp+0qP+Vng7e480GDkiJhlSwp0zQQk0C
	sfQzKCY2PSY3PZUwttqd3bKov13jY5dOvMUhTpPM3gC3O/hY7jj3avkMXxIzSNi5Dy0u
	gHz/d9V3XEloaWv35/dj6v1l8z0Y6TtQhSrbq3HaAtvvZ1Q0aRKq8aKi/6ysq9qzXKzR
	xlpA==
X-Received: by 10.66.169.172 with SMTP id af12mr2188080pac.23.1378450814727;
	Fri, 06 Sep 2013 00:00:14 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id bg3sm1748830pbb.44.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 00:00:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Sep 2013 23:58:52 -0700
Message-Id: <1378450732-16024-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [meta-oe][PATCH] uml-utilities: Fix build errors exposed with multilib
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
X-List-Received-Date: Fri, 06 Sep 2013 07:01:38 -0000

With multilib it cant package the files that go into
the arch independend lib dir

Fixes

ERROR: QA Issue: uml-utilities: Files/directories were installed but not
shipped
  /usr/lib
  /usr/lib/uml
  /usr/lib/uml/port-helper
  /usr/lib/uml/.debug
  /usr/lib/uml/.debug/port-helper

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
index 8b3059d..4d9d3c2 100644
--- a/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
+++ b/meta-oe/recipes-extended/uml-utilities/uml-utilities_20040406.bb
@@ -22,5 +22,5 @@ do_install() {
     oe_runmake install DESTDIR=${D}
 }
 
-FILES_${PN} += "${libdir}"
-FILES_${PN}-dbg += "${libdir}/uml/.debug"
+FILES_${PN} += "${exec_prefix}${nonarch_base_libdir}"
+FILES_${PN}-dbg += "${exec_prefix}${nonarch_base_libdir}/uml/.debug"
-- 
1.8.4


