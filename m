Return-Path: <john.ripple@keysight.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1D7C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:30:48 +0000 (UTC)
Subject: [meta-oe][PATCH] fitimage.bbclass: Add missing punctuation
To: openembedded-devel@lists.openembedded.org
From: "John Ripple" <john.ripple@keysight.com>
X-Originating-Location: Colorado Springs, Colorado, US (192.25.7.195)
X-Originating-Platform: Windows Chrome 133
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 12 Mar 2025 13:30:41 -0700
Message-ID: <NNse.1741811441373566415.sSfB@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YPKafo59JOJQlyIvpqE9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 20:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115942

--YPKafo59JOJQlyIvpqE9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The functions related to signing the fitimage had missing quotations and
newlines. Without this punctuation, the signing class would fail to
generate a signed fitimage.
To test this change just create a fitImage using this class and set
FITIMAGE_SIGN to 1. The resulting fitImage its file should have one
property per line with quotes around the property values.
Signed-off-by: John Ripple <john.ripple@keysight.com>
---
meta-oe/classes/fitimage.bbclass | 8 ++++----
1 file changed, 4 insertions(+), 4 deletions(-)
diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitimage.bb=
class
index fef8974187..03c01a1ed3 100644
--- a/meta-oe/classes/fitimage.bbclass
+++ b/meta-oe/classes/fitimage.bbclass
@@ -276,7 +276,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_imag=
es_list):
fd.write('\t\t\tsignature-1 {\n')
fd.write(f'\t\t\t\talgo =3D "{hash_algo},{encrypt_algo}";\n')
if conf_sign_keyname:
- =C2=A0 =C2=A0 =C2=A0 =C2=A0fd.write(f'\t\t\t\tkey-name-hint =3D {conf_sig=
n_keyname}";\n')
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0fd.write(f'\t\t\t\tkey-name-hint =3D "{conf_si=
gn_keyname}";\n')
fd.write(f'\t\t\t\tsign-images =3D {sign_images};\n')
fd.write(f'\t\t\t\tsigner-name =3D "{signer_name}";\n')
fd.write(f'\t\t\t\tsigner-version =3D "{signer_version}";\n')
@@ -341,9 +341,9 @@ def fitimage_emit_section_config_fdto(d, fd, dtb, compa=
tible):

fd.write(f'\t\t{dtb} {{\n')
fd.write(f'\t\t\tdescription =3D "Device Tree Overlay";\n')
- =C2=A0 =C2=A0fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";')
+ =C2=A0 =C2=A0fd.write(f'\t\t\tfdt =3D "fdt-{dtb}";\n')
if compatible:
- =C2=A0 =C2=A0 =C2=A0 fd.write(f'\t\t\tcompatible =3D "{compatible}";')
+ =C2=A0 =C2=A0 =C2=A0 fd.write(f'\t\t\tcompatible =3D "{compatible}";\n')

if sign =3D=3D "1":
sign_images =3D ["fdt"]
@@ -493,7 +493,7 @@ do_configure[postfuncs] +=3D "write_manifest"
do_fitimage () {
if [ "${FITIMAGE_SIGN}" =3D "1" ]; then
uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-k ${FITIMAGE_SIGN_KEYDIR} -r \
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-k "${FITIMAGE_SIGN_KEYDIR}" -r =
\
-f "${B}/manifest.its" \
"${B}/fitImage"
else

--YPKafo59JOJQlyIvpqE9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>The functions related to signing the fitimage had missing quotations a=
nd<br />newlines. Without this punctuation, the signing class would fail to=
<br />generate a signed fitimage.</div>
<div>To test this change just create a fitImage using this class and set<br=
 />FITIMAGE_SIGN to 1. The resulting fitImage its file should have one<br /=
>property per line with quotes around the property values.</div>
<div>Signed-off-by: John Ripple &lt;john.ripple@keysight.com&gt;<br />---<b=
r />&nbsp;meta-oe/classes/fitimage.bbclass | 8 ++++----<br />&nbsp;1 file c=
hanged, 4 insertions(+), 4 deletions(-)</div>
<div>diff --git a/meta-oe/classes/fitimage.bbclass b/meta-oe/classes/fitima=
ge.bbclass<br />index fef8974187..03c01a1ed3 100644<br />--- a/meta-oe/clas=
ses/fitimage.bbclass<br />+++ b/meta-oe/classes/fitimage.bbclass<br />@@ -2=
76,7 +276,7 @@ def fitimage_emit_subsection_signature(d, fd, sign_images_li=
st):<br />&nbsp; &nbsp; &nbsp;fd.write('\t\t\tsignature-1 {\n')<br />&nbsp;=
 &nbsp; &nbsp;fd.write(f'\t\t\t\talgo =3D "{hash_algo},{encrypt_algo}";\n')=
<br />&nbsp; &nbsp; &nbsp;if conf_sign_keyname:<br />- &nbsp; &nbsp; &nbsp;=
 &nbsp;fd.write(f'\t\t\t\tkey-name-hint =3D {conf_sign_keyname}";\n')<br />=
+ &nbsp; &nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tkey-name-hint =3D "{conf_si=
gn_keyname}";\n')<br />&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tsign-images =
=3D {sign_images};\n')<br />&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tsigner-n=
ame =3D "{signer_name}";\n')<br />&nbsp; &nbsp; &nbsp;fd.write(f'\t\t\t\tsi=
gner-version =3D "{signer_version}";\n')<br />@@ -341,9 +341,9 @@ def fitim=
age_emit_section_config_fdto(d, fd, dtb, compatible):<br />&nbsp;<br />&nbs=
p; &nbsp; &nbsp;fd.write(f'\t\t{dtb} {{\n')<br />&nbsp; &nbsp; &nbsp;fd.wri=
te(f'\t\t\tdescription =3D "Device Tree Overlay";\n')<br />- &nbsp; &nbsp;f=
d.write(f'\t\t\tfdt =3D "fdt-{dtb}";')<br />+ &nbsp; &nbsp;fd.write(f'\t\t\=
tfdt =3D "fdt-{dtb}";\n')<br />&nbsp; &nbsp; &nbsp;if compatible:<br />- &n=
bsp; &nbsp; &nbsp; fd.write(f'\t\t\tcompatible =3D "{compatible}";')<br />+=
 &nbsp; &nbsp; &nbsp; fd.write(f'\t\t\tcompatible =3D "{compatible}";\n')<b=
r />&nbsp;<br />&nbsp; &nbsp; &nbsp;if sign =3D=3D "1":<br />&nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;sign_images =3D ["fdt"]<br />@@ -493,7 +493,7 @@ do_con=
figure[postfuncs] +=3D "write_manifest"<br />&nbsp;do_fitimage () {<br />&n=
bsp; &nbsp; &nbsp;if [ "${FITIMAGE_SIGN}" =3D "1" ]; then<br />&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;uboot-mkimage ${FITIMAGE_MKIMAGE_EXTRA_ARGS} \<br />-=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-k ${FITIMAGE_SIGN_KEYDIR} -r \<b=
r />+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-k "${FITIMAGE_SIGN_KEYDIR}"=
 -r \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-f "${B}/manifes=
t.its" \<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"${B}/fitImag=
e"<br />&nbsp; &nbsp; &nbsp;else</div>
</div>

--YPKafo59JOJQlyIvpqE9--

