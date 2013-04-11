Received: from mail-we0-f179.google.com ([74.125.82.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQE55-0008KR-DK
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 11:46:20 +0200
Received: by mail-we0-f179.google.com with SMTP id p43so1092635wea.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 02:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=mMDVSp1JmsSY8pqkgR+ngEmYykfbZgow/YXswP9iOSM=;
	b=ya0PWMdQ5fUsliDUu74ZJOCTrLmbafVaAhg3QSwYF4D+cA54B0wuI2woWxulojl6ar
	R62xSU62h3XGAewDIVX2CNZ7a1Y7rAa2ZFcYAd7+0Z7LoRka9yGa7W0P+x+GRNpjOYzg
	QHHDTlGFpeyWe/87UWqITDggrf9efWZGJfiVEPKZZMJtpZv1CLqSoZL3ZnWyE6tGy+JB
	mXr5oXXTeX+h3PKQFH83uvJTqUKelEPZYapVIZ1GCYmFDrhMxmeteUDb3FAlxVi2K9pM
	xk7zvuEv+wakfFUkLB8OC6VL1ISpKkFluFz2kiqkREVs9ndLmdhihP+ORzMVD+7X6wDg
	yz1A==
X-Received: by 10.194.11.70 with SMTP id o6mr9217567wjb.29.1365672528676;
	Thu, 11 Apr 2013 02:28:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s2sm2170629wib.4.2013.04.11.02.28.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 02:28:48 -0700 (PDT)
Date: Thu, 11 Apr 2013 11:28:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130411092850.GA2477@jama>
References: <1365610462-29689-1-git-send-email-koen@dominion.thruhere.net>
	<1365610462-29689-4-git-send-email-koen@dominion.thruhere.net>
	<20130410220423.GH2471@jama>
	<9B4BCA43-0F29-4F57-A776-281D257DAC37@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <9B4BCA43-0F29-4F57-A776-281D257DAC37@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 4/8] gateone: fix html5 feature check
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
X-List-Received-Date: Thu, 11 Apr 2013 09:46:27 -0000
X-Groupsio-MsgNum: 44054
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 11, 2013 at 07:33:10AM +0200, Koen Kooi wrote:
>=20
> Op 11 apr. 2013, om 00:04 heeft Martin Jansa <martin.jansa@gmail.com> het=
 volgende geschreven:
>=20
> > On Wed, Apr 10, 2013 at 06:14:18PM +0200, Koen Kooi wrote:
> >> The BlobBuilder and Blob checks never succeeded, even on cutting edge =
browsers. Nudge SRCREV forward to drag in those fixes.
> >>=20
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta-oe/recipes-connectivity/gateone/gateone_git.bb | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>=20
> >> diff --git a/meta-oe/recipes-connectivity/gateone/gateone_git.bb b/met=
a-oe/recipes-connectivity/gateone/gateone_git.bb
> >> index 652876f..8133cf9 100644
> >> --- a/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> >> +++ b/meta-oe/recipes-connectivity/gateone/gateone_git.bb
> >> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dee5b168=
fc7de89a0cadc49e27830aa2c"
> >> PR =3D "r9"
> >>=20
> >> PV =3D "1.1"
> >> -SRCREV =3D "bb74e1095adb66b04b51ed6ff10ae0aa96afdd46"
> >> +SRCREV =3D "ea5db3dcb3bbbe445ae6d1a5611c1f8d547c57b9"
> >=20
> > I'll at least bump PR in this one.
>=20
> Wait, what? Isn't PRSERV mandatory nowadays?

Yes but for different SRCREV I would like to see it in something more
stable then PRSERV (e.g. to be able to compare .ipk files from different
builders and see which one has this newer SRCREV.)

Ideally add SRCPV to PV :).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFmglIACgkQN1Ujt2V2gBx+XgCeNVJL+2w9ZJchOoBqWokoVasm
mb8An0tfxyz+Yd9cdrcm950UIVBTPbFj
=196K
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
