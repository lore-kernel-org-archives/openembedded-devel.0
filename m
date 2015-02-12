Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5900B73317
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 16:53:15 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id k48so11395162wev.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 08:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GIfVzGO6BHOt5Jev+d6oaphjU67ix3u+7uG1A+kZBpE=;
	b=dWuLN9nxMadmMFLXTYhPa+l2+pD69IJzIbvfEae/iEkR7rkq/7uHDXSQRIzhu7sPSx
	oBESX8lIVVEIexqqVngNI5Jzaf//8+XsioNZbRU/0iq1nsnSXQGzEARMQnbEaW+DSzwx
	SrlY4uW4bBUBRFvVbd29MXycXW8hx46CX4DtkqA43l6201ZR4VCroqB8sYqedDVJBEsT
	sXcr63j1vUZ5eAG+LoEqEGF/w51GPzbV14CuLQbNoYM9miMOD5A2dNdTP6AIk8b9wxqP
	+D3bIWnjcZXxnjaOy4RL7pD08MmnduJJkwUfxInJnfTsrg9G1dKhhO9R1oUDrFH0lujV
	YCGQ==
X-Received: by 10.180.78.99 with SMTP id a3mr8040662wix.2.1423759996358;
	Thu, 12 Feb 2015 08:53:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fa3sm3246950wib.17.2015.02.12.08.53.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 08:53:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 Feb 2015 17:53:19 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150212165319.GE2272@jama>
References: <1423081763-2905-1-git-send-email-danismostlikely@gmail.com>
	<1423081763-2905-4-git-send-email-danismostlikely@gmail.com>
	<CAP71WjxPCVC6BcdmrDUz0HJ36Uw-4P-a4skKEFOZtudE2PWSDg@mail.gmail.com>
	<CACS+7ZQ0xqDt9DoWAdJ94V2xMiMuoQJcCw2ciKJF+r=_zSQAYg@mail.gmail.com>
	<CAP71WjxqmFWuZ9NJRdxns4+ZrUUWmKcTDg4gz_9YJF5LE0eFkg@mail.gmail.com>
	<CACS+7ZSv+hsBjSjfYMFmkT8D9SL=JGYpAbe1oDe35t4T__uqCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACS+7ZSv+hsBjSjfYMFmkT8D9SL=JGYpAbe1oDe35t4T__uqCg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH 3/5] emacs: Un-blacklist, seems to work fine with new qemu
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
X-List-Received-Date: Thu, 12 Feb 2015 16:53:21 -0000
X-Groupsio-MsgNum: 54212
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2015 at 07:51:39AM -0600, Dan McGregor wrote:
> On 5 Feb 2015 14:10, "Nicolas Dechesne" <nicolas.dechesne@linaro.org> wro=
te:
> >
> > On Thu, Feb 5, 2015 at 5:10 PM, Dan McGregor <danismostlikely@gmail.com>
> wrote:
> > > In my testing I explicitly disabled x11 in PACKAGECONFIG. I suspect
> > > there may be something broken in its X11 support, maybe I should
> > > remove x11 from the default PACKAGECONFIG set?
> >
> > indeed, without X11 emacs now works fine in non X11 environment. i am
> > not sure what to say then... if i use debian or ubuntu on the same
> > board, emacs works fine with or without X11, so we must be doing
> > something wrong in the recipe..
>=20
> I figured it out. There's a known bug in the emacs-23 branch that was
> distro patched in several other distros. Basically glib fixed a bug the
> emacs relied upon to function. I have a new patch I'll post later today
> that fixes this issue and some others identified in Martin's bitbake world
> run.

Did you notice that qemu segfaulted in qemux86* world builds?

It looks like the original issue with pixman/pci is still there.

> The proper fix is to import emacs 24, but that'll take longer. When I'm
> done I'll also post that.
>=20
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTc2n8ACgkQN1Ujt2V2gBx0UwCgho+kNAwaFCwEKTjPWaSYtnZm
YrMAn23Wb2CVgnJZ/BFBTtLOWVA/8kFS
=LfBX
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
