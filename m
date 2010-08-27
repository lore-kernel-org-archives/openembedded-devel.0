Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OouNU-0005Dj-DL
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 10:33:38 +0200
Received: by iwn2 with SMTP id 2so2320146iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=RSRRgGAh/pjbUtrA8dn0DV6FhjBF3/z0o0OoLUke3VA=;
	b=rbx3Qn4j2P6GAw6Yv8ZwLnGayI4dlWdQEipcpglHaIZygQGknZsuZ9c2tdubf9inU/
	BlEmvJe3oSmODQkIQw4ComloLA8BYwi2mr5id5xXfoVS65P120l5nfhYwmIY6xnaU1Hz
	jfvMs1Gf6HcoUgMRN6meyrhFy62j81yKDjbHc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JdX2tjqiGzIeC3T2mMa1i5eXDz0ps+0MeisxmHG7sOYw2pTK/MOL/2qMZgy/nEafFK
	jemCP+s08X31wgoZRfN+Px0+EXdT+wYazH0SPn3Tk37xukzW+UtMFTSghAGavBjtYb+m
	6qnWnYhi4MUafCGoWFGsl98q0Tj+F1BS4pcIs=
MIME-Version: 1.0
Received: by 10.231.166.72 with SMTP id l8mr772247iby.95.1282897989108; Fri,
	27 Aug 2010 01:33:09 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Fri, 27 Aug 2010 01:33:09 -0700 (PDT)
In-Reply-To: <1282896714-3167-2-git-send-email-raj.khem@gmail.com>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-2-git-send-email-raj.khem@gmail.com>
Date: Fri, 27 Aug 2010 10:33:09 +0200
Message-ID: <AANLkTimm5W_E-WLFVeN7uYDmPJ9GrrOnWaOFVsEAHpuG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] dspgw-utils: Adding DSP Gateway Utilities package
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
X-List-Received-Date: Fri, 27 Aug 2010 08:33:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/27 Khem Raj <raj.khem@gmail.com>:
> From: Willer Moreira <willer.moreira@openbossa.org>
>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@openbossa.org>
> Signed-off-by: Francisco Alecrim <francisco.alecrim@openbossa.org>
> Signed-off-by: Willer Moreira <willer.moreira@openbossa.org>
> ---
> =A0recipes/dspgw-utils/dspgw-utils_3.3.1.bb =A0 | =A0 43 ++++++++++++
> =A0recipes/dspgw-utils/files/dsp =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 96 ++++=
++++++++++++++++++++++++
> =A0recipes/dspgw-utils/files/dsp.rules =A0 =A0 =A0 =A0| =A0 =A06 ++
> =A0recipes/dspgw-utils/files/yytext_ptr.patch | =A0 11 +++
> =A04 files changed, 156 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/dspgw-utils/dspgw-utils_3.3.1.bb
> =A0create mode 100644 recipes/dspgw-utils/files/dsp
> =A0create mode 100644 recipes/dspgw-utils/files/dsp.rules
> =A0create mode 100644 recipes/dspgw-utils/files/yytext_ptr.patch
>
> diff --git a/recipes/dspgw-utils/dspgw-utils_3.3.1.bb b/recipes/dspgw-uti=
ls/dspgw-utils_3.3.1.bb
> new file mode 100644
> index 0000000..08e11b6
> --- /dev/null
> +++ b/recipes/dspgw-utils/dspgw-utils_3.3.1.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION =3D "DSP Gateway Utilities"
> +HOMEPAGE =3D "http://dspgateway.sourceforge.net"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "bison flex udev"
> +PR =3D "r0"
> +
> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/dspgateway/dspgw-${PV}-arm.tar.bz2 \
> + =A0 =A0 =A0 =A0 =A0 file://yytext_ptr.patch;patch=3D1 \
> + =A0 =A0 =A0 =A0 =A0 file://dsp \
> + =A0 =A0 =A0 =A0 =A0 file://dsp.rules "
> +
> +S =3D "${WORKDIR}/dspgw-${PV}-arm/src/utils"
> +
> +CFLAGS +=3D "-g -Wall -I${WORKDIR}/dspgw-${PV}-arm/include"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_NAME =3D "dsp"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +# Skipping...
> +do_configure () {
> +}
> +
> +# Skipping...
> +do_stage () {
> +}

Is an empty do-stage needed? I thought we could to without.
> +
> +do_compile () {
> + =A0 =A0 =A0 =A0cd ${S}/dsp_dld/arm && oe_runmake
> + =A0 =A0 =A0 =A0cd ${S}/dspctl && oe_runmake
> +}
> +
> +do_install () {
> + =A0 =A0 =A0 =A0install -d ${D}${sbindir}
> + =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}/init.d
> + =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}/udev/rules.d
> + =A0 =A0 =A0 =A0install -m 0655 ${S}/dspctl/dspctl ${D}${sbindir}
> + =A0 =A0 =A0 =A0install -m 0655 ${S}/dsp_dld/arm/dsp_dld ${D}${sbindir}
> + =A0 =A0 =A0 =A0install -m 0655 ${S}/dsp_dld/arm/dld_client ${D}${sbindi=
r}
> + =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/dsp ${D}${sysconfdir}/init.d
> + =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/dsp.rules ${D}${sysconfdir}/u=
dev/rules.d/
> +}
> diff --git a/recipes/dspgw-utils/files/dsp b/recipes/dspgw-utils/files/ds=
p
> new file mode 100644
> index 0000000..4387d60
> --- /dev/null
> +++ b/recipes/dspgw-utils/files/dsp
> @@ -0,0 +1,96 @@
> +#!/bin/sh
> +# DSP Gateway init script
> +# Copyright (C) 2007 INdT.
> +# @author Abner Jose de Faria Silva <abner.silva@indt.org.br>
> +#
> +# This library is free software; you can redistribute it and/or
> +# modify it under the terms of the GNU Lesser General Public
> +# License as published by the Free Software Foundation; either
> +# version 2.1 of the License, or (at your option) any later version.
> +#
> +# This library is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the GNU
> +# Lesser General Public License for more details.
> +#
> +# You should have received a copy of the GNU Lesser General Public
> +# License along with this library; if not, write to the Free Software
> +# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA =A002110-130=
1 =A0USA
> +
> +set -e
> +
> +DESC=3D"DSP Gateway"
> +
> +DAEMON=3D/usr/sbin/dsp_dld
> +DSPCTL=3D/usr/sbin/dspctl
> +DSPCONF=3D/lib/dsp/dsp_dld_avs.conf
> +
> +DAEMONPARAM=3D"-p --disable-restart -c $DSPCONF"
> +
> +KMEMRESERVE=3D360000
> +
> +PIDDIR=3D/var/run/dsp
> +PIDFILE=3D$PIDDIR/pid
> +
> +test -x "$DAEMON" || exit 0
> +test -x "$DSPCTL" || exit 0
> +test -e "$DSPCONF" || exit 0
> +
> +start_dsp()
> +{
> + =A0 =A0if [ ! -d "$PIDDIR" ]; then
> + =A0 =A0 =A0 =A0mkdir -p "$PIDDIR"
> + =A0 =A0fi
> +
> + =A0 =A0if [ -e "$PIDFILE" ]; then
> + =A0 =A0 =A0 =A0TMP=3D/proc/$(cat $PIDFILE)
> + =A0 =A0 =A0 =A0if [ -d "$TMP" -a "$(readlink -f $TMP/exe)" =3D "$DAEMON=
" ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0echo "$DESC is already running."
> + =A0 =A0 =A0 =A0 =A0 =A0return
> + =A0 =A0 =A0 =A0else
> + =A0 =A0 =A0 =A0 =A0 =A0echo "Removing old PID file $PIDFILE."
> + =A0 =A0 =A0 =A0 =A0 =A0rm -f "$PIDFILE"
> + =A0 =A0 =A0 =A0fi
> + =A0 =A0fi
> +
> + =A0 =A0echo -n "Starting $DESC: "
> +
> + =A0 =A0$DSPCTL kmem_reserve $KMEMRESERVE
> + =A0 =A0start-stop-daemon --start --quiet -b --make-pidfile --pidfile "$=
PIDFILE" \
> + =A0 =A0--exec "$DAEMON" -- $DAEMONPARAM
> +
> + =A0 =A0echo "done."
> +}
> +
> +stop_dsp()
> +{
> + =A0 =A0echo -n "Stopping $DESC: "
> +
> + =A0 =A0$DSPCTL kmem_release
> + =A0 =A0start-stop-daemon --stop --quiet --name $(basename "$DAEMON") \
> + =A0 =A0--pidfile "$PIDFILE"
> + =A0 =A0rm -f "$PIDFILE"
> +
> + =A0 =A0echo "done."
> +}
> +
> +case "$1" in
> + =A0 =A0start)
> + =A0 =A0 =A0 =A0start_dsp
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0stop)
> + =A0 =A0 =A0 =A0stop_dsp
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0restart|force-reload)
> + =A0 =A0 =A0 =A0stop_dsp
> + =A0 =A0 =A0 =A0start_dsp
> + =A0 =A0 =A0 =A0;;
> + =A0 =A0*)
> + =A0 =A0 =A0 =A0echo "Usage: $(basename $0) {start|stop|restart|force-re=
load}" >&2
> + =A0 =A0 =A0 =A0exit 1
> + =A0 =A0 =A0 =A0;;
> +esac
> +
> +echo ""
> +
> +exit 0
> diff --git a/recipes/dspgw-utils/files/dsp.rules b/recipes/dspgw-utils/fi=
les/dsp.rules
> new file mode 100644
> index 0000000..ae01361
> --- /dev/null
> +++ b/recipes/dspgw-utils/files/dsp.rules
> @@ -0,0 +1,6 @@
> +# dsp dev
> +KERNEL=3D=3D"dspctl", =A0 =A0NAME=3D"dspctl/ctl"
> +KERNEL=3D=3D"dspmem", =A0 =A0NAME=3D"dspctl/mem", MODE=3D"0640", GROUP=
=3D"kmem"
> +KERNEL=3D=3D"dsptwch", =A0 NAME=3D"dspctl/twch", MODE=3D"0640"
> +KERNEL=3D=3D"dsperr", =A0 =A0NAME=3D"dspctl/err", MODE=3D"0440"
> +KERNEL=3D=3D"dsptask[0-9]*", MODE=3D"0666"
> diff --git a/recipes/dspgw-utils/files/yytext_ptr.patch b/recipes/dspgw-u=
tils/files/yytext_ptr.patch
> new file mode 100644
> index 0000000..cf17c1d
> --- /dev/null
> +++ b/recipes/dspgw-utils/files/yytext_ptr.patch
> @@ -0,0 +1,11 @@
> +--- utils/dsp_dld/arm/dld_cmd_spec.l =A0 2006-09-08 02:57:22.000000000 -=
0300
> ++++ utils/dsp_dld/arm/dld_cmd_spec.l.fixed =A0 =A0 2007-10-09 16:46:28.0=
00000000 -0300
> +@@ -180,6 +180,8 @@
> + =A0 =A0 =A0 return(1);
> + }
> +
> ++#define yytext_ptr yytext
> ++
> + void comment(void)
> + {
> + =A0 =A0 =A0 char c, c1;
> --
> 1.7.1
>

If the do_stage item is looked into (and removed if needed), i see no
problem with it so:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


