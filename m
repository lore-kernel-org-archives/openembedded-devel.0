Received: from smtp-out115.alice.it ([85.37.17.115])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1OLWlt-0003XG-Kq
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 09:29:22 +0200
Received: from FBCMMO02.fbc.local ([192.168.68.196]) by smtp-out115.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 09:25:01 +0200
Received: from FBCMCL01B04.fbc.local ([192.168.69.85]) by FBCMMO02.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 7 Jun 2010 09:25:01 +0200
Received: from jcn ([87.3.140.153]) by FBCMCL01B04.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 7 Jun 2010 09:24:59 +0200
Date: Mon, 7 Jun 2010 09:24:54 +0200
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100607092454.54ea161f.ospite@studenti.unina.it>
In-Reply-To: <hu0602$c6i$2@dough.gmane.org>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<1275299757-28908-2-git-send-email-ospite@studenti.unina.it>
	<hu0602$c6i$2@dough.gmane.org>
X-Mailer: Sylpheed 3.0.2 (GTK+ 2.20.1; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 07 Jun 2010 07:24:59.0955 (UTC)
	FILETIME=[89B29030:01CB0612]
X-SA-Exim-Connect-IP: 85.37.17.115
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>,
	Michael 'Mickey' Lauer <mickey@vanille-media.de>,
	openezx-devel@lists.gnumonks.org
Subject: Re: [PATCH 01/12] fso-image.inc: add an even shorter alias, for ls -l
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
X-List-Received-Date: Mon, 07 Jun 2010 07:29:22 -0000
X-Groupsio-MsgNum: 19957
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__7_Jun_2010_09_24_54_+0200_daunINajs227Yxve"

--Signature=_Mon__7_Jun_2010_09_24_54_+0200_daunINajs227Yxve
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, 31 May 2010 13:19:30 +0200
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 31-05-10 11:55, Antonio Ospite wrote:
> > 'l' is a must have along with 'll'.
> >=20
> > Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
[...]
> diff --git a/recipes/images/fso-image.inc b/recipes/images/fso-image.inc
[...]
> > +    echo "alias l=3D'ls -l'" >>./etc/profile
> >      echo "alias ll=3D'ls -al'" >>./etc/profile
> >      # nfs
> >      mkdir -p ./local/pkg
>=20
> And what happens if you opkg upgrade base-files? You suddenly lost all
> your tweaks to /etc/profile.

Right, /etc/profile would be overwritten, but that's quite independent
from this very patch, it's the whole fso-image.inc approach which
should be revised, so I'd like this one could still make it.

Or if you can point to the right way to do what
recipes/images/fso-image.inc::fso_rootfs_postprocess() is doing I can
try to implement that.

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

--Signature=_Mon__7_Jun_2010_09_24_54_+0200_daunINajs227Yxve
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkwMnsYACgkQ5xr2akVTsAEX7QCdEx8FhARri6bFkB8jtw0aMj6s
kJcAnj2xb9YYlVGqVraDRTKNyMhvyxIY
=BEkI
-----END PGP SIGNATURE-----

--Signature=_Mon__7_Jun_2010_09_24_54_+0200_daunINajs227Yxve--
