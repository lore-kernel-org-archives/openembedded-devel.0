Return-Path: <leo@missingno.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BF8C79F82
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 12:05:26 +0000 (UTC)
Subject: Re: [meta-oe][PATCH] image_types_sparse: create symlinks for generated sparse images
To: openembedded-devel@lists.openembedded.org
From: "Leo Sartre" <leo@missingno.tech>
X-Originating-Location: FR (80.13.212.87)
X-Originating-Platform: Linux Firefox 154
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 08 Sep 2026 05:05:16 -0700
References: <20260902161946.13068-1-emailaddress.ashish@gmail.com>
In-Reply-To: <20260902161946.13068-1-emailaddress.ashish@gmail.com>
Message-ID: <256345.1788869116116111066@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="xbjdyjMSTyvKSupVq9PP"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 12:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129861

--xbjdyjMSTyvKSupVq9PP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Sep 2, 2026 at 06:20 PM, Ashish Mishra wrote:

>=20
> Ensure that symbolic links (${IMAGE_LINK_NAME}) are created for both
> sparse images, matching standard Yocto image deployment behavior
>=20
> Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
> ---
> meta-oe/classes/image_types_sparse.bbclass | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/classes/image_types_sparse.bbclass
> b/meta-oe/classes/image_types_sparse.bbclass
> index 5c1d92bd18..2ee4aa1159 100644
> --- a/meta-oe/classes/image_types_sparse.bbclass
> +++ b/meta-oe/classes/image_types_sparse.bbclass
> @@ -16,11 +16,13 @@ CONVERSION_CMD:sparse =3D " \
> case '${type}' in \
> ext*) \
> bbnote 'Running e2fsprogs-derived ext2simg_android..' ; \
> - ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' |=
|
> bberror 'ext2simg_android failed' \
> + ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' |=
|
> bberror 'ext2simg_android failed' ;\
> + ln -sf '${IMAGE_NAME}.${type}.simg'
> '${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${type}.simg'; \

Wouldn't it be simpler to use same .sparse extension name for this image to=
o, that way the IMAGE_LINK_NAME symlink is created by oe-core image.bbclass=
.
It is what I've done in this change: https://lists.openembedded.org/g/opene=
mbedded-devel/message/129709 (sorry did not saw this one before submitting =
mine).

>=20
> ;; \
> *) \
> bbnote 'Generating sparse image for non-ext filesystem...'; \
> img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.sparse'
> ${SPARSE_BLOCK_SIZE}; \
> + ln -sf '${IMAGE_NAME}.${type}.sparse'
> '${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${type}.sparse'; \

I think this is already covered by the oe-core image.bbclass: https://githu=
b.com/openembedded/openembedded-core/blob/master/meta/classes-recipe/image.=
bbclass#L493
So this line is not needed.
>=20
> ;; \
> esac; \
> if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD}" =3D "1" ]; then \
> --
> 2.43.0

Regards

--xbjdyjMSTyvKSupVq9PP
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>&nbsp;</div>
<div>On Wed, Sep 2, 2026 at 06:20 PM, Ashish Mishra wrote:</div>
<div>
<blockquote>Ensure that symbolic links (${IMAGE_LINK_NAME}) are created for=
 both<br />sparse images, matching standard Yocto image deployment behavior=
<br /><br />Signed-off-by: AshishKumar Mishra &lt;emailaddress.ashish@gmail=
.com&gt;<br />---<br />meta-oe/classes/image_types_sparse.bbclass | 4 +++-<=
br />1 file changed, 3 insertions(+), 1 deletion(-)<br /><br />diff --git a=
/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_s=
parse.bbclass<br />index 5c1d92bd18..2ee4aa1159 100644<br />--- a/meta-oe/c=
lasses/image_types_sparse.bbclass<br />+++ b/meta-oe/classes/image_types_sp=
arse.bbclass<br />@@ -16,11 +16,13 @@ CONVERSION_CMD:sparse =3D " \<br />ca=
se '${type}' in \<br />ext*) \<br />bbnote 'Running e2fsprogs-derived ext2s=
img_android..' ; \<br />- ext2simg_android '${IMAGE_NAME}.${type}' '${IMAGE=
_NAME}.${type}.simg' || bberror 'ext2simg_android failed' \<br />+ ext2simg=
_android '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.${type}.simg' || bberror 'e=
xt2simg_android failed' ;\<br />+ ln -sf '${IMAGE_NAME}.${type}.simg' '${IM=
GDEPLOYDIR}/${IMAGE_LINK_NAME}.${type}.simg'; \</blockquote>
</div>
<div>Wouldn't it be simpler to use same .sparse extension name for this ima=
ge too, that way the IMAGE_LINK_NAME symlink is created by oe-core image.bb=
class.</div>
<div>It is what I've done in this change: <a href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/message/129709" target=3D"_blank" rel=3D"noop=
ener">https://lists.openembedded.org/g/openembedded-devel/message/129709</a=
> (sorry did not saw this one before submitting mine).</div>
<div>
<blockquote>;; \<br />*) \<br />bbnote 'Generating sparse image for non-ext=
 filesystem...'; \<br />img2simg -s '${IMAGE_NAME}.${type}' '${IMAGE_NAME}.=
${type}.sparse' ${SPARSE_BLOCK_SIZE}; \<br />+ ln -sf '${IMAGE_NAME}.${type=
}.sparse' '${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${type}.sparse'; \</blockquot=
e>
I think this is already covered by the oe-core image.bbclass: <a href=3D"ht=
tps://github.com/openembedded/openembedded-core/blob/master/meta/classes-re=
cipe/image.bbclass#L493" target=3D"_blank" rel=3D"noopener">https://github.=
com/openembedded/openembedded-core/blob/master/meta/classes-recipe/image.bb=
class#L493</a></div>
<div>So this line is not needed.&nbsp;
<blockquote>;; \<br />esac; \<br />if [ "${DELETE_RAWIMAGE_AFTER_SPARSE_CMD=
}" =3D "1" ]; then \<br />-- <br />2.43.0</blockquote>
</div>
<div>Regards</div>

--xbjdyjMSTyvKSupVq9PP--

