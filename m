Received: from bsmtp3.bon.at ([213.33.87.17] helo=lbmfmo03.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q1fDx-0001RO-1b for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 14:32:45 +0100
Received: from bsmtp.bon.at (unknown [192.168.181.107])
	by lbmfmo03.bon.at (Postfix) with ESMTP id 02EA7119526
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 13:33:25 +0100 (CET)
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id B07FC130044
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 13:33:18 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2011 13:33:17 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103211236.39719.pgsellmann@portner-elektronik.at>
	<1300708482.2228.67.camel@phil-desktop>
In-Reply-To: <1300708482.2228.67.camel@phil-desktop>
MIME-Version: 1.0
Message-Id: <201103211333.17729.pgsellmann@portner-elektronik.at>
Subject: Re: [PATCH 3/3] base-files-3.0.14 configuration files
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
X-List-Received-Date: Mon, 21 Mar 2011 13:32:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Phil!

Am Montag, 21. M=E4rz 2011, 12:54:42 schrieb Phil Blundell:
> On Mon, 2011-03-21 at 12:36 +0100, Peter Gsellmann wrote:
> > setting ONLINE_PACKAGE_MANAGEMENT =3D "none" precludes the use of CONFF=
ILES_* in all recipes??
>=20
> It doesn't preclude it, but it does render CONFFILES fairly useless.
>=20
> It looks like the CONFFILES_micro =3D "" in this particular recipe was
> added by me in 2b4ab236.  I guess I probably did this to avoid having
> nonexistent files show up in CONFFILES (since micro doesn't ship stuff
> like motd at all).  I don't recall whether I did this just for neatness
> or whether OE was actually issuing a diagnostic for that situation.
>=20
> I guess it might make some sense to just set CONFFILES_micro =3D ""
> globally in micro.conf rather than doing it in individual recipes.
>=20
> > As i can see, ONLINE_PACKAGE_MANAGEMENT is misused for micro image.
>=20
> What do you mean?
Sorry, no misuse, but wrong cause assumed by me.
CONFFILES_${PN}_micro should not be empty but contain nsswitch.conf
  and hostname as these are the only you allow to exist.

Would this work for you?
CONFFILES_${PN}_micro =3D "${sysconfdir}/hostname ${sysconfdir}/nsswitch.co=
nf"

Even if nothing on your target is honoring the configness of these files at=
 least it is documented.



Peter


