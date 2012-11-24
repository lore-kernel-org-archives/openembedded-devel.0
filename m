Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip.balister@gmail.com>) id 1TcIrz-00028P-B6
	for openembedded-devel@openembedded.org; Sat, 24 Nov 2012 17:46:19 +0100
Received: by mail-vc0-f175.google.com with SMTP id m8so5924680vcd.6
	for <openembedded-devel@openembedded.org>;
	Sat, 24 Nov 2012 08:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=8htxQO54wpVf5/eiAe4ZLOadlwWe5DAWw3R6Wghji94=;
	b=k7RKfz0JnTuWCawmi+XbtuDGEQ26+BuCkF38qFE8qe+W7OO5zpyhuRNbVj/IawIvCJ
	/C9zQKEezJX/MV2De0w0rSRkFkJBtMJpf65hYB+eYfJToMmpC71YC9D2wmwinhSirbuX
	z4ebABCzo4gC9zr/JS1kZPkDMgcFoMa8HaR59olQqsDxWnh9ss08UqfNxrE02v3akQBM
	FIq6vVNRciGcEnjgUQ27GvKvTyNQddvINzv0IKZQ9wl5Iyi9PwWi/JGLDGi5pLJHkdMl
	w/RzoplXyOhzK6Nk+PXsrMZBpzYsFbG3WQIoxSzD/khpA6w2qybeQ2qupgxDhsBd/vUS
	HANA==
Received: by 10.52.88.14 with SMTP id bc14mr9636697vdb.110.1353774729756;
	Sat, 24 Nov 2012 08:32:09 -0800 (PST)
Received: from localhost.localdomain ([96.240.166.19])
	by mx.google.com with ESMTPS id jx16sm4757773veb.5.2012.11.24.08.32.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 24 Nov 2012 08:32:09 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@openembedded.org
Date: Sat, 24 Nov 2012 11:32:05 -0500
Message-Id: <1353774725-26969-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.7.11.7
Subject: [meta-oe][PATCH] python-cheetah : Drop RDEPENDS from native build.
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
X-List-Received-Date: Sat, 24 Nov 2012 16:46:19 -0000

If the native recipe has the RDEPENDS in, the build fails because these
packages are not provided by python-native.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
index 967be31..1dad958 100644
--- a/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
+++ b/meta-oe/recipes-devtools/python/python-cheetah_2.4.4.bb
@@ -13,6 +13,7 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit setuptools
 
 RDEPENDS_${PN} = "python-pickle python-pprint"
+RDEPENDS_${PN}_class-native = ""
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.11.7



