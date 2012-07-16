Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sqm0b-0003Le-7Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 16:10:45 +0200
Received: by bkcik5 with SMTP id ik5so3536919bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 06:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xHed2mnf6RIvGn9cKDrtw63qS/EtSa51Azjqvmbe1gc=;
	b=o4Z0RPyR94YBsDlvBXqEVmuQop3dX4abS2ab1MXnYRG6EHaq+VcT9fpKf4dIrkMMkN
	PDjr+/d0+uFs6AQjm+EJu17HAKeVrHH/YJ/2ZMdqNgdh/p7D8gihs7hh8XYHAbwMiwmc
	Mf9ZPQdBVLH29Y17R0fT0M/d98W0R9Q7vUhJzPL2oHWRdiwLV5xVVg4D89Hygjs++Nwy
	sTAsO7jI29aRde/VX/JjOng73qnCI85IY7MY69W10KWV/bUsH7+4VhWxe2fD9UScnwdG
	G+Iy4mp26GeMshqrJgh1c4GYKXcl11Ur4ZZPLAOQUv/mfWQOxTXWBsHIUpT0xgNFhI+b
	02LQ==
Received: by 10.204.154.211 with SMTP id p19mr2331969bkw.12.1342447167198;
	Mon, 16 Jul 2012 06:59:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z19sm4203346bkw.10.2012.07.16.06.59.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 06:59:26 -0700 (PDT)
Date: Mon, 16 Jul 2012 15:59:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120716135933.GF3729@jama.jama.net>
References: <1342430652-15388-1-git-send-email-koen@dominion.thruhere.net>
	<20120716120823.GE3729@jama.jama.net>
	<28779B0A-D02E-42D3-A7D9-3C7438D0BF04@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <28779B0A-D02E-42D3-A7D9-3C7438D0BF04@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][meta-systemd][PATCH] systemd: update to 186+git
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
X-List-Received-Date: Mon, 16 Jul 2012 14:10:45 -0000
X-Groupsio-MsgNum: 39685
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nYySOmuH/HDX6pKp"
Content-Disposition: inline

--nYySOmuH/HDX6pKp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 16, 2012 at 02:16:01PM +0200, Koen Kooi wrote:
>=20
> Op 16 jul. 2012, om 14:08 heeft Martin Jansa het volgende geschreven:
>=20
> > On Mon, Jul 16, 2012 at 11:24:12AM +0200, Koen Kooi wrote:
> >> This is a combined udev+systemd recipe: it will build both udev and sy=
stemd in one go, but keep the old (sub)package layout:
> >>=20
> >> 	udev
> >> 	udev-utils
> >> 	udev-systemd
> >> 	systemd
> >> 	systemd-vconsole-setup
> >> 	systemd-analyze
> >> 	systemd-initramfs
> >>=20
> >> And all libraries are seperated out:
> >> =09
> >> 	libgudev-1.0-0
> >> 	libsystemd-daemon0
> >> 	libsystemd-id128-0
> >> 	libsystemd-journal0
> >> 	libsystemd-login0
> >> 	libudev1
> >>=20
> >> The SRCREV is 94 patches ahead of the v186 tag to drag in compile fixe=
s for 'old' gcc versions like 4.5.x.
> >>=20
> >> Runtime tested with build from scratch and opkg upgrade with angstrom
> >=20
> > With this upgrade (opkg upgraded) I see few services failing to start.
> > I'll try to reproduce it on other devices (this is on qemux86-64) and
> > maybe it was caused by some other changes (like meta-systemd move).
> >=20
> > SHR root@qemux86-64 ~ $ systemctl status systemd-modules-load.service
> > systemd-modules-load.service - Load Kernel Modules
> >          Loaded: loaded (/lib/systemd/system/systemd-modules-load.servi=
ce; static)
> >          Active: failed (Result: exit-code) since Mon, 16 Jul 2012 12:0=
3:35 +0000; 2s ago
> >            Docs: man:systemd-modules-load.service(8)
> >                  man:modules-load.d(5)
> >         Process: 524 ExecStart=3D/lib/systemd/systemd-modules-load (cod=
e=3Dexited, status=3D1/FAILURE)
> >          CGroup: name=3Dsystemd:/system/systemd-modules-load.service
> >=20
> > Jul 16 12:03:35 qemux86-64 systemd-modules-load[524]: Failed to find mo=
dule '...
>=20
> can you add a '-a' to the systemctl line, that will show the actual error=
 :)

Ah, much better :)

so this is because there is no ipv6 module in latest greatest 3.4.4-yocto-s=
tandard, not systemd fault

>=20
> >=20
> > SHR root@qemux86-64 ~ $ systemctl status busybox-syslog.service
> > busybox-syslog.service - System Logging Service
> >          Loaded: loaded (/lib/systemd/system/busybox-syslog.service; en=
abled)
> >          Active: failed (Result: exit-code) since Mon, 16 Jul 2012 12:0=
3:55 +0000; 1s ago
> >         Process: 532 ExecStartPre=3D/bin/systemctl stop systemd-kmsg-sy=
slogd.service (code=3Dexited, status=3D1/FAILURE)
> >          CGroup: name=3Dsystemd:/system/busybox-syslog.service
> >=20
> > Jul 16 12:03:56 qemux86-64 systemctl[532]: Failed to issue method call:=
 Unit....

Jul 16 12:25:18 qemux86-64 systemctl[149]: Failed to issue method call:
Unit systemd-kmsg-syslogd.service not loaded.

/lib/systemd/system/busybox-syslog.service:
ExecStartPre=3D/bin/systemctl stop systemd-kmsg-syslogd.service

and systemd-kmsg-syslogd.service seems gone (for quite a while since
replaced by journald), maybe hit wasn't fatal before..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nYySOmuH/HDX6pKp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAEHkUACgkQN1Ujt2V2gBx6ogCbB2yRsAykNwvlSriYLEwLMETc
agYAn1PhYhnvxt5rynHFupmAoTOOR8eK
=6Xmq
-----END PGP SIGNATURE-----

--nYySOmuH/HDX6pKp--
