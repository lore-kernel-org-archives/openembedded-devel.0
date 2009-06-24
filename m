Received: from [84.21.108.25] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1MJago-0004fj-00
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Jun 2009 00:11:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id E37311422AA5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 00:01:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62hP0XLaKd4a
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 00:01:51 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id BA87A1416BA2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2009 00:01:51 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a50906241347g1667f13cy83f7dc49f6e7ce86@mail.gmail.com>
References: <1245871136.5939.3.camel@utx.utx.cz>
	<b6ebd0a50906241244hb9331c6nb22d82f6f04d004c@mail.gmail.com>
	<1245875929.5939.17.camel@utx.utx.cz>
	<b6ebd0a50906241347g1667f13cy83f7dc49f6e7ce86@mail.gmail.com>
Date: Thu, 25 Jun 2009 00:00:12 +0200
Message-Id: <1245880813.5939.46.camel@utx.utx.cz>
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
X-List-Received-Date: Wed, 24 Jun 2009 22:11:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Chris Larson wrote:

> DEFAULT_PREFERENCE is just default behavior when no PREFERRED_PROVIDER
> is set by the distro.

I just tested it without any of DEFAULT_PREFERENCE nor
PREFERRED_PROVIDER. It defaults to the old libusb.

With setting of PREFERRED_PROVIDER_virtual/libusb0 ?=3D "libusb-compat" i=
n
the angstrom distro config, it uses to libusb-compat (but just only for
angstrom).

When I remove this line from the distro config and set
DEFAULT_PREFERENCE =3D "-1" to all old libusb recipes (=EF=BB=BFand even =
setting
DEFAULT_PREFERENCE =3D "1" in libusb-compat), it still populates old
libusb instead of expected libusb-compat (using the virtual requires
from the patch above).

Maybe it compares version number and makes bad assumption that
libusb-0.1.12 > libusb-compat-0.1.0.
=EF=BB=BF
I would like to encourage everybody to use new libusb-compat, unless
configured opposite... I am not sure how to do it. Is there any default
config for default values of PREFERRED_PROVIDER?

> I'm just pointing out that you could use
> "libusb" rather than "virtual/libusb0", and avoid having to change the
> multitude of recipes.

It would not avoid it. Some of recipes use libusb, some of them use
libusb-compat, both want just any libusb0. It caused building both and
moving one to morgue just after the build of the feed.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



