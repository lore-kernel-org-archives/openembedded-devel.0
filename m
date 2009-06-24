Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MJZPw-0005TN-Il
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 22:50:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id BD3E81422AA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 22:40:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgR5xxnFg1z4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 22:40:22 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 8DE701416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 22:40:20 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
References: <1245871136.5939.3.camel@utx.utx.cz>
	<b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
Date: Wed, 24 Jun 2009 22:38:49 +0200
Message-Id: <1245875929.5939.17.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] introduction of virtual/libusb0
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
X-List-Received-Date: Wed, 24 Jun 2009 20:50:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Chris Larson wrote:
> +++ b/recipes/bluez/bluez.inc
> > +DEPENDS =3D "gstreamer gst-plugins-base virtual/libusb0 dbus glib-2.=
0"
> This is wrong.  libusb0 does not replace libusb1.
=EF=BB=BF
It was an attempt to make unrelated fix. bluez.inc is actually required
only by bluez-hcidump_1.42.bb. And bluez-hcidump_1.42.bb does not
require libusb at all (or at least not directly). So in fact it should
be probably removed completely.

> It's worth noting that this could be done in a much less intrusive way.
>
> In libusb-compat:
> PROVIDES +=3D "libusb"
>=20
> In libusb:
> DEFAULT_PREFERENCE =3D "-1", or just set the PREFERRED_PROVIDER_libusb =
=3D
> "libusb-compat" in the distros.

I didn't know that DEFAULT_PREFERENCE_distroname is possible. But if
this will work and allow distro maintainers to select one of another,
then it may be used as well. But I still think that distro config is a
more convenient way.

> Could also PROVIDES +=3D "libusb0" or
> PROVIDES +=3D "libusb-old" or something, to let recipes explicitly
> depend on the old one, though that's a bad thing to be doing.

Once your staging contains libusb-compat, none of your packages can
depend on libusb (-old). Their staging files conflict and one replaces
another during the build resulting in compilations against a random one.

It's one or another and distro maintainer must decide, which one to use
for everything.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



