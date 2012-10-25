Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TRT17-0006h6-JG
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Oct 2012 21:22:57 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1418559wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Oct 2012 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HIjzhjp7dlXNmIu2nEexcuecdxqy1PhcUDBRrsjziio=;
	b=vlRJxpkQvxnExKWahfSRkphVfR/LC4iij3z3JLmj2bNwdAIyLuglGh2f6GEmXRgJRY
	PJLErdKiA8abbpHJG/wZGBBLGk7CDnaMjoouSoyCm1t07GPz/qhDaCWcNokYUmAzzSYu
	PqFX9L6waGtBnMyGREO0CqGPlyIdDgGi7unOoHt54pYVR5u4/vzXT3T1GkSvcEo8X5Xm
	X5KSb7sxltL4Gfrey6+6JTtJyaAhUiTps7Vyq850gH/Vfew7zuQL0XyfHauIun+oDmnm
	w2BRPYJB7DXoIC2yawERRG8+51E4GkHTFe78uk6RK8dOkE4E95kuQ23WWtAYGInJNsiJ
	88WQ==
Received: by 10.216.202.97 with SMTP id c75mr8512132weo.211.1351192168417;
	Thu, 25 Oct 2012 12:09:28 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cu1sm11296242wib.6.2012.10.25.12.09.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 25 Oct 2012 12:09:25 -0700 (PDT)
Date: Thu, 25 Oct 2012 21:09:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20121025190944.GQ3269@jama.jama.net>
References: <k6b5r8$edu$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <k6b5r8$edu$1@ger.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: yocto 1.3 branch for meta-openembedded layers, RFC wanted.
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
X-List-Received-Date: Thu, 25 Oct 2012 19:22:57 -0000
X-Groupsio-MsgNum: 41294
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3LbzE+0aVzOo6fIw"
Content-Disposition: inline

--3LbzE+0aVzOo6fIw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 25, 2012 at 12:55:47PM +0200, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> We need a branch to track oe-core 'danny' and I am swamped till ELC-E
> happens, so I would like to hold off on patches that make meta-oe layers
> incompatible with oe-core 'danny'.

Agreed, I never used denzil, but I plan to stick official SHR builds to dan=
ny=20
branches (because I fear mandatory OEBasicHash in master soon).

> As for branch maintenance: any volunteers for managing the meta-openembed=
ded
> 'danny' branches? There doesn't need to be a single maintainer, but it wo=
uld
> be nice to have one person coordinating everything, even if it's just
> pulling in danny-next branches from the layer maintainers every week or s=
o.

I can take care of meta-efl and co-maintain the rest too.=20

Speaking of meta-efl I've upgrade to bugfix release 1.7.1 + EFL_SRCREV=20
bump ready for master in my branch, but plan to test it more, so not sure=
=20
if I should hold it off for longer and then backport it or test it faster :=
).

Cheers,

> As I said above, I'm swamped for the next 3 weeks, so can people who have
> used or are using the 'denzil' branch weigh in with feedback/anecdotes/et=
c?
> I have such a document for oe-core 'denzil', which I keep failing to send
> out, but it boils down to "better predictability for merge windows". Plea=
se
> share your experience for meta-oe here.
>=20
> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFQiRqzMkyGM64RGpERAschAJ98yscNYLI9qNGRviDm+drBquLttACgoa0X
> /YhGdFr+iYLy8n99sXb4zKE=3D
> =3DahtL
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3LbzE+0aVzOo6fIw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCJjngACgkQN1Ujt2V2gByHTwCgsFsbXTLV+JTSgchfXeUgU/HI
C6wAn036RnEVa1h98C1xY0hosbZNh+uJ
=n91a
-----END PGP SIGNATURE-----

--3LbzE+0aVzOo6fIw--
