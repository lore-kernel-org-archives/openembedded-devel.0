Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q1jj4-0007z3-VH for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 19:21:11 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 2DA9410010
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 19:19:13 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2011 19:19:11 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103211353.40761.pgsellmann@portner-elektronik.at>
	<1300725546.2228.88.camel@phil-desktop>
In-Reply-To: <1300725546.2228.88.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201103211919.11954.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH v2] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 18:21:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Am Montag, 21. M=E4rz 2011, 17:39:06 schrieb Phil Blundell:
> On Mon, 2011-03-21 at 13:53 +0100, Peter Gsellmann wrote:
> > Mark some files in ${sysconfdir} as configuration files so they are not=
 blindly overwritten when upgrading
> > Adjust conffiles variable to be usable as default in CONFFILES
> > Images nylon,slugo inherit and amend default set of conffiles
> > Image micro has very few configuration files
>=20
> Note that these are DISTROs, not images.  Also, it's "slugos".
>=20
> > +CONFFILES_${PN}_nylon =3D "${sysconfdir}/resolv.conf" + ${conffiles}
>=20
> Does that actually work?  I'm not convinced that this notation will do
> what you seem to be expecting.
:-( no, sorry. I am always confused about where bash-syntax or python-synta=
x counts.
This statement seems to works but dont know if its the canonical syntax:
CONFFILES_${PN}_nylon =3D "${sysconfdir}/resolv.conf ${conffiles}"
If ok, i will resend patch v3 tomorrow.


Peter


