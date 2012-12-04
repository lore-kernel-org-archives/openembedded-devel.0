Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mario.goulart@gmail.com>) id 1TfsgD-0005pu-Jz
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 14:36:57 +0100
Received: by mail-ie0-f175.google.com with SMTP id qd14so5981895ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 05:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=yLxpIBbTSnYNyTaePjZalEcUGvsD2AAaFrx3cLtiJz0=;
	b=KFksAcJ8KoJE1/jxrKm8P5PXDxa3gBy7aw1dwvTOge0mOyNFykfG46aHUS08IsgTt/
	eC6ik25FVRM3oN5OoDhR5QkaUM5v/aKisLyMtELUufhnxG4AhIWtIkgqE3bRzBRBFrfC
	Se6v0t47rkYumRtM4foYUvZ4KsPr3DFuzAX8eTHUf4zS/SK2+iKYKAO0SCVV1Mjpwspe
	by13vECkWmsJc+c7EMspyB/JCZTWymGfVD7ChyertDmKkFOppaDvSVwIl5DJt34/uH+A
	Gw3LwiSWrqeh7kLVaQLexUYKudMENnFRFsr48B9Z1UPJlBipr+sUuHw2XiGZRC5gKuG/
	ZI7A==
Received: by 10.42.57.11 with SMTP id b11mr10975446ich.15.1354627354478;
	Tue, 04 Dec 2012 05:22:34 -0800 (PST)
Received: from cl-t066-141cl.privatedns.com.gmail.com (wkit.com.br.
	[67.205.85.241])
	by mx.google.com with ESMTPS id as6sm9788494igc.8.2012.12.04.05.22.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 05:22:32 -0800 (PST)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
References: <1354624367-23776-1-git-send-email-mario@ossystems.com.br>
Date: Tue, 04 Dec 2012 08:09:37 -0500
In-Reply-To: <1354624367-23776-1-git-send-email-mario@ossystems.com.br> (Mario
	Domenech Goulart's message of "Tue, 4 Dec 2012 10:32:47 -0200")
Message-ID: <85r4n6c6b2.fsf@cl-t066-141cl.privatedns.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.2 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [meta-oe][danny][PATCHv2] xinput-calibrator: update to 2012 Aug 2nd's git snapshot
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
X-List-Received-Date: Tue, 04 Dec 2012 13:36:57 -0000
Content-Type: text/plain

Hi,

Please, ignore this patch.  I didn't notice the previous one (which has
a hardcoded path) has been applied already.  I'm gonna provide a patch
to specifically fix the hardcoded path.

Best wishes.
Mario

On Tue,  4 Dec 2012 10:32:47 -0200 Mario Domenech Goulart <mario@ossystems.com.br> wrote:

> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> ---
>  ...brator_pointercal.sh-specify-output-type-.patch |   56 --------------------
>  .../xinput-calibrator-autostart.desktop            |    8 ---
>  .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   33 ------------
>  .../xinput-calibrator/xinput-calibrator_git.bb     |   30 +++++++++++
>  4 files changed, 30 insertions(+), 97 deletions(-)
>  delete mode 100644
> meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
>  delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
>  delete mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
>  create mode 100644 meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
>
> diff --git
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
> b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
> deleted file mode 100644
> index 8e6d949..0000000
> ---
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From e73eb2c343006865ff3faf7777ab93ccfd1762d6 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Tue, 28 Feb 2012 14:09:08 +0100
> -Subject: [PATCH] xinput_calibrator_pointercal.sh: specify output type since 'auto' doesn't always pick 'xinput'
> -
> -Also deal with pointercal files that contain '# replace with valid machine specific pointercal.xinput'
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> -
> -Upstream-status: Submitted
> -
> - scripts/xinput_calibrator_pointercal.sh |   22 +++++++++++++++-------
> - 1 files changed, 15 insertions(+), 7 deletions(-)
> -
> -diff --git a/scripts/xinput_calibrator_pointercal.sh b/scripts/xinput_calibrator_pointercal.sh
> -index 579509c..fccb197 100755
> ---- a/scripts/xinput_calibrator_pointercal.sh
> -+++ b/scripts/xinput_calibrator_pointercal.sh
> -@@ -6,18 +6,26 @@
> - #
> - # original script: Martin Jansa <Martin.Jansa@gmail.com>, 2010-01-31
> - # updated by Tias Guns <tias@ulyssis.org>, 2010-02-15
> -+# updated by Koen Kooi <koen@dominion.thruhere.net>, 2012-02-28
> -+
> -+PATH="/usr/bin:$PATH"
> - 
> - BINARY="xinput_calibrator"
> - CALFILE="/etc/pointercal.xinput"
> - LOGFILE="/var/log/xinput_calibrator.pointercal.log"
> - 
> - if [ -e $CALFILE ] ; then
> --  echo "Using calibration data stored in $CALFILE"
> --  . $CALFILE
> --else
> --  CALDATA=`$BINARY -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
> --  if [ ! -z "$CALDATA" ] ; then
> --    echo $CALDATA > $CALFILE
> --    echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
> -+  if grep replace $CALFILE ; then
> -+    echo "Empty calibration file found, removing it"
> -+    rm $CALFILE
> -+  else
> -+    echo "Using calibration data stored in $CALFILE"
> -+    . $CALFILE && exit 0
> -   fi
> - fi
> -+
> -+CALDATA=`$BINARY --output-type xinput -v | tee $LOGFILE | grep '    xinput set' | sed 's/^    //g; s/$/;/g'`
> -+if [ ! -z "$CALDATA" ] ; then
> -+  echo $CALDATA > $CALFILE
> -+  echo "Calibration data stored in $CALFILE (log in $LOGFILE)"
> -+fi
> --- 
> -1.7.2.5
> -
> diff --git
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
> b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
> deleted file mode 100644
> index 3f3d613..0000000
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator/xinput-calibrator-autostart.desktop
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -[Desktop Entry]
> -Name=Calibrate Touchscreen
> -Exec=xinput_calibrator_once.sh
> -Terminal=false
> -Type=Application
> -Icon=xinput_calibrator
> -StartupNotify=true
> -Categories=System;Settings;
> diff --git
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> deleted file mode 100644
> index edc10bd..0000000
> --- a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -DESCRIPTION = "A generic touchscreen calibration program for X.Org"
> -HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> -LICENSE = "MIT-X"
> -LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
> -DEPENDS = "virtual/libx11 libxi"
> -
> -PR = "r8"
> -
> -inherit autotools
> -
> -SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz \
> -           file://0001-xinput_calibrator_pointercal.sh-specify-output-type-.patch \
> -           file://xinput-calibrator-autostart.desktop \
> -"
> -SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
> -SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
> -
> -S = "${WORKDIR}/xinput_calibrator-${PV}"
> -
> -# force native X11 ui as we don't have gtk+ in DEPENDS
> -EXTRA_OECONF += "--with-gui=x11"
> -
> -do_install_append() {
> -        install -d ${D}${bindir}
> -        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
> -
> -        install -d ${D}${sysconfdir}/xdg/autostart
> -        install -m 0644 ${WORKDIR}/xinput-calibrator-autostart.desktop ${D}${sysconfdir}/xdg/autostart
> -}
> -
> -FILES_${PN} += "${sysconfdir}/xdg/autostart"
> -RDEPENDS_${PN} = "xinput xterm"
> -RRECOMMENDS_${PN} = "pointercal-xinput"
> diff --git
> a/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> new file mode 100644
> index 0000000..07aad7f
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "A generic touchscreen calibration program for X.Org"
> +HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
> +LICENSE = "MIT-X"
> +LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f34021557898e4b5a"
> +DEPENDS = "virtual/libx11 libxi"
> +
> +PV = "0.7.5+git${SRCPV}"
> +
> +inherit autotools
> +
> +SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
> +SRC_URI = "git://github.com/tias/xinput_calibrator.git;protocol=git"
> +
> +S = "${WORKDIR}/git"
> +
> +# force native X11 ui as we don't have gtk+ in DEPENDS
> +EXTRA_OECONF += "--with-gui=x11"
> +
> +do_install_append() {
> +        install -d ${D}${bindir}
> +        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
> +
> +        install -d ${D}${sysconfdir}/xdg/autostart
> +        sed -i -e "s,^Exec=.*,Exec=${bindir}/xinput_calibrator_once.sh," scripts/xinput_calibrator.desktop
> +        install -m 0644 scripts/xinput_calibrator.desktop ${D}${sysconfdir}/xdg/autostart
> +}
> +
> +FILES_${PN} += "${sysconfdir}/xdg/autostart"
> +RDEPENDS_${PN} = "xinput xterm"
> +RRECOMMENDS_${PN} = "pointercal-xinput"


