Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RjJSs-0001mM-IL
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jan 2012 00:44:50 +0100
Received: by pbcc11 with SMTP id c11so1041470pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jan 2012 15:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=cim6Ql4rHpwSUVyPoFtOMu+SWBhKNMRDgZlwDZp+JUM=;
	b=jaRQV1FqoHrVJ1obW9gp7t9hdPb5yasI4+wKihUomzfT4H0+3hN1AH2kfhWm1lQy+o
	0nl8UDTCla0n7MK0+ykjhIz6WYgE5UUCF9Sz/o/jrWR+Hhr6XIUvI4PqE50DdhtsTdtn
	nkppkhA+bzMM1f98P8vMdkVospRGL5Dl3hhak=
MIME-Version: 1.0
Received: by 10.68.116.199 with SMTP id jy7mr11782881pbb.18.1325893044382;
	Fri, 06 Jan 2012 15:37:24 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Fri, 6 Jan 2012 15:37:24 -0800 (PST)
In-Reply-To: <70e261fc83be99734830dd00f5b1f8022086c55f.1325806595.git.andrea.adami@gmail.com>
References: <cover.1325806595.git.andrea.adami@gmail.com>
	<70e261fc83be99734830dd00f5b1f8022086c55f.1325806595.git.andrea.adami@gmail.com>
Date: Sat, 7 Jan 2012 00:37:24 +0100
Message-ID: <CAAQYJAti6hScnfrjdQC0Bj=p82vOmMTo=PwzvPeUkFF-Ts=kHg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] x11-common: remove extraneous BSP customizations
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
X-List-Received-Date: Fri, 06 Jan 2012 23:44:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 7, 2012 at 12:32 AM, Andrea Adami <andrea.adami@gmail.com> wrot=
e:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> =A0.../x11-common/x11-common/etc/X11/Xserver =A0 =A0 =A0 =A0 =A0| =A0 24 =
--------------------
> =A01 files changed, 0 insertions(+), 24 deletions(-)
>
> diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver =
b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
> index 57923e6..cea733e 100644
> --- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
> +++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
> @@ -18,14 +18,6 @@ fi
>
> =A0. /etc/profile
>
> -module_id() {
> - =A0 =A0## used to read from assets, but sometimes assets is corrupted
> - =A0 =A0# grep "Module ID" /proc/hal/assets | sed "s/.*://"
> - =A0 =A0## used to read from /proc/hal/model, but that is removed in 2.6
> - =A0 =A0# echo ' iPAQ' `cat /proc/hal/model`
> - =A0 =A0awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } ' </proc/cpuinf=
o
> -}
> -
> =A0ARGS=3D" -br -pn"
>
> =A0if [ "$XSERVER" !=3D "/usr/bin/Xorg" ]; then
> @@ -44,22 +36,6 @@ if [ "$XSERVER" !=3D "/usr/bin/Xorg" ]; then
> =A0 =A0 =A0 =A0 =A0 ARGS=3D"$ARGS -mouse tslib"
> =A0 =A0 =A0 =A0 fi
>
> - =A0 =A0 =A0 =A0# start off server in conventional location.
> - =A0 =A0 =A0 =A0case `module_id` in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Generic OMAP1510/1610/1710")
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARGS=3D"$ARGS -mouse /de=
v/input/event0" ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Compulab CM-x270")
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#modprobe mbxfb
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0#ARGS=3D"$ARGS -fb /dev/=
fb1"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Nokia N800")
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARGS=3D"$ARGS -mouse tsl=
ib" ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Nokia 770")
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARGS=3D"$ARGS -mouse tsl=
ib" ;;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0;;
> - =A0 =A0 =A0 =A0esac
> -
> =A0 =A0 =A0 =A0 ARGS=3D"$ARGS -screen ${DISPLAY_WIDTH_PIXELS}x${DISPLAY_H=
EIGHT_PIXELS}@${DISPLAY_ORIENTATION}x${DISPLAY_BPP}"
>
> =A0 =A0 =A0 =A0 if [ ! -z "$DISPLAY_DPI" ]; then
> --
> 1.7.3.4
>

please ignore

Andrea


