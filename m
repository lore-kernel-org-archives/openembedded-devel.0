Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDDYP-0006dg-Ox
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Mar 2013 13:34:46 +0100
Received: by mail-pb0-f42.google.com with SMTP id xb4so5927615pbc.29
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2013 04:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jWEzttAaHttKrUI59ngf4spZjFgfS9R1HYu3DqJlvRk=;
	b=dxTSshMjH9+7UagVwaLA+CsBWPofTVfnnWnkV8Y1GfCDvxChVB+i9zkriCaxdGV8C9
	HV/W0aZTC9UXKGQmV/Oaufx3dX2uAG8IG5Jg9QKpflXtk2C0qOBKEdO/40op3m50AH1R
	g2HOpDLQ4QMmucpwQq1IZ5JeqQNqeJXA3D13UiCPLw8pCnnnapwReo00jBYwXkFIFK04
	043IHt0F4IPIHH5O3I7/FwbfqRH01YgfZ73YnimbhSfIVwB8+dw412+6VwKvxk2ItOet
	xMVIDKRAb1LVIa3bti5Yd7S3oY0B+FvIXRommKRXN0FV3rviGtvSPW7vrV26Sz34OJWB
	QekA==
X-Received: by 10.68.42.9 with SMTP id j9mr46166299pbl.142.1362572290284;
	Wed, 06 Mar 2013 04:18:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id
	iu10sm31101821pbc.13.2013.03.06.04.18.06
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 06 Mar 2013 04:18:08 -0800 (PST)
Date: Wed, 6 Mar 2013 13:17:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130306121758.GC32228@jama.dyndns-home.com>
References: <1360834325-22890-1-git-send-email-florin.sarbu@windriver.com>
	<1360834325-22890-2-git-send-email-florin.sarbu@windriver.com>
	<20130214094445.GJ3300@jama> <5136F265.1080603@windriver.com>
	<20130306080035.GB32228@jama.dyndns-home.com>
	<5136F879.3050808@windriver.com>
MIME-Version: 1.0
In-Reply-To: <5136F879.3050808@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][meta-systemd][] rpcbind: Add ${PN}-systemd to PACKAGES
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
X-List-Received-Date: Wed, 06 Mar 2013 12:34:47 -0000
X-Groupsio-MsgNum: 43399
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Content-Disposition: inline

--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2013 at 10:04:09AM +0200, Florin Sarbu wrote:
> Actually no, forgot to mention that. My bad. I am using the systemd=20
> class from poky. Now that poky has systemd.bbclass, what is the point of=
=20
> the meta-openembedded systemd class? I thought it would go away and=20
> people would rely on the poky features for systemd enabling.

See this thread
http://lists.linuxtogo.org/pipermail/openembedded-core/2013-February/035956=
=2Ehtml
=20
> On 03/06/2013 10:00 AM, Martin Jansa wrote:
> > On Wed, Mar 06, 2013 at 09:38:13AM +0200, Florin Sarbu wrote:
> >> Hi,
> >> this is still needed (for me at least but it looks like should be the
> >> case for everybody too). I have today's master on both poky and
> >> meta-openembedded and get:
> >>
> >> ERROR: rpcbind-systemd does not appear in package list, please add it
> >> ERROR: Function failed:
> >>
> >> SYSTEMD_SERVICE_rpcbind-systemd value rpcbind.service does not exist
> > Are you sure you're using systemd.bbclass from meta-systemd?
> >
> > $ bitbake -e rpcbind | grep ^PACKAGES
> > PACKAGESPLITFUNCS=3D"populate_packages_updatercd package_do_split_local=
es                 populate_packages"
> > PACKAGES=3D"rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev r=
pcbind-doc rpcbind-locale  rpcbind"
> > PACKAGES_DYNAMIC=3D"^rpcbind-locale-.*"
> >
> > # $PACKAGES [3 operations]
> > #   set conf/bitbake.conf:270
> > #     "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PAC=
KAGE_BEFORE_PN} ${PN}"
> > #   set /OE/shr-core/openembedded-core/meta/conf/documentation.conf:91
> > #     [doc] "Names of packages to be generated. @group packaging"
> > #   set systemd.bbclass:33 [systemd_create_package]
> > #     "rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev rpcbin=
d-doc rpcbind-locale  rpcbind"
> > # computed:
> > #   "rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev rpcbind-=
doc rpcbind-locale  rpcbind"
> > PACKAGES=3D"rpcbind-systemd rpcbind-dbg rpcbind-staticdev rpcbind-dev r=
pcbind-doc rpcbind-locale  rpcbind"
> >
> >>
> >> Have Khem's patches you were talking about been merged? Can't see them
> >> anywhere though.
> >>
> >> Thank you,
> >> Florin
> >>
> >> On 02/14/2013 11:44 AM, Martin Jansa wrote:
> >>> On Thu, Feb 14, 2013 at 11:32:05AM +0200, Florin Sarbu wrote:
> >>>> The ${PN}-systemd should be added to PACKAGES
> >>>> so that the package gets created.
> >>>>
> >>>> Added do_install_append to have the systemd.service
> >>>> installed in the proper location.
> >>> see khem's patch fixing this in many recipes including rpcbind.
> >>>
> >>>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> >>>> ---
> >>>>    .../meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bbappend    | =
   8 +++++++-
> >>>>    1 file changed, 7 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0=
=2E2.0.bbappend b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2=
=2E0.bbappend
> >>>> index 0fa7f97..8197550 100644
> >>>> --- a/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bb=
append
> >>>> +++ b/meta-systemd/meta-oe/recipes-extended/rpcbind/rpcbind_0.2.0.bb=
append
> >>>> @@ -1,6 +1,8 @@
> >>>>    inherit systemd
> >>>>   =20
> >>>> -PRINC :=3D "${@int(PRINC) + 1}"
> >>>> +PACKAGES =3D+ "${PN}-systemd"
> >>>> +
> >>>> +PRINC :=3D "${@int(PRINC) + 2}"
> >>>>   =20
> >>>>    # look for files in the layer first
> >>>>    FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >>>> @@ -10,3 +12,7 @@ SRC_URI +=3D "file://rpcbind.service"
> >>>>    SYSTEMD_PACKAGES =3D "${PN}-systemd"
> >>>>    SYSTEMD_SERVICE =3D "rpcbind.service"
> >>>>   =20
> >>>> +do_install_append() {
> >>>> +        install -d ${D}${systemd_unitdir}/system/
> >>>> +        install -m 0644 ${WORKDIR}/rpcbind.service ${D}${systemd_un=
itdir}/system
> >>>> +}
> >>>> --=20
> >>>> 1.7.10.4
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> Openembedded-devel mailing list
> >>>> Openembedded-devel@lists.openembedded.org
> >>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
> >>>
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE3M/YACgkQN1Ujt2V2gBwfPgCfSENrOqzBQDFZCvSl0RujH65d
rAwAn26cNjiXxr8wvT4DHoiB4yur/YiF
=VDNp
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
