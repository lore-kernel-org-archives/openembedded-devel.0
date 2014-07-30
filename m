Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB0DA70246
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 14:11:36 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2410632wiv.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 07:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CLq9d4ailL8oy/jwbTGJbutw0K0BevCCmLwZbwBf8XA=;
	b=mU6RfcQXJ6J3fJkXXzP1a58GDGJTTSbYRfiUZzGJRH8m2+owtPsaJoxV3uwluUNpnz
	yYgnxALEW4kpsrbilxVvKKbl6EtCbdoDYqUnCMGGLCjU8bZgl7bw9Hg0gdSJw0ZxZNbm
	AyA/FF9EYjR01c5nFcKGitlVFJH049FipI5tpa1vexxbUByoPDgFwGeFm4bR5qgw5+uN
	YmaCthWqJlbavGWeZsxxn93mypUCn0F+X0yzUdhhSZuhpDmqmaPlAcRCowtWKYcPRuPl
	Q4UhOiszkQMHVajFjtb82erISWDFzsM8u8uxiLfpr8kZ9y0VJATTnwhAUig6O2uz3pfz
	rBQw==
X-Received: by 10.180.85.162 with SMTP id i2mr6435901wiz.53.1406729495999;
	Wed, 30 Jul 2014 07:11:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	de6sm5834456wjc.16.2014.07.30.07.11.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jul 2014 07:11:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Jul 2014 16:11:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140730141156.GQ16445@jama>
References: <1406725476-23048-1-git-send-email-dv@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <1406725476-23048-1-git-send-email-dv@pseudoterminal.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] libvpx: upgrade to version 1.3.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 14:11:40 -0000
X-Groupsio-MsgNum: 51327
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Er1qpsOqk0l6oMce"
Content-Disposition: inline

--Er1qpsOqk0l6oMce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 03:04:36PM +0200, Carlos Rafael Giani wrote:
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta-oe/recipes-multimedia/webm/libvpx.inc         |  2 +
>  .../0001-configure.sh-quote-local-variables.patch  | 40 +++++++++++++
>  .../webm/libvpx/CVE-2010-4203.patch                | 69 ----------------=
------
>  .../libvpx/do-not-hardcode-softfp-float-api.patch  | 28 ---------
>  meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb    | 19 ------
>  meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb    | 18 ++++++
>  6 files changed, 60 insertions(+), 116 deletions(-)
>  create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/0001-configure=
=2Esh-quote-local-variables.patch
>  delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.=
patch
>  delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcod=
e-softfp-float-api.patch
>  delete mode 100644 meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
>  create mode 100644 meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx.inc b/meta-oe/recipes=
-multimedia/webm/libvpx.inc
> index 4d8ba9d..963ac0b 100644
> --- a/meta-oe/recipes-multimedia/webm/libvpx.inc
> +++ b/meta-oe/recipes-multimedia/webm/libvpx.inc
> @@ -25,6 +25,8 @@ CONFIGUREOPTS =3D " \
>      --enable-vp8 \
>      --enable-libs \
>      --disable-install-docs \
> +    --disable-static \
> +    --enable-shared \
>  "
>  do_configure() {
>      ${S}/configure ${CONFIGUREOPTS}
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quo=
te-local-variables.patch b/meta-oe/recipes-multimedia/webm/libvpx/0001-conf=
igure.sh-quote-local-variables.patch
> new file mode 100644
> index 0000000..bf94b2d
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/webm/libvpx/0001-configure.sh-quote-loca=
l-variables.patch
> @@ -0,0 +1,40 @@
> +From f45fe1668401d72c2937a52385b492216715c0f9 Mon Sep 17 00:00:00 2001
> +From: James Zern <jzern@google.com>
> +Date: Thu, 6 Mar 2014 15:58:37 -0800
> +Subject: [PATCH] configure.sh: quote local variables
> +
> +fixes issue #711
> +
> +specifying a multiword CC, e.g., CC=3D'gcc -m32', would cause the failure
> +under dash
> +
> +reported in
> +https://bugs.gentoo.org/show_bug.cgi?id=3D498136
> +
> +patch by floppymaster at gmail dot com
> +
> +Upstream-Status: Backport [f45fe1668401d72c2937a52385b492216715c0f9]
> +
> +Change-Id: I2ba246f765646161538622739961ec0f6c2d8c2d
> +---
> + build/make/configure.sh | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/build/make/configure.sh b/build/make/configure.sh
> +index 449d1b9..43f8e77 100755
> +--- a/build/make/configure.sh
> ++++ b/build/make/configure.sh
> +@@ -405,8 +405,8 @@ true
> + }
> +=20
> + write_common_target_config_mk() {
> +-    local CC=3D${CC}
> +-    local CXX=3D${CXX}
> ++    local CC=3D"${CC}"
> ++    local CXX=3D"${CXX}"
> +     enabled ccache && CC=3D"ccache ${CC}"
> +     enabled ccache && CXX=3D"ccache ${CXX}"
> +     print_webm_license $1 "##" ""
> +--=20
> +1.8.3.2
> +
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch b=
/meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch
> deleted file mode 100644
> index 37f5108..0000000
> --- a/meta-oe/recipes-multimedia/webm/libvpx/CVE-2010-4203.patch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From: John Koleszar <jkoleszar@google.com>
> -Date: Thu, 4 Nov 2010 20:59:26 +0000 (-0400)
> -Subject: fix integer promotion bug in partition size check
> -X-Git-Url: https://review.webmproject.org/gitweb?p=3Dlibvpx.git;a=3Dcomm=
itdiff_plain;h=3D9fb80f7170ec48e23c3c7b477149eeb37081c699
> -
> -fix integer promotion bug in partition size check
> -
> -The check '(user_data_end - partition < partition_size)' must be
> -evaluated as a signed comparison, but because partition_size was
> -unsigned, the LHS was promoted to unsigned, causing an incorrect
> -result on 32-bit. Instead, check the upper and lower bounds of
> -the segment separately.
> -
> -Change-Id: I6266aba7fd7de084268712a3d2a81424ead7aa06
> ----
> -
> -diff --git a/vp8/decoder/decodframe.c b/vp8/decoder/decodframe.c
> -index 2d81d61..f5e49a1 100644
> ---- a/vp8/decoder/decodframe.c
> -+++ b/vp8/decoder/decodframe.c
> -@@ -462,7 +462,8 @@ static void setup_token_decoder(VP8D_COMP *pbi,
> -             partition_size =3D user_data_end - partition;
> -         }
> -=20
> --        if (user_data_end - partition < partition_size)
> -+        if (partition + partition_size > user_data_end
> -+            || partition + partition_size < partition)
> -             vpx_internal_error(&pc->error, VPX_CODEC_CORRUPT_FRAME,
> -                                "Truncated packet or corrupt partition "
> -                                "%d length", i + 1);
> -@@ -580,7 +581,8 @@ int vp8_decode_frame(VP8D_COMP *pbi)
> -         (data[0] | (data[1] << 8) | (data[2] << 16)) >> 5;
> -     data +=3D 3;
> -=20
> --    if (data_end - data < first_partition_length_in_bytes)
> -+    if (data + first_partition_length_in_bytes > data_end
> -+        || data + first_partition_length_in_bytes < data)
> -         vpx_internal_error(&pc->error, VPX_CODEC_CORRUPT_FRAME,
> -                            "Truncated packet or corrupt partition 0 len=
gth");
> -     vp8_setup_version(pc);
> -diff --git a/vp8/vp8_dx_iface.c b/vp8/vp8_dx_iface.c
> -index e7e5356..f0adf5b 100644
> ---- a/vp8/vp8_dx_iface.c
> -+++ b/vp8/vp8_dx_iface.c
> -@@ -253,8 +253,11 @@ static vpx_codec_err_t vp8_peek_si(const uint8_t   =
      *data,
> -                                    unsigned int           data_sz,
> -                                    vpx_codec_stream_info_t *si)
> - {
> --
> -     vpx_codec_err_t res =3D VPX_CODEC_OK;
> -+
> -+    if(data + data_sz <=3D data)
> -+        res =3D VPX_CODEC_INVALID_PARAM;
> -+    else
> -     {
> -         /* Parse uncompresssed part of key frame header.
> -          * 3 bytes:- including version, frame type and an offset
> -@@ -331,7 +334,10 @@ static vpx_codec_err_t vp8_decode(vpx_codec_alg_pri=
v_t  *ctx,
> -=20
> -     ctx->img_avail =3D 0;
> -=20
> --    /* Determine the stream parameters */
> -+    /* Determine the stream parameters. Note that we rely on peek_si to
> -+     * validate that we have a buffer that does not wrap around the top
> -+     * of the heap.
> -+     */
> -     if (!ctx->si.h)
> -         res =3D ctx->base.iface->dec.peek_si(data, data_sz, &ctx->si);
> -=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softf=
p-float-api.patch b/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-=
softfp-float-api.patch
> deleted file mode 100644
> index d871694..0000000
> --- a/meta-oe/recipes-multimedia/webm/libvpx/do-not-hardcode-softfp-float=
-api.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: Inappopriate [upstream has it done in other way]
> -
> -Problem is solved upstream but we have quite old version so backporting =
patches
> -is waste of time.
> -
> ----
> - build/make/configure.sh |    4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> ---- libvpx-v0.9.5.orig/build/make/configure.sh
> -+++ libvpx-v0.9.5/build/make/configure.sh
> -@@ -659,12 +659,12 @@ process_common_toolchain() {
> -         if enabled iwmmxt || enabled iwmmxt2
> -             then
> -                 check_add_asflags -mcpu=3D${tgt_isa}
> -             elif enabled armv7
> -             then
> --                check_add_cflags -march=3Darmv7-a -mcpu=3Dcortex-a8 -mf=
pu=3Dneon -mfloat-abi=3Dsoftfp  #-ftree-vectorize
> --        check_add_asflags -mcpu=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3D=
softfp  #-march=3Darmv7-a
> -+                check_add_cflags -march=3Darmv7-a -mcpu=3Dcortex-a8 -mf=
pu=3Dneon   #-ftree-vectorize
> -+        check_add_asflags -mcpu=3Dcortex-a8 -mfpu=3Dneon   #-march=3Dar=
mv7-a
> -             else
> -                 check_add_cflags -march=3D${tgt_isa}
> -                 check_add_asflags -march=3D${tgt_isa}
> -             fi
> -=20
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb b/meta-oe/re=
cipes-multimedia/webm/libvpx_0.9.5.bb
> deleted file mode 100644
> index 597d0e1..0000000
> --- a/meta-oe/recipes-multimedia/webm/libvpx_0.9.5.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require libvpx.inc
> -
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6e8dee932c26f2dab503abf70c96d=
8bb"
> -
> -PR =3D "${INC_PR}.0"
> -
> -SRC_URI +=3D "file://libvpx-configure-support-blank-prefix.patch \
> -            file://do-not-hardcode-softfp-float-api.patch \
> -            file://CVE-2010-4203.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "4bf2f2c76700202c1fe9201fcb0680e3"
> -SRC_URI[sha256sum] =3D "2e93968afcded113a7e218de047feecf6659a089058803a9=
e40fb687de5f9bfa"
> -
> -CONFIGUREOPTS +=3D " \
> -    --prefix=3D${prefix} \
> -    --libdir=3D${libdir} \
> -"
> -
> diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb b/meta-oe/re=
cipes-multimedia/webm/libvpx_1.3.0.bb
> new file mode 100644
> index 0000000..87358bc
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/webm/libvpx_1.3.0.bb
> @@ -0,0 +1,18 @@
> +require libvpx.inc
> +
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd5b04755015be901744a78cc30d39=
0d4"
> +
> +PR =3D "${INC_PR}.0"

You can drop this.

> +
> +SRC_URI +=3D "file://libvpx-configure-support-blank-prefix.patch \
> +            file://0001-configure.sh-quote-local-variables.patch \
> +"
> +
> +SRC_URI[md5sum] =3D "14783a148872f2d08629ff7c694eb31f"
> +SRC_URI[sha256sum] =3D "d3dcc8d84af51c6c382b214397c62402e37a799e8ebcda6f=
4217aef0010451a9"
> +
> +CONFIGUREOPTS +=3D " \
> +    --prefix=3D${prefix} \
> +    --libdir=3D${libdir} \
> +"

Why not add these (and LIC_FILES_CHKSUM) in .inc file or maybe it's time to=
 fold .inc file into
=2Ebb as we don't expect to have multiple libvpx versions.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Er1qpsOqk0l6oMce
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPY/SwACgkQN1Ujt2V2gBxVIwCguuDnEh7HRmU/x859SHJcWFbF
Cr4AnjSIiPo4VfRDxqBEG0Luyq7B16Ft
=LOy4
-----END PGP SIGNATURE-----

--Er1qpsOqk0l6oMce--
