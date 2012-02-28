Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1S2Nhe-0001Ce-0F
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 15:06:54 +0100
Received: by pbbrp12 with SMTP id rp12so3861370pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 05:58:25 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.adami@gmail.com designates
	10.68.232.42 as permitted sender) client-ip=10.68.232.42; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of andrea.adami@gmail.com
	designates 10.68.232.42 as permitted sender)
	smtp.mail=andrea.adami@gmail.com;
	dkim=pass header.i=andrea.adami@gmail.com
Received: from mr.google.com ([10.68.232.42])
	by 10.68.232.42 with SMTP id tl10mr54914241pbc.50.1330437505782
	(num_hops = 1); Tue, 28 Feb 2012 05:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=/RfExT3OWnMNFd8RafULT2vHRMe5Stp0sMEP96oM+48=;
	b=DGgXKzbGNVY2qy9UKnJ9FQRgkNGopRrtDc1S5+XaR64TaLY/lCoItzBBdgKDl5Npd0
	59EOWeHP3xw4gF9AvZksXAerCdl9Uq8BeYHbjaG4oyx3t49uwxUSiTiydAn1/2+heFSV
	xsaCyv5t7okXfNijLy3VwMJ107LdPmeKCliqA=
MIME-Version: 1.0
Received: by 10.68.232.42 with SMTP id tl10mr46412615pbc.50.1330437505328;
	Tue, 28 Feb 2012 05:58:25 -0800 (PST)
Received: by 10.143.67.8 with HTTP; Tue, 28 Feb 2012 05:58:25 -0800 (PST)
In-Reply-To: <1330435070-30907-1-git-send-email-koen@dominion.thruhere.net>
References: <1330435070-30907-1-git-send-email-koen@dominion.thruhere.net>
Date: Tue, 28 Feb 2012 14:58:25 +0100
Message-ID: <CAAQYJAv0-czYNsmCCqaXs3jpu-OJmRPd+fZU-C2zhG0xKaP0XQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] xinput-calibrator 0.7.5: fix calibration script
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
X-List-Received-Date: Tue, 28 Feb 2012 14:06:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2012 at 2:17 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> The 'auto' format switched to 'xorg.conf.d' which broke the script. The p=
ointercal package also installed an 'empty' pointercal by default, which al=
so broke the script. Fix these 2 in one go.
>
> Also remove the hal script since hal isn't supported in the oe-core unive=
rse anymore
>
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---

Koen,

do you think the recipe is now mature enough to be committed in oe-core?
This would follow xinput commit and could make easier the unification
of xserver-nodm-init between oe-core and meta-oe.

I think thi sis needed because at the moment xserver ts calibration is
not working when using oe-core (xtscal fails because XCALIBRATE ext
has been removed).


Regards

Andrea



> =A0...brator_pointercal.sh-specify-output-type-.patch | =A0 56 ++++++++++=
++++++++++
> =A0.../xinput-calibrator/xinput-calibrator_0.7.5.bb =A0 | =A0 =A06 +-
> =A02 files changed, 59 insertions(+), 3 deletions(-)
> =A0create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-c=
alibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
>
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch b/meta-oe/=
recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator=
_pointercal.sh-specify-output-type-.patch
> new file mode 100644
> index 0000000..8e6d949
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-x=
input_calibrator_pointercal.sh-specify-output-type-.patch
> @@ -0,0 +1,56 @@
> +From e73eb2c343006865ff3faf7777ab93ccfd1762d6 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Tue, 28 Feb 2012 14:09:08 +0100
> +Subject: [PATCH] xinput_calibrator_pointercal.sh: specify output type si=
nce 'auto' doesn't always pick 'xinput'
> +
> +Also deal with pointercal files that contain '# replace with valid machi=
ne specific pointercal.xinput'
> +
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> +
> +Upstream-status: Submitted
> +
> + scripts/xinput_calibrator_pointercal.sh | =A0 22 +++++++++++++++-------
> + 1 files changed, 15 insertions(+), 7 deletions(-)
> +
> +diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_ca=
librator_pointercal.sh
> +index 579509c..fccb197 100755
> +--- a/scripts/xinput_calibrator_pointercal.sh
> ++++ b/scripts/xinput_calibrator_pointercal.sh
> +@@ -6,18 +6,26 @@
> + #
> + # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
> + # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
> ++# updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
> ++
> ++PATH=3D"/usr/bin:$PATH"
> +
> + BINARY=3D"xinput_calibrator"
> + CALFILE=3D"/etc/pointercal.xinput"
> + LOGFILE=3D"/var/log/xinput_calibrator.pointercal.log"
> +
> + if [ -e $CALFILE ] ; then
> +- =A0echo "Using calibration data stored in $CALFILE"
> +- =A0. $CALFILE
> +-else
> +- =A0CALDATA=3D`$BINARY -v | tee $LOGFILE | grep ' =A0 =A0xinput set' | =
sed 's/^ =A0 =A0//g; s/$/;/g'`
> +- =A0if [ ! -z "$CALDATA" ] ; then
> +- =A0 =A0echo $CALDATA > $CALFILE
> +- =A0 =A0echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
> ++ =A0if grep replace $CALFILE ; then
> ++ =A0 =A0echo "Empty calibration file found, removing it"
> ++ =A0 =A0rm $CALFILE
> ++ =A0else
> ++ =A0 =A0echo "Using calibration data stored in $CALFILE"
> ++ =A0 =A0. $CALFILE && exit 0
> + =A0 fi
> + fi
> ++
> ++CALDATA=3D`$BINARY --output-type xinput -v | tee $LOGFILE | grep ' =A0 =
=A0xinput set' | sed 's/^ =A0 =A0//g; s/$/;/g'`
> ++if [ ! -z "$CALDATA" ] ; then
> ++ =A0echo $CALDATA > $CALFILE
> ++ =A0echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
> ++fi
> +--
> +1.7.2.5
> +
> diff --git a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator=
_0.7.5.bb b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.=
7.5.bb
> index f0e85cf..e39cc44 100644
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.=
bb
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.=
bb
> @@ -4,11 +4,12 @@ LICENSE =3D "MIT-X"
> =A0LIC_FILES_CHKSUM =3D "file://src/calibrator.cpp;endline=3D22;md5=3D998=
e238a7638a7446eaeb02398f691fc"
> =A0DEPENDS =3D "virtual/libx11 libxi"
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0inherit autotools
>
> -SRC_URI =3D "http://github.com/downloads/tias/xinput_calibrator/xinput_c=
alibrator-${PV}.tar.gz"
> +SRC_URI =3D "http://github.com/downloads/tias/xinput_calibrator/xinput_c=
alibrator-${PV}.tar.gz \
> + =A0 =A0 =A0 =A0 =A0 file://0001-xinput_calibrator_pointercal.sh-specify=
-output-type-.patch"
> =A0SRC_URI[md5sum] =3D "20da0a2055a5a75962add8c6b44f60fa"
> =A0SRC_URI[sha256sum] =3D "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927=
213c3169e475d3d971"
>
> @@ -20,7 +21,6 @@ EXTRA_OECONF +=3D "--with-gui=3Dx11"
> =A0do_install_append() {
> =A0 =A0 =A0 =A0 install -d ${D}${bindir}
> =A0 =A0 =A0 =A0 install -m 0755 scripts/xinput_calibrator_pointercal.sh $=
{D}${bindir}/xinput_calibrator_once.sh
> - =A0 =A0 =A0 =A0install -m 0755 scripts/xinput_calibrator_get_hal_calibr=
ation.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
> =A0}
>
> =A0RDEPENDS_${PN} =3D "xinput"
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


