Return-Path: <rehsack@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id CCB68770E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:51:34 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so36921181wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 04:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version;
	bh=WvIXlJtP1jGLrxXgxy1mzjUAqpbIkoyCcZ90d8ZOQL0=;
	b=bQO3n+j5H5Y+yzqXL2wSK8IJaZC81fpjpvwHPxjyEuTM8SCmFaGPt+IMlKlS6GnchR
	w067LZpM9FejAFf/REapn4cwyPNdNxmiZ7uPAXGOXwHefpGW+0JR0Bdpx6SS9zSJ67V6
	3eLvy+7W06UAKLstGUGEle2BABJ88vtglyzuhk6RO8KgvqNZ4AqdzX9KvhMt5D5UZQxY
	67Ld9YlT8Hu0usAxshsXbUwoh6kEXBxbrNHsMaze0V0+A8Y/S7fn6UD65hnzNEsCNCVt
	DHGl6l16BA/EZ//Icv0tDhBuTE+uG+W18Ja3ZpPtw+X7+2TVTtR9+eiAsIa7ii3NdyvG
	TE3A==
X-Received: by 10.194.24.68 with SMTP id s4mr10904189wjf.12.1444909894411;
	Thu, 15 Oct 2015 04:51:34 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	p4sm23312499wia.15.2015.10.15.04.51.33
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Oct 2015 04:51:33 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Date: Thu, 15 Oct 2015 13:51:31 +0200
Message-Id: <0736624E-A78B-47B2-BABB-18D5839FA698@gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Mailer: Apple Mail (2.2104)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-java][PATCH 1/6] cacao-initial-native: fix rebuild with uncleaned workdir breaks accidently
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
X-List-Received-Date: Thu, 15 Oct 2015 11:51:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


When cacao-initial-native is rebuilt because of changed dependency, =
executable
name in wrapper script is accidently changed twice into =
"cacao-initial-inital".
This is prevented now.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 recipes-core/cacao/cacao-initial-native_0.98.bb | 2 +-
 recipes-core/classpath/classpath.inc            | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb =
b/recipes-core/cacao/cacao-initial-native_0.98.bb
index 72c6246..fed9c49 100644
--- a/recipes-core/cacao/cacao-initial-native_0.98.bb
+++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
@@ -35,7 +35,7 @@ export JAR=3D"fastjar"
=20
 do_configure_append() {
   # Fix the executable name in the wrapper script.
-  sed -i -e "s|exec cacao|exec cacao-initial|" src/scripts/java.in
+  sed -i -e 's|exec cacao \$|exec cacao-initial \$|' =
src/scripts/java.in
 }
=20
 SRC_URI[md5sum] =3D "8b8907c8b925761c9410bcadb9705346"
diff --git a/recipes-core/classpath/classpath.inc =
b/recipes-core/classpath/classpath.inc
index 1bdfd78..6b3f158 100644
--- a/recipes-core/classpath/classpath.inc
+++ b/recipes-core/classpath/classpath.inc
@@ -55,7 +55,6 @@ EXTRA_OECONF +=3D "\
 do_configure_prepend () {
   cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${S}
 }
-=09
=20
 do_install() {
 	autotools_do_install
--=20
2.3.8 (Apple Git-58)

--=20
Jens Rehsack - rehsack@gmail.com


