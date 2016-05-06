Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 91ED26E630
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 10:54:04 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id e201so52924180wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fF0SZcH1pOdpsdTdipzS7dDGUZDxhRVih5DNRxOK8JY=;
	b=mlXZJyH35uJa+TkBYsVGEFMXWlAe7IhPQw1jJhczoTGgzhoUNt9vobRFQPs9KveCrU
	5ooDewq3FLZHBbwpgkmzqjCXk7Mzs+3EumhVSY7vD+6wpltgGKuk19hr/x7Vf0zA0U11
	6IQUjaTQcCNwF+BkcxXnuwBCGGSXbp6ITVDgzjSXFj7xNND83QVmgkwmwpROgglOaAM2
	xPykB7LgxAmWVM9ny+t8aexqlthYurCoU+odgcEwmXNgtCC/hS1m5R/YGndlQcAqSg3J
	JmEEoIrvMW0kJlCVvdxPlaz/4U0GyMZ7tW/dQGXhxkDUGOX6KXrsAhOcZbvTFDu9pKwg
	DoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fF0SZcH1pOdpsdTdipzS7dDGUZDxhRVih5DNRxOK8JY=;
	b=hS0tXltrZ+MdJkCXJACins6mpBcCJ2CT8Ahl9KjrCOwTCi9C3UJfnS1pbq0ms6LCfy
	wo0S7wYp/S/zZTRi1RLuYcjWmTT8APlelSwrFLUfDbmy8jvHg6AJ03srWlHOqW1u9Qz5
	mwOfMzPsq6xYGNSyTnE0yBNnP/0jzdmk1MwBMIr06tNaC+URf42K1utWi7LoONjF72EZ
	Hqady87Lh4inNwJ3QjTUKHmPUFPz8qx/JVlz2o73hEoZ65dQq9C2lFtobNyusI19k0gb
	4HrNgwJm7trNMX0JAUvMOoWnS+Y442XUMLPeqZNSLyfjHteQ2Fsz3uGm+VwMdsoSc9Xr
	bhFw==
X-Gm-Message-State: AOPr4FVjGnISnRvNU8OpNEiDBC3oaEO04URecpp3FVaCRIMgZnI8WQklcTQp8k5Zl6fK5A==
X-Received: by 10.28.141.18 with SMTP id p18mr8379874wmd.57.1462532044472;
	Fri, 06 May 2016 03:54:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ju3sm14417701wjb.11.2016.05.06.03.54.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 03:54:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 May 2016 12:55:34 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160506105534.GA2544@jama>
References: <1462465350-33532-1-git-send-email-noor_ahsan@mentor.com>
	<CABcZANkpvF7ehM5fdd53229jonE4x43Qg2bB7M5OcM88pXb+fQ@mail.gmail.com>
	<365E1805BC95084CBE82381A0B8699940127D1DB39@EU-MBX-01.mgc.mentorg.com>
MIME-Version: 1.0
In-Reply-To: <365E1805BC95084CBE82381A0B8699940127D1DB39@EU-MBX-01.mgc.mentorg.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Subject: Re: [PATCH] Fix "failed sanity test tmpdir" for libnice and update PNBLACKLIST.
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
X-List-Received-Date: Fri, 06 May 2016 10:54:05 -0000
X-Groupsio-MsgNum: 61357
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline

--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 06, 2016 at 10:16:18AM +0000, Ahsan, Noor wrote:
> Doesn't recipe name is mentioned when only that recipe is changed in the =
patch. I though when multiple recipes are changed then we don't mention the=
 name of the files in the commit summary. Correct me if my interpretation i=
s wrong.

Listing 2 is short enough, so the summary should start with them, just
like in the commit where I've blacklisted them:

  libnice, farsight2, pidgin: Blacklist because libnice's nice.pc

> Secondly I thought both are inter related. That is why added both in sign=
ed patch. Farsight is mentioned in the details=20

I'm fine with farsight unblacklisted in the same commit as the reason
for blacklist is the same and resolved here. Just remove added blank
lines as well please.

> Remove PNBLACKLIST for libnice and farsight recipes.
>=20
> Noor
>=20
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Christopher Larson
> Sent: Thursday, May 05, 2016 10:05 PM
> To: Openembedded Discussion
> Subject: Re: [oe] [PATCH] Fix "failed sanity test tmpdir" for libnice and=
 update PNBLACKLIST.
>=20
> On Thu, May 5, 2016 at 9:22 AM, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
>=20
> > From: Noor Ahsan <noor_ahsan@mentor.com>
> >
> > * Update do_compile_append where it was updating *.pc from ${S} and
> >   removing staging dir folder. Now we have seperate build folder
> >   where packages got build. We have to search pc in ${B} not in ${S}.
> >   After updating the tmp dir pathc is removed from nice.pc file.
> > * Remove PNBLACKLIST for libnice and farsight recipes.
> >
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> >
>=20
> The commit message doesn't meet the OE guidelines (not prefixed by the re=
cipe being changed) and you don't mention farsight2 in the message at all
> -- should that be a separate commit?
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus Maintainer - Tslib Senior Sof=
tware Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcseCUACgkQN1Ujt2V2gBxF/QCgjB62OcUuccbX2f9omX2F30eO
PPsAoKwW5ujJVE+JOs1q/FX3F68mF40/
=qL7h
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
