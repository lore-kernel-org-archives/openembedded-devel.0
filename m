Received: from dd20204.kasserver.com ([85.13.140.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bernhard.guillon@opensimpad.org>) id 1NglHR-0005Js-Oo
	for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 21:41:28 +0100
Received: from dd20204.kasserver.com (kasmail3.kasserver.com [85.13.143.1])
	by dd20204.kasserver.com (Postfix) with SMTP id 3C855185B3BD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 21:38:51 +0100 (CET)
In-Reply-To: <hl9luq$dgl$1@ger.gmane.org>
from: bernhard.guillon@opensimpad.org
to: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-SenderIP: 95.90.75.53
Message-Id: <20100214203851.3C855185B3BD2@dd20204.kasserver.com>
Date: Sun, 14 Feb 2010 21:38:51 +0100 (CET)
X-SA-Exim-Connect-IP: 85.13.140.93
X-SA-Exim-Mail-From: bernhard.guillon@opensimpad.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 20:41:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

> > classes/pkgconfig.bbclass suggests that .pc are fixed up in
> > do_install_prepend() (why does the efl class duplicate this, btw?)
> > and that this depends on stage.
>=20
> Because the efl classes suck, they also override things like PACKAGES.
> With new-style staging and the current state of e svn we should be able
> to get rid of that crap altogether.
>=20
> That reminds me, I wanted to add
>=20
> do_configure_prepend() {
> 	 autopoint
> }
>=20
> to those clase to make the modules build again.

I found the problem for blackbox. The path is in -rlink-path and this is =
currently ignored by pkgconfig.bbclass.

This fixed it on my system but I have no clue if this is a good idea at a=
ll :D

diff --git a/classes/pkgconfig.bbclass b/classes/pkgconfig.bbclass
index f3d9371..1da508f 100644
--- a/classes/pkgconfig.bbclass
+++ b/classes/pkgconfig.bbclass
@@ -3,7 +3,7 @@ DEPENDS_prepend =3D "pkgconfig-native "
 do_install_prepend () {
=20
 for i in `find ${S}/ -name "*.pc" -type f` ; do=20
-            sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDI=
R}::g' $i
+            sed -i -e 's:-L${STAGING_LIBDIR}::g' -e 's:-I${STAGING_INCDI=
R}::g' -e 's:-rpath-link,${STAGING_LIBDIR}::g' $i
         done
 }


Should I prepare a proper patch for pkgconfig.bbclass and send it to the =
list or is this approach the wrong way?

Best regards
Bernhard Guillon





