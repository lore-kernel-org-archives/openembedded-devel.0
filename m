Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f42.google.com (unknown [209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9116059B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 14:53:11 +0000 (UTC)
Received: by mail-la0-f42.google.com with SMTP id el20so1184032lab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 May 2014 07:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CIAqAcHM2xWnsjEslSUJ0uoauuBmsqUyg39Y366RmYo=;
	b=NtdF3n3p1+NAE385bJgt14e90gmaFrBniO5PhNJeFSoEPeqVhGZL+BBOUjEY1Ezh2k
	QzOpE/pJT1cI0zIJbmxJpNpf4LR9FOFjJ1kHOa1iW5YW3CnrfKPTl9xpODuaY/tWIU/+
	2QjEPOZTWXU8CePqXtii7XgnOITQI4xZOZ+htNuxK6zFdZh9ZI+HZN6XkSnxKIAVldPx
	lT+HRtmv5z/zejKxm+i6hs+mlTCtphwbFyjqSGYfUTzAmCbaB3r+ZEXH96kopzukjqeg
	ZwwTg+lPF35n7uIhMVcOVj73rjEdST6XXAEpDXyKEIA+Nb9lRf7lL4CM+yteQnSbcZmh
	Z8ug==
X-Received: by 10.152.29.8 with SMTP id f8mr8951166lah.11.1399819992652;
	Sun, 11 May 2014 07:53:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	go4sm10723823lbc.35.2014.05.11.07.53.10 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 May 2014 07:53:11 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 11 May 2014 16:53:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140511145337.GE22774@jama>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
MIME-Version: 1.0
In-Reply-To: <536A7C42.6030502@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Sun, 11 May 2014 14:53:13 -0000
X-Groupsio-MsgNum: 49843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline

--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 11:32:34AM -0700, Philip Balister wrote:
> On 05/05/2014 09:45 AM, Martin Jansa wrote:
> > On Mon, May 05, 2014 at 09:32:04AM -0700, Adam Lee wrote:
> >> Hi JaMa, what does it take to be a maintainer?
> >>
> >> Do I need to build check all the packages everyday?
> >=20
> > Definitely no everyday, there are more patches coming in just after the
> > release, but later it's something like 1-5 patches in month.
> >=20
> > So it doesn't need much time, but it's always good when it's done by
> > someone else then master maintainer (to setup separate builds etc).
> >=20
> > Possibly more time is spent on watching the ML, because many people
> > don't read README file and instead of following the proper procedure for
> > backports to relase branches they just say somewhere in ML "BTW: also
> > merge this to dora".
> >=20
> > You can also have some co-maintainer if you find way to split the work
> > without duplicating it.
>=20
> Adam,
>=20
> I'd be glad to help scan the list for backport requests.

Can one of you send README update patch?

Thanks!

> > I'm fine with scheme where maintainer sends me consolidated pull-request
> > and I'll merge it for him to actual branch (so that he doesn't even need
> > R/W to main repo).
> >=20
> > BTW: If you don't mind, then I'll forward this to oe-devel as well for
> > other possible volunteers.
> >=20
> > Cheers,
> >=20
> >> Please let me know!
> >>
> >> Adam
> >>
> >> On Wed, Apr 30, 2014 at 7:37 AM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
> >>> Hi,
> >>>
> >>> few people asked me when there will be daisy branch in meta-openembed=
ded
> >>> repository.
> >>>
> >>> My current plan is at the end of next week.
> >>>
> >>> There are some pending fixes I need to finish testing (please review,
> >>> test and reply on them).
> >>>
> >>> I was hoping for few more fixes for
> >>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-March=
/094893.html
> >>>
> >>> and especially for incorrect dependencies:
> >>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-April=
/095268.html
> >>> http://lists.openembedded.org/pipermail/openembedded-devel/2014-April=
/095464.html
> >>>
> >>> There is only one change on ML which really cannot go to daisy branch
> >>> (http://patchwork.openembedded.org/patch/71107/), the B!=3DS fixes ar=
e on
> >>> edge, but they shouldn't harm to be in daisy.
> >>>
> >>> I hope to get few more fixes from OEDAM and then I'll run final build
> >>> test on jenkins (3days, possibly needed twice).
> >>>
> >>> If you want to maintain daisy release in meta-oe, reply in this thread
> >>> and send patch to update README files.
> >>>
> >>> Regards,
> >>> --
> >>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>
> >=20
> >=20
> >=20
>=20



> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNvjvEACgkQN1Ujt2V2gBxcEgCggxWsM41BYqeFwJrJ5/WJubfe
rekAoIb3rWP6PZIrwdv1qCefYUSSCaRe
=gKM9
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
