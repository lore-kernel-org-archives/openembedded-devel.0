Received: from bsmtp5.bon.at ([195.3.86.187] helo=bsmtp.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q0ddT-00051O-Qr for openembedded-devel@lists.openembedded.org;
	Fri, 18 Mar 2011 18:38:52 +0100
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 8180E1000B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2011 18:37:06 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2011 18:37:04 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103181408.16366.pgsellmann@portner-elektronik.at>
	<20110318153048.GC17785@jama.jama.net>
In-Reply-To: <20110318153048.GC17785@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201103181837.04944.pgsellmann@portner-elektronik.at>
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
X-List-Received-Date: Fri, 18 Mar 2011 17:38:52 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Martin!

Am Freitag, 18. M=E4rz 2011, 16:30:48 schrieb Martin Jansa:
> On Fri, Mar 18, 2011 at 02:08:15PM +0100, Peter Gsellmann wrote:
> > Am Freitag, 18. M=E4rz 2011, 09:59:17 schrieb Hauser, Wolfgang (externa=
l):
> > > >> > Mark some files in ${sysconfdir} as configuration files so they =
are
> > > >> not blindly overwritten when upgrading
> > > >>=20
> > > >> I would suggest a pre-/post processing in the packages, like debian
> > > >> does.
> > > >> If a config file exists or is changed, the current File will be
> > > rotated
> > > >> or, if possible, left as it is and the new=20
> > > >> file is installed beside the changed one.
> > >=20
> > > >The opkg does not touch a present config file, but installs the new
> > > file with the name *-opkg
> > > >So if you do a find /etc -name \*-opkg you see the conflicts.
> > >=20
> > > >Any sensible conversion from old to new config file should be made by
> > > the package itself.
> > >=20
> > > As I experienced, opkg exits with an error code if a config file alre=
ady
> > > exists, so if you want to create an image, the process will break at
> > > that error.
> > > It wasn't possible to create an image automatically then.
> > If you create a fresh new image, the config files should not exist.
> > opkg should not complain.
>=20
> Looks like you two are talking about 2 different things.
>=20
> W) If 2 different packages are installing same config file, opkg won't
> overwrite it and image creation would also fail
This should considered as bug in opkg;
why 2 packages may not use the same Conffile?
=46or example one would split 'ntp' into 'ntpd' and 'ntpdate':
  both should use the servers in /etc/ntp.conf .
In present configuration you have to syncronize 2 files /etc/ntp.conf
  and /etc/ntp/step-tickers .

> P) If same package is trying to install newer version of config file it
> overwrites it silently when md5 sums are the same or file is not in
> CONFFILES or creates config.file-opkg otherwise.
This should considered as user error to 'install' a package instead of 'upg=
rade'.

> So the patch idea looks sane to me, only please check why there is
> unused conffiles variable and maybe use it as default CONFFILES or
> remove it completely.
I think you talk about CONFFILES_${PN}_micro, CONFFILES_${PN}_nylon, CONFFI=
LES_${PN}_slugos ?
=46or 'nylon' and 'slugos' it generates an additional empty file /etc/resol=
v.conf .
Otherwise this file is not owned by any package even so it exists!
  (anybody knows who creates it?)
Could this be written as:
CONFFILES_${PN}_nylon =3D ${CONFFILES_${PN}} + "${sysconfdir}/resolv.conf"
  or is there a smarter syntax?

OTOH, declaring 'base-files' as owner of /etc/resolv.conf for _all_ images
  would be the better solution (in my opinion). Votings?


=46or 'micro' the list is empty! What is the advantage of an empty list for=
 this image?
I dont know and for this i am a bit reluctant to remove it.



Peter


