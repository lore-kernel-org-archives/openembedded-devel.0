Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PbKc2-0008Hy-TI
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Jan 2011 23:16:47 +0100
Received: by mail-yx0-f175.google.com with SMTP id 5so7280261yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jan 2011 14:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=A2F3LhhwKpZay3RoHpIbszCiPvd3kT93CYx9PY70NBA=;
	b=BUJZWiV5LQgh/eFTxHlqSHUyaXeSf9VuprHpDxrcn+ytKwezRlYVw+0B5plvT71sGB
	Kgfvq/ni6crcvHrsXIM64X9ea0svxli+4iM5B/yo3Oed+gnCyyTpdyC8pZT7bVA1FREo
	e4b5eHtMVIx8YhvLFRuuc+BwAyi7C50TItRHw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=J9hm6wJkaBrBOGm4ysfXrLUh1r2FY68Ru1EVW9UrUfaSNxdvQ9w33atZRJ/iMGj65c
	941vfLde4NNFlWovMCSe2JOABKK4XvgTqrdrNmSC9EOUo1LGh2vqt1+wmSEE6LstThSJ
	lJIFjt7sLciEsHOB2Z/xd9Q4lJE6jWagLBwmM=
Received: by 10.90.104.20 with SMTP id b20mr3847173agc.193.1294438582450; Fri,
	07 Jan 2011 14:16:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 7 Jan 2011 14:16:02 -0800 (PST)
In-Reply-To: <1294436836-28074-2-git-send-email-eric@eukrea.com>
References: <1294436836-28074-1-git-send-email-eric@eukrea.com>
	<1294436836-28074-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jan 2011 14:16:02 -0800
Message-ID: <AANLkTimo=EFRJO_zdjcJG1O6hgm=KUunDg8YdXSDv52=@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] dosfstools: update to latest 3.0.11
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
X-List-Received-Date: Fri, 07 Jan 2011 22:16:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 7, 2011 at 1:47 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> 3.0.10 :
> bugfix in LFN handling, fixes false positives with bad filenames
> 3.0.11 :
> bugfix for s390x, better error message ifdevices can't be opened
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/dosfstools/dosfstools_3.0.11.bb | =C2=A0 28 +++++++++++++++=
+++++++++++++
> =C2=A0recipes/dosfstools/dosfstools_3.0.9.bb =C2=A0| =C2=A0 28 ----------=
------------------
> =C2=A02 files changed, 28 insertions(+), 28 deletions(-)
> =C2=A0create mode 100644 recipes/dosfstools/dosfstools_3.0.11.bb
> =C2=A0delete mode 100644 recipes/dosfstools/dosfstools_3.0.9.bb
>
> diff --git a/recipes/dosfstools/dosfstools_3.0.11.bb b/recipes/dosfstools=
/dosfstools_3.0.11.bb
> new file mode 100644
> index 0000000..1717157
> --- /dev/null
> +++ b/recipes/dosfstools/dosfstools_3.0.11.bb
> @@ -0,0 +1,28 @@
> +# dosfstools OE build file
> +# Copyright (C) 2004-2006, Advanced Micro Devices, Inc. =C2=A0All Rights=
 Reserved
> +# Released under the MIT license (see packages/COPYING)
> +
> +DESCRIPTION =3D "DOS FAT Filesystem Utilities"
> +
> +SECTION =3D "base"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPLv3"
> +
> +DEFAULT_PREFERENCE =3D "-1"
> +
> +PR =3D "r1"
> +
> +SRC_URI =3D "http://www.daniel-baumann.ch/software/dosfstools/dosfstools=
-${PV}.tar.bz2 \
> + =C2=A0 =C2=A0 =C2=A0 "
> +# output of getconf LFS_CFLAGS
> +#
> +CFLAGS_append =3D ' -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
> +CFLAGS_append_libc-uclibc =3D ' ${@base_contains("DISTRO_FEATURES", "lar=
gefile", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64", "", d)}'
> +
> +do_install () {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake "PREFIX=3D${D}" "SBINDIR=3D${D}${sbindi=
r}" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"MANDIR=
=3D${D}${mandir}/man8" install
> +}
> +
> +SRC_URI[md5sum] =3D "8d2211d5bd813164e20740e7c852aa06"
> +SRC_URI[sha256sum] =3D "94b27a0f53f4aa86b0c049eb26df7a681ec6c31bc352c57d=
3ac53881bcfcd9a8"
> diff --git a/recipes/dosfstools/dosfstools_3.0.9.bb b/recipes/dosfstools/=
dosfstools_3.0.9.bb
> deleted file mode 100644
> index 676c751..0000000
> --- a/recipes/dosfstools/dosfstools_3.0.9.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -# dosfstools OE build file
> -# Copyright (C) 2004-2006, Advanced Micro Devices, Inc. =C2=A0All Rights=
 Reserved
> -# Released under the MIT license (see packages/COPYING)
> -
> -DESCRIPTION =3D "DOS FAT Filesystem Utilities"
> -
> -SECTION =3D "base"
> -PRIORITY =3D "optional"
> -LICENSE =3D "GPLv3"
> -
> -DEFAULT_PREFERENCE =3D "-1"
> -
> -PR =3D "r1"
> -
> -SRC_URI =3D "http://www.daniel-baumann.ch/software/dosfstools/dosfstools=
-${PV}.tar.bz2 \
> - =C2=A0 =C2=A0 =C2=A0 "
> -# output of getconf LFS_CFLAGS
> -#
> -CFLAGS_append =3D ' -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
> -CFLAGS_append_libc-uclibc =3D ' ${@base_contains("DISTRO_FEATURES", "lar=
gefile", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64", "", d)}'
> -
> -do_install () {
> - =C2=A0 =C2=A0 =C2=A0 oe_runmake "PREFIX=3D${D}" "SBINDIR=3D${D}${sbindi=
r}" \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"MANDIR=
=3D${D}${mandir}/man8" install
> -}
> -
> -SRC_URI[md5sum] =3D "7f159ec44d3b9c502904bab0236050e4"
> -SRC_URI[sha256sum] =3D "3f63676faeac507e909d84c8920ddb6597da1eb688577c2f=
c9c756b821d0458f"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


