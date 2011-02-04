Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PlHYb-0000Fg-P0
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 10:02:22 +0100
Received: by gwaa12 with SMTP id a12so853643gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 01:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/xikCeav1c4ekpnESIOffelojnhIvrONWim1oAv7gUM=;
	b=migFTiYHAJobUrgZdHQhR5ZLNOy4i5OEgk4AgL98ev4BrulvNxUjRoLyBWAd8bvfKZ
	40AnRvgcQsx+sGNzp5aQ1h1cBA1eNkuQyklqdcuAjoh8NvdL/OkdW+1eIW6UJzknrKWJ
	4ZPiDkAUBQC6tMTs/lyqXMepC0/KNRqxjuyg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=VWs4TB8zWIhPJZdSCzAAbxCrWk3FGyP7Adv9/1JLDhliTI8HC4ee9FE1aahmvI3X7V
	7qzRTgu0IR+VY7/knu09UxNZmzeku81rs9/QWth5h7VcppP8Rw0y1fcWgR8mHRzu7YY+
	9pd8h2jcS+nSHdahSnoGFKmCEwMvT5t4lfAG4=
MIME-Version: 1.0
Received: by 10.236.95.140 with SMTP id p12mr23730713yhf.38.1296810083763;
	Fri, 04 Feb 2011 01:01:23 -0800 (PST)
Received: by 10.146.83.19 with HTTP; Fri, 4 Feb 2011 01:01:23 -0800 (PST)
In-Reply-To: <1296566313-26494-1-git-send-email-Martin.Jansa@gmail.com>
References: <1296566313-26494-1-git-send-email-Martin.Jansa@gmail.com>
Date: Fri, 4 Feb 2011 10:01:23 +0100
Message-ID: <AANLkTimvY=4KEtZEqEMX7DQ7t7uoXDozKcX4E_DMRAV6@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] recipes: don't use Icon= with extension in .desktop files
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
X-List-Received-Date: Fri, 04 Feb 2011 09:02:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Probably not really needed after
http://trac.enlightenment.org/e/changeset/56699

On Tue, Feb 1, 2011 at 2:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> * new efreet with icon cache cannot find right icon in theme when it's de=
fined with extension like ./neon.desktop:Icon=3Dneon.png
> * fixed for .desktop files found installed on my device
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0recipes/dillo/dillo2_2.1.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/dillo/files/dillo.desktop =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/gpe-scap/gpe-scap_1.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A06 +++++-
> =A0recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb =A0 =A0 | =A0 =A06 ++++=
+-
> =A0.../numptyphysics/numptyphysics.desktop =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/numptyphysics/numptyphysics_svn.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/openmoko-3rdparty/calc_0.0.4.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A06 +++++-
> =A0recipes/openmoko-3rdparty/calc_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 ++++
> =A0recipes/openmoko-3rdparty/om-neon_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
3 ++-
> =A0recipes/openmoko-3rdparty/podboy_svn.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A03 ++-
> =A0recipes/pyphonelog/pyphonelog_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +++++-
> =A011 files changed, 32 insertions(+), 10 deletions(-)
>
> diff --git a/recipes/dillo/dillo2_2.1.1.bb b/recipes/dillo/dillo2_2.1.1.b=
b
> index 69b9c65..e77f164 100644
> --- a/recipes/dillo/dillo2_2.1.1.bb
> +++ b/recipes/dillo/dillo2_2.1.1.bb
> @@ -8,7 +8,7 @@ RDEPENDS_${PN} =3D "fltk2-images"
> =A0SRC_URI=3D"http://www.dillo.org/download/dillo-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0file://dillo.desktop \
> =A0 =A0 =A0 =A0 =A0file://dillo.png"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0S =3D "${WORKDIR}/dillo-${PV}/"
>
> diff --git a/recipes/dillo/files/dillo.desktop b/recipes/dillo/files/dill=
o.desktop
> index 6c5f994..9144553 100644
> --- a/recipes/dillo/files/dillo.desktop
> +++ b/recipes/dillo/files/dillo.desktop
> @@ -4,6 +4,6 @@ Comment=3DDillo
> =A0Exec=3Ddillo
> =A0Terminal=3D0
> =A0Type=3DApplication
> -Icon=3Ddillo.png
> +Icon=3Ddillo
> =A0Categories=3DApplication;PIM;GPE
> =A0StartupNotify=3DTrue
> diff --git a/recipes/gpe-scap/gpe-scap_1.4.bb b/recipes/gpe-scap/gpe-scap=
_1.4.bb
> index 9e560e6..eec2fce 100644
> --- a/recipes/gpe-scap/gpe-scap_1.4.bb
> +++ b/recipes/gpe-scap/gpe-scap_1.4.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A GPE application that allows you to tak=
e screenshots."
> =A0LICENSE =3D "GPL"
> =A0PRIORITY =3D "optional"
> =A0SECTION =3D "gpe"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0RREPLACES_${PN} =3D "gpe-screenshot"
>
> @@ -14,3 +14,7 @@ inherit gpe autotools
>
> =A0SRC_URI[md5sum] =3D "eaf545561b0ad981c9d01833f30fcf95"
> =A0SRC_URI[sha256sum] =3D "762778421fae7c62d5ec6a9d27986166c0dbbe2ff51fc1=
0bb9b8baff5c367534"
> +
> +do_configure_prepend() {
> + =A0 =A0 =A0 =A0sed -i 's#gpe-scap.png#gpe-scap#g' ${S}/gpe-scap.desktop=
.in
> +}
> diff --git a/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb b/recipes/gpe=
-sketchbook/gpe-sketchbook_0.2.9.bb
> index 3b33f0d..466fe11 100644
> --- a/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
> +++ b/recipes/gpe-sketchbook/gpe-sketchbook_0.2.9.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPL"
> =A0DESCRIPTION =3D "A GPE notebook to sketch your notes"
> =A0export CVSBUILD =3D "no"
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0inherit gpe pkgconfig
>
> @@ -15,6 +15,10 @@ SRC_URI =3D "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
> =A0FILES_${PN} =3D "${bindir} ${datadir}/pixmaps ${datadir}/applications"
> =A0FILES_${PN} +=3D " ${datadir}/gpe/pixmaps"
>
> +do_configure_prepend() {
> + =A0 =A0 =A0 =A0sed -i 's#gpe-sketchbook.png#gpe-sketchbook#g' ${S}/gpe-=
sketchbook.desktop.in
> +}
> +
> =A0do_compile () {
> =A0 =A0 =A0 =A0 oe_runmake PREFIX=3D${prefix}
> =A0 =A0 =A0 =A0 oe_runmake all-desktop PREFIX=3D${prefix}
> diff --git a/recipes/numptyphysics/numptyphysics/numptyphysics.desktop b/=
recipes/numptyphysics/numptyphysics/numptyphysics.desktop
> index 5ebefb6..b317ceb 100644
> --- a/recipes/numptyphysics/numptyphysics/numptyphysics.desktop
> +++ b/recipes/numptyphysics/numptyphysics/numptyphysics.desktop
> @@ -3,7 +3,7 @@ Name=3Dnumptyphysics
> =A0Comment=3DPhysics Game
> =A0Note=3DSimulate Objects
> =A0Exec=3Dnumptyphysics
> -Icon=3Dstar.png
> +Icon=3Dstar
> =A0Type=3DApplication
> =A0Categories=3DGames
>
> diff --git a/recipes/numptyphysics/numptyphysics_svn.bb b/recipes/numptyp=
hysics/numptyphysics_svn.bb
> index f997dbe..9ea15dd 100644
> --- a/recipes/numptyphysics/numptyphysics_svn.bb
> +++ b/recipes/numptyphysics/numptyphysics_svn.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "http://numptyphysics.garage.maemo.org/"
> =A0SECTION =3D "x11/games"
> =A0SRCREV =3D "109"
> =A0PV =3D "0.2+svnr${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0inherit autotools
>
> diff --git a/recipes/openmoko-3rdparty/calc_0.0.4.bb b/recipes/openmoko-3=
rdparty/calc_0.0.4.bb
> index a7bb158..6ed2057 100644
> --- a/recipes/openmoko-3rdparty/calc_0.0.4.bb
> +++ b/recipes/openmoko-3rdparty/calc_0.0.4.bb
> @@ -4,12 +4,16 @@ AUTHOR =3D "Sebastian Spaeth <Sebastian@SSpaeth.de>"
> =A0LICENSE =A0=3D "MIT"
> =A0RDEPENDS_${PN} =3D "python-elementary python python-edbus"
> =A0SECTION =3D "x11/application"
> -PR =3D "r1"
> +PR =3D "r2"
>
>
> =A0SRC_URI =3D "git://github.com/spaetz/calc.git;protocol=3Dhttp;branch=
=3Dmaster;tag=3D${PV}"
> =A0S =3D "${WORKDIR}/git"
>
> +do_configure_prepend() {
> + =A0 =A0 =A0 =A0sed -i 's#calculator.png#calculator#g' ${S}/data/element=
ary-calculator.desktop
> +}
> +
> =A0do_install(){
> =A0 =A0 =A0 =A0 install -d ${D}${datadir}/applications
> =A0 =A0 =A0 =A0 install -m 0644 ${S}/data/elementary-calculator.desktop $=
{D}${datadir}/applications/
> diff --git a/recipes/openmoko-3rdparty/calc_git.bb b/recipes/openmoko-3rd=
party/calc_git.bb
> index 53356b2..559a61b 100644
> --- a/recipes/openmoko-3rdparty/calc_git.bb
> +++ b/recipes/openmoko-3rdparty/calc_git.bb
> @@ -14,6 +14,10 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0SRC_URI =3D "git://github.com/spaetz/calc.git;protocol=3Dhttp;branch=
=3Dmaster"
> =A0S =3D "${WORKDIR}/git"
>
> +do_configure_prepend() {
> + =A0 =A0 =A0 =A0sed -i 's#calculator.png#calculator#g' ${S}/data/element=
ary-calculator.desktop
> +}
> +
> =A0do_install(){
> =A0 =A0 =A0 =A0 install -d ${D}${datadir}/applications
> =A0 =A0 =A0 =A0 install -m 0644 ${S}/data/elementary-calculator.desktop $=
{D}${datadir}/applications/
> diff --git a/recipes/openmoko-3rdparty/om-neon_svn.bb b/recipes/openmoko-=
3rdparty/om-neon_svn.bb
> index a17c373..20b2251 100644
> --- a/recipes/openmoko-3rdparty/om-neon_svn.bb
> +++ b/recipes/openmoko-3rdparty/om-neon_svn.bb
> @@ -8,7 +8,7 @@ DEPENDS =3D "edje-native python-native"
>
> =A0SRCREV =3D "68"
> =A0PV =3D "1.0.0+svnr${SRCPV}"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0S =3D "${WORKDIR}/trunk"
>
> @@ -27,4 +27,5 @@ do_compile_prepend() {
> =A0 =A0 =A0 =A0sed -i "s/\/opt\/bin\/edje_cc -v/${@"${STAGING_BINDIR_NATI=
VE}".replace('/', '\/')}\/edje_cc/g" ${S}/build_edje.py
> =A0 =A0 =A0 =A0sed -i "s/#THEMES_DIR =3D '\/usr\/share\/neon\/themes'/THE=
MES_DIR =3D '\/usr\/share\/neon\/themes'/g" ${S}/neon/neon.py
> =A0 =A0 =A0 =A0sed -i "s/THEMES_DIR =3D '..\/data\/themes'/#THEMES_DIR =
=3D '..\/data\/themes'/g" ${S}/neon/neon.py
> + =A0 =A0 =A0 sed -i 's#neon.png#neon#g' ${S}/data/neon.desktop
> =A0}
> diff --git a/recipes/openmoko-3rdparty/podboy_svn.bb b/recipes/openmoko-3=
rdparty/podboy_svn.bb
> index 1cbeb69..813b812 100644
> --- a/recipes/openmoko-3rdparty/podboy_svn.bb
> +++ b/recipes/openmoko-3rdparty/podboy_svn.bb
> @@ -7,7 +7,7 @@ PRIORITY =3D "optional"
>
> =A0SRCREV =3D "210"
> =A0PV =3D "1.7.2+svnr${SRCPV}"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0PACKAGE_ARCH =3D "all"
>
> @@ -23,4 +23,5 @@ RDEPENDS_${PN} +=3D "python-compression python-elementa=
ry python-gst python-html p
>
> =A0do_compile_prepend() {
> =A0 =A0 =A0 =A0${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/data ${S}/data/p=
odboy.edc
> + =A0 =A0 =A0 sed -i 's#podboy.png#podboy#g' ${S}/data/podboy.desktop
> =A0}
> diff --git a/recipes/pyphonelog/pyphonelog_git.bb b/recipes/pyphonelog/py=
phonelog_git.bb
> index e22e824..639194c 100644
> --- a/recipes/pyphonelog/pyphonelog_git.bb
> +++ b/recipes/pyphonelog/pyphonelog_git.bb
> @@ -11,8 +11,12 @@ S =3D "${WORKDIR}/git"
> =A0SRCREV =3D "d22159060470d2f429d4e8b9ba1dc3096aa5d099"
> =A0PE =3D "1"
> =A0PV =3D "0.17.0+gitr${SRCPV}"
> -PR =3D "r1"
> +PR =3D "r2"
> =A0SRC_URI =3D "git://git.shr-project.org/repo/pyphonelog.git;protocol=3D=
http"
> =A0FILES_${PN} +=3D "${datadir}/applications/phonelog.desktop \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/phonelog/ \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/pixmaps/phonelog.png"
> +
> +do_configure_prepend() {
> + =A0 =A0 =A0 =A0sed -i 's#phonelog.png#phonelog#g' ${S}/data/application=
s/phonelog.desktop
> +}
> --
> 1.7.4
>
>


