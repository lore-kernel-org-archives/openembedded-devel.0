Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9C98D7846C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2018 04:48:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id c24so20947814wrc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 21:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=p7J/CStjFBBJSuj2hC6hh3leeayqisa/PSUGVlulDM8=;
	b=WApMqarXhX5pkHDYBQ8cds+6ft704vZwVEP35n3IxAJ+qe1GfI7BGoFUkwyLVAmcQ1
	Vh7nUtdONqJRshKHRcq5vXt4Q7elyb/r+2GOCJTw2qIMg89NZD3QJyk/YvlFaQruHJ1B
	JMIiniWym3s7HfgzZEw8fZ2jDclmLYoc5ngLisbS5zjICu+9ltZKx5AD25wfpMDAZwo5
	MPmAn1Pz/jcKD48T65eQLPahRYm1WXT8yY45KFGh5A10Oe8OkeGex/uOR8tTv6lwtDrZ
	PsmAseFJqYYBoDuKLhkAPTRK1OzQsFgncxlhcbHwJwuuty4aHbRGlDztxOlvE2eO0mWQ
	pWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=p7J/CStjFBBJSuj2hC6hh3leeayqisa/PSUGVlulDM8=;
	b=NcuJcFCGpBSeEf7OwaYZo54ZcSkXK8DQR3cI56f86hva70BHbAsFvp/XIdWiafKXz7
	XlRkA0cmUjb/n8/o/xUl9VWTGXLZsXiTcuRaaZdwfRKnHnPFru9r3stN9wYCvETVxsoJ
	YvS36mMfx1tjSuhz54LmQnXnF8KW0ds2Q+k9l/Agk1FRj7lz6Rx9H1ONhQz4mUhcapLj
	Tmq7Ao5kUm4f9T2iRwbh6Yxa3cahiJUR/IvdDyii4LnCzedlaRYL7eLwvplsW+eCIqxu
	TH7wbMkTLzKd8c2CVGSa+A8DFY2lChITXkXjz3aY2NABcQJ59C6sacddgyrOEwoh8STY
	fonA==
X-Gm-Message-State: AElRT7Hg8gNoWctn1sJykhELHVKuEES7icykik9PI8IVXNsCv5TWjEdi
	ShdYWCdcJ+ikM6UMNxJzjcxKHQ==
X-Google-Smtp-Source: AG47ELuyhmEjp6ScPnTFNz2YAsLXHQg9uF+PRqmRqp8iERv5uiSMREnIxJUxe1S1hJz+1Ay5dyPv5Q==
X-Received: by 10.223.196.132 with SMTP id m4mr35852822wrf.9.1522126116548;
	Mon, 26 Mar 2018 21:48:36 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id c57sm368692wrg.84.2018.03.26.21.48.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 26 Mar 2018 21:48:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Mar 2018 06:48:35 +0200
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>
Message-ID: <20180327044835.GA1536@jama>
References: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
	<20180326214334.26378-1-Martin.Jansa@gmail.com>
	<CALbNGRTNSvJT-PO1GMSaaVxpdGjuJKxZTotkXj9dFXLJVV7e-w@mail.gmail.com>
	<CA+chaQdxLj2hAqfvK1YKKKAsg0e3PxGor_K0nfamN+NWAw7hcw@mail.gmail.com>
	<CALbNGRTyS5H=BK4sZ+YeJnT3=4DeyCGtUw6pGJ5zQAWJQfWQVg@mail.gmail.com>
	<CALbNGRQFpVkRPVtMv10avhDoVgUStwMKhWsTRprX_57osSjRmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQFpVkRPVtMv10avhDoVgUStwMKhWsTRprX_57osSjRmg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv3] mozjs: refresh patches
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
X-List-Received-Date: Tue, 27 Mar 2018 04:48:35 -0000
X-Groupsio-MsgNum: 71522
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2018 at 01:02:02AM +0200, Andreas M=FCller wrote:
> On Tue, Mar 27, 2018 at 12:27 AM, Andreas M=FCller
> <schnitzeltony@gmail.com> wrote:
> > On Tue, Mar 27, 2018 at 12:11 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >> Mostly because I find the proper patch headers useful.
> >>
> >> When doing the refresh now, I find it useful to also add original auth=
or and
> >> patch headers even to patches which currently apply cleanly, so that n=
ext
> >> time I can just use "git am foo/*" (or use git as a PATCHTOOL) and get
> >> usable results.
> >>
> >> I understand that it adds unnecessary changes (not needed to fix the
> >> WARNING), but IMHO better in separate "refresh patches" commit, than n=
ext
> >> time someone uses devtool for actual mozjs upgrade which might refresh=
 the
> >> patches even more to make them applicable on new base version.
> >>
> >> Regards,
> >>
> > Understood - but by moving the patches devtool has created to the
> > original location (often they are already there) and use git add -p
> > you can decide for each Hunk if that is necessary or not - but it's
> > not that important to start a longer thread for this :)
> >
> Just said 'don't want a longer thread' - and now this :)
>=20
> An example from V1 demonstrates what I mean (using 'git add -p' forget
> most of the rest) :
>=20
> -From da3929a96d9c74e11bf37d128890e18fcb745365 Mon Sep 17 00:00:00 2001
> +From 08b62f039e0fee50e9399ce2e48b56770f8f71e3 Mon Sep 17 00:00:00 2001
> ^ This is not necessary
>  From: Lei Maohui <leimaohui@cn.fujitsu.com>
>  Date: Mon, 26 Jan 2015 08:53:19 +0900
>  Subject: [PATCH] mozjs17.0.0: fix the compile bug of powerpc
> @@ -10,14 +10,16 @@ argument '5' to 'JSBool
> TryArgumentFormatter(JSContext*, const char**,
>  JSBool, jsval**, __va_list_tag (*)[1])'
>=20
>  Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
> +
> +
> ^ same here
>  ---
> - jscpucfg.h | 6 ++++++
> + js/src/jscpucfg.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> ^ This is wrong - devtool does not take care for 'S =3D
> "${WORKDIR}/${BPN}${PV}/js/src"' in recipe (I should open a bug for
> that)

That's why I've added patchdir=3D../.. to all the patches in SRC_URI, some
already had it. As bonus it makes it easily applicable with git am.

Where it really didn't work was 0004-Add-AArch64-support.patch which was
loosing the diff for mfbt/double-conversion/utils.h (which is outside S,
maybe because devtool was trying to be clever and include only diff
inside S).

Regards,
>=20
> You'd noticed that by checking in each hunk interactively that's all I
> wanted to suggest. Devtool is a very strong helper - I use it - but I
> just don't agree with all it suggests and try to the patch diffs
> small.
>=20
> Time for zzz..
>=20
> Andreas

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWrnNIgAKCRA3VSO3ZXaA
HN1JAJ9r20L75ttvttwuotbuvW6ACm4yhgCfTHqk4sFESZdRboOFuihRnrvyXyk=
=S/oS
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
