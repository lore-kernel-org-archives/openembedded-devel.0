Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 762C276FB8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 13:08:26 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so27971872wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 06:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9MugLWOtGMD22DL9zZuxk2RmRzAYk4N0wosjeJrmnDo=;
	b=TAV/wwtjCwvpks8hx5jD6zkyWIOLoFPnt9lxMvm5MzQhbRJA6f1ZJjAecOY4ibAFEM
	QXur2uImbIqB6i3QSsAK6MUXvSGefMeSzKR5eDSdJ9gcw2XRryhv1L3N9AygpHZPcwkP
	D3RaGgv31IQ63nT0HR1XOwPDfFFpEpWLxOQCgRxj5EBMV7w3ljQVu9o+d6lIt57Ro97o
	4DdhhlFVGvLUxV4EllyKxmxo+KZeh3egMxHSKXwRpzJLU6GScwVj5gRkjWBOI8eqCW9J
	8ICMAypVPgWwBXlUZa4KGryuq2L9UfI19AzjoHzvjPAr2i4SNqcSRfB2+gcszvEnu6gu
	Cguw==
X-Received: by 10.194.95.136 with SMTP id dk8mr39278359wjb.60.1442322506104;
	Tue, 15 Sep 2015 06:08:26 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	pb4sm13392531wjb.8.2015.09.15.06.08.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Sep 2015 06:08:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2015 15:08:29 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150915130829.GA2379@jama>
References: <55F7EF3A.7020403@topic.nl>
	<CAJTo0LZQhC+QjAcNxxUuQpUkfWgXc-rVDohQe-sb8Ch1d57R2g@mail.gmail.com>
	<CAJTo0LZVtrC-93qCesHSpet689+3vQN=Wc0+N46_H8g4qkFb7A@mail.gmail.com>
	<CAHiDW_H0Nu_T_PVzE+9q0OaD6s+MRFTvRHNJw4ZNaXPD9kVfwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHiDW_H0Nu_T_PVzE+9q0OaD6s+MRFTvRHNJw4ZNaXPD9kVfwA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: gnome-icon-theme?
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
X-List-Received-Date: Tue, 15 Sep 2015 13:08:26 -0000
X-Groupsio-MsgNum: 57363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Qxx1br4bt0+wmkIi"
Content-Disposition: inline

--Qxx1br4bt0+wmkIi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2015 at 03:26:01PM +0300, Jussi Kukkonen wrote:
> On 15 September 2015 at 14:14, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On 15 September 2015 at 12:13, Burton, Ross <ross.burton@intel.com> wro=
te:
> >
> > > Yeah this was just removed from oe-core but the addition to meta-oe
> hasn't
> > > happened.  I can send a patch now if there isn't one on the list.
> > >
> >
> > Hm, alternatively,  we make adwaita-icon-theme provide gnome-icon-theme,
> as
> > they're broadly compatible anyway.  Any thoughts?
>=20
> gnome-icon-theme has effectively been abandonware since adwaita become the
> actual gnome icon theme so I'd suggest not adding it if adwaita works as
> alternative (which I believe it does).
>=20
> I've been pushing off building an image with the remaining gnome-icon-the=
me
> users (using adwaita) to check that things seem to work. I'll do that now
> and send changes to those recipes if they're fine.
>=20
> I guess we could still make adwaita-icon-theme provide gnome-icon-theme b=
ut
> is there a meaningful benefit after I fix meta-oe recipes?

Adding RREPLACES,RCONFLICTS,RPROVIDES combo in adwaita recipe allows
on-device upgrades to uninstall gnome-icon-theme and replace it
completely with adwaita-icon-theme

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Qxx1br4bt0+wmkIi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX4GEwACgkQN1Ujt2V2gBxeLwCdH0IFK966aySKIBb8mJyn2mlv
yT4An1+rBFAaL7jHuVCgjtPREnCxX3oZ
=VbfG
-----END PGP SIGNATURE-----

--Qxx1br4bt0+wmkIi--
