Received: from smtp-out01.alice.it ([85.33.2.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1NuoNH-0008AV-0R
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 15:49:32 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out01.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 15:46:20 +0100
Received: from FBCMCL01B03.fbc.local ([192.168.69.84]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 25 Mar 2010 15:46:19 +0100
Received: from jcn ([80.116.251.127]) by FBCMCL01B03.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Thu, 25 Mar 2010 15:46:19 +0100
Date: Thu, 25 Mar 2010 15:46:13 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100325154613.d1dfe88a.ospite@studenti.unina.it>
In-Reply-To: <1269527063-17761-1-git-send-email-Martin.Jansa@gmail.com>
References: <1269527063-17761-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Sylpheed 3.0.1 (GTK+ 2.18.9; x86_64-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 25 Mar 2010 14:46:19.0474 (UTC)
	FILETIME=[EE270320:01CACC29]
X-SA-Exim-Connect-IP: 85.33.2.12
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] oestats-client: add metadata_scm inherit after base.bbclass split in 89b7e433719f43f1c36c76cb8856d559014e99bc
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
X-List-Received-Date: Thu, 25 Mar 2010 14:49:32 -0000
X-Groupsio-MsgNum: 18111
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Thu__25_Mar_2010_15_46_13_+0100_tgin5CqsIQ=+beWO"

--Signature=_Thu__25_Mar_2010_15_46_13_+0100_tgin5CqsIQ=+beWO
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, 25 Mar 2010 15:24:23 +0100
Martin Jansa <martin.jansa@gmail.com> wrote:

[...]
> --- a/classes/oestats-client.bbclass
> +++ b/classes/oestats-client.bbclass
> @@ -9,6 +9,8 @@
>  # OESTATS_BUILDER =3D "some_nickname"
>  #=20
> =20
> +inherit metadata_scm
> +

Hi Martin, this makes sense indeed, but can you please explain if/why my
previous patch[1] is not complete? In other words can oestats-client
be used without base.bbclass? Or is that "just" to make the inheritance
explicit?

Thanks,
   Antonio

[1]
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/018675.h=
tml

--=20
Antonio Ospite
http://ao2.it

PGP public key ID: 0x4553B001

A: Because it messes up the order in which people normally read text.
   See http://en.wikipedia.org/wiki/Posting_style
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

--Signature=_Thu__25_Mar_2010_15_46_13_+0100_tgin5CqsIQ=+beWO
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkurdzUACgkQ5xr2akVTsAH8zgCghOkKfM13fHliDLS1rYI/KcAm
A7UAn3lBAT0aZQ+OCa2m0xKilgRcl+7i
=dUx4
-----END PGP SIGNATURE-----

--Signature=_Thu__25_Mar_2010_15_46_13_+0100_tgin5CqsIQ=+beWO--
