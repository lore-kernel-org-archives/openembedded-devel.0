Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi8i-0005QU-LY
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:21:41 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1378899eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=pEAyS58u7QOrSqcM2J6TFCjkgCUra1E1iqCezZTvJwo=;
	b=dODyTBKivOAggp6SvCWeoaIHCX4Z+7sIXeOCBuI03BhPCr1Qeb9qyj+uEsFcuEActB
	GXn5bPAZVxLzzWL3lnAYJBo/5vnJKg84+xFUvQ7oaRgO8eWcgjp1cd+qOfKTFnegLCeM
	LZANemqTB3OGR4KvC2iFB9u9Dvkr3dthf3Qpp/xx5ZU+vnLX/C7GVlwVZIOsAYgr4RzC
	aaVGC0KQNdPph2roAEHKpW/vl10cbOvjvgJEw9oIl9C2ckkn8pD09TYQCZ0DInzVB7ga
	ExVc68xybWrQ4h5DcqLf8Td2XBCCdVKg8ydS6pH6nL9ggJ7FBB9OENHn0fyUgxUYZ7Pu
	au+w==
Received: by 10.14.184.131 with SMTP id s3mr42634171eem.38.1354586839005;
	Mon, 03 Dec 2012 18:07:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z8sm34815001eeo.11.2012.12.03.18.07.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:07:18 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:31 +0100
Message-Id: <c4edc88757afce5fa7416086bcedc3a574200946.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 58/58] eject: use new update-alternatives and add u-a for eject
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
X-List-Received-Date: Tue, 04 Dec 2012 02:21:42 -0000

* eject conflicts with util-linux now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 3f17fe8..3f2c90d 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -12,12 +12,11 @@ SRC_URI[sha256sum] = "ef9f7906484cfde4ba223b2682a37058f9a3c7d3bb1adda7a34a67402e
 
 S = "${WORKDIR}/${PN}"
 
-do_install_append() {
-  mv ${D}/${bindir}/volname ${D}/${bindir}/volname.${PN}
-}
+PR = "r1"
 
-ALTERNATIVE_NAME = "volname"
-ALTERNATIVE_LINK = "${bindir}/volname"
-ALTERNATIVE_PATH = "${bindir}/volname.${PN}"
-ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "volname eject"
+ALTERNATIVE_LINK_NAME[volname] = "${bindir}/volname"
+ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
+ALTERNATIVE_PRIORITY[volname] = "100"
+ALTERNATIVE_PRIORITY[eject] = "100"
 
-- 
1.8.0



