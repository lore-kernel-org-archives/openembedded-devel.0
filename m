Return-Path: <joe@deserted.net>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 30E1E6EFEE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Feb 2014 03:30:01 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id to1so7110436ieb.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 19:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=5NimJenuidJ0SQuLmbZ+wTLGD7ntYRC+fRYZ8+nBrMs=;
	b=WFgwAOTE9LolxfTRPML8UUMbFUpbGvsRdHEG7HN2gwIMj7GodFGmFocPuIbZ6O+gbw
	ss8rcG3SG0CIQ97Vg23cWTr/u0Umd4sbx/x51X0ebM9oG+ftJ4DyR6uGqwQVRik1xbo+
	3xnPfViJlC9dgdo+uOwBVygOngyEZpIZIIvPFsyQQi7Sj+QAPCmxWtfktswhorgoUxHJ
	YkgQkAw626UzxckIUtwJNCOHalrdbQ+qoQI9ZrSxI4fmBn13/0GInWFpO1p/zeMs8jHf
	JLZ15sCizUvAsORLuzBp/UPvF9kZSI0EbEYqWlXe/MRfoLBJJ65D71Ci55J5evRcrYzO
	GOtA==
X-Gm-Message-State: ALoCoQmflphlS4tpd4MdOlqKoFexGNyxr2mJlYE4JqqWqCTEbGuThEEeAhokWfdJqD3tN/Bwm/It
X-Received: by 10.50.25.33 with SMTP id z1mr494439igf.6.1392348600643;
	Thu, 13 Feb 2014 19:30:00 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id m6sm613906igx.9.2014.02.13.19.29.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 13 Feb 2014 19:29:59 -0800 (PST)
Date: Thu, 13 Feb 2014 22:29:56 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140214032954.GL23405@deserted.net>
References: <1390222355-9757-1-git-send-email-liezhi.yang@windriver.com>
	<CAP9ODKr5h8uX9yp+b9n8MpniGGosZ+MW_YEk9dKPR8QHj-XO7A@mail.gmail.com>
	<52FC361E.4030708@windriver.com>
	<CAP9ODKoWiCTHvBbDaupueGM5buzvGTG6fYSrZ2+eTipmpDMVyg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoWiCTHvBbDaupueGM5buzvGTG6fYSrZ2+eTipmpDMVyg@mail.gmail.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-networking] [PATCH] traceroute: filter-out patches dir
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
X-List-Received-Date: Fri, 14 Feb 2014 03:30:01 -0000
X-Groupsio-MsgNum: 48146
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="P9KQiUGMzYCFwWCN"
Content-Disposition: inline

--P9KQiUGMzYCFwWCN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [meta-networking] [PATCH] traceroute: filter-out patches dir] On =
14.02.13 (Thu 08:40) Otavio Salvador wrote:

> On Thu, Feb 13, 2014 at 1:03 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
> >
> >
> > On 01/22/2014 10:21 PM, Otavio Salvador wrote:
> >>
> >> On Mon, Jan 20, 2014 at 10:52 AM, Robert Yang <liezhi.yang@windriver.c=
om>
> >> wrote:
> >>>
> >>> The $(subdirs) contains all the dirs under the ${B}, and this one:
> >>>
> >>> do_unpack[cleandirs] =3D "${S}/patches"
> >>>
> >>> will create a "patches" dir, then there will be compile errors, filter
> >>> out the patches will fix the problem.
> >>>
> >>> Note: poky doesn't have this problem since it separates the ${S} and
> >>> ${B}
> >>>
> >>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >>
> >>
> >> Couldn't we change it for OE-Core as well? So we avoid having to patch
> >> the build system.
> >>
> >
> > I'm sorry, I don't quite understand what do you mean, this patch didn't
> > change the build system, it changed the Make.rules.
>=20
>=20
> To be sincere I didn't understand my comment as well ...  don't recall
> what I thought... I'd say to ignore it.

Oh.  Heh.  I thought you were proposing a change to oe-core's build
approach that would mean we didn't need to have a patch here to
traceroute to separate $(B) and $(S).  At least that's what I got from
it based on the commit log.  I'm still a bit confused about what's so
different about traceroute's build system that it needs special handling
=2E..

--=20
-Joe MacDonald.
:wq

--P9KQiUGMzYCFwWCN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL9jbIACgkQwFvcllog0XzW3gCePA18DrFVsmebvwlaQJjefxXl
hccAoKXozr8T9sKVQiskcHveQEZtfigL
=k4QX
-----END PGP SIGNATURE-----

--P9KQiUGMzYCFwWCN--
