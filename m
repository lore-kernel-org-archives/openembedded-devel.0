Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWVQ8-0004go-Dl
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 16:53:04 +0100
Received: by wgbds11 with SMTP id ds11so1213618wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 07:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9l/Tay/pv9G84pDexpvysHSMVoCrmxcCn5Nm6mx6FiE=;
	b=uuva8f8EJSSI38gTImdOxwUem/YM+sBJv+ZV6LacjgeuR1wUAw8ucxLwwz5Yz4HC3V
	6FL7UDjdhomuyM9WWfGUgF6b2U6XaKcfjpOtP2FXalyh7UULyA6RXdSHDGccmYWJ7W/6
	X643ucGzGiZtIxJgLf9c8yOhNJCLT5MsvgE64=
Received: by 10.216.229.160 with SMTP id h32mr634769weq.38.1322840781466;
	Fri, 02 Dec 2011 07:46:21 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u5sm4332667wbm.2.2011.12.02.07.46.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 07:46:20 -0800 (PST)
Date: Fri, 2 Dec 2011 16:46:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111202154608.GE3770@jama.jama.net>
References: <4ED8307F.2060306@googlemail.com>
	<201112021120.17762.GNUtoo@no-log.org>
	<4ED8DBC7.6080708@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
	<4ED8EAEC.3010706@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4ED8EAEC.3010706@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: fso-console-image problems
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
X-List-Received-Date: Fri, 02 Dec 2011 15:53:04 -0000
X-Groupsio-MsgNum: 35825
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline

--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2011 at 03:12:44PM +0000, Mr Dash Four wrote:
>=20
> > So yes this is OE-classic.
> >
> > For building SHR you should follow SHR instructions:
> > http://wiki.shr-project.org/trac/wiki/Building%20SHR
> >  =20
> I see. Truth be told, this was the first thing I tried to do, but later=
=20
> on decided to use openembedded as my ultimate aim is to have a cli image=
=20
> (with less stuff on it as I don't want/need the gui). I think the=20
> "shr-image" target I build is similar, if not the same, as the building=
=20
> of the SHR - a link to which you provided above.

yes probably similar but at least you would read about diff between
OE-classic and oe-core setup.. but fine

> > Where are instructions for building from OE-classic as well as new
> > layers, but with htcdream there is problem in oe-core, see this thread:
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/010=
993.html
> >  =20
> Interesting, but thankfully that doesn't apply to me, right?

No if you decide to stuck with old OE-classic.. but would be great to
get htcdream well supported with oe-core..

> > I'm not familiar with htcdream, but this looks like some problem with k=
ernel fb=20
> > driver, you can try to boot shr-image, setup ssh access and then
> > shutdown xserver (with /etc/init.d/xserver-nodm stop) to see if you get
> > console login (check inittab if it's starting getty there) and also try
> > other vts with chvt.
> >  =20
> The phone, as far as I know, is not connected anywhere - I don't have a=
=20
> working wifi/gsm etc - fastboot uses the usb link to transfer (and boot)=
=20
> the image. Is it possible to, somehow, use usb to connect to the phone=20
> this way (if so, how)? As you probably have gathered by now, I am a n00b=
=20
> when it comes to this smartphone/embedded devices business, so would=20
> need a bit of help with it. What is "vts" and "chvt"?

Well I was expecting that setting usbnet (g_ether kernel module) is easy
on htcdream as it's easy on other devices and that you can load it on
boot and check that usb0 is set to auto.

vt - virtual terminal
chvt - change foreground virtual terminal

as sometimes Xserver is started on different vt then where getty is
enabled, but depends on config and I'm not familiar with htcdream ..

> I was thinking (that was plan B) to specify runlevel 3, not 5, thus=20
> forcing a console log in (provided there is one!) - don't know if this=20
> works on smartphones though! I already discovered that "nomodeset" isn't=
=20
> working, sadly!

you need to have getty enabled in inittab ie:
t1:2345:respawn:/sbin/getty 38400 tty1

>=20
> > If it works you can prepare console-image with right
> > /etc/network/interfaces to be able to ssh in as soon as it boots and
> > then debug those stripes over ssh too.
> >  =20
> This is what I can't figure out - how can I get connectivity on this=20
> phone if none of my wifi/gms is up and running?

usbnet is usually easiest

> > Well if you can get serial console to htcdream then it would be even
> > easier.
> >  =20
> That is way over my head I am afraid!
>=20
> >> I don't know whether I would need this. I also discovered yesterday th=
at=20
> >> there is another openembedded git repository on freesmartphone.org=20
> >> (git://git.freesmartphone.org/openembedded.git), but not sure whether=
=20
> >> this is the same as the one I have been using...
> >>    =20
> >
> > This is usually used only by FSO people without R/W access to OE git to
> > prepare some changes.
> >  =20
> So, I shouldn't use it then?

yes, don't use it

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Y8sAACgkQN1Ujt2V2gBytTwCglLGc622Bmy3sRHIwSMZacsAr
Z08An10RgplC0KsFm9fTNfWKKBYglVkY
=Qloe
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
