Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sharky@sharky.jerryweb.org>) id 1Lqs29-0007F0-Q4
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Apr 2009 18:50:56 +0200
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 62FAFD4822F;
	Mon,  6 Apr 2009 18:47:59 +0200 (CEST)
Received: from sharky.jerryweb.org (mna75-4-81-56-56-40.fbx.proxad.net
	[81.56.56.40])
	by smtp5-g21.free.fr (Postfix) with ESMTP id 7D41ED481CF;
	Mon,  6 Apr 2009 18:47:57 +0200 (CEST)
Received: by sharky.jerryweb.org (Postfix, from userid 1000)
	id 0BDC51840D9; Mon,  6 Apr 2009 18:48:00 +0200 (CEST)
From: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@bolloretelecom.eu>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Apr 2009 18:48:00 +0200
Message-Id: <1239036480-19478-1-git-send-email-jeremy.laine@bolloretelecom.eu>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.27.42.5
X-SA-Exim-Mail-From: sharky@sharky.jerryweb.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?utf-8?q?Jeremy=20Lain=C3=A9?= <jeremy.laine@m4x.org>
Subject: [STABLE][PATCH] flite-1.3: use LDFLAGS (fixes QA error)
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
X-List-Received-Date: Mon, 06 Apr 2009 16:50:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>


Signed-off-by: Jeremy Lain=C3=A9 <jeremy.laine@m4x.org>
---
 recipes/flite/flite-1.3/flite-1.3-Makefile.patch |    3 ++-
 recipes/flite/flite_1.3.bb                       |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/flite/flite-1.3/flite-1.3-Makefile.patch b/recipes/f=
lite/flite-1.3/flite-1.3-Makefile.patch
index 9a1a82e..5b532fd 100644
--- a/recipes/flite/flite-1.3/flite-1.3-Makefile.patch
+++ b/recipes/flite/flite-1.3/flite-1.3-Makefile.patch
@@ -317,9 +317,10 @@ Index: config/common_make_rules
  	@ rm -rf shared_os && mkdir shared_os
  	@ rm -f $@ $(LIBDIR)/$@.${PROJECT_VERSION} $(LIBDIR)/$@.${PROJECT_SHLI=
B_VERSION}=20
  	@ (cd shared_os && ar x ../$<)
- 	@ (cd shared_os && $(CC) -shared -Wl,-soname,$@.${PROJECT_SHLIB_VERSIO=
N} -o ../$@.${PROJECT_VERSION} *.os)
+-	@ (cd shared_os && $(CC) -shared -Wl,-soname,$@.${PROJECT_SHLIB_VERSIO=
N} -o ../$@.${PROJECT_VERSION} *.os)
 -	@ ln -s $(LIBDIR)/$@.${PROJECT_VERSION} $(LIBDIR)/$@.${PROJECT_SHLIB_V=
ERSION}
 -	@ ln -s $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION} $(LIBDIR)/$@
++	@ (cd shared_os && $(CC) $(LDFLAGS) -shared -Wl,-soname,$@.${PROJECT_S=
HLIB_VERSION} -o ../$@.${PROJECT_VERSION} *.os)
 +	#@ ln -s $(LIBDIR)/$@.${PROJECT_VERSION} $(LIBDIR)/$@.${PROJECT_SHLIB_=
VERSION}
 +	#@ ln -s $(LIBDIR)/$@.${PROJECT_SHLIB_VERSION} $(LIBDIR)/$@
 +	@ ln -s $@.${PROJECT_VERSION} $@.${PROJECT_SHLIB_VERSION}
diff --git a/recipes/flite/flite_1.3.bb b/recipes/flite/flite_1.3.bb
index 360ccb0..b553689 100644
--- a/recipes/flite/flite_1.3.bb
+++ b/recipes/flite/flite_1.3.bb
@@ -1,6 +1,6 @@
 require flite.inc
=20
-PR =3D "r3"
+PR =3D "r4"
=20
 EXTRA_OECONF =3D "--with-audio=3Doss --enable-shared"
=20
--=20
1.6.2.1



