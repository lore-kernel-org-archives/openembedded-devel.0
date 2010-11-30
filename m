Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNZw6-0001V0-Am
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Dec 2010 00:48:39 +0100
Received: by gyd12 with SMTP id 12so3150623gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 15:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=+8mIB3xQnDrkp7VnTqqs0jwIEadPDY4x25YEqHPyI0Y=;
	b=DwWqFW3QHqUDD9vGv0M0nmVDQm23t48oprXlU73ub/FiDP7ygjTsulau0wJXHJ8KJr
	Nz/9PHt70tgIiVcxg2ykziMW02npDV+fQZB9jLYPs19Lg597KLoHl8IMcmTNJcNcyMdu
	mekCXik3o60PTAozM7CX2agJ40O2zQOSWFQnU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Q56Qdha7+AK5dZWy+X5H7OYoVr1JzhbWiTeaBWbB4fqUYFDY0XUpi/CuVbKUMlyqr8
	0raDVxqR5Fn89nj0Ver4dvTV3QGU+sskERPcvAF80pgXJiKri2WtlXaMpVmcFpDMEKwN
	ry3/BIu1Lofb8Am+7rY2nO+NGOIe8dJO7QXpE=
Received: by 10.91.10.21 with SMTP id n21mr528054agi.75.1291160835323; Tue, 30
	Nov 2010 15:47:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 15:46:55 -0800 (PST)
In-Reply-To: <1291119423-4541-1-git-send-email-Martin.Jansa@gmail.com>
References: <4CF4E21A.90009@opendreambox.org>
	<1291119423-4541-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 15:46:55 -0800
Message-ID: <AANLkTikv3tfvSSOGzPMiWTiiNOzyJmCYJZQBzfYx8aQh@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] sane-srcdates.inc: remove from all distro configs as well as file itself
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
X-List-Received-Date: Tue, 30 Nov 2010 23:48:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2010 at 4:17 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * it's empty for > 6 months
> * entries were moved to recipes
> * SRCREV instead of SRCDATE is preferred anyways http://git.openembedded.=
org/cgit.cgi/bitbake/commit/?id=3D8da9744fcdf856abebcfbe9e3bc1b8cf07bc317b
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

looks ok to me

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0conf/distro/angstrom-2008.1.conf =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A01 -
> =C2=A0conf/distro/angstrom-2010.x.conf =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=
=A01 -
> =C2=A0conf/distro/celinux-test.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A03 ---
> =C2=A0conf/distro/foonas.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A01 -
> =C2=A0conf/distro/include/slugos.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A01 -
> =C2=A0conf/distro/jlime-2010.1.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A01 -
> =C2=A0conf/distro/kaeilos-2010.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A01 -
> =C2=A0conf/distro/kaeilos.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 -
> =C2=A0conf/distro/mamona.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A01 -
> =C2=A0conf/distro/metano.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A01 -
> =C2=A0conf/distro/micro.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A0 =C2=A01 -
> =C2=A0conf/distro/minimal.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 -
> =C2=A0conf/distro/openprotium.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 =C2=A01 -
> =C2=A0conf/distro/oplinux-uclibc.conf =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=
=A01 -
> =C2=A0conf/distro/oplinux.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A01 -
> =C2=A0conf/distro/shr.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A01 -
> =C2=A016 files changed, 0 insertions(+), 18 deletions(-)
> =C2=A0delete mode 100644 conf/distro/include/sane-srcdates.inc
>
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008=
.1.conf
> index 1fd5ab6..3fa8e3e 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -20,7 +20,6 @@ DISTRO_PR =3D ".6"
>
> =C2=A0OLDEST_KERNEL ?=3D "2.6.16"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/angstrom-2008-preferred-versions.inc
> =C2=A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010=
.x.conf
> index 1cc9060..2d15670 100644
> --- a/conf/distro/angstrom-2010.x.conf
> +++ b/conf/distro/angstrom-2010.x.conf
> @@ -25,7 +25,6 @@ DISTRO_PR =3D ".9"
>
> =C2=A0OLDEST_KERNEL ?=3D "2.6.16"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/angstrom-2010-preferred-versions.inc
> =C2=A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> diff --git a/conf/distro/celinux-test.conf b/conf/distro/celinux-test.con=
f
> index fbc96e1..250fe16 100644
> --- a/conf/distro/celinux-test.conf
> +++ b/conf/distro/celinux-test.conf
> @@ -25,9 +25,6 @@ DISTRO_VERSION =3D "${DATE}"
> =C2=A0DISTRO_TYPE =3D "debug"
> =C2=A0# DISTRO_TYPE =3D "release"
>
> -# fixed SRCDATE for many packages
> -require conf/distro/include/sane-srcdates.inc
> -
> =C2=A0# fix it to one date but allow to override in local.conf if needed
> =C2=A0SRCDATE ?=3D "20060927"
>
> diff --git a/conf/distro/foonas.conf b/conf/distro/foonas.conf
> index 57d73a0..3d530a642 100644
> --- a/conf/distro/foonas.conf
> +++ b/conf/distro/foonas.conf
> @@ -41,7 +41,6 @@ IMAGE_PREPROCESS_COMMAND +=3D "rm -f ${IMAGE_ROOTFS}/us=
r/lib/ipkg/lists/*"
> =C2=A0IMAGE_POSTPROCESS_COMMAND +=3D "${MACHINE}_pack_image;"
> =C2=A0IMAGE_DEVICE_TABLE =3D "${@bb.which(bb.data.getVar('BBPATH', d, 1),=
 'files/device_table-slugos.txt')}"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0PREFERRED_VERSION_openlink =3D "svn"
> =C2=A0PREFERRED_VERSION_dtc =3D "20070216"
> =C2=A0PREFERRED_VERSION_dtc-native =3D "20070216"
> diff --git a/conf/distro/include/sane-srcdates.inc b/conf/distro/include/=
sane-srcdates.inc
> deleted file mode 100644
> index e69de29..0000000
> diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.=
inc
> index 4c509c6..eaa50bc 100644
> --- a/conf/distro/include/slugos.inc
> +++ b/conf/distro/include/slugos.inc
> @@ -187,5 +187,4 @@ PREFERRED_PROVIDER_bluez-utils =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "bluez4"
> =C2=A0# Include any package preferred versions and srcrevs:
>
> =C2=A0require conf/distro/include/preferred-slugos-versions.inc
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> diff --git a/conf/distro/jlime-2010.1.conf b/conf/distro/jlime-2010.1.con=
f
> index 9741026..f01b949 100644
> --- a/conf/distro/jlime-2010.1.conf
> +++ b/conf/distro/jlime-2010.1.conf
> @@ -88,7 +88,6 @@ require conf/distro/include/arm-thumb.inc
> =C2=A0# Bootstrap & Init
> =C2=A0#
> =C2=A0PREFERRED_PROVIDER_task-bootstrap =3D "task-bootstrap"
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
>
> =C2=A0#
> diff --git a/conf/distro/kaeilos-2010.conf b/conf/distro/kaeilos-2010.con=
f
> index 618d47c..a9743dd 100644
> --- a/conf/distro/kaeilos-2010.conf
> +++ b/conf/distro/kaeilos-2010.conf
> @@ -18,7 +18,6 @@ DISTRO_PR =3D ".2"
>
> =C2=A0OLDEST_KERNEL ?=3D "2.6.28"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/kaeilos-2009-preferred-versions.inc
> =C2=A0require conf/distro/include/preferred-e-versions.inc
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index 09a48e2..fdec1e9 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -18,7 +18,6 @@ DISTRO_PR =3D ".6"
>
> =C2=A0OLDEST_KERNEL ?=3D "2.6.16"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/kaeilos-2009-preferred-versions.inc
> =C2=A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> diff --git a/conf/distro/mamona.conf b/conf/distro/mamona.conf
> index 31d6c36..a9df496 100644
> --- a/conf/distro/mamona.conf
> +++ b/conf/distro/mamona.conf
> @@ -11,7 +11,6 @@ MAINTAINER =3D "Mamona Team <mamona-devel@garage.maemo.=
org>"
>
> =C2=A0TARGET_VENDOR =3D "-mamona"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
>
> =C2=A0INHERIT +=3D "angstrom-mirrors mamona-mirrors"
> diff --git a/conf/distro/metano.conf b/conf/distro/metano.conf
> index 9bab8d9..d9fb1e9 100644
> --- a/conf/distro/metano.conf
> +++ b/conf/distro/metano.conf
> @@ -88,7 +88,6 @@ require conf/distro/include/arm-thumb.inc
> =C2=A0###################################################################=
##########
> =C2=A0# PREFERRED VERSIONS
> =C2=A0###################################################################=
##########
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/preferred-e-versions.inc
> =C2=A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> diff --git a/conf/distro/micro.conf b/conf/distro/micro.conf
> index b3f099a..f3b9846 100644
> --- a/conf/distro/micro.conf
> +++ b/conf/distro/micro.conf
> @@ -77,7 +77,6 @@ MACHINE_OVERRIDES +=3D "${MACHINE_CLASS}"
> =C2=A0###################################################################=
##########
> =C2=A0# PREFERRED VERSIONS
> =C2=A0###################################################################=
##########
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/preferred-xorg-versions-X11R7.5.inc
>
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index afa8ac6..5c7efbd 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -96,7 +96,6 @@ require conf/distro/include/arm-thumb.inc
> =C2=A0###################################################################=
##########
> =C2=A0# PREFERRED VERSIONS
> =C2=A0###################################################################=
##########
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/preferred-e-versions.inc
> =C2=A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> diff --git a/conf/distro/openprotium.conf b/conf/distro/openprotium.conf
> index 4e0f472..749b832 100644
> --- a/conf/distro/openprotium.conf
> +++ b/conf/distro/openprotium.conf
> @@ -76,5 +76,4 @@ PREFERRED_PROVIDER_virtual/db =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D "db"
> =C2=A0PREFERRED_PROVIDER_virtual/db-native =C2=A0 ?=3D "db-native"
> =C2=A0PREFERRED_PROVIDER_gconf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ?=3D "gconf"
>
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc=
.conf
> index 480602b..432851d 100644
> --- a/conf/distro/oplinux-uclibc.conf
> +++ b/conf/distro/oplinux-uclibc.conf
> @@ -15,7 +15,6 @@
> =C2=A0#------------------------------------------------------------------=
-----------
>
> =C2=A0require conf/distro/include/oplinux.inc
> -require conf/distro/include/sane-srcdates.inc
>
> =C2=A0#
> =C2=A0# Header
> diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
> index c8c7cfd..c20d885 100644
> --- a/conf/distro/oplinux.conf
> +++ b/conf/distro/oplinux.conf
> @@ -18,7 +18,6 @@
> =C2=A0#------------------------------------------------------------------=
-----------
>
> =C2=A0require conf/distro/include/oplinux.inc
> -require conf/distro/include/sane-srcdates.inc
>
>
> =C2=A0#
> diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
> index 04ee301..140a6d3 100644
> --- a/conf/distro/shr.conf
> +++ b/conf/distro/shr.conf
> @@ -181,7 +181,6 @@ PREFERRED_PROVIDER_frameworkd-config =3D "frameworkd-=
config-shr"
> =C2=A0###################################################################=
##########
> =C2=A0# PREFERRED VERSIONS
> =C2=A0###################################################################=
##########
> -require conf/distro/include/sane-srcdates.inc
> =C2=A0require conf/distro/include/sane-srcrevs.inc
> =C2=A0require conf/distro/include/preferred-e-versions.inc
> =C2=A0require conf/distro/include/preferred-opie-versions-1.2.4.inc
> --
> 1.7.3.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


