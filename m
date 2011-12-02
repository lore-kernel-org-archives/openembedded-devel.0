Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RWW2J-0006D4-43
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Dec 2011 17:32:31 +0100
Received: by wgbds11 with SMTP id ds11so1264993wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2011 08:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=cYOZytNDWGx8HtFwpPwIXoGLgWg1919iU9vR8bwgIqU=;
	b=UfzBiiccG9oQX2J726E3avgH5PeYX7cpkBJDyRv4mtmU46tkzFHFzYKJBYixktYKsu
	e3RxQVJH4W+A75mvl02/qaGmoVcwwHYRvyNgqt9QZbYb4csmPjbvwwhp5R3eaqcHV2o3
	B5j25TETJ+m2elItDCv5lRQHpxdr8GofhSSvg=
Received: by 10.227.198.142 with SMTP id eo14mr6544233wbb.28.1322843147963;
	Fri, 02 Dec 2011 08:25:47 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gd6sm10879197wbb.1.2011.12.02.08.25.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 08:25:46 -0800 (PST)
Date: Fri, 2 Dec 2011 17:25:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111202162544.GG3770@jama.jama.net>
References: <4ED8307F.2060306@googlemail.com>
	<201112021120.17762.GNUtoo@no-log.org>
	<4ED8DBC7.6080708@googlemail.com>
	<20111202145256.GD3770@jama.jama.net>
	<4ED8EAEC.3010706@googlemail.com>
	<20111202154608.GE3770@jama.jama.net>
	<4ED8FAE5.7010804@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <4ED8FAE5.7010804@googlemail.com>
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
X-List-Received-Date: Fri, 02 Dec 2011 16:32:31 -0000
X-Groupsio-MsgNum: 35827
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="O8XZ+2Hy8Kj8wLPZ"
Content-Disposition: inline

--O8XZ+2Hy8Kj8wLPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 02, 2011 at 04:20:53PM +0000, Mr Dash Four wrote:
> Thanks again, JaMa,
>=20
>=20
> >> Interesting, but thankfully that doesn't apply to me, right?
> >>    =20
> >
> > No if you decide to stuck with old OE-classic.. but would be great to
> > get htcdream well supported with oe-core..
> >  =20
> Once I get my phone up and running I'll give it a go - I've been=20
> following the discussion about oe-classic/oe-core with interest, so I am=
=20
> willing to help out if I can.

Great!

> >> The phone, as far as I know, is not connected anywhere - I don't have =
a=20
> >> working wifi/gsm etc - fastboot uses the usb link to transfer (and boo=
t)=20
> >> the image. Is it possible to, somehow, use usb to connect to the phone=
=20
> >> this way (if so, how)? As you probably have gathered by now, I am a n0=
0b=20
> >> when it comes to this smartphone/embedded devices business, so would=
=20
> >> need a bit of help with it. What is "vts" and "chvt"?
> >>    =20
> >
> > Well I was expecting that setting usbnet (g_ether kernel module) is easy
> > on htcdream as it's easy on other devices and that you can load it on
> > boot and check that usb0 is set to auto.
> >  =20
> Ah, right, in other words connecting the device (my phone) via usb *is*=
=20
> possible, right? If so, I presume this "usb0" interface acts in a=20
> similar fashion as my "eth0" for example (ifconfig, route etc can be=20
> applied to it), right? Quite a revelation to me this! How do I get it=20
> connected on the "host" side (on my PC on which the usb is used) - do I=
=20
> see a similar adapter on it as well? How does that work then?

Every usb networking howto will help you with this :).

> > vt - virtual terminal
> > chvt - change foreground virtual terminal
> >
> > as sometimes Xserver is started on different vt then where getty is
> > enabled, but depends on config and I'm not familiar with htcdream ..
> >  =20
> Noted, thanks!
>=20
> >> I was thinking (that was plan B) to specify runlevel 3, not 5, thus=20
> >> forcing a console log in (provided there is one!) - don't know if this=
=20
> >> works on smartphones though! I already discovered that "nomodeset" isn=
't=20
> >> working, sadly!
> >>    =20
> >
> > you need to have getty enabled in inittab ie:
> > t1:2345:respawn:/sbin/getty 38400 tty1
> >  =20
> I'll check that at first opportunity - is it possible that *might* be=20
> the reason I am not getting anywhere with my console-image rootfs? I=20
> haven't checked the inittab there ... will do that when I get home tonigh=
t!
>=20
> >> This is what I can't figure out - how can I get connectivity on this=
=20
> >> phone if none of my wifi/gms is up and running?
> >>    =20
> >
> > usbnet is usually easiest
> >  =20
> So, I presume this usbnet is a point-to-point adapted, is it? Do I have=
=20
> to set up special routing (i.e. with route add etc) for it? Do I have to=
=20
> give it an ip address from the net I am on my host PC or is this differen=
t?

usualy you use IPs from private range and if you want to access internet
=66rom your phone you just setup masquerade in your iptables on PC.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--O8XZ+2Hy8Kj8wLPZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Y/AgACgkQN1Ujt2V2gBzO/ACeLs4C9yysgLCoKedoko2Kf6zI
/BIAoLL5IY9FF2aaMBKIR6Fsj8+wsF5e
=4WoL
-----END PGP SIGNATURE-----

--O8XZ+2Hy8Kj8wLPZ--
