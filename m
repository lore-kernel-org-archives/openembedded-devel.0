Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5OjY-0007A9-GZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:44:48 +0200
Received: by fxm19 with SMTP id 19so2463902fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=I6QAl/r3u5nxeD+4/cJS3mh7GMjE3Bm2LoebyT0nbm4=;
	b=jgYqdlf1EdPqnZ4XH2no1fQ40oIT1shXfGjvvmYrY2E1EfpLNJWhTIGNppNOx4/lt4
	GnoV3ATnJhc2v2lnyRsgEy579RczlLOv6Sum5npNKR+B1hTrrZU0VuWsHSBXLpJSkZmE
	toJb5XzpoYy0wbU9aV2Btp/lcH/EOm76xa5wM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=G64VcQnTEXGvT3PWX0/Csf+5wNiaJlvUqtYyul6CedJjIiIhZEr7nIgcl0xIZXEJca
	n9rjKQXfGJ+M2tfWCzhxxiS316Ttsjjxt5xtyUEPUnfIP2zVlPXF1Emx7HYsXBk2ELGB
	y0R1yq/A9ts7dBA5dFYpTG/kUJr/BdKOwOXak=
Received: by 10.223.14.137 with SMTP id g9mr1953290faa.8.1301604168075; Thu,
	31 Mar 2011 13:42:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:42:18 -0700 (PDT)
In-Reply-To: <1301382028-10848-1-git-send-email-sledz@dresearch-fe.de>
References: <1301382028-10848-1-git-send-email-sledz@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:42:18 -0700
Message-ID: <AANLkTik7agTmi3OCKQnYQEf5oeq_RDLBnjVHCo9MgYNJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] linux-2.6.24: allow building kernel with newer GNU make
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
X-List-Received-Date: Thu, 31 Mar 2011 20:44:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2011 at 12:00 AM, Steffen Sledz <sledz@dresearch-fe.de> wro=
te:
> GNU make >=3D 3.82 does not allow mixed implicit and normal rules
>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>

Looks good.


Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0.../linux-libc-headers-2.6.24/make-3.82.patch =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 29 ++++++++++++++++++++
> =C2=A0.../linux-libc-headers_2.6.24.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
> =C2=A0recipes/linux/linux-2.6.24/make-3.82.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 29 ++++++++++++++++++++
> =C2=A0recipes/linux/linux_2.6.24.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 +-
> =C2=A04 files changed, 62 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 recipes/linux-libc-headers/linux-libc-headers-2.=
6.24/make-3.82.patch
> =C2=A0create mode 100644 recipes/linux/linux-2.6.24/make-3.82.patch
>
> diff --git a/recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.=
82.patch b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.82.p=
atch
> new file mode 100644
> index 0000000..99896d9
> --- /dev/null
> +++ b/recipes/linux-libc-headers/linux-libc-headers-2.6.24/make-3.82.patc=
h
> @@ -0,0 +1,29 @@
> +diff -Nurd linux-2.6.24.orig//Makefile linux-2.6.24/Makefile
> +--- linux-2.6.24.orig//Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A02011-03-29 07=
:56:05.122449521 +0200
> ++++ linux-2.6.24/Makefile =C2=A0 =C2=A0 =C2=A02011-03-29 07:57:48.726768=
621 +0200
> +@@ -431,7 +431,11 @@
> + include $(srctree)/arch/$(SRCARCH)/Makefile
> + export KBUILD_DEFCONFIG
> +
> +-config %config: scripts_basic outputmakefile FORCE
> ++config: scripts_basic outputmakefile FORCE
> ++ =C2=A0 =C2=A0 =C2=A0$(Q)mkdir -p include/linux include/config
> ++ =C2=A0 =C2=A0 =C2=A0$(Q)$(MAKE) $(build)=3Dscripts/kconfig $@
> ++
> ++%config: scripts_basic outputmakefile FORCE
> + =C2=A0 =C2=A0 =C2=A0 $(Q)mkdir -p include/linux include/config
> + =C2=A0 =C2=A0 =C2=A0 $(Q)$(MAKE) $(build)=3Dscripts/kconfig $@
> +
> +@@ -1500,7 +1504,11 @@
> + =C2=A0 =C2=A0 =C2=A0 $(Q)$(MAKE) $(build)=3D$(build-dir) $(target-dir)$=
(notdir $@)
> +
> + # Modules
> +-/ %/: prepare scripts FORCE
> ++/: prepare scripts FORCE
> ++ =C2=A0 =C2=A0 =C2=A0$(cmd_crmodverdir)
> ++ =C2=A0 =C2=A0 =C2=A0$(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES=
),1) \
> ++ =C2=A0 =C2=A0 =C2=A0$(build)=3D$(build-dir)
> ++%/: prepare scripts FORCE
> + =C2=A0 =C2=A0 =C2=A0 $(cmd_crmodverdir)
> + =C2=A0 =C2=A0 =C2=A0 $(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES=
),1) \
> + =C2=A0 =C2=A0 =C2=A0 $(build)=3D$(build-dir)
> diff --git a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb b/re=
cipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> index e95299b..9c683a7 100644
> --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb
> @@ -2,11 +2,12 @@ require linux-libc-headers.inc
>
> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
> =C2=A0DEPENDS +=3D "unifdef-native"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.=
tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://procinfo.h \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://export_falloc_h.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-3.82.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://unifdef.patch"
>
> =C2=A0S =3D "${WORKDIR}/linux-${PV}"
> diff --git a/recipes/linux/linux-2.6.24/make-3.82.patch b/recipes/linux/l=
inux-2.6.24/make-3.82.patch
> new file mode 100644
> index 0000000..99896d9
> --- /dev/null
> +++ b/recipes/linux/linux-2.6.24/make-3.82.patch
> @@ -0,0 +1,29 @@
> +diff -Nurd linux-2.6.24.orig//Makefile linux-2.6.24/Makefile
> +--- linux-2.6.24.orig//Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A02011-03-29 07=
:56:05.122449521 +0200
> ++++ linux-2.6.24/Makefile =C2=A0 =C2=A0 =C2=A02011-03-29 07:57:48.726768=
621 +0200
> +@@ -431,7 +431,11 @@
> + include $(srctree)/arch/$(SRCARCH)/Makefile
> + export KBUILD_DEFCONFIG
> +
> +-config %config: scripts_basic outputmakefile FORCE
> ++config: scripts_basic outputmakefile FORCE
> ++ =C2=A0 =C2=A0 =C2=A0$(Q)mkdir -p include/linux include/config
> ++ =C2=A0 =C2=A0 =C2=A0$(Q)$(MAKE) $(build)=3Dscripts/kconfig $@
> ++
> ++%config: scripts_basic outputmakefile FORCE
> + =C2=A0 =C2=A0 =C2=A0 $(Q)mkdir -p include/linux include/config
> + =C2=A0 =C2=A0 =C2=A0 $(Q)$(MAKE) $(build)=3Dscripts/kconfig $@
> +
> +@@ -1500,7 +1504,11 @@
> + =C2=A0 =C2=A0 =C2=A0 $(Q)$(MAKE) $(build)=3D$(build-dir) $(target-dir)$=
(notdir $@)
> +
> + # Modules
> +-/ %/: prepare scripts FORCE
> ++/: prepare scripts FORCE
> ++ =C2=A0 =C2=A0 =C2=A0$(cmd_crmodverdir)
> ++ =C2=A0 =C2=A0 =C2=A0$(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES=
),1) \
> ++ =C2=A0 =C2=A0 =C2=A0$(build)=3D$(build-dir)
> ++%/: prepare scripts FORCE
> + =C2=A0 =C2=A0 =C2=A0 $(cmd_crmodverdir)
> + =C2=A0 =C2=A0 =C2=A0 $(Q)$(MAKE) KBUILD_MODULES=3D$(if $(CONFIG_MODULES=
),1) \
> + =C2=A0 =C2=A0 =C2=A0 $(build)=3D$(build-dir)
> diff --git a/recipes/linux/linux_2.6.24.bb b/recipes/linux/linux_2.6.24.b=
b
> index 5c05593..5cc686a 100644
> --- a/recipes/linux/linux_2.6.24.bb
> +++ b/recipes/linux/linux_2.6.24.bb
> @@ -11,7 +11,7 @@ DEFAULT_PREFERENCE_hipox =3D "1"
> =C2=A0DEFAULT_PREFERENCE_cs-e9302 =3D "1"
> =C2=A0DEFAULT_PREFERENCE_smartq5 =3D "1"
>
> -PR =3D "r36"
> +PR =3D "r37"
>
> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.24=
.tar.bz2;name=3Dkernel \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${KERNELORG_MIRROR}/pub/linux/ke=
rnel/v2.6/patch-${PV}.7.bz2;apply=3Dyes;name=3Dstablepatch \
> @@ -19,6 +19,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/=
linux-2.6.24.tar.bz2;name=3Dk
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ubifs-v2.6.24.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ubifs-v2.6.24-silent-get-=
sb.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cfi-amic.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-3.82.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://defconfig"
>
> =C2=A0# Moved away temporarely until committed properly (work in progress=
).
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


