Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sr45x-0007vC-VI
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 11:29:30 +0200
Received: by bkcik5 with SMTP id ik5so101683bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 02:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4Cqk1QgxYXceiCRzT5OxJaTsW9wl2L3xFwwXobtN8f4=;
	b=D3ssWXEYwzsf79W09Bkv0VtVv0spBqiwV2VVLtBhYrUJhizGrA+8wdQHCKN9VkM9r0
	HetcT5YrvvKTvowE7RuEKq9q/eQtIOOZR8eoF3Sf8uo7DngMyvzXYS8YhttHVyqs5puW
	nd7fHPKA5jH4D4xsFHTWaTrC3RUgRg1eglNK0LKMDK1K6pmbCn6gr9mpzG7vQrN7os3K
	ORt4dHCjzCB9PQwX/T6dGEZ67ulaoa0Mj0BkndvlNuRVfpTHfuTDNHV9l7YbzC9O7AuS
	UYDwXwxtgznMfMoPsahnTnuf5vZBIeoiA8JQ6/FDGU0pEZLC+DdNpw0bXOtqvLzHihHj
	1PVA==
Received: by 10.205.123.10 with SMTP id gi10mr662088bkc.9.1342516690869;
	Tue, 17 Jul 2012 02:18:10 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gq2sm9434872bkc.13.2012.07.17.02.18.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jul 2012 02:18:09 -0700 (PDT)
Date: Tue, 17 Jul 2012 11:18:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120717091818.GA3390@jama.jama.net>
References: <20120716074256.12AC410334@opal>
	<20120716182528.GO3729@jama.jama.net>
	<CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBzeXN0ZW1kLmJiY2xhc3M6IGFkZCAqLXN5c3RlbWQgcGFja2FnZXMgdG8gUlJFQ09NTUVORFM=?=
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2012 09:29:30 -0000
X-Groupsio-MsgNum: 39713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 17, 2012 at 10:54:41AM +0200, Andreas M=FCller wrote:
> On Mon, Jul 16, 2012 at 8:25 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
> > On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: meta-openembedded.git
> >> Branch: master
> >> Commit: 264e5a44e1111f939b43c11bb9514a0b435918db
> >> URL:    http://git.openembedded.org/?p=3Dmeta-openembedded.git&a=3Dcom=
mit;h=3D264e5a44e1111f939b43c11bb9514a0b435918db
> >>
> >> Author: Andreas M=FCller <schnitzeltony@googlemail.com>
> >> Date:   Wed Jul 11 20:46:07 2012 +0200
> >>
> >> systemd.bbclass: add *-systemd packages to RRECOMMENDS
> >
> > This is a bit unfortunate e.g. when busybox is used in small chroot
> > image.
> > busybox pulls busybox-syslog, which now adds busybox-syslog-systemd and
> > it ends with systemd/dbus/udev/shadow/pam/util-linux/kmod being added t=
o previously small image, see:
> >
> > http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dblobdiff;f=3Di=
mages/crespo/eglibc/chroot-image/installed-package-names.txt;h=3D07187b9e51=
bd0199910152a8019d117ed41cc2db;hp=3D8f401e657dd449e30fe8183dc86a791d09614d9=
f;hb=3Dac04304bb15221b49e5af6838068f158e7d628ed;hpb=3D4c0555e7fa689c3c20902=
c7fc1ec8e525769723f
> >
> > So it could be solved by image specific BAD_RECOMMENDATIONs or something
> > like that, but by default it doesn't work very well in this use-case.
> >
> > Cheers,
> >
> I think the image specific BAD_RECOMMENDATION is not that easy to
> implement and to handle by user. I am 'dreaming' of of a distro layer
> blacklist. So in your case the distro could mask out whole
> meta-systemd. Could you live with that?

No, as the same distro is used to create full images with systemd and
this chroot-image is just small initramfs for kernel (where
systemd+friends is really not needed/expected).

Cheers,

>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAFLdoACgkQN1Ujt2V2gByhWgCfRfMgodpBNLv9wUt9ea+ag9aZ
VWYAoIDszr+mVNuaVLYWrVMe9zSE6JZd
=K+0Q
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--
