Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 83B9E78911
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 15:04:55 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id o82-v6so830108vko.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2018 08:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Gf6kTQkOh91aA2ULaouFovfwBnIyfMBZnVNl+uR3Z2M=;
	b=rUFnLJalJLqoj4+RcsOeX0u7sUfluCu5w0euL5oT2NlqQlOc7ZjK4rI7rS3YVSekwZ
	W/ZTJwi0EtJYMLBf6R6/HVyaWCB+eEwfPE6AxHv70nBh8kQMQJ394MSDMDPYRabnkahk
	Kp7HrgDIJn2Vnq3XXCeng5pWsmCK7TUS0WznkCkkxXV08L0f1Jzk2/j6xAEAVn/Aho/u
	Og3NXV9GihcQdvG8JEJw5ekkkwvWKKk2JwLZermaja/f6MHekyyGDYDcdBao4nVQShit
	4vk0ywGIq5Ird6+1Pse+QJZioBmJvz7tKpawHHzIwIxbObi5bzkLgU227N7K5yD//DxM
	V1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Gf6kTQkOh91aA2ULaouFovfwBnIyfMBZnVNl+uR3Z2M=;
	b=PFVKT8ewRqydHDEjf9Vmh2bcV18So0p1F7OuGqYIkm0LLhxYlTbpx4jKoMN+UHl8by
	7ttjXr4//VsyWlo4GLAsy9sXr191St3lYrONsauGu0/2CvQGP2I2QmYUb8K2ua2uo7bl
	lEFET+tlp9eVsu674NZ0gXyh2jangWUiPi7sPr6CJoNGnk4dcb4A75Mhx66HQH/zE9Vu
	/6/mu2O5QAkFKSYj/BmA8S/z/DI8OschPc+xOgoMhWESe5Ii3nEBLxCkPR+TAC73tWKZ
	lljqJEh+2HD+colXZ6KOxOVDQfCtg58mdjfak6b2CTVTWT8PXg7PJg/5h2dejWzARQPF
	vZTg==
X-Gm-Message-State: AOUpUlEKOrejpAkP7dkq0DxAR5Ns3x/rA7MXrDN02Xm8jRuoH3mFvLHm
	AqfSD/glDJ3Ni1YW4enTug7aufQjcEnyYI70vQE=
X-Google-Smtp-Source: AAOMgpeYzisq7vWzqKW0k9yexR31/LXWcByPaPI1m9ItGzenj4YM+nvzBi+n0gM5IVt94CX1f3S208v0fSLMBr/b60A=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr3542939vkh.4.1531926295218; 
	Wed, 18 Jul 2018 08:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20180717015840.131005-1-mingli.yu@windriver.com>
	<a140d60a-53db-1a9a-d0b1-cbb4729379df@gmail.com>
	<5B4EFA3C.6010202@windriver.com>
In-Reply-To: <5B4EFA3C.6010202@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jul 2018 08:04:28 -0700
Message-ID: <CAMKF1soBJYHX3X6jWhGSFS-VuwtS6HyomR0BDCjPByirtX67Sg@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] cryptsetup: Upgrade to 2.0.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 15:04:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 18, 2018 at 1:34 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
>
>
> On 2018=E5=B9=B407=E6=9C=8817=E6=97=A5 10:37, Khem Raj wrote:
> >
> >
> > On 7/16/18 6:58 PM, mingli.yu@windriver.com wrote:
> >> From: Mingli Yu <mingli.yu@windriver.com>
> >>
> >> * Update the homepage to https://gitlab.com/cryptsetup/cryptsetup
> >> * Add json-c to DEPENDS as cryptsetup requires the
> >>    json-c library for JSON data processing since cryptsetup
> >>    2.0.0 per "The LUKS2 format and features" part of
> >>
> >> https://mirrors.edge.kernel.org/pub/linux/utils/cryptsetup/v2.0/v2.0.0=
-ReleaseNotes
> >>
> >> * Add file /usr/lib/tmpfiles.d/cryptsetup.conf to
> >>    FILES_${PN} when systemd enabled in DISTRO_FEATURES
> >>
> >
> > I am seeing a new failure for
> > meta-oe/recipes-extended/libblockdev/libblockdev_2.16.bb
> >
> >
> > | ../../../git/src/plugins/crypto.c: In function 'bd_crypto_tc_open':
> > | ../../../git/src/plugins/crypto.c:973:12: error: missing initializer
> > for field 'veracrypt_pim' of 'struct crypt_params_tcrypt'
> > [-Werror=3Dmissing-field-initializers]
> > |      struct crypt_params_tcrypt params =3D
> > {NULL,0,NULL,0,NULL,NULL,NULL,0,0};
> > |             ^~~~~~~~~~~~~~~~~~~
> > | In file included from ../../../git/src/plugins/crypto.c:22:
> > |
> > /mnt/a/oe/build/tmp/work/cortexa7t2hf-neon-vfpv4-bec-linux-gnueabi/libb=
lockdev/2.16-r0/recipe-sysroot/usr/include/libcryptsetup.h:436:11:
>
> Hi Khem,
>
> The root cause for this failure is some API changed after cryptsetup
> upgrade to 2.0.3 and libblockdev depends on cryptsetup and we should
> also upgrade libblockdev accordingly.
>
> And I notice there is already a patch with subject "[oe]
> [PATCH][meta-oe] libblockdev: 2.16 -> 2.18" has already upgraded the
> libblockdev to 2.18.
>
> After upgrade to 2.18, the build failure for libblockdev which your saw
> should be gone, so I think there is no need to resend V3 for cryptsetup.
> What do you think?

Thats fine. I will pickup that series on top of
this and see how it goes.

>
> Thanks,
>
> > note: 'veracrypt_pim' declared here
> > |   uint32_t veracrypt_pim;    /**< VeraCrypt Personal Iteration
> > Multiplier */
> > |            ^~~~~~~~~~~~~
> >
> >
> >
> >> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ---
> >>   .../{cryptsetup_1.7.4.bb =3D> cryptsetup_2.0.3.bb}     | 12 +++++++-=
----
> >>   1 file changed, 7 insertions(+), 5 deletions(-)
> >>   rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_1.7.4.bb =3D>
> >> cryptsetup_2.0.3.bb} (72%)
> >>
> >> diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
> >> b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
> >> similarity index 72%
> >> rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
> >> rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
> >> index c13b764f7..df85add6a 100644
> >> --- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_1.7.4.bb
> >> +++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.0.3.bb
> >> @@ -4,16 +4,16 @@ device-mapper mappings. These include plain dm-crypt
> >> volumes and \
> >>   LUKS volumes. The difference is that LUKS uses a metadata header \
> >>   and can hence offer more features than plain dm-crypt. On the other =
\
> >>   hand, the header is visible and vulnerable to damage."
> >> -HOMEPAGE =3D "http://code.google.com/p/cryptsetup/"
> >> +HOMEPAGE =3D "https://gitlab.com/cryptsetup/cryptsetup"
> >>   SECTION =3D "console"
> >>   LICENSE =3D "GPL-2.0-with-OpenSSL-exception"
> >>   LIC_FILES_CHKSUM =3D
> >> "file://COPYING;md5=3D32107dd283b1dfeb66c9b3e6be312326"
> >> -DEPENDS =3D "util-linux libdevmapper popt libgcrypt"
> >> +DEPENDS =3D "util-linux libdevmapper popt libgcrypt json-c"
> >> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v1.7/${BP}.tar.xz=
"
> >> -SRC_URI[md5sum] =3D "058ed35c5b776032c2a036838f9e22a7"
> >> -SRC_URI[sha256sum] =3D
> >> "7ccf893ef79a38fb92d61f03c17b964982119f5319cdaa85a1335b8558cca016"
> >> +SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v2.0/${BP}.tar.xz=
"
> >> +SRC_URI[md5sum] =3D "ea1c722f8d4c4e36427628b679b1f819"
> >> +SRC_URI[sha256sum] =3D
> >> "4d6cca04c1f5ff4a68d045d190efb2623087eda0274ded92f92a4b6911e501d4"
> >>   inherit autotools gettext pkgconfig
> >> @@ -33,4 +33,6 @@ RRECOMMENDS_${PN} =3D "kernel-module-aes-generic \
> >>   EXTRA_OECONF =3D "--enable-static"
> >> +FILES_${PN} +=3D
> >> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/=
tmpfiles.d/cryptsetup.conf',
> >> '', d)}"
> >> +
> >>   BBCLASSEXTEND =3D "native nativesdk"
> >>
> >

