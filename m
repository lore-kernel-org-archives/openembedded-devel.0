Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Of8wX-00062v-TJ for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 12:06:21 +0200
Received: from f053040133.adsl.alicedsl.de ([78.53.40.133]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Of8wE-0005qf-Od for openembedded-devel@lists.openembedded.org;
	Sat, 31 Jul 2010 10:05:06 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1280504555-3633-10-git-send-email-aalonso00@gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1280504555-3633-10-git-send-email-aalonso00@gmail.com>
Date: Sat, 31 Jul 2010 12:05:04 +0200
Message-ID: <1280570704.3721.18.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 10/10] xserver-kdrive-common: xilinx virtex5 support
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
X-List-Received-Date: Sat, 31 Jul 2010 10:06:37 -0000
X-Groupsio-MsgNum: 21673
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FXT0PqnEpWoRgJ1ZJbom"

--=-FXT0PqnEpWoRgJ1ZJbom
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Freitag, den 30.07.2010, 10:42 -0500 schrieb Adrian Alonso:
> * Add Xserver support for virtex5 board
> * Update module id for Xilinx platforms, xserver
>   arguments are setup at runtime by getting
>   module id info from /proc/cpuinfo

Please split those two changes up into separate patches.

This should be worded differently. Maybe, =C2=BBOn Xilinx platforms there i=
s
no line `Hardware`. Instead it is stored in the line starting with
`platform`.

> * Increase PR
>=20
> Signed-off-by: Adrian Alonso <aalonso00@gmail.com>

NAK.

> ---
>  .../xserver-kdrive-common/Xserver                  |    9 ++++++++-
>  .../xserver-kdrive-common_0.1.bb                   |    2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver =
b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> index 347b005..375b787 100644
> --- a/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> +++ b/recipes/xserver-kdrive-common/xserver-kdrive-common/Xserver
> @@ -34,7 +34,12 @@ module_id() {
>      # grep "Module ID" /proc/hal/assets | sed "s/.*://"
>      ## used to read from /proc/hal/model, but that is removed in 2.6
>      # echo ' iPAQ' `cat /proc/hal/model`
> -    awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } ' </proc/cpuinfo
> +    id=3D`awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } ' </proc/cpui=
nfo`
> +	if [ -n "$id" ]; then
> +		echo -n "${id}"
> +    else
> +        awk 'BEGIN { FS=3D": " } /platform/ { print $2 } ' </proc/cpuinf=
o
> +	fi
>  }

1. Please use spaces instead of tabulators.
2. It took me some time to figure out, why you use a variable here. I
think it would be nicer the following way.

	id=3D`awk 'BEGIN { FS=3D": " } /Hardware/ { print $2 } ' </proc/cpuinfo`
	if [ ! -n "$id" ]; then
		id=3D`awk 'BEGIN { FS=3D": " } /platform/ { print $2 } ' </proc/cpuinfo`
	echo -n "${id}"

Why are the curly brackets needed?

>  export USER=3Droot
> @@ -171,6 +176,8 @@ case `module_id` in
>                   if [ "$XSERVER" =3D "/usr/bin/Xorg" ];then
>                        ARGS=3D""
>                   fi;; #TODO: handle kdrive
> +		 "Xilinx Virtex"*)
> +				 ARGS=3D"$ARGS $PPM" ;;
>          *)
>                  # It is a device we do not know about, in which case we =
force
>                  # kdrive to use the current framebuffer geometry -- othe=
rwise

Please use spaces instead of tabulators.

[=E2=80=A6]


Thanks,

Paul


PS: Please remember to update the status of your patches in Patchwork
[1][2].


[1] http://patchwork.openembedded.org/
[2] http://wiki.openembedded.net/index.php/Patchwork (I need to update
this patch on how to use `pwclient` to update the states of the patches.

--=-FXT0PqnEpWoRgJ1ZJbom
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxT9VAACgkQPX1aK2wOHVh/eACgg4egzXG6t9Qy2YOlfSv+6Da5
sIAAnigY+FW+dYOy/YNWENRuhXNv5kJ+
=00u4
-----END PGP SIGNATURE-----

--=-FXT0PqnEpWoRgJ1ZJbom--
