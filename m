Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5Oic-00073t-Es
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:43:50 +0200
Received: by fxm19 with SMTP id 19so2463034fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=JQe+RwpxKQCTJAXHYc0mYjfLyxhMmEyPDZesgv5HxyI=;
	b=U1VFzwtgWd3Uw6cu5u682fWbwt/gy37uXj4FFwo85T2FU+2G5NdRBMf4IfVmtiRq12
	RfAyolsuwNtUkTHUkFYWBnYxKSs1wXcB9zlRu1d5Ema/m4qvDsZ9MR86APeYTO5KFVCv
	7RIfTl+Esz3UbARGrP6Vep441rdHXKlD4O174=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=ZF+ePv+HlKCLfZvaAR3cEgp1qMXu4m77sp2ohpDdMupux/v4fOe2Ori1LNAzh5x4oE
	ULpkC1OKV2Rf7fHcb/RmaOag1ftALnpAr2OfpTuvnS8kpGpp/M0Gpv+O/eH071oltSdI
	jD568couerwkhxk4PKx4dJ2c26l2ogmgoarGE=
Received: by 10.223.54.148 with SMTP id q20mr404553fag.84.1301604110065; Thu,
	31 Mar 2011 13:41:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:41:20 -0700 (PDT)
In-Reply-To: <62c38635dfccecaaf1b4e09b408f50470d0a4e6d.1301562689.git.Martin.Jansa@gmail.com>
References: <cover.1301562689.git.Martin.Jansa@gmail.com>
	<62c38635dfccecaaf1b4e09b408f50470d0a4e6d.1301562689.git.Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:41:20 -0700
Message-ID: <AANLkTi=rAFG1VACT9t8+zwp6G1wnmMigNoMSAOTNzezi@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 1/2] python-cython: import from meta-shr
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
X-List-Received-Date: Thu, 31 Mar 2011 20:43:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 31, 2011 at 2:13 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Looks ok

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0.../recipes-devtools/python/python-cython_0.13.bb =C2=A0| =C2=A0 19=
 +++++++++++++++++++
> =C2=A01 files changed, 19 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-devtools/python/python-cython_0.=
13.bb
>
> diff --git a/meta-oe/recipes-devtools/python/python-cython_0.13.bb b/meta=
-oe/recipes-devtools/python/python-cython_0.13.bb
> new file mode 100644
> index 0000000..f705756
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/python/python-cython_0.13.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Cython is a language specially designed for writing Pyt=
hon extension modules. \
> +It's designed to bridge the gap between the nice, high-level, easy-to-us=
e world of Python \
> +and the messy, low-level world of C."
> +SECTION =3D "devel/python"
> +PRIORITY =3D "optional"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De23fadd6ceef8c618fc1c6519=
1d846fa"
> +SRCNAME =3D "Cython"
> +BBCLASSEXTEND =3D "native"
> +NATIVE_INSTALL_WORKS =3D "1"
> +DEPENDS =3D "python"
> +
> +SRC_URI =3D "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz"
> +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> +
> +SRC_URI[md5sum] =3D "ed2ec5e0df60a6b8e500bedf93bb1feb"
> +SRC_URI[sha256sum] =3D "a30d5e26c82ec65d65703c7cf312161a21b30339addc1a42=
d3b2965dea254ca6"
> +
> +inherit distutils
> --
> 1.7.4.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


