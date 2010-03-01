Received: from smtp-out108.alice.it ([85.37.17.108])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ospite@studenti.unina.it>) id 1Nm81A-0000xw-Se
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 16:58:54 +0100
Received: from FBCMMO03.fbc.local ([192.168.68.197]) by smtp-out108.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 16:54:53 +0100
Received: from FBCMCL01B08.fbc.local ([192.168.171.46]) by FBCMMO03.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 1 Mar 2010 16:54:53 +0100
Received: from badebec ([87.3.28.51]) by FBCMCL01B08.fbc.local with Microsoft
	SMTPSVC(6.0.3790.3959); Mon, 1 Mar 2010 16:54:53 +0100
Date: Mon, 1 Mar 2010 16:54:44 +0100
From: Antonio Ospite <ospite@studenti.unina.it>
To: openembedded-devel@lists.openembedded.org
Message-Id: <20100301165444.82e3fa2e.ospite@studenti.unina.it>
In-Reply-To: <1267394698.13054.5.camel@andromeda>
References: <1267383448-7009-1-git-send-email-ospite@studenti.unina.it>
	<hmehnp$n57$1@dough.gmane.org> <4B8AE4F8.1000906@balister.org>
	<1267394698.13054.5.camel@andromeda>
X-Mailer: Sylpheed 3.0.0 (GTK+ 2.18.7; i486-pc-linux-gnu)
X-Face: z*RaLf`X<@C75u6Ig9}{oW$H; 1_\2t5)({*|jhM<pyWR#k60!#=#>/Vb;
	]yA5<GWI5`6u&+ ; 6b'@y|8w"wB;
	4/e!7wYYrcqdJFY,~%Gk_4]cq$Ei/7<j&N3ah(m`ku?pX.&+~:_/wC~dwn^)MizBG
	!pE^+iDQQ1yC6^,)YDKkxDd!T>\I~93>J<_`<4)A{':UrE
Mime-Version: 1.0
X-OriginalArrivalTime: 01 Mar 2010 15:54:53.0777 (UTC)
	FILETIME=[888DD410:01CAB957]
X-SA-Exim-Connect-IP: 85.37.17.108
X-SA-Exim-Mail-From: ospite@studenti.unina.it
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Subject: Re: [PATCH] ezx: Use pulseaudio 0.9.15
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
X-List-Received-Date: Mon, 01 Mar 2010 15:58:54 -0000
X-Groupsio-MsgNum: 17194
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="PGP-SHA1";
	boundary="Signature=_Mon__1_Mar_2010_16_54_45_+0100_5mSdOCEao+pf60PV"

--Signature=_Mon__1_Mar_2010_16_54_45_+0100_5mSdOCEao+pf60PV
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, 28 Feb 2010 23:04:58 +0100
"Michael 'Mickey' Lauer" <mickey@vanille-media.de> wrote:

> Am Sonntag, den 28.02.2010, 16:49 -0500 schrieb Philip Balister:
> > On 02/28/2010 02:55 PM, Koen Kooi wrote:
> > >
> > > On 28-02-10 19:57, Antonio Ospite wrote:
[...]
> > >> Cfr: http://bugs.openembedded.org/show_bug.cgi?id=3D5404
[...]
> > > NAK: machines have no business setting versions (except for kernels a=
nd
> > > even that is debatable).
> > >
> > > If it doesn't build, fix your distro.
> >=20
> > I'm with Koen here, machines may be used by other distros so forcing=20
> > revision selection for recipes (other than directly impact the machine)=
=20
> > has no business in machine files.
>

Be patient but my knowledge of OE is still limited, the point here is
that distros can override PREFERRED_VERSIONs set in machine files, isn't
it?

> Of course one could argue that there is a bug in the OE recipes metadata
> rather than the distro, since the pulseaudio recipes are known broken
> for certain architectures -- however they don't contain any blacklisting
> or whitelisting except for om-gta01/om-gta02 which I added when I became
> aware of the problem. Antonio, lets just blacklist the broken versions
> for the machines you're interested in.
>
> :M:

I can well add DEFAULT_PREFERENCE_om-a780 =3D "-1"
in both pulseaudio_0.9.21.bb and pulseaudio_0.9.19.bb
Is that what you mean Mickey?
Way better than my solution but still a bit hackish.
If that's OK for you, it'll be fine with me as well.

About fixing distro, isn't 'minimal' supposed to build all the latest
recipes? If so a  conf/distro/include/preferred-minimal-versions.inc
would not have much sense if we can't set preference rules per
machines (or archs).

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

--Signature=_Mon__1_Mar_2010_16_54_45_+0100_5mSdOCEao+pf60PV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkuL40UACgkQ5xr2akVTsAH25ACeI3I1bFE47UYoe49X4nhOgyF1
xKIAnjOMZQ2rMnJV6NaLOeD83PztxQoI
=M2Gd
-----END PGP SIGNATURE-----

--Signature=_Mon__1_Mar_2010_16_54_45_+0100_5mSdOCEao+pf60PV--
