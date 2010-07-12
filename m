Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYNvV-0006JZ-PW
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 20:41:46 +0200
Received: by iwn34 with SMTP id 34so5012035iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 11:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=pW3tnCW1t9dGAEYw+UsjuzKVhSWnRz6u3fZjtzG1a9I=;
	b=q/Y+kY4fgrj4MzdacpujQxlnmfPPgeZZh3vt5ypcVkV3AFZLTPCgoEPiQPAr+KQt6+
	skYKLo1kbT4lovWg81PaezeFvGwcm+lc3gdMkxekWHINzA4opXArAtQnnS+0HF8mvbqt
	ErZRVr49a4IflwyYXoc9yYyRLSP7lQAi/NNiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=qbDW63HVehAr+MXRxiVpbNr3vEuIpSllQtPkrGV69AxbNwdPl79rw0GK7KcM2xRcTW
	Li0N3F/RMWFHist16gdBG6XZtuDPUyX0+TCsxk0BgPYfBObr930oxQv1ySxmrkbhJSO+
	2uCTvPcCgnJ5Q4mackMDfTflaOB1ctnQzt75M=
Received: by 10.231.33.205 with SMTP id i13mr14403638ibd.179.1278959708315; 
	Mon, 12 Jul 2010 11:35:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.10.196 with HTTP; Mon, 12 Jul 2010 11:34:48 -0700 (PDT)
In-Reply-To: <1278499134-24718-1-git-send-email-khimov@altell.ru>
References: <201007071352.09254.khimov@altell.ru>
	<1278499134-24718-1-git-send-email-khimov@altell.ru>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jul 2010 11:34:48 -0700
Message-ID: <AANLkTimzHYI6PCsDfbDM2v0zpj1ovyTZ8H-43tvJIluv@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] busybox: add suport for FEATURE_INDIVIDUAL setup
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
X-List-Received-Date: Mon, 12 Jul 2010 18:42:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 7, 2010 at 3:38 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Where each applet is installed as a tiny binary linked against shared
> libbusybox.

may be it should be a DISTRO_FEATURE in OE

>
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0recipes/busybox/busybox.inc | =A0 74 +++++++++++++++++++++++++++++++++=
+++-------
> =A01 files changed, 62 insertions(+), 12 deletions(-)
>
> diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
> index a5346bd..31e6cdc 100644
> --- a/recipes/busybox/busybox.inc
> +++ b/recipes/busybox/busybox.inc
> @@ -11,7 +11,7 @@ LICENSE =3D "GPLv2"
> =A0SECTION =3D "base"
> =A0PRIORITY =3D "required"
>
> -INC_PR =3D "r30"
> +INC_PR =3D "r31"
>
> =A0SRC_URI =3D "\
> =A0 file://busybox-cron \
> @@ -98,15 +98,35 @@ do_install () {
>
> =A0 =A0 =A0 =A0install -d ${D}${sysconfdir}/init.d
>
> - =A0 =A0 =A0 # Install /bin/busybox, and the /bin/sh link so the postins=
t script
> - =A0 =A0 =A0 # can run. Let update-alternatives handle the rest.
> - =A0 =A0 =A0 install -d ${D}${base_bindir}
> - =A0 =A0 =A0 if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORKDIR}/defconfig; =
then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 4755 ${S}/busybox ${D}${base_bin=
dir}
> + =A0 =A0 =A0 if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=3Dy" ${WORKDIR}/def=
config; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # Install /bin/busybox, and the /bin/sh lin=
k so the postinst script
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # can run. Let update-alternatives handle t=
he rest.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${base_bindir}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORK=
DIR}/defconfig; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 4755 ${S}/busybo=
x ${D}${base_bindir}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${S}/busybo=
x ${D}${base_bindir}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf busybox ${D}${base_bindir}/sh
> =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${S}/busybox ${D}${base_bin=
dir}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${base_bindir} ${D}${base_sb=
indir}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${libdir} ${D}${bindir} ${D}=
${sbindir}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cat busybox.links | while read FILE; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 NAME=3D`basename "$FILE"`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 "0_lib/$NAM=
E" "${D}$FILE.${PN}"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 # add suid bit where needed
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for i in `grep -E "APPLET.*_BB_SUID_((MAYBE=
|REQUIRE))" include/applets.h | grep -v _BB_SUID_DROP | cut -f 3 -d '(' | c=
ut -f 1 -d ','`; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 find ${D} -name $i.${PN} -e=
xec chmod a+s {} \;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 done
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 0_lib/libbusybox.so.${PV} $=
{D}${libdir}/libbusybox.so.${PV}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf sh.${PN} ${D}${base_bindir}/sh
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf ln.${PN} ${D}${base_bindir}/ln
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -sf test.${PN} ${D}${bindir}/test
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -f ${D}/linuxrc.${PN} ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mv ${D}/linuxrc.${PN} ${D}/=
linuxrc
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0fi
> - =A0 =A0 =A0 ln -sf busybox ${D}${base_bindir}/sh
>
> =A0 =A0 =A0 =A0if grep -q "CONFIG_SYSLOGD=3Dy" ${WORKDIR}/defconfig; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/syslog ${D}${sy=
sconfdir}/init.d/syslog.${PN}
> @@ -144,12 +164,42 @@ pkg_postinst_${PN} () {
> =A0 =A0 =A0 =A0# so the update-alternatives script will get the utilities=
 it needs
> =A0 =A0 =A0 =A0# (update-alternatives have no problem replacing links lat=
er anyway)
> =A0 =A0 =A0 =A0test -n 2> /dev/null || alias test=3D'busybox test'
> - =A0 =A0 =A0 if test "x$D" =3D "x"; then while read link; do if test ! -=
h "$link"; then case "$link" in /*/*/*) to=3D"../../bin/busybox";; /bin/*) =
to=3D"busybox";; /*/*) to=3D"../bin/busybox";; /*) to=3D"/bin/busybox";; es=
ac; busybox ln -s $to $link; fi; done </etc/busybox.links; fi
> + =A0 =A0 =A0 ln --help >/dev/null 2>&1 || alias ln=3D'busybox ln'
> + =A0 =A0 =A0 if test "x$D" =3D "x"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 while read link; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test ! -h "$link"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -f =
"$link.busybox"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 to=3D"$link.busybox"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 case "$link" in
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 /*/*/*) to=3D"../../bin/busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 /bin/*) to=3D"busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 /*/*) to=3D"../bin/busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 /*) to=3D"/bin/busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 esac
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ln -s $to $=
link
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 done </etc/busybox.links
> + =A0 =A0 =A0 fi
>
> =A0 =A0 =A0 =A0# This adds the links, remember that this has to work when=
 building an image too, hence the $D
> - =A0 =A0set +e
> - =A0 =A0 =A0 while read link; do case "$link" in /*/*/*) to=3D"../../bin=
/busybox";; /bin/*) to=3D"busybox";; /*/*) to=3D"../bin/busybox";; /*) to=
=3D"/bin/busybox";; esac; bn=3D`basename $link`; update-alternatives --inst=
all $link $bn $to 50; done <$D/etc/busybox.links
> - =A0 =A0set -e
> + =A0 =A0 =A0 set +e
> + =A0 =A0 =A0 while read link; do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if test -f "$D$link.${PN}"; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 to=3D"$link.${PN}"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 case "$link" in
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*/*/*) to=
=3D"../../bin/busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /bin/*) to=
=3D"busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*/*) to=3D=
"../bin/busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*) to=3D"/=
bin/busybox";;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 esac
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bn=3D`basename $link`
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 update-alternatives --install $link $bn $to=
 50
> + =A0 =A0 =A0 done <$D/etc/busybox.links
> + =A0 =A0 =A0 set -e
> =A0}
>
> =A0pkg_postinst_${PN}-mountall () {
> --
> 1.5.6.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


