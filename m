Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f46.google.com (unknown [209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id BC264660FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 10:21:07 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id ec20so620055lab.19
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 May 2014 03:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7+Z7kKVDPCeHOtZNX1RY/JEOwRTtzeiiBf2V6Z9x+Yo=;
	b=VO9mu8FPxKPciiu+g+mPlkqFgZY/uibHOose7SkjmQSm7dFGfqBpALpdQFdrY2W0Vg
	5YsS4+7tAVYrvCq+RH1GrLeQE8oJ191BQ6tCdQaeqhzeTy4pfUJTpBtnbnBOYdUbGNdG
	hSFEuFkwrEZ+bNcEVOQOHXHbhWuijbWc7udxGtrytwORUf0lrRj0442SFIdqaR6L85xd
	8YUjL9r2etrIL+kNFSCq88P8R08mYjZCPioRA+JlvXn55AZUArndnv0Rgp/YW/DR1Ja5
	JOmq2pdH4b2qTq+u9if7POGF5CN3L9O2crYppsMi+6GmqqG1AuqpSPCltHLRLyIDhXp0
	7dEw==
X-Received: by 10.112.118.197 with SMTP id ko5mr6510578lbb.23.1400149267831;
	Thu, 15 May 2014 03:21:07 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	q8sm4908061lbr.28.2014.05.15.03.21.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 May 2014 03:21:06 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 15 May 2014 12:21:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Message-ID: <20140515102136.GB2433@jama>
References: <1398698859-15011-1-git-send-email-otavio@ossystems.com.br>
	<20140504214712.GG2486@jama>
	<CAP9ODKpL+SMvus2o_kY_-gYgxu95E3ahiBsKwFQxQGn93f69ug@mail.gmail.com>
	<CAP9ODKo43jUETHixm0_wBjL=zwJcb+BdgQV2MLKnte2FdCe5Mg@mail.gmail.com>
	<CAGiJk9cPtJfRwOfUB3gEsFzhLSsegSf_Fk4k_YnqJg=FsG1XoQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGiJk9cPtJfRwOfUB3gEsFzhLSsegSf_Fk4k_YnqJg=FsG1XoQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qtbase.inc: Enable accessibility by default
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
X-List-Received-Date: Thu, 15 May 2014 10:21:10 -0000
X-Groupsio-MsgNum: 49942
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline

--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2014 at 11:16:00AM +0200, Samuel Stirtzel wrote:
> 2014-05-14 21:04 GMT+02:00 Otavio Salvador <otavio@ossystems.com.br>:
> > Hello folks,
> >
> > On Mon, May 5, 2014 at 9:21 AM, Otavio Salvador <otavio@ossystems.com.b=
r> wrote:
> >> On Sun, May 4, 2014 at 6:47 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >>> On Mon, Apr 28, 2014 at 12:27:39PM -0300, Otavio Salvador wrote:
> >>>> qtdeclarative requires accessibility to be enabled and it is added by
> >>>> default to the toolchain so we ought to have it enabled to ensure the
> >>>> default toolchain generation works.
> >>>>
> >>>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> >> ...
> >>> As I told you on gtalk, I would prefer default to stay as minimal as
> >>> posible, why don't you change packagegroup-qt5-toolchain-target.bb to
> >>> use RRECOMMENDS instead of RDEPENDS so that missing
> >>> qtquickcontrols-qmlplugins package doesn't break it when it's not
> >>> available (because it's empty)?
> >>
> >> I don't have a strong opinion for either case however I think we ought
> >> to know what other meta-qt5 users think about it.
> >>
> >> In support to this patch addition I think we ought to provide the most
> >> used features of Qt5 working out of box to users have a good first
> >> use. Special cases can customize it per need basis. I think QML is
> >> common enough for us to provide full support for it by default.
> >
> >
> > Martin and I have different views on this topic and I'd like to merge
> > or drop this patch. Could people comment on this one?
> >
>=20
>=20
> We may want to be able to let the user choose between 2 flavors of Qt.
>=20
> One of them could be a standard Qt (which is what I use), other users
> seem to prefer a stripped down version with some features switched
> off.
>=20
> As 'Giuseppe D'Angelo <giuseppe.dangelo@kdab.com>' noted on qt-interest [=
1]:
> "Apart from this: builds with feature switches are not really tested,
> so I'm not surprised that [there are combinations that don't even
> build]. But we totally welcome patches that would fix such builds."
>=20
> So IMO it would be a good idea to have a constantly tested low
> footprint version.
>=20
> There is no one size fits all in this case, but can we provide 2
> versions that work for 99% of the users?

What you mean by 2 versions here?

There is simple PACKAGECONFIG option to enable more features (most
people will probably enable icu, gl* and accessibility).

But we don't want 2 qtbase recipes one with more PACKAGECONFIG options
enabled and other with more disabled.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlN0lTAACgkQN1Ujt2V2gByZsACgjGwv9rVluveLaQ3qaYjbouI3
wPYAniWnio4ClVm4zK+rWYF6aPiWdDSs
=2qWV
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
