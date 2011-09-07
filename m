Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R1FP6-0003xi-06
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 12:30:48 +0200
Received: by pzk2 with SMTP id 2so13867666pzk.34
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Sep 2011 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=6NqTQPwqcFkENA+l1SLRanvw/7HsCw94YizWxCl++IU=;
	b=phEgBouETmICwNffef/wydtWVlpm29Ir2zeL2UU/LQkSsD2WM+N2utCzbdQWK9mdgW
	6SyNHlZ04QJ+YwFg0EmBZD7LBtz1GIfIYrWljK8Czm2DX7/p8hR54+a/MFMd6B3YAEjr
	sVsEwm9A9AVtsSvEpsWguJP3+iQUOvfU24VzE=
MIME-Version: 1.0
Received: by 10.68.51.137 with SMTP id k9mr837922pbo.164.1315391144845; Wed,
	07 Sep 2011 03:25:44 -0700 (PDT)
Received: by 10.142.231.2 with HTTP; Wed, 7 Sep 2011 03:25:44 -0700 (PDT)
In-Reply-To: <1315387357-21355-1-git-send-email-eric@eukrea.com>
References: <1315349980-6611-1-git-send-email-eric@eukrea.com>
	<1315387357-21355-1-git-send-email-eric@eukrea.com>
Date: Wed, 7 Sep 2011 12:25:44 +0200
Message-ID: <CAAQYJAtpPps4s7Y5FYEmOYCUX3ynwY+_Hn=37KD2xbDD2k3hrg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe v2] tzdata & tzcode: update to 2011i
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
X-List-Received-Date: Wed, 07 Sep 2011 10:30:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/9/7 Eric B=E9nard <eric@eukrea.com>

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> ---
>  ...code-native_2011g.bb =3D> tzcode-native_2011i.bb} |   11 +++++------
>  .../tzdata/{tzdata_2011g.bb =3D> tzdata_2011i.bb}    |    4 ++--
>  2 files changed, 7 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-extended/tzcode/{tzcode-native_2011g.bb =3D>
> tzcode-native_2011i.bb} (56%)
>  rename meta-oe/recipes-extended/tzdata/{tzdata_2011g.bb =3D>
> tzdata_2011i.bb} (72%)
>
> diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bbb/meta=
-oe/recipes-extended/tzcode/
> tzcode-native_2011i.bb
> similarity index 56%
> rename from meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> rename to meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
> index 651d1dd..358a313 100644
> --- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> +++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
> @@ -9,12 +9,11 @@ LIC_FILES_CHKSUM =3D
> "file://README;md5=3D3ae8198f82258417ce29066d3b034035"
>  # Also, tzdata (and it is needed to build tzcode) version can differ fro=
m
>  # tzcode version, thus this variable
>
> -TZDATA_PV =3D "2011h"
> +TZDATA_PV =3D "2011i"
>
>  PR =3D "${INC_PR}.1"
>
> -SRC_URI[tzcode-2011g.md5sum] =3D "ecb564279b28c5b184421c525d997d6c"
> -SRC_URI[tzcode-2011g.sha256sum] =3D
> "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
> -SRC_URI[tzdata-2011h.md5sum] =3D "546d27b6c1e5e1097bd512651815017f"
> -SRC_URI[tzdata-2011h.sha256sum] =3D
> "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
> -
> +SRC_URI[tzcode-2011i.md5sum] =3D "cf7f4335b7c8682899fa2814e711c1b2"
> +SRC_URI[tzcode-2011i.sha256sum] =3D
> "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
> +SRC_URI[tzdata-2011i.md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
> +SRC_URI[tzdata-2011i.sha256sum] =3D
> "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
> diff --git a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bbb/meta-oe/rec=
ipes-extended/tzdata/
> tzdata_2011i.bb
> similarity index 72%
> rename from meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> rename to meta-oe/recipes-extended/tzdata/tzdata_2011i.bb
> index 6863b5a..783b38e 100644
> --- a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> +++ b/meta-oe/recipes-extended/tzdata/tzdata_2011i.bb
> @@ -8,5 +8,5 @@ LIC_FILES_CHKSUM =3D
> "file://asia;beginline=3D2;endline=3D3;md5=3D06468c0e84ef4d4c97045a
>  # just bump it to the latest available version, removing the old one
>
>  PR =3D "${INC_PR}.0"
> -SRC_URI[md5sum] =3D "a068c27e7e426fdb12ab0c88506df20d"
> -SRC_URI[sha256sum] =3D
> "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
> +SRC_URI[md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
> +SRC_URI[sha256sum] =3D
> "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f059d8104964c81ffa"
> --
> 1.7.6
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


tzdata and tzcode 2011i are already in oe-core.
Why do we keep another version here? Maybe because the different do_install=
?

Regards

Andrea

