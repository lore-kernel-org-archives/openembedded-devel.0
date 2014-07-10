Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC6161FE4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 22:30:25 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id x48so232439wes.39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 15:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uvRvYybqApy5hXqH8YjEhZZuy8euOanMJkzZlrrq5JY=;
	b=uCfcikDUB3jdMzKgc2oFWo/QvP/NqaXxM1EGoh2hKQH3hJ8sxwNWAoy1WpDKTlhouL
	k14B5byjBPfJIGu9L/iWL4tUxvkrwJmeHDLg3/zAE1u/+zHZ17cF13eiSNFGqmj5LV2q
	bJSgyfsa+O98IbY7/v8fNAqx6EpC27QAysWCr1z437UBINFasKbC4GUIsRiYNvQTEGVk
	ry1oU/6yRqV/kN9ybPOSFjZEdfHZ815d0PftsEZipjweBQ7xofrv1b2GpA3qhpChUZEW
	MjEeGY6jpLXh8GBHdpYh5IS6+FJWOLppVEGTD54F5izh3nmM1TsOMcY9SXEHkeKG5q5s
	tzNg==
X-Received: by 10.180.94.5 with SMTP id cy5mr437939wib.11.1405031425861;
	Thu, 10 Jul 2014 15:30:25 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cz4sm36564216wib.23.2014.07.10.15.30.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jul 2014 15:30:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 11 Jul 2014 00:30:30 +0200
To: Jate S <jatedev@gmail.com>
Message-ID: <20140710223030.GD2433@jama>
References: <CAPphmgZ+ivQYXuYHLWfzQF9QySVnd=YtbM=fEjfA_7hp3iFq1A@mail.gmail.com>
	<53B39DCE.9060705@freenet.de>
	<CAPphmgaa8uhXjwDq+c-GUgyyqhcPB-gdsHmAxq4_c_x1acBooQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPphmgaa8uhXjwDq+c-GUgyyqhcPB-gdsHmAxq4_c_x1acBooQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Yocto Project <yocto@yoctoproject.org>, Jens Lucius <jenslucius@freenet.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] python tkinter dependencies
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
X-List-Received-Date: Thu, 10 Jul 2014 22:30:33 -0000
X-Groupsio-MsgNum: 50824
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7DO5AaGCk89r4vaK"
Content-Disposition: inline

--7DO5AaGCk89r4vaK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 04:11:29PM -0400, Jate S wrote:
> - Python-tkinter requires the tk recipe in meta-oe, so you must add
> this layer for your build.
> - I am on dora. I found that I needed commit "tk: make multilib build
> compatible and fix library install" made on 12/5/2013
> (1ca29d1cda0d007c4e6a28fe1a4037b4029ad7ae).
> - I created a bbappend for python. In this I added
> DEPENDS_class-target on tk, and RDEPENDS_class-target on tk and
> tk-lib. Also, I did a SRC_URI replace to eliminate the
> avoid_warning_about_tkinter.patch file.
>=20
> I was able to build and use python-tkinter successfully.
>=20
> The question now is if this should go into meta-oe or oe-core. And how.
>=20
> The tcl recipe is in oe-core, but not tk. I'm not yet sure why this
> is. Does anybody know?

You can use PACKAGECONFIG for optional dependencies like tk, that way
patch adding PACKAGECONFIG can go to oe-core and only people with
meta-oe and tk available will enable it.

>=20
> - Jate S.
>=20
> On Wed, Jul 2, 2014 at 1:51 AM, Jens Lucius <jenslucius@freenet.de> wrote:
> > Hi
> >
> > It worked for me in my build env after trying several things.
> >
> > I did setup a new yocto some while ago and actually had the same proble=
ms
> > again.
> >
> > There is a patch in python about tkinter (03-fix-tkinter-detection.patc=
h).
> >
> > I removed that, did a fresh rebuild of python (-c clean) and did a rebu=
ild
> > of my image (as no new image was written by building my image after
> > rebuilding python).
> >
> > Either of these did work for me, maybe somebody knows exactly which ste=
p :-)
> >
> > Jens
> >
> > Am 02.07.2014 05:41, schrieb Jate S:
> >
> >> The python-tkinter module requires _tkinter. A result from a websearch
> >> suggested that I needed to make sure tk (from meta-oe/meta-oe) and tcl
> >> were installed before compiling python.
> >>
> >> I added a DEPENDS on the tk and tcl recipes to both python and
> >> python-tkinter in a python_2.7.3.bbappend. It did not work and was
> >> never built.
> >>
> >> I'm looking for tips to figure out what is going on. Thanks.
> >>
> >>
> >> - Jate S.
> >
> >
> --=20
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7DO5AaGCk89r4vaK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO/FAYACgkQN1Ujt2V2gBzgZgCfXAkt1aXHEtearbOpdhPz8ezk
hbQAn2Imq+aHFLYXWy7cVzeAXY0ORbtK
=BTP6
-----END PGP SIGNATURE-----

--7DO5AaGCk89r4vaK--
