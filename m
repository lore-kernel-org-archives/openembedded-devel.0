Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ppik3-0003In-QD
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 15:52:32 +0100
Received: by iyj8 with SMTP id 8so1278630iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 06:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=Ie9MLd7lKaDVS0Zg+mq1aQX+l7EG/a78FugCJU/l5QA=;
	b=D7Gz9J3tUnLAw/mEhVWM1+y3HH+B0B0kOhIP03EAPRE6mFrIfzJxLQEzD9efiV6lHX
	c0KBkTySlFkKqRNtn8k6c52f14oapCHlHro0bwx/S75QLOCJ/Gq90rP3MHifeFp2tea4
	+fsVVlDIqdf6uLxKl1WIXRRXNimTgmfFKsTnI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BXpyf0ChjUKM40b8/qv2LnnOSnBm8Po1PGSMVjhpE7jUL+DOi7Qh7ni+BVVkbwKxAZ
	QajSXWL+JFkBjBeWfJQ5p+GROhDCpc7yMQnU0K0yJCLMNMigj7PuUV16xbW5V4v2Z2ww
	RKZWftj5GlnYBePoziQvnDPTeElJMbqk4vicU=
MIME-Version: 1.0
Received: by 10.42.7.129 with SMTP id e1mr934855ice.500.1297867879501; Wed, 16
	Feb 2011 06:51:19 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Wed, 16 Feb 2011 06:51:19 -0800 (PST)
In-Reply-To: <1297855134-19216-6-git-send-email-otavio@ossystems.com.br>
References: <1297855134-19216-1-git-send-email-otavio@ossystems.com.br>
	<1297855134-19216-6-git-send-email-otavio@ossystems.com.br>
Date: Wed, 16 Feb 2011 15:51:19 +0100
Message-ID: <AANLkTinK1xT3zRxSQrrcf9MY4f3m54kAPWZ_xEk0kMwD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 06/13] cups: add textonly filter and split packages
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
X-List-Received-Date: Wed, 16 Feb 2011 14:52:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/2/16 Otavio Salvador <otavio@ossystems.com.br>:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

> ---
> =A0recipes/cups/cups-1.4.4/text.convs =A0 | =A0 =A06 ++
> =A0recipes/cups/cups-1.4.4/textonly =A0 =A0 | =A0124 ++++++++++++++++++++=
++++++++++++++
> =A0recipes/cups/cups-1.4.4/textonly.ppd | =A0 47 +++++++++++++
> =A0recipes/cups/cups_1.4.4.bb =A0 =A0 =A0 =A0 =A0 | =A0 30 ++++++++-
> =A04 files changed, 205 insertions(+), 2 deletions(-)
> =A0create mode 100644 recipes/cups/cups-1.4.4/text.convs
> =A0create mode 100644 recipes/cups/cups-1.4.4/textonly
> =A0create mode 100644 recipes/cups/cups-1.4.4/textonly.ppd
>
> diff --git a/recipes/cups/cups-1.4.4/text.convs b/recipes/cups/cups-1.4.4=
/text.convs
> new file mode 100644
> index 0000000..20a845d
> --- /dev/null
> +++ b/recipes/cups/cups-1.4.4/text.convs
> @@ -0,0 +1,6 @@
> +application/x-cshell text/plain 100 -
> +application/x-csource text/plain 100 -
> +application/x-perl text/plain 100 -
> +application/x-shell text/plain 100 -
> +text/html text/plain 100 -
> +text/css text/plain 100 -
> diff --git a/recipes/cups/cups-1.4.4/textonly b/recipes/cups/cups-1.4.4/t=
extonly
> new file mode 100644
> index 0000000..25850cc
> --- /dev/null
> +++ b/recipes/cups/cups-1.4.4/textonly
> @@ -0,0 +1,124 @@
> +#!/bin/bash
> +## Copyright (C) 2003-2006 Red Hat, Inc.
> +## Copyright (C) 2003-2006 Tim Waugh <twaugh@redhat.com>
> +## Changed on 2007/05/17, Opher Shachar, LADPC Ltd.
> +## =A0 =A0 Added support for page-ranges option.
> +## =A0 =A0 Added page accounting.
> +
> +## This program is free software; you can redistribute it and/or modify
> +## it under the terms of the GNU General Public License as published by
> +## the Free Software Foundation; either version 2 of the License, or
> +## (at your option) any later version.
> +
> +## This program is distributed in the hope that it will be useful,
> +## but WITHOUT ANY WARRANTY; without even the implied warranty of
> +## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> +## GNU General Public License for more details.
> +
> +## You should have received a copy of the GNU General Public License
> +## along with this program; if not, write to the Free Software
> +## Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> +
> +if [ $# =3D=3D 0 ]; then
> + =A0echo >&2 "ERROR: $0 job-id user title copies options [file]"
> + =A0exit 1
> +fi
> +
> +# Extract the papersize
> +SENDFF=3D`grep '^\*DefaultSendFF' "$PPD" | cut -d\ =A0-f2`
> +COPIES=3D1
> +if [ $# -ge 4 ]; then
> + =A0COPIES=3D"$4"
> +fi
> +
> +if [ "$COPIES" -gt 1 ] && [ $# -lt 6 ]; then
> + =A0unset TMPFILE
> + =A0trap -- 'rm -f "$TMPFILE"' EXIT
> + =A0TMPFILE=3D$(mktemp ${TMPDIR:-/tmp}/textonly.XXXXXX)
> + =A0cat > "$TMPFILE"
> +else
> + =A0TMPFILE=3D"$6"
> +fi
> +
> +PR=3D${5#*page-ranges=3D}
> +# Do options specify page-ranges?
> +if [[ "$PR" !=3D "$5" ]]; then
> + =A0PR=3D${PR%% *}
> +else
> + =A0#unset PR
> + =A0PR=3D1-999999
> +fi
> +
> +if [[ "$PR" ]]; then
> + =A0TMPFILE2=3D$(mktemp ${TMPDIR:-/tmp}/textonly2.XXXXXX)
> + =A0pagenum=3D0
> + =A0EOF=3D
> + =A0{
> + =A0while [[ "$PR" ]]; do
> + =A0 =A0pl=3D${PR%%,*} =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;# take first subrang=
e
> + =A0 =A0PR=3D${PR#$pl};PR=3D${PR#,} =A0 =A0;# remove from range list
> + =A0 =A0pu=3D${pl#*-} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;# =
extract upper and lower
> + =A0 =A0pl=3D${pl%-*} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;# =
pages of subrange
> + =A0 =A0# Allows interpreting 0-5,3-10 as 1-5,6-10 rejects 5-1 or 1-
> + =A0 =A0(( pagenum >=3D pl )) && pl=3D$(( pagenum + 1 ))
> + =A0 =A0(( pl > pu )) && continue
> +
> + =A0 =A0# Loop reading pages until at or over lower page of subrange.
> + =A0 =A0while read -d `echo -ne '\f'` -r; do
> + =A0 =A0 =A0(( pagenum++ ))
> + =A0 =A0 =A0(( pagenum =3D=3D pl )) && break
> + =A0 =A0done
> + =A0 =A0# Did we reach lower page of subrange or EOF?
> + =A0 =A0if (( pagenum < pl )); then
> + =A0 =A0 =A0[[ ! "$REPLY" ]] && break =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;# =
empty last page - we're done.
> + =A0 =A0 =A0(( pagenum++ ))
> + =A0 =A0 =A0EOF=3Dy
> + =A0 =A0fi
> + =A0 =A0# Output page and report to page log
> + =A0 =A0if (( pagenum =3D=3D pl )); then
> + =A0 =A0 =A0echo -n "${REPLY}" >>"$TMPFILE2"
> + =A0 =A0 =A0# If EOF then page has no final FF
> + =A0 =A0 =A0[[ ! "$EOF" ]] && echo -ne '\f' >>"$TMPFILE2"
> + =A0 =A0 =A0echo "PAGE: $pagenum $COPIES" >&2
> + =A0 =A0fi
> + =A0 =A0[[ "$EOF" ]] && break
> + =A0 =A0# Is the current subrange a single page?
> + =A0 =A0(( pagenum =3D=3D pu )) && continue
> + =A0 =A0while read -d `echo -ne '\f'` -r; do
> + =A0 =A0 =A0(( pagenum++ ))
> + =A0 =A0 =A0echo -ne "${REPLY}\f" >>"$TMPFILE2"
> + =A0 =A0 =A0echo "PAGE: $pagenum $COPIES" >&2
> + =A0 =A0 =A0(( pagenum =3D=3D pu )) && break
> + =A0 =A0done
> + =A0 =A0# Could be that we reached EOF before page boundry
> + =A0 =A0if (( pagenum < pu )); then
> + =A0 =A0 =A0if [[ "$REPLY" ]]; then
> + =A0 =A0 =A0 =A0(( pagenum++ ))
> + =A0 =A0 =A0 =A0echo -n "${REPLY}" >>"$TMPFILE2"
> + =A0 =A0 =A0 =A0echo "PAGE: $pagenum $COPIES" >&2
> + =A0 =A0 =A0fi
> + =A0 =A0 =A0break
> + =A0 =A0fi
> + =A0done
> + =A0} <"$TMPFILE"
> +else
> + =A0TMPFILE2=3D"$TMPFILE"
> + =A0pc=3D$(grep -co `echo -ne '\f'` "$TMPFILE2")
> + =A0pc=3D$(( pc * $COPIES ))
> + =A0echo "PAGE: $pc" >&2
> +fi
> +
> +while [ "$COPIES" -gt 0 ]; do
> + =A0# Just translate LF->CRLF at the moment, until the PPD has options a=
dded.
> + =A0sed -e 's/$/'`echo -ne '\r'`'/g' "$TMPFILE2"
> +
> + =A0if [ "$SENDFF" =3D=3D "True" ]
> + =A0 =A0then
> + =A0 =A0echo -ne \\14
> + =A0fi
> +
> + =A0COPIES=3D$(($COPIES - 1))
> +done
> +# Cleanup
> +[[ "$TMPFILE" !=3D "$TMPFILE2" ]] && rm -f "$TMPFILE2"
> +exit 0
> diff --git a/recipes/cups/cups-1.4.4/textonly.ppd b/recipes/cups/cups-1.4=
.4/textonly.ppd
> new file mode 100644
> index 0000000..89060bc
> --- /dev/null
> +++ b/recipes/cups/cups-1.4.4/textonly.ppd
> @@ -0,0 +1,47 @@
> +*PPD-Adobe: "4.3"
> +*%
> +*% Text-only printer definition
> +*%
> +*FormatVersion: =A0 =A0 =A0 =A0"4.3"
> +*FileVersion: =A0"1.1"
> +*LanguageVersion: English
> +*LanguageEncoding: ISOLatin1
> +*PCFileName: =A0 "TEXTONLY.PPD"
> +*Manufacturer: "Generic"
> +*Product: =A0 =A0 =A0"(Generic)"
> +*cupsVersion: =A0 1.0
> +*cupsManualCopies: True
> +*cupsModelNumber: =A02
> +*cupsFilter: =A0 =A0"text/plain 0 textonly"
> +*ModelName: =A0 =A0 "Generic text-only printer"
> +*ShortNickName: "Generic text-only printer"
> +*NickName: =A0 =A0 =A0"Generic text-only printer"
> +*PSVersion: =A0 =A0"(2017.000) 0"
> +*LanguageLevel: =A0 =A0 =A0 =A0"2"
> +*ColorDevice: =A0False
> +*DefaultColorSpace: Gray
> +*FileSystem: =A0 False
> +*Throughput: =A0 "8"
> +*LandscapeOrientation: Plus90
> +*VariablePaperSize: False
> +*TTRasterizer: Type42
> +*DefaultImageableArea: Letter
> +*ImageableArea Letter/US Letter: =A0 =A0 =A0 "18 36 594 756"
> +*DefaultPaperDimension: Letter
> +*PaperDimension Letter/Letter: =A0 =A0 =A0 =A0 "612 792"
> +*OpenUI *PageSize/Media Size: PickOne
> +*OrderDependency: 10 AnySetup *PageSize
> +*DefaultPageSize: Letter
> +*PageSize Letter/Letter: =A0 =A0 =A0 "<</PageSize[612 792]/ImagingBBox n=
ull>>setpagedevice"
> +*CloseUI: *PageSize
> +*OpenUI *PageRegion: PickOne
> +*OrderDependency: 10 AnySetup *PageRegion
> +*DefaultPageRegion: Letter
> +*PageRegion Letter/Letter: =A0 =A0 "<</PageSize[612 792]/ImagingBBox nul=
l>>setpagedevice"
> +*CloseUI: *PageRegion
> +
> +*OpenUI *SendFF: Boolean
> +*DefaultSendFF: False
> +*SendFF True/True: =A0 =A0 =A0 =A0""
> +*SendFF False/False: =A0 ""
> +*CloseUI: *SendFF
> diff --git a/recipes/cups/cups_1.4.4.bb b/recipes/cups/cups_1.4.4.bb
> index 709edf1..c469dae 100644
> --- a/recipes/cups/cups_1.4.4.bb
> +++ b/recipes/cups/cups_1.4.4.bb
> @@ -5,12 +5,15 @@ LICENSE =3D "GPL LGPL"
> =A0DEPENDS =3D "gnutls libpng jpeg dbus dbus-glib zlib fakeroot-native"
> =A0DEPENDS +=3D "virtual/libusb0"
> =A0PROVIDES =3D "cups14"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "ftp://ftp.easysw.com/pub/cups/${PV}/cups-${PV}-source.tar=
.bz2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://use_echo_only_in_init.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://skip_tools.patch \
> =A0 =A0 =A0 =A0 =A0 =A0file://configure.patch \
> + =A0 =A0 =A0 =A0 =A0 file://textonly.ppd \
> + =A0 =A0 =A0 =A0 =A0 file://textonly \
> + =A0 =A0 =A0 =A0 =A0 file://text.convs \
> =A0 =A0 =A0 =A0 =A0 =A0"
> =A0SRC_URI[md5sum] =3D "8776403ad60fea9e85eab9c04d88560d"
> =A0SRC_URI[sha256sum] =3D "d25ffa35add3abeeec0eba60be2cffc89425b649c64ef3=
a73dfc724683a59aa3"
> @@ -57,10 +60,24 @@ do_compile () {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"-I."
> =A0}
>
> -PACKAGES =3D+ "${PN}-lib ${PN}-libimage"
> +PACKAGES =3D+ "${PN}-lib ${PN}-libimage ${PN}-filter-textonly ${PN}-filt=
ers ${PN}-models"
> +
> +PACKAGES_DYNAMIC +=3D "${PN}-backend-*"
> +
> +python populate_packages_prepend() {
> + =A0 =A0 =A0 backend_dir =3D bb.data.expand('${libdir}/cups/backend/', d=
)
> + =A0 =A0 =A0 do_split_packages(d, backend_dir, '^(.*)$', 'cups-backend-%=
s',
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 '${PN} backend for %s',=
 prepend=3DTrue, allow_links=3DTrue)
> +}
>
> =A0FILES_${PN}-lib =3D "${libdir}/libcups.so.*"
> =A0FILES_${PN}-libimage =3D "${libdir}/libcupsimage.so.*"
> +FILES_${PN}-filter-textonly +=3D "${datadir}/ppd/cups-included/textonly.=
ppd \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadi=
r}/cups/mime/text.convs \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir=
}/cups/filter/textonly \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"
> +FILES_${PN}-filters +=3D "${libdir}/cups/filter/*"
> +FILES_${PN}-models +=3D "${datadir}/cups/model/*"
> =A0FILES_${PN}-dbg +=3D "${libdir}/cups/backend/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/cgi-bin/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/cups/filter/.debug \
> @@ -82,6 +99,15 @@ fakeroot do_install () {
> =A0 =A0 oe_runmake "DSTROOT=3D${D}" install
> =A0 =A0 # This directory gets installed with perms 511, which makes packa=
ging fail
> =A0 =A0 chmod 0711 "${D}/${localstatedir}/run/cups/certs"
> +
> + =A0 =A0install -d ${D}/${libdir}/cups/filter
> + =A0 =A0install -m 755 ${WORKDIR}/textonly ${D}/${libdir}/cups/filter
> +
> + =A0 =A0install -d ${D}/${datadir}/cups/mime
> + =A0 =A0install -m 644 ${WORKDIR}/text.convs ${D}/${datadir}/cups/mime
> +
> + =A0 =A0install -d ${D}/${datadir}/ppd/cups-included
> + =A0 =A0install -m 644 ${WORKDIR}/textonly.ppd ${D}/${datadir}/ppd/cups-=
included
> =A0}
>
> =A0python do_package_append() {
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


