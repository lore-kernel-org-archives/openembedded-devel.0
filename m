Return-Path: <joe@deserted.net>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id A248A6E939
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:56:33 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id k19so12185759igc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=d6ht4Utd8LBJt75CkpLAKT80YowGGaayC2JbONZzZrs=;
	b=F+QTtrBt5trkflijR4ZLUy0UYjdqYB2nvhUnAWJx08dtxxCX8IZDvJBFMKEl7tijWK
	ev9Y8wT5DmzgHg3WTiDk6MhrVp8OwLUK2TI2TvyNM6YQaKPCC/cfeZSi+Qn6dOI2fOCj
	eQGWzt5zmjzdEoSAVlaFC5nB/leuRN9QFZwUkntbZihoEzT4hawBCJArTR/4oqQ/wCaY
	Lkq8/rMLQw5dNmOXz864CfolcvcyffHsFyCcmbGjLFeNdmKxJjCdz2oouF7veynG/et2
	oYMn446elVWZzjMxpKZABclhCppHSCuVnav7EI+TLYeKRUTA0rTwktVOkeXgJHTdML8s
	J6dw==
X-Gm-Message-State: ALoCoQm+vNpvxJBaYBWxZNMnZ4DW+xh8O6yfcwjgEBl/qRZHprEhJUKQdE4I3SWlcJXlRT8J3iol
X-Received: by 10.42.214.80 with SMTP id gz16mr32203142icb.6.1392263794804;
	Wed, 12 Feb 2014 19:56:34 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	om7sm2654203igb.10.2014.02.12.19.56.33
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 19:56:34 -0800 (PST)
Date: Wed, 12 Feb 2014 22:56:31 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140213035629.GH23405@deserted.net>
References: <1390284784-25950-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKoUDMLD834HhwQOpyn6Q4Gb2jtN7Rw2EB7pnqW+G9H+pw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoUDMLD834HhwQOpyn6Q4Gb2jtN7Rw2EB7pnqW+G9H+pw@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] inetutils: disable rpath
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
X-List-Received-Date: Thu, 13 Feb 2014 03:56:33 -0000
X-Groupsio-MsgNum: 48136
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pe+tqlI1iYzVj1X/"
Content-Disposition: inline

--pe+tqlI1iYzVj1X/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged.  Thanks.
-J.

[Re: [oe] [PATCH meta-networking] inetutils: disable rpath] On 14.01.22 (We=
d 12:30) Otavio Salvador wrote:

> On Tue, Jan 21, 2014 at 4:13 AM,  <rongqing.li@windriver.com> wrote:
> > From: Roy Li <rongqing.li@windriver.com>
> >
> > The rpath, which configuration computers, is a host-related path in
> > cross-compile environment; In fact, need to not add rpath into elf
> > file.
> >
> >    WARNING: QA Issue: package inetutils-ftp contains bad RPATH
> >    /buildarea/build/new/bitbake_build/tmp/sysroots/qemux86-64/usr/lib64=
 in file
> >    /buildarea/build/new/bitbake_build/tmp/work/x86_64-wrs-linux/inetuti=
ls/1.9.1-r1/packages-split/inetutils-ftp/usr/bin/ftp.inetutils
> >
> > Signed-off-by: Roy Li <rongqing.li@windriver.com>
>=20
>=20
> Reviewed-by: Otavio Salvador <otavio@ossystems.com.br>
>=20
>=20
--=20
-Joe MacDonald.
:wq

--pe+tqlI1iYzVj1X/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL8Qm0ACgkQwFvcllog0XxhaQCeODaILR4m6QBKfeSH/0OB1vlD
pnUAnRFp/RVKXbIwfos7+J+cCtK3ynzC
=xgna
-----END PGP SIGNATURE-----

--pe+tqlI1iYzVj1X/--
