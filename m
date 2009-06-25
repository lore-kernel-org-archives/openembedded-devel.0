Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MJsg9-0003nL-VZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 19:24:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 2BDDC140971A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 19:14:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aUzrcrEkj6Gp
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 19:14:19 +0200 (CEST)
Received: from [10.20.1.86] (nat.scz.novell.com [213.151.88.252])
	by ns.penguin.cz (Postfix) with ESMTP id F23101416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 19:14:18 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245880813.5939.46.camel@utx.utx.cz>
References: <1245871136.5939.3.camel@utx.utx.cz>
	<b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
	<1245875929.5939.17.camel@utx.utx.cz>
	<b6ebd0a50906241347g1667f13cy83f7dc49f6e7ce86@mail.gmail.com>
	<1245880813.5939.46.camel@utx.utx.cz>
Date: Thu, 25 Jun 2009 19:12:44 +0200
Message-Id: <1245949964.25917.13.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.27.2 
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
X-List-Received-Date: Thu, 25 Jun 2009 17:24:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Stanislav Brabec wrote:
> Chris Larson wrote:
>=20
> > DEFAULT_PREFERENCE is just default behavior when no PREFERRED_PROVIDE=
R
> > is set by the distro.

It seems that it is not true. First in order it selects ordered package
name list for the requirement (using only PREFERRED_PROVIDER), second in
order it decides about best version for each package name (using
DEFAULT_PREFERENCE and PREFERRED_VERSION variables). When no explicit
dependence or conflict is found, best version for the package first in
order will be selected.

It seems that virtual/libusb0 is much cleaner solution than the current
libusb-0.0.0 (which did not work correctly).

> When I remove this line from the distro config and set
> DEFAULT_PREFERENCE =3D "-1" to all old libusb recipes (=EF=BB=BFand eve=
n setting
> DEFAULT_PREFERENCE =3D "1" in libusb-compat), it still populates old
> libusb instead of expected libusb-compat (using the virtual requires
> from the patch above).

The above may explain this behavior:

DEBUG: Added dependency virtual/libusb0 for /OE/openembedded/recipes/usbu=
tils/usbutils_0.82.bb
DEBUG: Added dependency virtual/libusb0 for /OE/openembedded/recipes/blue=
z/bluez4_4.42.bb
DEBUG: providers for virtual/libusb0 are: ['libusb', 'libusb-compat']
DEBUG: sorted providers for virtual/libusb0 are: ['/OE/openembedded/recip=
es/libusb/libusb_0.1.12.bb', '/OE/openembedded/recipes/libusb/libusb-comp=
at_0.1.0.bb']
NOTE: multiple providers are available for virtual/libusb0 (libusb, libus=
b-compat);
NOTE: consider defining PREFERRED_PROVIDER_virtual/libusb0
DEBUG: adding /OE/openembedded/recipes/libusb/libusb_0.1.12.bb to satisfy=
 virtual/libusb0

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



