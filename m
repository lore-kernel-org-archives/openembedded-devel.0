Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5OpW-0000ko-6a
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:51:02 +0200
Received: by fxm19 with SMTP id 19so2469494fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=A9AYsH6EznjYqqvCs9oiqgoINgIrlY4WzSn6ig2JLsM=;
	b=tnst1xhKPJZAOWRE8pPx/FHwkdyJw+l65Vr9s7o3uk/2WTvPnBbGx7DTC628dyaV5i
	Gbaw9UvWQja/As+RAhlzMPr/0CINKLWChA8AhLQhWs4i/8Y1DIsK4gFAjuLrTi0I6xTz
	Pbvz8Z5y1V2xSRBckcW8QYTcw+OQvfjxibI5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=Wi/+8MyUX5UUvPJ7N75MTU+pidhXsp2EYYLfqIjbBsVWeBc3Fhl/qf6eZWUnvhqtLY
	PKdFIXZ7sNwlYMfCgnA2TbiwsyhY+NNG15P1nl51qbeEJWi3k/1xqIrE8v3A/FTS2Jn8
	SrzDqxBpYH+DKRBitUwUVEhLUVis4Q5JdGZUQ=
Received: by 10.223.14.137 with SMTP id g9mr1958974faa.8.1301604535075; Thu,
	31 Mar 2011 13:48:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:48:25 -0700 (PDT)
In-Reply-To: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:48:25 -0700
Message-ID: <AANLkTinpsase2JeCR14LJ0VtMQ_f4eEtDB5E8ZNeLzPz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/6] Add support for the Technologic Systems TS7500 ARM SBCs
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
X-List-Received-Date: Thu, 31 Mar 2011 20:51:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2011 at 7:07 AM, UDel V2G Team <v2g.udel@gmail.com> wrote:
> * Includes conf/machine/ts75xx.conf and conf/machine/include/tune-fa526.i=
nc
> =C2=A0files needed for building OE packages w/ EABI and *NO* thumb suppor=
t
>
> Signed-off-by: UDel V2G Team <v2g.udel@gmail.com>
> ---
> =C2=A0conf/machine/include/tune-fa526.inc | =C2=A0 22 +++++++++++++++++++=
+++
> =C2=A0conf/machine/ts75xx.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 22 ++++++++++++++++++++++
> =C2=A02 files changed, 44 insertions(+), 0 deletions(-)
> =C2=A0create mode 100755 conf/machine/include/tune-fa526.inc
> =C2=A0create mode 100755 conf/machine/ts75xx.conf
>
> diff --git a/conf/machine/include/tune-fa526.inc b/conf/machine/include/t=
une-fa526.inc
> new file mode 100755
> index 0000000..a5c5008
> --- /dev/null
> +++ b/conf/machine/include/tune-fa526.inc
> @@ -0,0 +1,22 @@
> +# This tune file is for the Faraday FA526 core is used in
> +# ARM processors like the Semi STR8132/ Cavium CNS2132, which is
> +# in the Technologic Systems TS-7500 board in addition to some
> +# NAS boxes out there.
> +#
> +# This core basically resembles a ARM920T but has NO thumb interworking =
support
> +# which makes it not fully EABI compliant
> +#
> +# Hence, we need to diable all thumb instructions here
> +# Also be sure to disable all thumb flags/features/includes in the distr=
os
> +
> +FEED_ARCH =3D "armv4"
> +BASE_PACKAGE_ARCH =3D "armv4"
> +
> +# Ideally we want the following CFLAGS for our architecture.
> +# Angstorm will automtically add the thumb flags, so don't include them =
here
> +# TARGET_CC_ARCH +=3D "-march=3Darmv4 -mno-thumb-interwork -mno-thumb -m=
float-abi=3Dsoft"

-mfloat-abi=3Dsoft is probably not needed since thats the toolchain default=
.

> +TARGET_CC_ARCH +=3D "-march=3Darmv4 -mfloat-abi=3Dsoft"
> +
> +PACKAGE_EXTRA_ARCHS +=3D "armv4"
> +LDFLAGS +=3D "-Xlinker --fix-v4bx -Xassembler --fix-v4bx"

those should also be default when toolchain is build for armv4
where do u need to specify that in LDFLAGS

> +THUMB_INTERWORK =3D "no"
> diff --git a/conf/machine/ts75xx.conf b/conf/machine/ts75xx.conf
> new file mode 100755
> index 0000000..d76548d
> --- /dev/null
> +++ b/conf/machine/ts75xx.conf
> @@ -0,0 +1,22 @@
> +#@TYPE: Machine
> +#@Name: Technologic Systems TS-75xx SBC
> +#@DESCRIPTION: Machine configuration for Technologic Systems TS-75xx SBC
> +
> +TARGET_ARCH =3D "arm"
> +
> +MACHINE_FEATURES =3D "kernel26 ext2 usbhost"
> +
> +# This requires cavium fa526 patch set to function
> +# See the linux-ts75xx directory for the patches
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux-ts75xx"
> +PREFERRED_VERSION_linux =3D "2.6.35"
> +
> +SERIAL_CONSOLE =3D "115200 ttyS0"
> +USE_VT =3D "0"
> +
> +# Uses the traditional TS-7500 bootloader process
> +# See the ts75xx-initrd-image.bb recipe for building
> +# an initrd script that only uses EABI userspace utilities
> +CMDLINE =3D "root=3D/dev/ram0 init=3D/linuxrc console=3D/dev/ttyS0,11520=
0 lpj=3D958464"
> +
> +require conf/machine/include/tune-fa526.inc
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


