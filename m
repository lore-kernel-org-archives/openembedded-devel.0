Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id E86F96093B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Aug 2017 08:16:15 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id t201so25003654wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 01:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=RRJ4y8hTZHNTk0Wr883N5I9mxqtvxftzwRxXTHZFGb4=;
	b=fQICJznKRh2LM5Aaq63OFMQT81xaDbwqvtzpVsgNKwwlRTDwXFKxC+bK7q7csEQ9LI
	BY1/Np8/0jSYcDRMXQ+Ngb7p+x6vzAo4hV1qzvg/nna67ovzMeQ3vbjjlofSvKnrkzSg
	PN52YPfE+8IDc7/eF21CkUm5mftr1k4ad3H6pMIw3Y8CUVaoXB0UDLAV9ZHAcbAG3Bbh
	XnWZpJYHKD2ODQqzprldJWaeBzOKEzPUQxyFmZN7omJ1v8ZGr95Tp8s+jagtEd1OtYMI
	8hjLjT+TjtEgKsE290F3V0pI8AWSZxY41KH3LjYOSuHnMjaB5ohfBQvwdkagK0qWLzPc
	HEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=RRJ4y8hTZHNTk0Wr883N5I9mxqtvxftzwRxXTHZFGb4=;
	b=GJV6D3x6OOa7COUHynw3YovSuEw71Iw6iFjxzbdMOmI0ZMcQ5qCkh/55uMJnwmPUtg
	wEqWht4iI9ooyNYQId6MUEknyzXlD+CXGzrESWZ0jIbrPoF4UOYHMm7t69WLeXSAzgA/
	rbTuS40XsBe9F5xbJlOaOA5UExv04pgJF9/rDfgGJaSAAuZ/D0YTCIG/9s9Rui5o4vRq
	ANfDGn67cAOfTc7UJzR30TOy5pgfjLglff4wyryh1jM1Yzgi5elgQO0yYbHKVrntnoWC
	k93Z4nYt+Q27JwxsLP4t0dVQLsBziRrkaowHGo87VrxA2R7lQIC+PljK0nC4KoDbRh6W
	XC4A==
X-Gm-Message-State: AHYfb5h4sBDL1QYS49vrqMbnx4mdAjb5cNlBn0c01nT30RY6mc+jRZv7
	IX0FR/AfaF1M2A==
X-Received: by 10.28.7.213 with SMTP id 204mr4676109wmh.113.1502266576761;
	Wed, 09 Aug 2017 01:16:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o20sm2563356wro.45.2017.08.09.01.16.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 09 Aug 2017 01:16:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Aug 2017 10:17:44 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170809081744.GA3394@jama>
References: <20170801170152.94586-1-Randy.MacLeod@windriver.com>
	<olqm6a$87a$1@blaine.gmane.org>
	<4aaa2c14-284f-71b4-47d2-fc7e8e27beef@windriver.com>
	<BFE10A87-CF18-46BA-88E4-A795FB20506E@dominion.thruhere.net>
	<f3b1d5bc-6d6f-4fdd-8076-5d856af4b8cf@windriver.com>
	<CAMKF1srRkN_vfF5HkMQy4YM5aa8bUCC+HOX0zALdbweUeT8dCQ@mail.gmail.com>
	<9ec26f7f-f87b-b470-ee15-459ac5712bfd@windriver.com>
	<CALbNGRQQHqg-qWOxJim5Do08VSUCt_F8kSA-75LXeDx=SoDbqA@mail.gmail.com>
	<CAMKF1spVbt=sEkrkrJbPjLJ=SRC7zAkPKy4A9xUK1OR=90pOMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spVbt=sEkrkrJbPjLJ=SRC7zAkPKy4A9xUK1OR=90pOMQ@mail.gmail.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] imagemagick: upgrade from 7.0.5 to 7.0.6p4
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
X-List-Received-Date: Wed, 09 Aug 2017 08:16:16 -0000
X-Groupsio-MsgNum: 68025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 08, 2017 at 07:42:59PM -0700, Khem Raj wrote:
> On Tue, Aug 8, 2017 at 7:28 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > On Wed, Aug 9, 2017 at 4:02 AM, Randy MacLeod
> > <randy.macleod@windriver.com> wrote:
> >> On 2017-08-08 08:42 PM, Khem Raj wrote:
> >>>
> >>> I am seeing
> >>>
> >>> downloads
> >>> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar=
=2Exz'
> >>> --progress=3Ddot -v failed with exit code 8, output:
> >>> --2017-08-08 15:05:59--
> >>> http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar.=
xz
> >>> Resolving www.imagemagick.org... 198.72.81.86
> >>> Connecting to www.imagemagick.org|198.72.81.86|:80... connected.
> >>> HTTP request sent, awaiting response... 404 Not Found
> >>> 2017-08-08 15:05:59 ERROR 404: Not Found.
> >>>
> >>>
> >>> ERROR: imagemagick-7.0.6-r0 do_fetch: Fetcher failure for URL:
> >>> 'http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-4.tar=
=2Exz'.
> >>> Unable to fetch URL from any source.
> >>> ERROR: imagemagick-7.0.6-r0 do_fetch: Function failed: base_do_fetch
> >>> ERROR: Logfile of failure stored in:
> >>>
> >>> /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/im=
agemagick/7.0.6-r0/temp/log.do_fetch.17282
> >>
> >>
> >> Ugh, the imagemagick devs have moved on to:
> >>  http://www.imagemagick.org/download/releases/ImageMagick-7.0.6-5.tar.=
gz
> >>
> >> and deleted the 7.0.6-4 tarball already!
> >> I'll send a patch in the morning and also talk to upstream about their
> >> archiving policy. I don't see a directory for that at the moment.
> >>
> >> Thanks for the heads up.
> >>
> >> ../Randy
> >>
> > Yes and they will do it again until 7-0.7.x comes up :(
>=20
> I think we should copy the tarballs to source.openembedded.org before
> accepting imagemagick updates.

That's what my jenkins builds do (or at least should do) once they build
this.

>=20
> >
> > Andreas
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Kj7319i9nmIyA2yE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWYrFJwAKCRA3VSO3ZXaA
HNUJAKCFbWDDJbjBkWRjMr6RqgQ+QkmabgCgmB/KfkqX7fEqY+xyKkkV7UsIb9Y=
=Ngc7
-----END PGP SIGNATURE-----

--Kj7319i9nmIyA2yE--
