Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 07B5B6E2C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 14:53:39 +0000 (UTC)
Received: by widdi4 with SMTP id di4so76094649wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 07:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tASUHCwDFk/N/SIWtw4OSF9i+PXtEQdK2sGHpvS4HvE=;
	b=pkN3UUprRzI5U3iIbk0rVSBfqtzFoHFv17VQTJVncO8Q8I4XsITVbFWBE4XUtctKiO
	WnmQrNZhHUATTZEJtHbd0rxRaLoqFZ+dP/4889Fx43Lmmzt4qnNiQ1aypkWHY7y1DbEr
	GxVepy2JF6cZmEI8jXskHYc+gCvPEn/UsJ5wgmeUtOwzYB76zmDotMXafqEfs84RdDAA
	NnHtSHJVH1NLYYJ3u2c66cD68erQd6Lm39xuod+Q61QfXH0JpjI8b/SdFrlW2FQ95k8O
	fXYIZZeJpkVgvusRfma7swhmiarAdnP2L7PZ+wmicccj1gkUe8qDpHForI/R2rSM5UoS
	6VgA==
X-Received: by 10.194.86.135 with SMTP id p7mr29094806wjz.89.1428936820142;
	Mon, 13 Apr 2015 07:53:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ey10sm13157895wib.2.2015.04.13.07.53.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 07:53:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 16:53:43 +0200
To: Stephan Binner <stephan.binner@basyskom.com>
Message-ID: <20150413145343.GI2330@jama>
References: <CA+chaQdFo2M-=_PP7x-KnPEvEAQLX9vkudnaC9VJQxe90AhTbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQdFo2M-=_PP7x-KnPEvEAQLX9vkudnaC9VJQxe90AhTbQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] Qt 5.5 Alpha Recipes?
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
X-List-Received-Date: Mon, 13 Apr 2015 14:53:42 -0000
X-Groupsio-MsgNum: 55068
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="byLs0wutDcxFdwtm"
Content-Disposition: inline

--byLs0wutDcxFdwtm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> I don't want to promise anything but I may have some time to spend on > i=
t...

Any luck with this? Now I have use-case for both 5.4.2 (for Yocto 1.8
Fido branch) and 5.5 (for master branch as in LuneOS we decided to skip
upgrade to 5.4 and go directly to 5.5).

If you already work on it, I'll do the 2nd option.

Thanks,

On Mon, Mar 30, 2015 at 05:41:47PM +0200, Martin Jansa wrote:
> Hello Stephan,
>=20
> they usually follow "stable" branch, but that's not a rule, it can be
> changed to any branch as long as you update corresponding variable.
>=20
> For myself I don't know if we'll be more interested in trying newer
> revision in 5.4 (e.g. if we find critical bug in 5.4.1 which is supposed =
to
> be fixed in 5.4.2) or trying new features from 5.5.
>=20
> I think it's safe to say that "fido" branch should only get 5.4.x* in git
> recipes and lets leave 5.5-alpha only for master branch. Fido branch will
> be created soon (1-2 weeks).
>=20
> How does this sound?
>=20
> CCing oe-devel in case someone else wanted to start on it.
>=20
> On Mon, Mar 30, 2015 at 1:13 PM, Stephan Binner <stephan.binner@basyskom.=
com
> > wrote:
>=20
> > Hello Martin,
> >
> > with which Qt development release (Alpha, Beta, RC) are the qt*_git.bb
> > recipes
> > usually upgraded to next major version? If with Alpha are you working o=
n or
> > aware of anybody currently working on upgrading qt*_git.bb to Qt 5.5
> > Alpha?
> >
> > I don't want to promise anything but I may have some time to spend on i=
t...
> >
> > Regards,
> > Stephan
> >
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--byLs0wutDcxFdwtm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUr2HcACgkQN1Ujt2V2gBz5DgCgmoKgdmFva0nP3D4+VdZkZ1rz
fwoAn0n7M+Qxgzt8npyKoP9thFXd4NJ2
=MnFX
-----END PGP SIGNATURE-----

--byLs0wutDcxFdwtm--
