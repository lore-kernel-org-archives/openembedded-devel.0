Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PmrF4-0008Vv-A9
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 18:20:42 +0100
Received: by yie16 with SMTP id 16so2364011yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 09:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=jtv9qeWUU/rTKgOX8xd2k/22V75MuY++gPXNAo5hIhI=;
	b=ooT6X3jp913eF6QpHTKK1rIRAvZfofVVo3r8BGihokcc7IDtm2ZVYsg9zGWfG6TyiK
	2/byjMrYp8aAtohsihO5z9uDFya3p+AOKkovrOeT0c+2fh40/WqXxccpzc/XpUEyr5Vy
	vjdv9ezE2fg2KdEOxsGNfgKjen8R5dSGjFazQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=DfJz6wRYnE74amrGw0hh4jJ2VfTvecj0JamZ9rKsrYJ911sQNiXiGyDXU0Gb3iCDlk
	68NZy23M3u3JKpCK0wRfNf33qmFNsmu1AjUIm/xc7mYp0itaWwE1fNiUhYf56BT75Lbt
	sk8E7L46Orfa+vHexF5xXEP1qRwgDyc/g9Qbo=
Received: by 10.91.20.2 with SMTP id x2mr201695agi.196.1297185579466; Tue, 08
	Feb 2011 09:19:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Tue, 8 Feb 2011 09:19:19 -0800 (PST)
In-Reply-To: <1297181802-18948-4-git-send-email-kergoth@gmail.com>
References: <1297181802-18948-1-git-send-email-kergoth@gmail.com>
	<1297181802-18948-4-git-send-email-kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Feb 2011 09:19:19 -0800
Message-ID: <AANLkTi=Wtke6zuJuemaOqWpt7zg22EstF1waj_GtQQP=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/4] autotools: split up into multiple files
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
X-List-Received-Date: Tue, 08 Feb 2011 17:20:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 8, 2011 at 8:16 AM, Chris Larson <kergoth@gmail.com> wrote:
> From: Chris Larson <chris_larson@mentor.com>
>
> Split up autotools.bbclass into:
>
> =C2=A0 =C2=A0classes/autotools/configure.bbclass
> =C2=A0 =C2=A0 =C2=A0 =C2=A0To be inherited if one wants ./configure and c=
onfig.{sub,guess}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0updating, but not autoreconf execution
>
> =C2=A0 =C2=A0classes/autotools/bootstrap.bbclass
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Autoreconf execution
>
> =C2=A0 =C2=A0classes/autotools/staging.inc
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Holds the old autotools staging utility functi=
ons
>
> autotools.bbclass still exists, and simply inherits
> classes/autotools/bootstrap.bbclass.
>
> Signed-off-by: Chris Larson <chris_larson@mentor.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0classes/autotools.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0238 +----------------------------------
> =C2=A0classes/autotools/bootstrap.bbclass | =C2=A0101 +++++++++++++++
> =C2=A0classes/autotools/configure.bbclass | =C2=A0118 +++++++++++++++++
> =C2=A0classes/autotools/staging.inc =C2=A0 =C2=A0 =C2=A0 | =C2=A0 36 ++++=
++
> =C2=A04 files changed, 256 insertions(+), 237 deletions(-)
> =C2=A0create mode 100644 classes/autotools/bootstrap.bbclass
> =C2=A0create mode 100644 classes/autotools/configure.bbclass
> =C2=A0create mode 100644 classes/autotools/staging.inc
>
> diff --git a/classes/autotools.bbclass b/classes/autotools.bbclass
> index a88a4d1..6f30a9e 100644
> --- a/classes/autotools.bbclass
> +++ b/classes/autotools.bbclass
> @@ -1,237 +1 @@
> -# use autotools_stage_all for native packages
> -AUTOTOOLS_NATIVE_STAGE_INSTALL =3D "1"
> -
> -def autotools_deps(d):
> - =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ''
> -
> - =C2=A0 =C2=A0 =C2=A0 pn =3D bb.data.getVar('PN', d, 1)
> - =C2=A0 =C2=A0 =C2=A0 deps =3D ''
> -
> - =C2=A0 =C2=A0 =C2=A0 if pn in ['autoconf-native', 'automake-native', 'h=
elp2man-native']:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return deps
> - =C2=A0 =C2=A0 =C2=A0 deps +=3D 'autoconf-native automake-native help2ma=
n-native '
> -
> - =C2=A0 =C2=A0 =C2=A0 if pn not in ['libtool', 'libtool-native', 'libtoo=
l-cross']:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps +=3D 'libtool-nat=
ive '
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (not oe.utils.inher=
its(d, 'native', 'nativesdk', 'cross',
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'sdk'=
) and
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not d.ge=
tVar('INHIBIT_DEFAULT_DEPS', True)):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 deps +=3D 'libtool-cross '
> -
> - =C2=A0 =C2=A0 =C2=A0 return deps + 'gnu-config-native '
> -
> -EXTRA_OEMAKE =3D ""
> -
> -DEPENDS_prepend =3D "${@autotools_deps(d)}"
> -DEPENDS_virtclass-native_prepend =3D "${@autotools_deps(d)}"
> -DEPENDS_virtclass-nativesdk_prepend =3D "${@autotools_deps(d)}"
> -
> -inherit siteinfo
> -
> -def _autotools_get_sitefiles(d):
> - =C2=A0 =C2=A0if oe.utils.inherits(d, 'native', 'nativesdk'):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return
> -
> - =C2=A0 =C2=A0sitedata =3D siteinfo_data(d)
> - =C2=A0 =C2=A0for path in d.getVar("BBPATH", True).split(":"):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0for element in sitedata:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename =3D os.path.join(path=
, "site", element)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(filename):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield filename
> -
> -# Space separated list of shell scripts with variables defined to supply=
 test
> -# results for autoconf tests we cannot run at build time.
> -export CONFIG_SITE =3D "${@' '.join(_autotools_get_sitefiles(d))}"
> -
> -acpaths =3D "default"
> -EXTRA_AUTORECONF =3D "--exclude=3Dautopoint"
> -
> -def autotools_set_crosscompiling(d):
> - =C2=A0 =C2=A0 =C2=A0 if not bb.data.inherits_class('native', d):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return " cross_compili=
ng=3Dyes"
> - =C2=A0 =C2=A0 =C2=A0 return ""
> -
> -def append_libtool_sysroot(d):
> - =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=
=3D "yes":
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('BUI=
LD_SYS', d, 1) =3D=3D bb.data.getVar('HOST_SYS', d, 1):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return '--with-libtool-sysroot'
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
> - =C2=A0 =C2=A0 =C2=A0 return ''
> -
> -def distro_imposed_configure_flags(d):
> - =C2=A0 =C2=A0 =C2=A0 distro_features =3D bb.data.getVar('DISTRO_FEATURE=
S', d, True) or ""
> - =C2=A0 =C2=A0 =C2=A0 distro_features =3D distro_features.split()
> - =C2=A0 =C2=A0 =C2=A0 flags =3D set()
> - =C2=A0 =C2=A0 =C2=A0 features =3D (('largefile', 'largefile'),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ('ipv6' =C2=A0 =C2=A0 =
, 'ipv6'),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ('nls' =C2=A0 =C2=A0 =
=C2=A0, 'nls'))
> -
> - =C2=A0 =C2=A0 =C2=A0 for knob, cfgargs in features:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cfgargs,=
 basestring):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cfgargs =3D [cfgargs]
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 en_or_dis =3D knob in =
distro_features and "enable" or "disable"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for flg in cfgargs:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags.add("--%s-%s" % (en_or_dis, flg))
> - =C2=A0 =C2=A0 =C2=A0 return " ".join(flags)
> -
> -# EXTRA_OECONF_append =3D "${@autotools_set_crosscompiling(d)}"
> -
> -CONFIGUREOPTS =3D " --build=3D${BUILD_SYS} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --host=3D${HOST=
_SYS} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --target=3D${TA=
RGET_SYS} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix=3D${pr=
efix} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exec_prefix=
=3D${exec_prefix} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --bindir=3D${bi=
ndir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sbindir=3D${s=
bindir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libexecdir=3D=
${libexecdir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --datadir=3D${d=
atadir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir=3D=
${sysconfdir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sharedstatedi=
r=3D${sharedstatedir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstatedir=
=3D${localstatedir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D${li=
bdir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D=
${includedir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --oldincludedir=
=3D${oldincludedir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --infodir=3D${i=
nfodir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --mandir=3D${ma=
ndir} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@append_libto=
ol_sysroot(d)} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@distro_impos=
ed_configure_flags(d)} \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> -
> -oe_runconf () {
> - =C2=A0 =C2=A0 =C2=A0 if [ -x ${S}/configure ] ; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/configure \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CONFIGUREOPTS} ${EXT=
RA_OECONF} "$@"
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oefatal "no configure =
script found"
> - =C2=A0 =C2=A0 =C2=A0 fi
> -}
> -
> -oe_autoreconf () {
> - =C2=A0 =C2=A0 =C2=A0 if [ x"${acpaths}" =3D xdefault ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acpaths=3D
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find ${S} -m=
axdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 acpaths=3D"$acpaths -I $i"
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acpaths=3D"${acpaths}"
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 AUTOV=3D`automake --version | head -n 1 | sed "s/.=
* //;s/\.[0-9]\+$//"`
> - =C2=A0 =C2=A0 =C2=A0 install -d ${STAGING_DATADIR}/aclocal
> - =C2=A0 =C2=A0 =C2=A0 install -d ${STAGING_DATADIR}/aclocal-$AUTOV
> - =C2=A0 =C2=A0 =C2=A0 acpaths=3D"$acpaths -I${STAGING_DATADIR}/aclocal-$=
AUTOV -I ${STAGING_DATADIR}/aclocal"
> - =C2=A0 =C2=A0 =C2=A0 # autoreconf is too shy to overwrite aclocal.m4 if=
 it doesn't look
> - =C2=A0 =C2=A0 =C2=A0 # like it was auto-generated. =C2=A0Work around th=
is by blowing it away
> - =C2=A0 =C2=A0 =C2=A0 # by hand, unless the package specifically asked n=
ot to run aclocal.
> - =C2=A0 =C2=A0 =C2=A0 if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal";=
 then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f aclocal.m4
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 if [ -e configure.in ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIGURE_AC=3Dconfigu=
re.in
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIGURE_AC=3Dconfigu=
re.ac
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIG=
URE_AC >/dev/null; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep "sed.*POTFILES=
" $CONFIGURE_AC >/dev/null; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 : do nothing -- we still have an old unmodified configure.ac
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "no" | glib-gettextize --force
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIG=
URE_AC >/dev/null; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${STAGING_DATA=
DIR}/gettext/config.rpath ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -sf ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is=
 not installed.
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 fi
> -
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_=
MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${aux}
> - =C2=A0 =C2=A0 =C2=A0 done
> - =C2=A0 =C2=A0 =C2=A0 autoreconf -Wcross --verbose --install --symlink -=
-force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed=
."
> - =C2=A0 =C2=A0 =C2=A0 if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CON=
FIGURE_AC >/dev/null; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intltoolize --force --=
automake
> - =C2=A0 =C2=A0 =C2=A0 fi
> -}
> -
> -autotools_do_configure() {
> - =C2=A0 =C2=A0 =C2=A0 case ${PN} in
> - =C2=A0 =C2=A0 =C2=A0 autoconf*|automake*)
> - =C2=A0 =C2=A0 =C2=A0 ;;
> - =C2=A0 =C2=A0 =C2=A0 *)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${S} -name config=
ure.in -o -name configure.ac | \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 while read fn; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f `dirname $fn`/configure
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 done
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${S}/configure=
.in -o -e ${S}/configure.ac ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 olddir=3D`pwd`
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cd ${S}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 oe_autoreconf
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cd $olddir
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 ;;
> - =C2=A0 =C2=A0 =C2=A0 esac
> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${S}/configure ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runconf $@
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oenote "nothing to con=
figure"
> - =C2=A0 =C2=A0 =C2=A0 fi
> -}
> -
> -autotools_do_install() {
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake 'DESTDIR=3D${D}' install
> -}
> -
> -PACKAGE_PREPROCESS_FUNCS +=3D "${@['autotools_prepackage_lamangler',''][=
bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=3D "yes"]}"
> -autotools_prepackage_lamangler () {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `find ${PKGD} -name "*.la"` ; do \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e 's:${STAGING_LIBDIR}=
:${libdir}:g;' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:${=
D}::g;' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:-I=
${WORKDIR}\S*: :g;' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:-L=
${WORKDIR}\S*: :g;' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $i
> - =C2=A0 =C2=A0 =C2=A0 done
> -}
> -
> -# STAGE_TEMP_PREFIX is used for a speedup by packaged-staging
> -STAGE_TEMP=3D"${WORKDIR}/temp-staging"
> -STAGE_TEMP_PREFIX =3D ""
> -
> -autotools_stage_includes() {
> - =C2=A0 =C2=A0 =C2=A0 if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" !=3D "1" ]
> - =C2=A0 =C2=A0 =C2=A0 then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGE_TEMP}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make DESTDIR=3D"${STAG=
E_TEMP}" install
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -pPR ${STAGE_TEMP}/=
${includedir}/* ${STAGING_INCDIR}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> - =C2=A0 =C2=A0 =C2=A0 fi
> -}
> -
> -autotools_stage_dir() {
> - =C2=A0 =C2=A0 =C2=A0 sysroot_stage_dir $1 ${STAGE_TEMP_PREFIX}$2
> -}
> -
> -autotools_stage_libdir() {
> - =C2=A0 =C2=A0 =C2=A0 sysroot_stage_libdir $1 ${STAGE_TEMP_PREFIX}$2
> -}
> -
> -autotools_stage_all() {
> - =C2=A0 =C2=A0 =C2=A0 if [ "${INHIBIT_AUTO_STAGE}" =3D "1" ]
> - =C2=A0 =C2=A0 =C2=A0 then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> - =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGE_TEMP}
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D"${STAGE_TEMP}" install
> - =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}/${mandir} || true
> - =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}/${infodir} || true
> - =C2=A0 =C2=A0 =C2=A0 sysroot_stage_dirs ${STAGE_TEMP} ${STAGE_TEMP_PREF=
IX}
> - =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> -}
> -
> -EXPORT_FUNCTIONS do_configure do_install
> -
> +inherit autotools/bootstrap
> diff --git a/classes/autotools/bootstrap.bbclass b/classes/autotools/boot=
strap.bbclass
> new file mode 100644
> index 0000000..f992aa3
> --- /dev/null
> +++ b/classes/autotools/bootstrap.bbclass
> @@ -0,0 +1,101 @@
> +inherit autotools/configure
> +
> +def autotools_deps(d):
> + =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('INHIBIT_AUTOTOOLS_DEPS', d, 1):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ''
> +
> + =C2=A0 =C2=A0 =C2=A0 pn =3D bb.data.getVar('PN', d, 1)
> + =C2=A0 =C2=A0 =C2=A0 deps =3D ''
> +
> + =C2=A0 =C2=A0 =C2=A0 if pn in ['autoconf-native', 'automake-native', 'h=
elp2man-native']:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return deps
> + =C2=A0 =C2=A0 =C2=A0 deps +=3D 'autoconf-native automake-native help2ma=
n-native '
> +
> + =C2=A0 =C2=A0 =C2=A0 if pn not in ['libtool', 'libtool-native', 'libtoo=
l-cross']:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps +=3D 'libtool-nat=
ive '
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (not oe.utils.inher=
its(d, 'native', 'nativesdk', 'cross',
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 'sdk'=
) and
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 not d.ge=
tVar('INHIBIT_DEFAULT_DEPS', True)):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 deps +=3D 'libtool-cross '
> +
> + =C2=A0 =C2=A0 =C2=A0 return deps
> +
> +DEPENDS_prepend =3D "${@autotools_deps(d)}"
> +DEPENDS_virtclass-native_prepend =3D "${@autotools_deps(d)}"
> +DEPENDS_virtclass-nativesdk_prepend =3D "${@autotools_deps(d)}"
> +
> +acpaths =3D "default"
> +EXTRA_AUTORECONF =3D "--exclude=3Dautopoint"
> +
> +oe_autoreconf () {
> + =C2=A0 =C2=A0 =C2=A0 if [ x"${acpaths}" =3D xdefault ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acpaths=3D
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `find ${S} -m=
axdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 acpaths=3D"$acpaths -I $i"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 acpaths=3D"${acpaths}"
> + =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 AUTOV=3D`automake --version | head -n 1 | sed "s/.=
* //;s/\.[0-9]\+$//"`
> + =C2=A0 =C2=A0 =C2=A0 install -d ${STAGING_DATADIR}/aclocal
> + =C2=A0 =C2=A0 =C2=A0 install -d ${STAGING_DATADIR}/aclocal-$AUTOV
> + =C2=A0 =C2=A0 =C2=A0 acpaths=3D"$acpaths -I${STAGING_DATADIR}/aclocal-$=
AUTOV -I ${STAGING_DATADIR}/aclocal"
> + =C2=A0 =C2=A0 =C2=A0 # autoreconf is too shy to overwrite aclocal.m4 if=
 it doesn't look
> + =C2=A0 =C2=A0 =C2=A0 # like it was auto-generated. =C2=A0Work around th=
is by blowing it away
> + =C2=A0 =C2=A0 =C2=A0 # by hand, unless the package specifically asked n=
ot to run aclocal.
> + =C2=A0 =C2=A0 =C2=A0 if ! echo ${EXTRA_AUTORECONF} | grep -q "aclocal";=
 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f aclocal.m4
> + =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 if [ -e configure.in ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIGURE_AC=3Dconfigu=
re.in
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIGURE_AC=3Dconfigu=
re.ac
> + =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 if grep "^[[:space:]]*AM_GLIB_GNU_GETTEXT" $CONFIG=
URE_AC >/dev/null; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if grep "sed.*POTFILES=
" $CONFIGURE_AC >/dev/null; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 : do nothing -- we still have an old unmodified configure.ac
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 echo "no" | glib-gettextize --force
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIG=
URE_AC >/dev/null; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${STAGING_DATA=
DIR}/gettext/config.rpath ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ln -sf ${STAGING_DATADIR}/gettext/config.rpath ${S}/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 oenote ${STAGING_DATADIR}/gettext/config.rpath not found. gettext is=
 not installed.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> + =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 for aux in m4 `sed -n -e '/^[[:space:]]*AC_CONFIG_=
MACRO_DIR/s|[^(]*([[]*\([^])]*\)[]]*)|\1|p' $CONFIGURE_AC`; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${aux}
> + =C2=A0 =C2=A0 =C2=A0 done
> + =C2=A0 =C2=A0 =C2=A0 autoreconf -Wcross --verbose --install --symlink -=
-force ${EXTRA_AUTORECONF} $acpaths || oefatal "autoreconf execution failed=
."
> + =C2=A0 =C2=A0 =C2=A0 if grep "^[[:space:]]*[AI][CT]_PROG_INTLTOOL" $CON=
FIGURE_AC >/dev/null; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 intltoolize --force --=
automake
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> +autotools_do_configure() {
> + =C2=A0 =C2=A0 =C2=A0 case ${PN} in
> + =C2=A0 =C2=A0 =C2=A0 autoconf*|automake*)
> + =C2=A0 =C2=A0 =C2=A0 ;;
> + =C2=A0 =C2=A0 =C2=A0 *)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${S} -name config=
ure.in -o -name configure.ac | \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 while read fn; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f `dirname $fn`/configure
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 done
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e ${S}/configure=
.in -o -e ${S}/configure.ac ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 olddir=3D`pwd`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cd ${S}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 oe_autoreconf
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cd $olddir
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 ;;
> + =C2=A0 =C2=A0 =C2=A0 esac
> + =C2=A0 =C2=A0 =C2=A0 if [ -e ${S}/configure ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runconf $@
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oenote "nothing to con=
figure"
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> diff --git a/classes/autotools/configure.bbclass b/classes/autotools/conf=
igure.bbclass
> new file mode 100644
> index 0000000..8f93d9c
> --- /dev/null
> +++ b/classes/autotools/configure.bbclass
> @@ -0,0 +1,118 @@
> +# use autotools_stage_all for native packages
> +AUTOTOOLS_NATIVE_STAGE_INSTALL =3D "1"
> +
> +DEPENDS_prepend =3D "${@['gnu-config-native ', ''][bool(d.getVar('INHIBI=
T_AUTOTOOLS_DEPS', 1))]}"
> +EXTRA_OEMAKE =3D ""
> +
> +inherit siteinfo
> +
> +def _autotools_get_sitefiles(d):
> + =C2=A0 =C2=A0if oe.utils.inherits(d, 'native', 'nativesdk'):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0return
> +
> + =C2=A0 =C2=A0sitedata =3D siteinfo_data(d)
> + =C2=A0 =C2=A0for path in d.getVar("BBPATH", True).split(":"):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for element in sitedata:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filename =3D os.path.join(path=
, "site", element)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.exists(filename):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0yield filename
> +
> +# Space separated list of shell scripts with variables defined to supply=
 test
> +# results for autoconf tests we cannot run at build time.
> +export CONFIG_SITE =3D "${@' '.join(_autotools_get_sitefiles(d))}"
> +
> +def autotools_set_crosscompiling(d):
> + =C2=A0 =C2=A0 =C2=A0 if not bb.data.inherits_class('native', d):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return " cross_compili=
ng=3Dyes"
> + =C2=A0 =C2=A0 =C2=A0 return ""
> +
> +def append_libtool_sysroot(d):
> + =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=
=3D "yes":
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.getVar('BUI=
LD_SYS', d, 1) =3D=3D bb.data.getVar('HOST_SYS', d, 1):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return '--with-libtool-sysroot'
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return '--with-libtool-sysroot=3D${STAGING_DIR_HOST}'
> + =C2=A0 =C2=A0 =C2=A0 return ''
> +
> +def distro_imposed_configure_flags(d):
> + =C2=A0 =C2=A0 =C2=A0 distro_features =3D bb.data.getVar('DISTRO_FEATURE=
S', d, True) or ""
> + =C2=A0 =C2=A0 =C2=A0 distro_features =3D distro_features.split()
> + =C2=A0 =C2=A0 =C2=A0 flags =3D set()
> + =C2=A0 =C2=A0 =C2=A0 features =3D (('largefile', 'largefile'),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ('ipv6' =C2=A0 =C2=A0 =
, 'ipv6'),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ('nls' =C2=A0 =C2=A0 =
=C2=A0, 'nls'))
> +
> + =C2=A0 =C2=A0 =C2=A0 for knob, cfgargs in features:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if isinstance(cfgargs,=
 basestring):
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cfgargs =3D [cfgargs]
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 en_or_dis =3D knob in =
distro_features and "enable" or "disable"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for flg in cfgargs:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 flags.add("--%s-%s" % (en_or_dis, flg))
> + =C2=A0 =C2=A0 =C2=A0 return " ".join(flags)
> +
> +CONFIGUREOPTS =3D " --build=3D${BUILD_SYS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --host=3D${HOST=
_SYS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --target=3D${TA=
RGET_SYS} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix=3D${pr=
efix} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --exec_prefix=
=3D${exec_prefix} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --bindir=3D${bi=
ndir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sbindir=3D${s=
bindir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libexecdir=3D=
${libexecdir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --datadir=3D${d=
atadir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir=3D=
${sysconfdir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sharedstatedi=
r=3D${sharedstatedir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --localstatedir=
=3D${localstatedir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --libdir=3D${li=
bdir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --includedir=3D=
${includedir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --oldincludedir=
=3D${oldincludedir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --infodir=3D${i=
nfodir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --mandir=3D${ma=
ndir} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@append_libto=
ol_sysroot(d)} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@distro_impos=
ed_configure_flags(d)} \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +oe_runconf () {
> + =C2=A0 =C2=A0 =C2=A0 if [ -x ${S}/configure ] ; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${S}/configure \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${CONFIGUREOPTS} ${EXT=
RA_OECONF} "$@"
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oefatal "no configure =
script found"
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> +autotools_do_configure () {
> + =C2=A0 =C2=A0 =C2=A0 if [ -e ${S}/configure ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${S} -name config=
.guess -exec \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf $=
{STAGING_DATADIR_NATIVE}/gnu-config/config.guess "{}" \;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find ${S} -name config=
.sub -exec \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf $=
{STAGING_DATADIR_NATIVE}/gnu-config/config.sub "{}" \;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runconf $@
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oenote "nothing to con=
figure"
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> +autotools_do_install() {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake 'DESTDIR=3D${D}' install
> +}
> +
> +do_configure () {
> + =C2=A0 =C2=A0autotools_do_configure
> +}
> +
> +do_install () {
> + =C2=A0 =C2=A0autotools_do_install
> +}
> +
> +PACKAGE_PREPROCESS_FUNCS +=3D "${@['autotools_prepackage_lamangler',''][=
bb.data.getVar('LIBTOOL_HAS_SYSROOT', d, 1) =3D=3D "yes"]}"
> +autotools_prepackage_lamangler () {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in `find ${PKGD} -name "*.la"` ; do \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e 's:${STAGING_LIBDIR}=
:${libdir}:g;' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:${=
D}::g;' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:-I=
${WORKDIR}\S*: :g;' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:-L=
${WORKDIR}\S*: :g;' \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $i
> + =C2=A0 =C2=A0 =C2=A0 done
> +}
> +
> +require classes/autotools/staging.inc
> diff --git a/classes/autotools/staging.inc b/classes/autotools/staging.in=
c
> new file mode 100644
> index 0000000..6fa45cb
> --- /dev/null
> +++ b/classes/autotools/staging.inc
> @@ -0,0 +1,36 @@
> +# STAGE_TEMP_PREFIX is used for a speedup by packaged-staging
> +STAGE_TEMP=3D"${WORKDIR}/temp-staging"
> +STAGE_TEMP_PREFIX =3D ""
> +
> +autotools_stage_includes() {
> + =C2=A0 =C2=A0 =C2=A0 if [ "${INHIBIT_AUTO_STAGE_INCLUDES}" !=3D "1" ]
> + =C2=A0 =C2=A0 =C2=A0 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGE_TEMP}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 make DESTDIR=3D"${STAG=
E_TEMP}" install
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -pPR ${STAGE_TEMP}/=
${includedir}/* ${STAGING_INCDIR}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> +autotools_stage_dir() {
> + =C2=A0 =C2=A0 =C2=A0 sysroot_stage_dir $1 ${STAGE_TEMP_PREFIX}$2
> +}
> +
> +autotools_stage_libdir() {
> + =C2=A0 =C2=A0 =C2=A0 sysroot_stage_libdir $1 ${STAGE_TEMP_PREFIX}$2
> +}
> +
> +autotools_stage_all() {
> + =C2=A0 =C2=A0 =C2=A0 if [ "${INHIBIT_AUTO_STAGE}" =3D "1" ]
> + =C2=A0 =C2=A0 =C2=A0 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return
> + =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> + =C2=A0 =C2=A0 =C2=A0 mkdir -p ${STAGE_TEMP}
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D"${STAGE_TEMP}" install
> + =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}/${mandir} || true
> + =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}/${infodir} || true
> + =C2=A0 =C2=A0 =C2=A0 sysroot_stage_dirs ${STAGE_TEMP} ${STAGE_TEMP_PREF=
IX}
> + =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGE_TEMP}
> +}
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


