Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id CAB17766F3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 14:42:41 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so94709446wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 07:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=voQVr8nZst5O3aCWHwiXJSkujVR/vczwxseRGwrXvSQ=;
	b=wvelgJEQWodYW3ZXFCuDa0SG84vkytbWlLTpPxwD8Y4dITN7Y74XqNR98x1zYpAl5g
	avvb74NZWr7M/wt8BGcbwIeRyb0fTs1AdNvRTTIfilO117HaoPySdv0ZlGLOYqeVVgGv
	lCqkcQGvY3TEy+ONm5WGCxMC26i49DzJzdz7I9Q5Ethj7yqFvjcYO5CyH5VVbXSbL+QU
	nTAmPKZ2BUTQnS57IhYKvuZngQpndE9Darimnvn7Ajr/q2CEsAhnxlvOq5B0ClRk7hiF
	9IH790u9Rz3aK/yAKe1ItXpiLupQup82aH9Xd1J4lzi+gi2vTKYi7IVvs7DEMyZ/ws8S
	jo4A==
X-Received: by 10.180.93.133 with SMTP id cu5mr32554252wib.49.1445438560928;
	Wed, 21 Oct 2015 07:42:40 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	p18sm2434011wik.21.2015.10.21.07.42.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 07:42:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 16:42:59 +0200
To: Jens Rehsack <rehsack@gmail.com>
Message-ID: <20151021144259.GD2556@jama>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
	<20151021105937.GA2556@jama> <20151021110944.GB2556@jama>
	<20151021141118.GC2556@jama>
	<A80CC947-3B00-47C1-8A21-81FD2D4127B2@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A80CC947-3B00-47C1-8A21-81FD2D4127B2@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/6] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Wed, 21 Oct 2015 14:42:42 -0000
X-Groupsio-MsgNum: 57950
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UfEAyuTBtIjiZzX6"
Content-Disposition: inline

--UfEAyuTBtIjiZzX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 04:24:17PM +0200, Jens Rehsack wrote:
>=20
> > Am 21.10.2015 um 16:11 schrieb Martin Jansa <martin.jansa@gmail.com>:
> >=20
> > On Wed, Oct 21, 2015 at 01:09:44PM +0200, Martin Jansa wrote:
> >> On Wed, Oct 21, 2015 at 12:59:37PM +0200, Martin Jansa wrote:
> >>> On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
> >>>>=20
> >>>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM=
 in 3.5
> >>>> (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-t=
o-the-arm-backend).
> >>>>=20
> >>>> Ensure JIT is built with llvm
> >>>=20
> >>> I'm tempted to leave this one after jethro is branched, unless
> >>> default LLVM_RELEASE is updated in oe-core/jethro mesa as well.
> >>>=20
> >>> Otherwise everybody will need to set LLVM_RELASE in their mesa bbappe=
nd
> >>> or we'll need to bbappend it in meta-oe.
> >>=20
> >> Or better, update this to keep 3.3 as llvm is meant to allow multiple
> >> versions being built and installed in parallel.
> >=20
> > Another reason to keep 3.3 around is build on older hosts, current 3.5
> > fails in Ubuntu-12.04
> >=20
> > | checking whether GCC is new enough... no
> > | configure: error:
> > | The selected GCC C++ compiler is not new enough to build LLVM. Please=
 upgrade
> > | to GCC 4.7. You may pass --disable-compiler-version-checks to configu=
re to
> > | bypass these sanity checks.
>=20
> I'm fine with keeping both. Shall I resend the patch keeping 3.3, or can =
you
> extract the relevant part?

Please send updated version.

> >>> What others think?
> >>>=20
> >>> And was this tested with mesa or just with java?
> >>>=20
> >>> Regards,
>=20
> Unfortunately (my DISTRO's are without X11) with Java only.
>=20
> Cheers
> --=20
> Jens Rehsack - rehsack@gmail.com
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UfEAyuTBtIjiZzX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYnpHIACgkQN1Ujt2V2gByMmgCgj8oVmA3k809TgAtS0PhOr8tc
aPgAnjqPIkjHvRUBZwOtIcj4XGbYNmb8
=/jtA
-----END PGP SIGNATURE-----

--UfEAyuTBtIjiZzX6--
