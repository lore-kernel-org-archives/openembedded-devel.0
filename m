Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C8C3A607A5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 15:11:56 +0000 (UTC)
Received: by padck2 with SMTP id ck2so25591327pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=CTBmbIIepLnqXB6HIfQCYdEqywclkKBYtkjV8Jy+D4c=;
	b=Rb09lwgGB4pAMxaM94RjmT/9F/zh+jvnnJq7H5LlMx4nTca6DQ3kzYPIsleLZsdlay
	sZN0K/oCIOP7FsMSvCSL8DtAnnmMJL88waLq07jTSzSx07Mxc3rGaWxBOqae0Bxjc7mL
	KUa7ZV5as6GX2RxXyFFXV7R6LsmEt12K/Bdff+m+KmiIL2+cC4R31PN+VXaf0g+axXXQ
	sH+pLU/+vOKfzLKMzc7x7sktb0a4QU/KJVEHxZKNp8d5c29IhjRdcWIj/0U3MnyMOMB0
	NHL2iw8sTBZZ3JltPbTXMFf2lAnc7zg39MsUk1FmBru5BJ9YI2DxjZho/FUQg8tlU9nW
	W8AA==
X-Received: by 10.66.248.2 with SMTP id yi2mr8885437pac.149.1436973116781;
	Wed, 15 Jul 2015 08:11:56 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	pj4sm5010249pbb.29.2015.07.15.08.11.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jul 2015 08:11:55 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jul 2015 08:11:52 -0700
Message-Id: <1436973112-10720-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-gnome][PATCH] libxklavier: fix compile error.
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
X-List-Received-Date: Wed, 15 Jul 2015 15:12:00 -0000

make[3]: *** No rule to make target `Xkl-1.0.typelib', needed by `all-am'.  Stop.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
index e93c378..5e1d125 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.3.bb
@@ -11,6 +11,8 @@ SRC_URI[archive.md5sum] = "290ea2a8abc40f78a3a16bdae6f02808"
 SRC_URI[archive.sha256sum] = "ebec3bc54b5652838502b96223152fb1cd8fcb14ace5cb02d718fc3276bbd404"
 
 EXTRA_OECONF = "--with-xkb-bin-base=${bindir}"
+PACKAGECONFIG ??=""
+PACKAGECONFIG[introspection] = "--enable-introspection=yes, --enable-introspection=no, libgirepository"
 
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-- 
2.3.5


