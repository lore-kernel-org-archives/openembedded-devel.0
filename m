Received: from smtp-out30.alice.it ([85.33.2.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1O0Jp3-0002xQ-Ln
	for openembedded-devel@lists.openembedded.org;
	Fri, 09 Apr 2010 21:24:59 +0200
Received: from FBCMMO04.fbc.local ([192.168.184.135]) by smtp-out30.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 9 Apr 2010 21:21:34 +0200
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO04.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 9 Apr 2010 21:21:13 +0200
Received: from jcn ([82.57.79.100]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Fri, 9 Apr 2010 21:21:12 +0200
Date: Fri, 9 Apr 2010 21:21:07 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100409212107.4a690d5f.ospite@studenti.unina.it>
In-Reply-To: <hpmma4$s8u$2@dough.gmane.org>
References: <20100408162117.e7638f69.ospite@studenti.unina.it>
	<1270761657-18322-1-git-send-email-ospite@studenti.unina.it>
	<hpmma4$s8u$2@dough.gmane.org>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.20.0; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 09 Apr 2010 19:21:12.0303 (UTC)
	FILETIME=[D0D73FF0:01CAD819]
X-SA-Exim-Connect-IP: 85.33.2.30
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] glib-2.0: remove old glib-2.0-native recipes
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
X-List-Received-Date: Fri, 09 Apr 2010 19:24:59 -0000
X-Groupsio-MsgNum: 18539
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Fri__9_Apr_2010_21_21_07_+0200_s9Xp2kRl.1n5AdMP"

--Signature=_Fri__9_Apr_2010_21_21_07_+0200_s9Xp2kRl.1n5AdMP
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 09 Apr 2010 09:51:31 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 08-04-10 23:20, Antonio Ospite wrote:
> > Having these around can cause some conflict in recipes depending on
> > recent glib-2.0-native, see [1].
> >=20
> > What can happen is that, when no preferred versions are set (like in
> > DISTRO=3Dminimal), bitbake picks up an older -native recipe even if a m=
ore
> > recent one using the BBCLASSEXTEND =3D "native" mechanism exists.
>=20
> If that's the actual problem, leave the recipes alone and set a
> PREFERRED_VERSION in your distro.

Well, could someone who knows bitbake better than me confirm that
it is actually giving preference to the older -native mechanism?

Plus, as mickeyl alludes, 'minimal' is not supposed to set preferences
explicitly, maybe also to expose such kind of bugs?

BTW, I was quite sure that my easy-way patch wouldn't fit everyone;
I can try converting glib-2.0-native_2.22.1.bb which someone is
actually using and drop the older ones, would that do?

Or maybe some more experienced OE dev could take the ball here. :)

A question: is there any autobuilder for DISTRO=3D"minimal" around which
builds some images from a fresh setup periodically to catch such issues?

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

--Signature=_Fri__9_Apr_2010_21_21_07_+0200_s9Xp2kRl.1n5AdMP
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAku/fiMACgkQ5xr2akVTsAFeXQCeMliNnV6AOekxJF+xiBcn3Iso
WGUAoIynWetjFlNAFRxnCNZnI6dPpByb
=KzGr
-----END PGP SIGNATURE-----

--Signature=_Fri__9_Apr_2010_21_21_07_+0200_s9Xp2kRl.1n5AdMP--
