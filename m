Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 711AB76EB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 11:59:59 +0000 (UTC)
Received: by wikq8 with SMTP id q8so208016517wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W9oCKZaZh45dm0pM/YsZ5RyUZchK7OpioLIqv+8EO1o=;
	b=qq1Tx5oamtAzdqcQrkxByu8s08YR6zlz8EwDUB35zyE0GUr+3Y4T0aQk9B//ohp/31
	fVmlmz+TcV4lD+FUCqxRjbh5I1Ss84xBEjlqBuf8Zba20nJQVA9So06rRlvfhbBhJ0ja
	9IqKL842v3oCY3pvPO6KZ8MyFrFQFAxzLtIm/gczqSKrqHCErRyFH3vaKQwxTL8huuRz
	3wRXoM2+nL1udcElbp0tToCO0OvwGftg6vSB1oNL2mB7ixoShf9guTMls/++g5g0+N/W
	BIyXTLp3nOelorZBofHGlOEfjqkNUcbH/9rfldtDstFjzrQIjc+/dK5P3zRpFDeyESCu
	UqTQ==
X-Received: by 10.180.76.240 with SMTP id n16mr25488426wiw.11.1445947199841;
	Tue, 27 Oct 2015 04:59:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q1sm44376293wjy.31.2015.10.27.04.59.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 04:59:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 13:00:16 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151027120016.GC2577@jama>
References: <562EB36A.1010109@webthatworks.it>
	<CAP71WjyyrqEGtdfN1mzrwaH=YGAC4zdz5QwFH-aSxNzgXr=4JA@mail.gmail.com>
	<11758297.Qg5HCuaF4n@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <11758297.Qg5HCuaF4n@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Michael Halstead <michael@yoctoproject.org>
Subject: Re: checking if a patch was approved
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
X-List-Received-Date: Tue, 27 Oct 2015 12:00:00 -0000
X-Groupsio-MsgNum: 58065
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Content-Disposition: inline

--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 11:37:36AM +0000, Paul Eggleton wrote:
> On Tuesday 27 October 2015 08:12:48 Nicolas Dechesne wrote:
> > On Tue, Oct 27, 2015 at 12:12 AM, Ivan Sergio Borgonovo
> > <mail@webthatworks.it> wrote:
> > > I saw many patch passing by and I submitted a couple about
> > > meta-toolchain-qt5.
> > > I didn't see any message from Otavio or Martin "approving" a patches.
> > >=20
> > > How can I check if it was approved other than pulling from the
> > > repo/checking github?
> > >=20
> > > Or if there is no place to check... consider this a ping ;)
> >=20
> > all commits are published on
> > openembedded-commits@lists.openembedded.org mailing list, and in
> > general you see when it's pushed in master-next, then in master.. i
> > have a mail filter that checks my name there.. it's the poor man
> > solution.. but it works. Note that the email trigger has been broken
> > for 2 weeks.. but i suspect this is a temporary issue that should be
> > fixed..
>=20
> FWIW there are a small number of us working on improving patchwork so tha=
t=20
> we're able to rely upon the results it shows as being the outstanding pat=
ches=20
> in the queue and potentially even send email notifications to submitters =
(opt-
> in). I'd also like to go a step further and trigger some automatic valida=
tion=20
> on patches. At the moment we're trying to figure out if we're able to spe=
nd the=20
> time working on this in the next development cycle.

Paul: do you know what's wrong with git hooks triggering
openembedded-commits e-mails? Or maybe it's the ML itself, but there
was no e-mail in last month. I've pinged Michael on IRC twice (+CC here)

http://lists.openembedded.org/pipermail/openembedded-commits/2015-September=
/thread.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYvZ08ACgkQN1Ujt2V2gBwSXgCgis6HU4NI7y5Qj8d8yoZJjIZ4
K0sAoKDwwTErKwsdpoR8A+hXvxaVlt5H
=9RpB
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
