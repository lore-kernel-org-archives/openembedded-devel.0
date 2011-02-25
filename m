Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PszDP-0003Jo-Ac
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 16:04:19 +0100
Received: by iyb26 with SMTP id 26so969180iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 07:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=kzjb5seK5SjePIi6KhzNjO9avaUYam/w6B2S23aFR+M=;
	b=hEB/KL21dNw4vQpM1sAZzz01U66dnxSD67JxAJ/uOOS1o+tyJcDkm0BqNQSXHwZRQl
	qpnTRNWzAriKTXjraXEdIm53HcFgFrqVk3UBCnvCSzKUhZQvyEoU+c/ZMecszxz5Urpk
	45P/hqYF9vig0UDqzOj9qUp0ITARhsUyNND3w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g9MykfSBvl8Xv+6XVR4nWpvhUtjMFqsOFHR79OWzXzLP5UY47iUUqdsYfa2DLNHHEj
	DxzkSW0C50f0UtIVIErRmunOJIllBSEonXLBG0qqiG233G6fxc8pTgyGBrXgsI5fJohW
	i+GNIMqxvLCCloS/7wAm6tgI3sDhFSOCIAxF8=
MIME-Version: 1.0
Received: by 10.42.218.5 with SMTP id ho5mr845398icb.403.1298646176235; Fri,
	25 Feb 2011 07:02:56 -0800 (PST)
Received: by 10.231.11.201 with HTTP; Fri, 25 Feb 2011 07:02:56 -0800 (PST)
In-Reply-To: <1298645128-32394-1-git-send-email-otavio@ossystems.com.br>
References: <1298645128-32394-1-git-send-email-otavio@ossystems.com.br>
Date: Fri, 25 Feb 2011 16:02:56 +0100
Message-ID: <AANLkTinzw2OKZ0RTGEOgNf_i=X7qZhTj0R2epjc+FqTU@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux: update 2.6.37 to 2.6.37.2
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
X-List-Received-Date: Fri, 25 Feb 2011 15:04:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Commit message should say update from 2.6.37.1, not 2.6.37
otherwise ok.

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2011/2/25 Otavio Salvador <otavio@ossystems.com.br>:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =A0recipes/linux/linux_2.6.37.bb | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/linux/linux_2.6.37.bb b/recipes/linux/linux_2.6.37.b=
b
> index e11af81..1cd40f4 100644
> --- a/recipes/linux/linux_2.6.37.bb
> +++ b/recipes/linux/linux_2.6.37.bb
> @@ -1,6 +1,6 @@
> =A0require linux.inc
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0# Mark archs/machines that this kernel supports
> =A0DEFAULT_PREFERENCE =3D "-1"
> @@ -20,7 +20,7 @@ DEFAULT_PREFERENCE_visstrim_m10 =3D "1"
> =A0# DEFAULT_PREFERENCE_om-gta01 =3D "1"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar=
.bz2;name=3Dkernel \
> - =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${P=
V}.1.bz2;apply=3Dyes;name=3Dstablepatch \
> + =A0 =A0 =A0 =A0 =A0 ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${P=
V}.2.bz2;apply=3Dyes;name=3Dstablepatch \
> =A0 =A0 =A0 =A0 =A0 =A0file://defconfig "
>
> =A0SRC_URI_append_om-gta02 =3D " \
> @@ -34,5 +34,5 @@ SRC_URI_append_om-gta01 =3D " \
>
> =A0SRC_URI[kernel.md5sum] =3D "c8ee37b4fdccdb651e0603d35350b434"
> =A0SRC_URI[kernel.sha256sum] =3D "edbf091805414739cf57a3bbfeba9e87f5e74f9=
7e38f04d12060e9e0c71e383a"
> -SRC_URI[stablepatch.md5sum] =3D "7693d1d32ed39346cc988e0f027e5890"
> -SRC_URI[stablepatch.sha256sum] =3D "c33bfa59828a9ff6916993ec008967a8c1d7=
1a18b743ee15f4280e773ef4baaf"
> +SRC_URI[stablepatch.md5sum] =3D "bb5798f2a2a5af13219d1a250c4dad11"
> +SRC_URI[stablepatch.sha256sum] =3D "3d65f2fb5f0018e8dafda4abe68d947d2ab5=
e21c386062cb0d6e011244a16aef"
> --
> 1.7.2.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


