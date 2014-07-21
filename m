Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 624456DAB4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 11:01:33 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id u57so7287923wes.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 04:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Bq+EL2bb9O5bXGtrSU9btrEcMi82iHatgCEyF9b5QzQ=;
	b=DlDXASR+ciBaCD6uLynNhE+pTMcZ4tKCcq2/g+RFeg5FF8srqGZoOqmNwr2JJq+PMs
	cTS45r/8spoCZRi740085Vyk0ZQ1SiuEeRgsCxV3HsUQj5Rq12xBXXBUARrYHzah9DFh
	XFXHLOifX69AuAmocMlssGrkKMxFj1WOKqGHDH5VhrXNLPkneN+hft8hn+k79bH14H2a
	nz0Eqa1USf53JdfFtaTJPsoln8FgBD6KuKDUYAlN+uOiEOoevrDiNtEC1TLX7j7nUz84
	GTpowRf4QQ0zuYiFfH0UAGUFeXlkhmrtdMSh36uU5Gk4ELXihevh4vaAWTZyH2iNUmc4
	wfEw==
X-Received: by 10.194.123.105 with SMTP id lz9mr22129303wjb.122.1405940492148; 
	Mon, 21 Jul 2014 04:01:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	l8sm36801511wje.15.2014.07.21.04.01.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Jul 2014 04:01:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 21 Jul 2014 13:01:45 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140721110145.GJ22875@jama>
References: <1405887685-12673-1-git-send-email-akuster@mvista.com>
	<20140720214452.GF22875@jama>
MIME-Version: 1.0
In-Reply-To: <20140720214452.GF22875@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] v2] wireshark: Add recipe 1.12.0-rc2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 11:01:39 -0000
X-Groupsio-MsgNum: 51141
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="dPW7zu3hTOhZvCDO"
Content-Disposition: inline

--dPW7zu3hTOhZvCDO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2014 at 11:44:52PM +0200, Martin Jansa wrote:
> On Sun, Jul 20, 2014 at 01:21:25PM -0700, Armin Kuster wrote:
> > Inital wireshark support on gtk+
> > Added gtk3.
> > Cleaned up PACKAGECONFIG options
> > README with additional info
>=20
> RP submitted few fixes for this change, can you please check wireshark
> in master-next and send just follow-up patch or comment on fixes RP did?

Also world builds are failing with:

| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c: In function 'ex=
pert_add_info':
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:392:2: error: in=
compatible type for argument 8 of 'expert_set_info_vformat'
|   expert_set_info_vformat(pinfo, pi, eiinfo->group, eiinfo->severity, *ei=
info->hf_info.p_id, FALSE, eiinfo->summary, NULL);
|   ^
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:299:1: note: exp=
ected 'va_list' but argument is of type 'void *'
|  expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, i=
nt severity, int hf_index, gboolean use_vaformat,
|  ^
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c: In function 'pr=
oto_tree_add_expert':
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:420:2: error: in=
compatible type for argument 8 of 'expert_set_info_vformat'
|   expert_set_info_vformat(pinfo, ti, eiinfo->group, eiinfo->severity, *ei=
info->hf_info.p_id, FALSE, eiinfo->summary, NULL);
|   ^
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
wireshark/1.12.0-rc2-r0/wireshark-1.12.0-rc2/epan/expert.c:299:1: note: exp=
ected 'va_list' but argument is of type 'void *'
|  expert_set_info_vformat(packet_info *pinfo, proto_item *pi, int group, i=
nt severity, int hf_index, gboolean use_vaformat,
|  ^
| make[3]: *** [libwireshark_la-expert.lo] Error 1

was it fixed in v2?

> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> >  meta-networking/recipes-support/wireshark/README   | 37 ++++++++++++++=
+++++
> >  .../wireshark/wireshark_1.12.0-rc2.bb              | 42 ++++++++++++++=
++++++++
> >  2 files changed, 79 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/wireshark/README
> >  create mode 100644 meta-networking/recipes-support/wireshark/wireshark=
_1.12.0-rc2.bb
> >=20
> > diff --git a/meta-networking/recipes-support/wireshark/README b/meta-ne=
tworking/recipes-support/wireshark/README
> > new file mode 100644
> > index 0000000..0e0c526
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/wireshark/README
> > @@ -0,0 +1,37 @@
> > +#
> > +Wireshark - Notes
> > +
> > +URL: http://www.wireshark.org/
> > +User Guide: http://www.wireshark.org/docs/wsug_html_chunked/
> > +Secruity advisories: http://www.wireshark.org/security/
> > +
> > +Wireshark is slowly moving away from gtk and towards QT as their graph=
ical stack.
> > +Currently gtk is supported with this release and I plan on integrating=
 QT.=20
> > +
> > +
> > +
> > +Adding the wireshark to your build
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +via local.conf
> > +IMAGE_INSTALL_append =3D " wireshark"
> > +
> > +Adding the wireshark to your graphical build
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +via local.conf
> > +EXTRA_IMAGE_FEATURES +=3D "x11-base"
> > +
> > +or use the "core-image-x11"
> > +
> > +
> > +Maintenance
> > +-----------
> > +
> > +Send patches, comments or questions to openembedded-devel@lists.openem=
bedded.org
> > +
> > +When sending single patches, please using something like:
> > +'git send-email -1 --to  openembedded-devel@lists.openembedded.org --c=
c akuster@mvista.com --subject-prefix=3Dmeta-security][PATCH'
> > +
> > +Maintainer:    Armin Kuster <akuster@mvista.com>
> > +
> > +
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0=
-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > new file mode 100644
> > index 0000000..6860419
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > @@ -0,0 +1,42 @@
> > +DESCRIPTION =3D "wireshark - a popular network protocol analyzer"
> > +HOMEPAGE =3D "http://www.wireshark.org"
> > +SECTION =3D "network"
> > +LICENSE =3D "GPL-2.0"
> > +
> > +DEPENDS =3D "perl-native libpcap pcre expat glib-2.0 libsmi"
> > +
> > +inherit autotools
> > +
> > +ARM_INSTRUCTION_SET =3D "arm"
> > +
> > +# Works with either gtk+ or gtk3.
> > +WHICH_GTK =3D "gtk3"
> > +
> > +PACKAGECONFIG ??=3D "gnutls gcrypt"
> > +PACKAGECONFIG +=3D " ${@bb.utils.contains("IMAGE_FEATURES", "x11-base"=
, "${WHICH_GTK}  graphics", "", d)}"
> > +
> > +PACKAGECONFIG +=3D " ${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "=
ipv6", "", d)}"
> > +
> > +PACKAGECONFIG[gtk2] =3D "--with-gtk2=3Dyes, --with-gtk2=3Dno, gtk+"
> > +PACKAGECONFIG[gtk3] =3D "--with-gtk3=3Dyes, --with-gtk3=3Dno, gtk+3"
> > +PACKAGECONFIG[graphics] =3D "--enable-wireshark, --disable-wireshark,"
> > +PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6,"
> > +PACKAGECONFIG[gnutls] =3D "--with-gnutls=3Dyes, --with-gnutls=3Dno, gn=
utls"
> > +PACKAGECONFIG[gcrypt] =3D "--with-gcrypt=3Dyes, --with-gcrypt=3Dno, li=
bgcrypt"
> > +
> > +EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dno -enable-tshar=
k"
> > +
> > +LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb14=
9195e065b0"
> > +SRC_URI =3D "http://wiresharkdownloads.riverbed.com/wireshark/src/wire=
shark-1.12.0-rc2.tar.bz2 "
> > +   =20
> > +SRC_URI[md5sum] =3D "dc1149073066a29f91116c168558262e"
> > +SRC_URI[sha256sum]=3D "31009bb450126e9b12808267419f31016d14e6fde7b5e39=
c85ad37459908cffb"
> > +
> > +do_configure_prepend() {
> > +    # force to use fallback=20
> > +    sed -i -e '/^glib_prefix/s/=3D.*$/=3D""/' ${S}/aclocal-flags
> > +}
> > +
> > +ALLOW_EMPTY_${PN} =3D "1"
> > +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
> > +
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--dPW7zu3hTOhZvCDO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPM8xkACgkQN1Ujt2V2gByhEACfahsW5ILFiFZ6jhDShvndlI/W
DRYAoJDPD21G140c6faRVCNSzxzLU9d5
=xIHW
-----END PGP SIGNATURE-----

--dPW7zu3hTOhZvCDO--
