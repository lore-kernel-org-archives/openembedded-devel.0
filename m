Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC346FC5D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 08:46:11 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id q58so8312677wes.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G5X11RjS3QGztGetQLR7geGK6mMedMC/vYuO+2jH2B8=;
	b=B/0j54y8oHphFeAMf0J9TynMhII50Cd1mlN0ULhKnfME59UV1L8fOFqZgExhToKfpb
	b8zTNoolSCS0CuwbCaD2LfhUOH2JYaGV4MqKMAjmkH/f4YDTjYmU2ObRvPilvuRIvriC
	iVH/ZZXmAmN255lB83Av0a+LNLEiPRZJEb4MpudOnjS1MAC9dFDxo4zC/HFIxPTPWwTF
	rLZLYejKMOkbPxfB7ocDZHZriaxDRhJ8NgMBC9yINmvc6aTqIpQfrtzFQ0CXX10J0RZv
	+c4iMjdKiu730pj30ysvoVZqUD3OHTOIqqOisyXIL5Q/dZVBfERDD28Ub5QqpFyDqUJa
	w5cA==
X-Received: by 10.194.236.35 with SMTP id ur3mr9272009wjc.127.1407746772583;
	Mon, 11 Aug 2014 01:46:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	au7sm38363087wjc.41.2014.08.11.01.46.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Aug 2014 01:46:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 11 Aug 2014 10:46:47 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140811084647.GU14848@jama>
References: <cover.1407632366.git.chris_larson@mentor.com>
	<df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
	<20140810092431.GP14848@jama>
	<CABcZANma2YyDV34G+9EcZ20n8Uj7cFjKXh2AHG0zSqd2b+f4wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANma2YyDV34G+9EcZ20n8Uj7cFjKXh2AHG0zSqd2b+f4wg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/5] dnsmasq: fix parallel make issue
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
X-List-Received-Date: Mon, 11 Aug 2014 08:46:13 -0000
X-Groupsio-MsgNum: 51580
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32KBALpRDK42x9o9"
Content-Disposition: inline

--32KBALpRDK42x9o9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 10, 2014 at 05:36:32PM -0700, Christopher Larson wrote:
> On Sun, Aug 10, 2014 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>=20
> > > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Is this v2 of this change which was sent earlier?
> >
>=20
>=20
> They should be the same, just this one is part of a series with other
> changes. Either should work fine for that particular issue.

There were some smaller differences (like Upstream-Status and SRC_URI
addition in .inc instead of .bb).

I've resolved them as conflicts in next patch.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32KBALpRDK42x9o9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPogvcACgkQN1Ujt2V2gBxkbgCdE0Zo8zw2x4xGMuLE9Vr0nsIS
QE8An3a/miXBmKAUemROeQGwjtkXBQFl
=OggC
-----END PGP SIGNATURE-----

--32KBALpRDK42x9o9--
