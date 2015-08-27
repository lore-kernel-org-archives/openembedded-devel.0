Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 93D1E60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:41:12 +0000 (UTC)
Received: by widdq5 with SMTP id dq5so47367711wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 07:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eagq8eLYqpzueOtI5ENIejmpWSccc5gXDLsrLfag8Q8=;
	b=jSuCLX+a8e0uGyfp3JWSOqk1LmGwOm9iD8vg5ntqqL5HSRZJ154kjrgi1RCOOEyCR5
	blXNQMqoU+j/NPV1DQ3flLjDqLtAWLGOV2UEHeDf8+xM+gscVpqGyKCp1X0vzYWTYbcx
	pCej41z7NmMKCyatI7UXVyQBJg827hrzy8Q1pXYJA6lPrxq0A9D1Fmpayh465HjM0agP
	KQQ4DU0tNOag4dOFlWv/ut6jBD9kK+L6dFYs+XC13mQolpqSCCqQ8BTisEAd2/Lv7kAZ
	yYIexjTmwPf8ZM9YMdpK1qEl8TMIZM0p7iT690x+oO9Dlb1fXgpB+o38bu29U9oqqzpB
	MTww==
X-Received: by 10.194.109.97 with SMTP id hr1mr5724607wjb.38.1440686472152;
	Thu, 27 Aug 2015 07:41:12 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	op6sm12908800wic.12.2015.08.27.07.41.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Aug 2015 07:41:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 27 Aug 2015 16:41:27 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150827144127.GB2443@jama>
References: <1440633769-19691-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKoUaLm8yUiS1idtr+Neyth_oBufdME1XSJGdR2S7XbdzA@mail.gmail.com>
	<CAMKF1srdDoCk8_bbLVEYjWgUEF_MyfY5KcRor2QoLiN7FJoJ4g@mail.gmail.com>
	<20150827142008.GQ26375@denix.org>
MIME-Version: 1.0
In-Reply-To: <20150827142008.GQ26375@denix.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH] layer.conf: define LAYERDEPENDS
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
X-List-Received-Date: Thu, 27 Aug 2015 14:41:14 -0000
X-Groupsio-MsgNum: 57072
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline

--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 10:20:08AM -0400, Denys Dmytriyenko wrote:
> On Thu, Aug 27, 2015 at 06:30:13AM -0700, Khem Raj wrote:
> > On Thu, Aug 27, 2015 at 5:46 AM, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > On Wed, Aug 26, 2015 at 9:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > >> qtwebkit needs ruby-native which comes from meta-ruby
> > >> this patch adds initial set of layer dependencies there may be more
> > >> that can be added but its a start
> > >>
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >
> > > This is only when someone uses QtWebkit; a lot of people does not use
> > > it so it is not a real dependency.
> > >
> >=20
> > then it should be part of BBMASK which is default so if someone wants
> > it then user gets a clear message and knows what to fix
> >=20
> > > We could make it dependent on the collection availability?
> >=20
> > yes that could be how do u propose to do so
>=20
> Chris Larson shared this code for such purpose:
>=20
> https://github.com/MentorEmbedded/meta-mentor/blob/master/meta-mel/conf/l=
ayer.conf#L5-L11

There are plans to merge ruby in oe-core (because of newer webkit-gtk),
so I wouldn't worry too much about BBMASKing qtwebkit if meta-ruby is
not available.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXfIZYACgkQN1Ujt2V2gBxqKQCfYUZE/jwAHV+FZJsBKmv4dCAm
AjcAmgISK7OqvdkkX9J6qMFhP0QnjZip
=8M+b
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
