Return-Path: <joe@deserted.net>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 85F296E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 00:59:28 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id m12so2688955iga.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:59:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=yC/CcECUndqZFGQTcFvHAEtPz5qGitlJf2JLjQbJRnY=;
	b=Ej3tmaGestuuTLyGqZe488BOxaUhv520LjATqvmIuo7n5sVTZIgEu01rit4umt+hfO
	SH2gmQz9MfEKGrMWxbzCtRMXlg00umsulFVa8a5Q06jGFOSUYG7TL62ak5LMc6qIx2Z4
	R9sW+HsPH8RENciTEDvyPBYbIEczelikVC1jHyvtQ9eHR0hPcidHK1EQ1YS6pUWRaIq0
	yVZw+siJtSios+GBtZx14RzVzvzJm1C1fGR2+NKUVcyXwc7PAivkOzajN5MGU53bMjhw
	xHgfbrmhAlZtvX0/NMQ9yf6zRb4dwf/NitupFAqncY+FHVvz2D2MhjklqxDTUbXhCRQk
	RmYg==
X-Gm-Message-State: ALoCoQnQpua+l5FwDqsH0zwNEyqNwDJkREj8yCXPULq+W7uWKRwUSNG6OlyTeRuxw441+HJqatFn
X-Received: by 10.50.153.79 with SMTP id ve15mr611966igb.40.1392253169561;
	Wed, 12 Feb 2014 16:59:29 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	om7sm1529648igb.10.2014.02.12.16.59.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 16:59:28 -0800 (PST)
Date: Wed, 12 Feb 2014 19:59:26 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140213005923.GE23405@deserted.net>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
	<CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Thu, 13 Feb 2014 00:59:28 -0000
X-Groupsio-MsgNum: 48130
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dgjlcl3Tl+kb3YDk"
Content-Disposition: inline

--dgjlcl3Tl+kb3YDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] [PATCH] traceroute: filter-out patches dir] On =
14.01.22 (Wed 12:21) Otavio Salvador wrote:

> On Mon, Jan 20, 2014 at 10:52 AM, Robert Yang <liezhi.yang@windriver.com>=
 wrote:
> > The $(subdirs) contains all the dirs under the ${B}, and this one:
> >
> > do_unpack[cleandirs] =3D "${S}/patches"
> >
> > will create a "patches" dir, then there will be compile errors, filter
> > out the patches will fix the problem.
> >
> > Note: poky doesn't have this problem since it separates the ${S} and
> > ${B}
> >
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>=20
> Couldn't we change it for OE-Core as well? So we avoid having to patch
> the build system.

That seems sensible.  I've not seen any follow-up on this, so I'm going
to drop this patch and assume this is a change being done in OE-Core (if
it hasn't already been done there).

--=20
-Joe MacDonald.
:wq

--dgjlcl3Tl+kb3YDk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL8GOsACgkQwFvcllog0XzeJQCgr2N6mWGtm91XWES4hnYLq6TR
Y5QAn36VCeWweuBv2MvpGv7C9OYPyIdC
=RsBe
-----END PGP SIGNATURE-----

--dgjlcl3Tl+kb3YDk--
