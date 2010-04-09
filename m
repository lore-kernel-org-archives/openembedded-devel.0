Received: from smtp-out05a.alice.it ([85.33.3.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O0K7t-0007nO-EG
	for openembedded-devel@openembedded.org; Fri, 09 Apr 2010 21:44:32 +0200
Received: from FBCMMO04.fbc.local ([7.168.68.254]) by smtp-OUT05A.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 9 Apr 2010 21:39:53 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 9 Apr 2010 21:39:53 +0200
Received: from jcn ([82.57.79.100]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 9 Apr 2010 21:39:51 +0200
Date: Fri, 9 Apr 2010 21:39:45 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100409213945.fdbf907b.ospite@studenti.unina.it>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 09 Apr 2010 19:39:51.0889 (UTC)
	FILETIME=[6C2A8410:01CAD81C]
X-SA-Exim-Connect-IP: 85.33.3.5
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL, BAYES_00, RCVD_ILLEGAL_IP
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: libmokoui2 needs pygtk-codegen-2.0
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
X-List-Received-Date: Fri, 09 Apr 2010 19:44:32 -0000
X-Groupsio-MsgNum: 18541
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__9_Apr_2010_21_39_45_+0200_Noy228fuGV+zpheA"

--Signature=_Fri__9_Apr_2010_21_39_45_+0200_Noy228fuGV+zpheA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

when building libmokoui2 I get this:
http://tinderbox.openembedded.org/packages/544186/

basically:
/bin/sh: pygtk-codegen-2.0: command not found

With this change to python-pygtk_2.16.0.bb I can make it build:

diff --git a/recipes/python/python-pygtk_2.16.0.bb b/recipes/python/python-=
pygtk_2.16.0.bb
index e2b0602..de570c7 100644
--- a/recipes/python/python-pygtk_2.16.0.bb
+++ b/recipes/python/python-pygtk_2.16.0.bb
@@ -36,7 +36,6 @@ do_configure_prepend() {
 # dirty fix #1: remove dependency on python-pygobject-dev
 do_install_append() {
        find ${D} -name "*.la"|xargs rm -f
-       rm -f ${D}/${bindir}/pygtk-codegen-2.0
        rm -rf ${D}/${libdir}/pkgconfig
 }

Is this the way to go? Why pygtk-codegen-2.0 is not supplied?

This is one of the very few issues which prevent me from building
fso-zhone-image from a fresh setup.

Thanks,
   Antonio

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Fri__9_Apr_2010_21_39_45_+0200_Noy228fuGV+zpheA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku/goEACgkQ5xr2akVTsAEOwACdHb7V7oTOgu5hoHs9RPIDK5pg
HzwAnih/eyp+dR1QMlR8MGfzIQxjfN6V
=krmB
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Apr_2010_21_39_45_+0200_Noy228fuGV+zpheA--
