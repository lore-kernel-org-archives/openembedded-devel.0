Received: from bsmtp3.bon.at ([213.33.87.17] helo=lbmfmo03.bon.at)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pgsellmann@portner-elektronik.at>)
	id 1Q1dbT-0001cP-RC for openembedded-devel@lists.openembedded.org;
	Mon, 21 Mar 2011 12:48:55 +0100
Received: from bsmtp.bon.at (unknown [192.168.181.108])
	by lbmfmo03.bon.at (Postfix) with ESMTP id AEC25CE8E5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 12:47:04 +0100 (CET)
Received: from aspire.localdomain (unknown [88.116.171.82])
	by bsmtp.bon.at (Postfix) with ESMTP id 8B646130050
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2011 12:36:40 +0100 (CET)
From: Peter Gsellmann <pgsellmann@portner-elektronik.at>
Organization: PORTNER Elektronik
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2011 12:36:39 +0100
User-Agent: KMail/1.13.5 (Linux/2.6.32.26-175.fc12.x86_64; KDE/4.4.5; x86_64; ;
	)
References: <201103171154.23397.pgsellmann@portner-elektronik.at>
	<201103181837.04944.pgsellmann@portner-elektronik.at>
	<20110321093020.GB3798@jama.jama.net>
In-Reply-To: <20110321093020.GB3798@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201103211236.39719.pgsellmann@portner-elektronik.at>
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
X-List-Received-Date: Mon, 21 Mar 2011 11:48:56 -0000
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

Hi Martin!

Am Montag, 21. M=E4rz 2011, 10:30:21 schrieb Martin Jansa:
> On Fri, Mar 18, 2011 at 06:37:04PM +0100, Peter Gsellmann wrote:
> > Am Freitag, 18. M=E4rz 2011, 16:30:48 schrieb Martin Jansa:
> > > On Fri, Mar 18, 2011 at 02:08:15PM +0100, Peter Gsellmann wrote:
> > > > Am Freitag, 18. M=E4rz 2011, 09:59:17 schrieb Hauser, Wolfgang (ext=
ernal):
> > > > > >> > Mark some files in ${sysconfdir} as configuration files so t=
hey are
> > > > > >> not blindly overwritten when upgrading
> > > > > >>=20
> > > > > >> I would suggest a pre-/post processing in the packages, like d=
ebian
> > > > > >> does.
> > > > > >> If a config file exists or is changed, the current File will be
> > > > > rotated
> > > > > >> or, if possible, left as it is and the new=20
> > > > > >> file is installed beside the changed one.
> > > > >=20
> > > > > >The opkg does not touch a present config file, but installs the =
new
> > > > > file with the name *-opkg
> > > > > >So if you do a find /etc -name \*-opkg you see the conflicts.
> > > > >=20
> > > > > >Any sensible conversion from old to new config file should be ma=
de by
> > > > > the package itself.
> > > > >=20
> > > > > As I experienced, opkg exits with an error code if a config file =
already
> > > > > exists, so if you want to create an image, the process will break=
 at
> > > > > that error.
> > > > > It wasn't possible to create an image automatically then.
> > > > If you create a fresh new image, the config files should not exist.
> > > > opkg should not complain.
> > >=20
> > > Looks like you two are talking about 2 different things.
> > >=20
> > > W) If 2 different packages are installing same config file, opkg won't
> > > overwrite it and image creation would also fail
> > This should considered as bug in opkg;
> > why 2 packages may not use the same Conffile?
> > For example one would split 'ntp' into 'ntpd' and 'ntpdate':
> >   both should use the servers in /etc/ntp.conf .
> > In present configuration you have to syncronize 2 files /etc/ntp.conf
> >   and /etc/ntp/step-tickers .
>=20
> well maybe it makes sense for files from CONFFILES, but certainly you
> don't want some other package to overwrite binary owned by other package
> etc.. so I think that it's working the same for CONFFILES and such
> "usefull" colisions are so seldom that nobody cared to create exception.
>=20
> > > P) If same package is trying to install newer version of config file =
it
> > > overwrites it silently when md5 sums are the same or file is not in
> > > CONFFILES or creates config.file-opkg otherwise.
> > This should considered as user error to 'install' a package instead of =
'upgrade'.
>=20
> it's the same with upgrade, by "install newer version" I actually meant
> "opkg upgrade", sorry I wasn't clear.
>=20
> > > So the patch idea looks sane to me, only please check why there is
> > > unused conffiles variable and maybe use it as default CONFFILES or
> > > remove it completely.
> > I think you talk about CONFFILES_${PN}_micro, CONFFILES_${PN}_nylon, CO=
NFFILES_${PN}_slugos ?
>=20
> No, about conffiles (lowercase)
> <snip>
> volatiles =3D "cache run log lock tmp"
> conffiles =3D "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>              ${sysconfdir}/inputrc ${sysconfdir}/issue /${sysconfdir}/iss=
ue.net \
>              ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
>              ${sysconfdir}/default"
> </snip>
like this?
CONFFILES_${PN} =3D ${conffiles}
CONFFILES_${PN}_micro =3D ""
CONFFILES_${PN}_nylon =3D "${sysconfdir}/resolv.conf" + ${conffiles}
CONFFILES_${PN}_slugos =3D "${sysconfdir}/resolv.conf" + ${conffiles}

Patch follows (have to test before).

> > For 'micro' the list is empty! What is the advantage of an empty list f=
or this image?
> > I dont know and for this i am a bit reluctant to remove it.
>=20
> IIRC someone in this thread said it's because micro is not using ONLINE_P=
ACKAGE_MANAGEMENT..
setting ONLINE_PACKAGE_MANAGEMENT =3D "none" precludes the use of CONFFILES=
_* in all recipes??
As i can see, ONLINE_PACKAGE_MANAGEMENT is misused for micro image.




Peter


