Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nez4z-0003d0-RW for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 00:01:16 +0100
Received: from f053032124.adsl.alicedsl.de ([78.53.32.124]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Nez2Y-0002DJ-Lf for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 22:58:42 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B71815C.6050208@dresearch.de>
References: <4B7145A5.70808@dresearch.de>
	<1265716784.16488.1.camel@mattotaupa>	<4B716090.2090104@dresearch.de>
	<20100209132913.GC24852@ibawizard.net> <4B71815C.6050208@dresearch.de>
Date: Tue, 09 Feb 2010 23:58:40 +0100
Message-ID: <1265756320.17045.26.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: confused by netbase/udev
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
X-List-Received-Date: Tue, 09 Feb 2010 23:01:24 -0000
X-Groupsio-MsgNum: 16618
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-mVGvNg27XGtUquAhlduq"

--=-mVGvNg27XGtUquAhlduq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Dienstag, den 09.02.2010, 16:38 +0100 schrieb Steffen Sledz:
> Petr =C5=A0tetiar wrote:
> > man 5 interfaces?

[=E2=80=A6]

> OK, i try to solve one problem after the other. Let's accept that
> every new USB-NIC gets a new name for now (using a pool of interface name=
s).
>=20
> I've tried to create a /etc/network/interfaces which fits my wishes:
>=20
> ------------->snip<----------------
> # /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
>=20
> # the loopback interface
> auto lo
> iface lo inet loopback
>=20
> # interfaces to bring up at boot time
> auto eth0
>=20
> # the onboard NIC
> iface eth0 inet dhcp
>=20
> # interfaces to bring up when hotplugging
> allow-hotplug eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8
>=20
> # additional USB-NIC's
> iface eth1 inet dhcp
> iface eth2 inet dhcp
> iface eth3 inet dhcp
> iface eth4 inet dhcp
> iface eth5 inet dhcp
> iface eth6 inet dhcp
> iface eth7 inet dhcp
> iface eth8 inet dhcp
> ------------->snip<----------------
>=20
> This works fine when hotplugging, but the USB-NIC is not recognised
> when connected while booting up. :(

Did you test this with both USB-NICs?

> I tried to change the one line responsible for that to
>=20
>   auto eth0 eth1 eth2 eth3 eth4 eth5 eth6 eth7 eth8
>=20
> This works better but leads to dirty errors messages while booting
> and shutdown for disconnected interfaces:
>=20
> boot:
> eth1: unknown interface: No such device
> eth2: unknown interface: No such device
> eth3: unknown interface: No such device
> eth4: unknown interface: No such device
> eth5: unknown interface: No such device
> eth6: unknown interface: No such device
> eth7: unknown interface: No such device
> eth8: unknown interface: No such device
>=20
> shutdown:
> Deconfiguring network interfaces... cat: /var/run/udhcpc.eth0.pid: No suc=
h file or directory
> cat: /var/run/udhcpc.eth1.pid: No such file or directory
> eth1: unknown interface: No such device
> cat: /var/run/udhcpc.eth2.pid: No such file or directory
> eth2: unknown interface: No such device
> cat: /var/run/udhcpc.eth3.pid: No such file or directory
> eth3: unknown interface: No such device
> cat: /var/run/udhcpc.eth4.pid: No such file or directory
> eth4: unknown interface: No such device
> cat: /var/run/udhcpc.eth5.pid: No such file or directory
> eth5: unknown interface: No such device
> cat: /var/run/udhcpc.eth6.pid: No such file or directory
> eth6: unknown interface: No such device
> cat: /var/run/udhcpc.eth7.pid: No such file or directory
> eth7: unknown interface: No such device
> cat: /var/run/udhcpc.eth8.pid: No such file or directory
> eth8: unknown interface: No such device
> done.
>=20
> I'm not really happy with that. :(

How are your boot/init scripts activate the interfaces, i. e. what
options to they pass to `ifup`?

I still suggest to use a daemon as NetworkManager which as far as I know
compensate this flaw of udev and `/e/n/i` which were created when a
system had no dynamically added (non-wifi) NICs.

Although I must admit that I find a use case that someone is changing
the NICs not very common. Normally you get one and always use that
device with this one. And if you change it you normally only have to
edit `/e/n/i` once since from now on you will use the new device.


Thanks,

Paul

--=-mVGvNg27XGtUquAhlduq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Dies ist ein digital signierter Nachrichtenteil

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAktx6KAACgkQPX1aK2wOHVgaOwCfdXnLoKwfAGEZdhj7DHLwgAxe
yuEAoIko6q6cz+NQgt9zHWk+quM3KlNJ
=JM8c
-----END PGP SIGNATURE-----

--=-mVGvNg27XGtUquAhlduq--
