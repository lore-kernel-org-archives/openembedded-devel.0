Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8C84873D27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:22:10 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so10925562wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=V7UaoCMlBo8sViFaMr2CP+sj3sfDp5gPWXzRO0Cm8gk=;
	b=cXqbTZYq+Ezc1dylMuBNiyWB24LbY2T0fOtmeAQu/PGjCkmlp1KDfT1auO4a5Z/msp
	7HbRqdDY4L7fBhd7AFAdcBGS2B0/qfgYLv+h4SWghPdO43vP61sLGDxD0vfA6wQM7cU0
	iLEp9OJDO5ZMRx5TjB1sAqGjGpDsDxTl/u59xpFKQzlmqJjE262I/9aoOYwHiSqLH44n
	We4TQgCCgPzyzRv9rG34qVLAWRehahxPjiYIrjMk4NT1cVOk1EI90S7B+yP+41YNvBjF
	4pUw7knXLn4VBbdPVGSenXmi8Zy8gXXCWqJHSMGhGN8+cFpVFbrSMqp9hIXqQgBJlSRm
	eHQw==
X-Received: by 10.180.99.137 with SMTP id eq9mr4835702wib.4.1442474530744;
	Thu, 17 Sep 2015 00:22:10 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	cm6sm8440106wib.22.2015.09.17.00.22.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 00:22:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 Sep 2015 09:21:52 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150917072152.GB2388@jama>
References: <1442450491-14912-1-git-send-email-schnitzeltony@googlemail.com>
	<1442450491-14912-2-git-send-email-schnitzeltony@googlemail.com>
	<20150917065442.GA2388@jama>
	<CALbNGRSspTfweFmjH4rr_8QZC+7dCOEz6oAms22+hpHpyb6_Bg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSspTfweFmjH4rr_8QZC+7dCOEz6oAms22+hpHpyb6_Bg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 01/19] gvfs: remove invalid PACKAGECONFIG[cdda]
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
X-List-Received-Date: Thu, 17 Sep 2015 07:22:11 -0000
X-Groupsio-MsgNum: 57428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JP+T4n/bALQSJXh8"
Content-Disposition: inline

--JP+T4n/bALQSJXh8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2015 at 09:07:00AM +0200, Andreas M=FCller wrote:
> On Thu, Sep 17, 2015 at 8:54 AM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Thu, Sep 17, 2015 at 02:41:13AM +0200, Andreas M=FCller wrote:
> >> Enabling cdda requires libcdio-paranoia not libcdio. libcdio-paranoia =
is not
> >> found in layer list so disable cdda.
> >
> > It wouldn't be the first case where PACKAGECONFIG requires dependency
> > which cannot be satisfied, would you mind adding libcdio-paranoia to
> > PACKAGECONFIG for cdda and keeping it by default disabled?
> >
> > Maybe with comment saying that for cdda you need to create/find
> > libcdio-paranoia recipe.
> >
> OK I can do. I think the easiest way to handle is ignoring this commit
> and do the change next series. Please don't block the others (if there
> aren't other complaints) because I am loosing overview what was sent
> and what needs further rebasement.

OK, I can even update this patch for you, because I like your patches
and the rest looks good to me.

Thanks for fixes, I fully agree that in current state it's hard to track
what's broken and by what, it's big mess, hopefully we'll get failures
down when oe-core is stabilized for release.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JP+T4n/bALQSJXh8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlX6ahAACgkQN1Ujt2V2gByMwQCePm2/dPWJwfu2DGTOzbZt2OWl
gvoAnAzrao6/hg5P+aFYp/EpCcyTjtUv
=LVh+
-----END PGP SIGNATURE-----

--JP+T4n/bALQSJXh8--
