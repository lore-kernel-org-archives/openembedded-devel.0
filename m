Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 09FF276806
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 12:58:17 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l68so130047318wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 04:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dAMDvM1coYyQiRE/rKIwZ7SRkwayRz/Pwnc4ZhS/HyA=;
	b=nFDEnBEpNx9BRgm0DDM7H9hW+BpD7BNE0BW/hbNv/CI2VXU8dp4QEG0sm1K0+u6c0C
	tbqXVvKem4ZbXXLP9my5aKtFwWSEhcKImAeqypNUKO1oEDOCyQSJIZRrD9DWl52Ue+0v
	iGN2WraOtXLewaCsO1gOv6PARQbPNCU8iZf6fbqVBMJXmDItfh+UoK73t74EBc8OVjw+
	Jp5ZnWYuGxdZkYeNC29+KLA4KLC/0MpnHJIaf6mmuKLWalZux/bUpfVHK51Ab0OIlPC3
	MrmSCpdUKgOtLsC7OPskTwt60/x1gH1+v7CXQWAqwwpI4nwxicq6gb1E81O6eVJeu6kF
	GXlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dAMDvM1coYyQiRE/rKIwZ7SRkwayRz/Pwnc4ZhS/HyA=;
	b=eFFKRpUEXuNsicNdxaFzIfleug9IeBDc9qGquLW3Yk51/d/8C4+//SceQSv2NqW0WM
	t8CaPxYsGfc6NjPmpch9FpuU2Sh/tcNX1o/WfLZrUEcBcO5ynVRnpOR28sX0q8zyREzP
	s7UcNmvrpRI4FnpdWW1ti6s3AunA/V0BRPk/E5JaOwOC2AyJCRjd2FBccIEaGzmmX12U
	RrFoYr18lZGHeCH2m4HlzY3H1lwKl2mCjk60mPofbbV1uk+hWvyBFVoQZ86aZdxSpxrI
	WbnEaK/7P6LHS3eLVqeJ9ngsu4Lr17Xp+KPPwbRQ4klkFctbRHPzJ5z4l+Tsf+VwuI2V
	c+uA==
X-Gm-Message-State: AD7BkJJgve1nzVJng+IjAVg18PY6nfkJ17+6vMhln47DyBYn8QKYcNNxPrGKASV9drbUnw==
X-Received: by 10.28.148.16 with SMTP id w16mr3423502wmd.90.1457009898081;
	Thu, 03 Mar 2016 04:58:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fv6sm40633220wjc.12.2016.03.03.04.58.16
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 04:58:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2016 14:00:22 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160303130022.GD2569@jama>
References: <1456935672-15538-1-git-send-email-Martin.Jansa@gmail.com>
	<1456935672-15538-4-git-send-email-Martin.Jansa@gmail.com>
	<56D83036.9020909@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <56D83036.9020909@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH][meta-oe 4/5] gst-ffmpeg: blacklist, not compatible with currently used ffmpeg 3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Mar 2016 12:58:20 -0000
X-Groupsio-MsgNum: 60316
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tNQTSEo8WG/FKZ8E"
Content-Disposition: inline

--tNQTSEo8WG/FKZ8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2016 at 02:38:14PM +0200, Alexander Kanavin wrote:
> On 03/02/2016 06:21 PM, Martin Jansa wrote:
>=20
> > +# http://errors.yoctoproject.org/Errors/Details/40736/
> > +PNBLACKLIST[gst-ffmpeg] ?=3D "Not compatible with currently used ffmpe=
g 3"
>=20
> Before blacklisting, you should try switching to gst-ffmpeg's internal=20
> copy of that library, and see if it helps:

I'm not using gst-ffmpeg, someone who can test it in runtime should try
it.

> PACKAGECONFIG ??=3D "external-libav"
> PACKAGECONFIG[external-libav] =3D "--with-system-ffmpeg,,libav"
>=20
> So drop external-libav from PACKAGECONFIG.
>=20
> Alex
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tNQTSEo8WG/FKZ8E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbYNWUACgkQN1Ujt2V2gBzViwCfeKziXrXMdlSTg4cTuo0gMLg5
A/0An3qFtJBUZoEC9W0iaIKIFtRtQs5s
=L7f9
-----END PGP SIGNATURE-----

--tNQTSEo8WG/FKZ8E--
