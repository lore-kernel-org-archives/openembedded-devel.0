Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MzyYG-0006HW-9X
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 22:10:00 +0200
Received: from 88-109-185-146.dynamic.dsl.as9105.com ([88.109.185.146]
	helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MzyX6-0003lS-Ng
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Oct 2009 21:08:47 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200910191847.30200.marcin@juszkiewicz.com.pl>
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1255969713.4434.5.camel@hammer.suse.cz>
	<200910191847.30200.marcin@juszkiewicz.com.pl>
Date: Mon, 19 Oct 2009 21:08:20 +0100
Message-Id: <1255982900.21136.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Mon, 19 Oct 2009 20:10:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2009-10-19 at 18:47 +0200, Marcin Juszkiewicz wrote:
> Dnia poniedzia=C5=82ek, 19 pa=C5=BAdziernika 2009 o 18:28:33 Stanislav Br=
abec=20
> napisa=C5=82(a):
>=20
> > Maybe it should be 2.6.21.7-r0 instead of 2.6.21-r13 and do the same fo=
r
> > other patched recipes.
> =20
> No, your suggestion will break everyone who uses PREF_VER_linux =3D "2.6.=
21" for=20
> example.

I guess that depends on your definition of "breaks".  One way of looking
at it is that folks who set PREFERRED_VERSION_linux =3D "2.6.21" are
wanting the actual version 2.6.21, not 2.6.21.7, and might be dismayed
to find that they have suddenly been bumped to the latter with no way to
get back to what they had before.

2.6.21.7 clearly is a new upstream release and I would have thought that
it is appropriate to reflect that in PV rather than hiding it behind a
PR increment.

p.




