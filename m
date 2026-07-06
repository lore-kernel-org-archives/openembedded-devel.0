Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3174C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:50:23 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146930.1783327813672712732
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o9qWFRnr;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c59f740cso18724775e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 01:50:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783327812; cv=none;
        d=google.com; s=arc-20260327;
        b=C25G/eqGWpLPkUX5rNorOtwrwlUMJvdFniaTZ5vVeo2MVP4lk79AMfiiPiuc657bZL
         Edxw5d+64/dRhpszXDtsaCKpMfhRue0cvhKn23eXMA01gb7q0p3Tf4qTFHs7kjhRSqGR
         w/DxePw5OGM0devdPQERHQsVLpfeqUDIbs8Y5IM8b5f8M5wU8ZLgLSpX8HrpHkjQqXtI
         BJoca25/9hYzRkE6nSOIq5wLTy58meON4VmjcSYCl4RzDcEc2qPaENALQfpQHVvODeeR
         VBZyTlXlk4+62ml0rnByc5LV7tXDgY5uj77U464cAl5D6fzU0M31+vuG4RGR65Ce1igZ
         zBqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TadwH9bnKNg/e+MrhPuUQvH6fzTC5r0qluH8fobwKUg=;
        fh=3gNmh+G7U8VRR2Luhp6b+laC5vWoIq0nVkCmdnHWMps=;
        b=Jm92NM8WH6Q+2VRpAVeLyxOirq7Tbwgv0TF66z4Hc7ReCxHglVorkcq2AbArj9hGDv
         V++DUIt82D/fyJQxMy+TP1Y2Qv3vknyvKge4+c4FBqYioXVvZvMRhhvisElgepkdVjKA
         OtGtlL9VmOVyUIvLtttV0zM8wtqNi724ktLhYvqRZXdmZl6Y3zm5jwaZc52BFekuwKYb
         J9aQkgDTrQZ4h2fVU1+Sn/Yz7XjExyEQLxmhN8alBExc5BbGWjuUNM/y6WkfcKVvTE/0
         PIYLhatSqRkNtpSKPzE+2WzR5T/bixSRsJS30+sHYmyCdhV5QgMHdbnDtkzJroqSITQa
         VXfQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783327812; x=1783932612; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TadwH9bnKNg/e+MrhPuUQvH6fzTC5r0qluH8fobwKUg=;
        b=o9qWFRnrLvXf2ADF0AUKOrlTtNICySuOVzeqfW+agb/5yPZo2+hYsY27SqHdzd0YhM
         dkEOIT3TJ7Y1QzFG4fFJe6CMoEqr+keb6EQydczaMEu5eJW4kkQUofXeAdwHXi5KaXlK
         mJLJlsdPX8gsHqtGoYjbOmuXIGHXq4r8culnM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327812; x=1783932612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TadwH9bnKNg/e+MrhPuUQvH6fzTC5r0qluH8fobwKUg=;
        b=FEd2YA6vIvT3rYRAa2U/IoCxpE4gY2VFDyAyWZ8vXiriEQ24yT24cDdH+ukWprU+Bz
         GuwOzKCT4yxneAwC25VMunbgKQqrL4ZNEbiT/IToACmqP85vP2iZ+55RsbHvMbPaYpU9
         4TC57aaglHhGpFxhXeAlkw5QyYETfjF9BM2gG6H9FkEZw2U7kG6mByoY9iA2jRh5Ryqv
         AYbgQeruCGLsUNJV1a5tCAwbi9tAcPMfER5qFgDFafixoVjeGwdk22eZKXtxmeLiwsth
         PXnf+zjvMZOIgZyBt09CiGqmq1lW4kSnA+m8uTXpauIqxwJ5sA+deaU2f1jlIXArczJn
         zsng==
X-Gm-Message-State: AOJu0Yz/hrfJ+tqdmpgY7hkSA4mDXYfKkSLLr2VqGxL6mmb3fYANaWoR
	ivcDd21ZrkFq2R7xKm7/6aryzl78phOuRig9NymGOqAPnGa0jvDrwVcQwu6Osm+fqu5kvS4tfHz
	+6sXsgNi6Nd+rOmxOfsSwP33bCxYW5q8boNuBz+uAIQ==
X-Gm-Gg: AfdE7cn+2nagPn+PuENTIJX83575afF6EipkMDUP1O43YLewOiEtq5/vVbK/92bh4D5
	zZRDCt+R+nASgITys7W3EACOklRR4Titwv9B7TK4BHsDzo1eN9gkTKdyPHbekSHvyzBP3uh5/jH
	wX9TORULcHKTDjTTwEgO9VeLOxSNFidXtB9PgarFnWrgG926vA6Ky08eyxxc2evbZxo15YEK0fv
	hW3XYisUFL0SGnC0T+XT16RbxSUzv0FyMzg6iS6FhITyashTL6gm0LS3NPwWNfqVCjCAaVmvfY3
	a2j1Cclnp5TYR1aNMGZESwiadSw4lQ==
X-Received: by 2002:a05:600c:a48:b0:492:4a56:690b with SMTP id
 5b1f17b1804b1-493d1204c58mr116298995e9.35.1783327811707; Mon, 06 Jul 2026
 01:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260706083734.171406-1-ecordonnier@snap.com>
In-Reply-To: <20260706083734.171406-1-ecordonnier@snap.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 6 Jul 2026 10:49:45 +0200
X-Gm-Features: AVVi8CepL56nGi2rkOVPb-BtGUm5Z_-E8U_1ecKy3U50ubEbJ5JCWr3hhR7LHgM
Message-ID: <CAMSfU+6n_iFpTQu0MV5_OAK=a2-V=99C7UV1YuvvVHqOUN+B4Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ttf-noto-emoji: upgrade 20200916 -> 2.051
To: ecordonnier@snap.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bc3a440655ed5c05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 08:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128030

--000000000000bc3a440655ed5c05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 6 juil. 2026 =C3=A0 10:37, Etienne Cordonnier via lists.openembedde=
d.org
<ecordonnier=3Dsnap.com@lists.openembedded.org> a =C3=A9crit :

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> - NotoEmoji-Regular.ttf was removed upstream in
> https://github.com/googlefonts/noto-emoji/commit/1442f6acc8463c428c8b38fc=
558e87c28d8efa5b
> - A new COLRv1 format is provided, with a smaller file-size
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  .../packagegroups/packagegroup-meta-oe.bb     |  4 +++-
>  .../ttf-fonts/ttf-noto-emoji_2.051.bb         | 22 +++++++++++++++++++
>  .../ttf-fonts/ttf-noto-emoji_20200916.bb      | 18 ---------------
>

Hello,

Does that change in versioning format need a PE increase?
If I remember correctly, we got some builds with buildhistory enabled, and
this patch might trigger:
https://docs.yoctoproject.org/ref-manual/qa-checks.html#version-going-backw=
ards

Thanks!


>  3 files changed, 25 insertions(+), 19 deletions(-)
>  create mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-noto-emoji_2.051.bb
>  delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/
> ttf-noto-emoji_20200916.bb
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index a4b03e2a88..c3600d5c95 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -556,7 +556,9 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D "\
>      ttf-lklug \
>      ttf-lohit \
>      ttf-noto-emoji-color \
> -    ttf-noto-emoji-regular \
> +    ttf-noto-emoji-color-noflags \
> +    ttf-noto-emoji-colrv1 \
> +    ttf-noto-emoji-colrv1-noflags \
>      ttf-pt-sans \
>      ttf-roboto \
>      ttf-sazanami-gothic \
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
> new file mode 100644
> index 0000000000..215ec9d14d
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_2.051.bb
> @@ -0,0 +1,22 @@
> +require ttf.inc
> +
> +SUMMARY =3D "Google noto emoji font pack"
> +HOMEPAGE =3D "https://github.com/googlefonts/noto-emoji"
> +LICENSE =3D "OFL-1.1"
> +LIC_FILES_CHKSUM =3D
> "file://fonts/LICENSE;md5=3D55719faa0112708e946b820b24b14097"
> +
> +SRC_URI =3D "git://
> github.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps"
> +SRCREV =3D "8998f5dd683424a73e2314a8c1f1e359c19e8742"
> +
> +PACKAGES =3D+ "${PN}-color ${PN}-color-noflags ${PN}-colrv1
> ${PN}-colrv1-noflags"
> +FONT_PACKAGES =3D "${PN} ${PN}-color ${PN}-color-noflags ${PN}-colrv1
> ${PN}-colrv1-noflags"
> +
> +FILES:${PN} =3D "${datadir}/fonts/truetype/*.ttf"
> +FILES:${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
> +FILES:${PN}-color-noflags =3D
> "${datadir}/fonts/truetype/NotoColorEmoji-noflags.ttf"
> +# The COLRv1 format is a color scalable font compared with the previous
> color bitmap fonts.
> +# COLRv1 is significantly smaller than the color bitmap format (~5MB vs
> ~11MB).
> +FILES:${PN}-colrv1 =3D "${datadir}/fonts/truetype/Noto-COLRv1.ttf"
> +FILES:${PN}-colrv1-noflags =3D
> "${datadir}/fonts/truetype/Noto-COLRv1-noflags.ttf"
> +
> +do_compile[noexec] =3D "1"
> diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.b=
b
> b/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> deleted file mode 100644
> index b5dae22a9d..0000000000
> --- a/meta-oe/recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -require ttf.inc
> -
> -SUMMARY =3D "Google noto emoji font pack"
> -HOMEPAGE =3D "https://github.com/googlefonts/noto-emoji"
> -LICENSE =3D "OFL-1.1"
> -LIC_FILES_CHKSUM =3D
> "file://fonts/LICENSE;md5=3D55719faa0112708e946b820b24b14097"
> -
> -SRC_URI =3D "git://
> github.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps"
> -SRCREV =3D "aac7ccaa4d1dea4543453b96f7d6fc47066a57ff"
> -
> -PACKAGES =3D "${PN}-color ${PN}-regular"
> -FONT_PACKAGES =3D "${PN}-color ${PN}-regular"
> -
> -
> -FILES:${PN}-color =3D "${datadir}/fonts/truetype/NotoColorEmoji.ttf"
> -FILES:${PN}-regular =3D "${datadir}/fonts/truetype/NotoEmoji-Regular.ttf=
"
> -
> -do_compile[noexec] =3D "1"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128028):
> https://lists.openembedded.org/g/openembedded-devel/message/128028
> Mute This Topic: https://lists.openembedded.org/mt/120136605/4316185
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> yoann.congal@smile.fr]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Yoann Congal
Smile ECS

--000000000000bc3a440655ed5c05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 6 =
juil. 2026 =C3=A0=C2=A010:37, Etienne Cordonnier via <a href=3D"http://list=
s.openembedded.org">lists.openembedded.org</a> &lt;ecordonnier=3D<a href=3D=
"mailto:snap.com@lists.openembedded.org">snap.com@lists.openembedded.org</a=
>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.=
com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
- NotoEmoji-Regular.ttf was removed upstream in <a href=3D"https://github.c=
om/googlefonts/noto-emoji/commit/1442f6acc8463c428c8b38fc558e87c28d8efa5b" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/googlefonts/noto-em=
oji/commit/1442f6acc8463c428c8b38fc558e87c28d8efa5b</a><br>
- A new COLRv1 format is provided, with a smaller file-size<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-meta-oe.bb" rel=3D"n=
oreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 4 +++-<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-noto-emoji_2.051.bb" rel=3D"noref=
errer" target=3D"_blank">ttf-noto-emoji_2.051.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 22 +++++++++++++++++++<br>
=C2=A0.../ttf-fonts/<a href=3D"http://ttf-noto-emoji_20200916.bb" rel=3D"no=
referrer" target=3D"_blank">ttf-noto-emoji_20200916.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 18 ---------------<br></blockquote><div><br></div><div>Hello,</div><d=
iv><br></div><div>Does that change in versioning=C2=A0format need a PE incr=
ease?</div><div>If I remember correctly, we got some builds with buildhisto=
ry enabled, and this patch might trigger:</div><div><a href=3D"https://docs=
.yoctoproject.org/ref-manual/qa-checks.html#version-going-backwards">https:=
//docs.yoctoproject.org/ref-manual/qa-checks.html#version-going-backwards</=
a></div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
=C2=A03 files changed, 25 insertions(+), 19 deletions(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http=
://ttf-noto-emoji_2.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-e=
moji_2.051.bb</a><br>
=C2=A0delete mode 100644 meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http=
://ttf-noto-emoji_20200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-not=
o-emoji_20200916.bb</a><br>
<br>
diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegr=
oup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.b=
b</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-m=
eta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a>=
<br>
index a4b03e2a88..c3600d5c95 100644<br>
--- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
+++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegroup-met=
a-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb</a><b=
r>
@@ -556,7 +556,9 @@ RDEPENDS:packagegroup-meta-oe-graphics =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0ttf-lklug \<br>
=C2=A0 =C2=A0 =C2=A0ttf-lohit \<br>
=C2=A0 =C2=A0 =C2=A0ttf-noto-emoji-color \<br>
-=C2=A0 =C2=A0 ttf-noto-emoji-regular \<br>
+=C2=A0 =C2=A0 ttf-noto-emoji-color-noflags \<br>
+=C2=A0 =C2=A0 ttf-noto-emoji-colrv1 \<br>
+=C2=A0 =C2=A0 ttf-noto-emoji-colrv1-noflags \<br>
=C2=A0 =C2=A0 =C2=A0ttf-pt-sans \<br>
=C2=A0 =C2=A0 =C2=A0ttf-roboto \<br>
=C2=A0 =C2=A0 =C2=A0ttf-sazanami-gothic \<br>
diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-=
emoji_2.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2.051.b=
b</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-emoji=
_2.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2.051.bb</a>=
<br>
new file mode 100644<br>
index 0000000000..215ec9d14d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-emoji_2=
.051.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2.051.bb</a><b=
r>
@@ -0,0 +1,22 @@<br>
+require ttf.inc<br>
+<br>
+SUMMARY =3D &quot;Google noto emoji font pack&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/googlefonts/noto-emoji" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/googlefonts/noto-emo=
ji</a>&quot;<br>
+LICENSE =3D &quot;OFL-1.1&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://fonts/LICENSE;md5=3D55719faa0112708e946b=
820b24b14097&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/googlefonts/noto-emoj=
i;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
+SRCREV =3D &quot;8998f5dd683424a73e2314a8c1f1e359c19e8742&quot;<br>
+<br>
+PACKAGES =3D+ &quot;${PN}-color ${PN}-color-noflags ${PN}-colrv1 ${PN}-col=
rv1-noflags&quot;<br>
+FONT_PACKAGES =3D &quot;${PN} ${PN}-color ${PN}-color-noflags ${PN}-colrv1=
 ${PN}-colrv1-noflags&quot;<br>
+<br>
+FILES:${PN} =3D &quot;${datadir}/fonts/truetype/*.ttf&quot;<br>
+FILES:${PN}-color =3D &quot;${datadir}/fonts/truetype/NotoColorEmoji.ttf&q=
uot;<br>
+FILES:${PN}-color-noflags =3D &quot;${datadir}/fonts/truetype/NotoColorEmo=
ji-noflags.ttf&quot;<br>
+# The COLRv1 format is a color scalable font compared with the previous co=
lor bitmap fonts.<br>
+# COLRv1 is significantly smaller than the color bitmap format (~5MB vs ~1=
1MB).<br>
+FILES:${PN}-colrv1 =3D &quot;${datadir}/fonts/truetype/Noto-COLRv1.ttf&quo=
t;<br>
+FILES:${PN}-colrv1-noflags =3D &quot;${datadir}/fonts/truetype/Noto-COLRv1=
-noflags.ttf&quot;<br>
+<br>
+do_compile[noexec] =3D &quot;1&quot;<br>
diff --git a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-=
emoji_20200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_2020=
0916.bb</a> b/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto=
-emoji_20200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_202=
00916.bb</a><br>
deleted file mode 100644<br>
index b5dae22a9d..0000000000<br>
--- a/meta-oe/recipes-graphics/ttf-fonts/<a href=3D"http://ttf-noto-emoji_2=
0200916.bb" rel=3D"noreferrer" target=3D"_blank">ttf-noto-emoji_20200916.bb=
</a><br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-require ttf.inc<br>
-<br>
-SUMMARY =3D &quot;Google noto emoji font pack&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"https://github.com/googlefonts/noto-emoji" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/googlefonts/noto-emo=
ji</a>&quot;<br>
-LICENSE =3D &quot;OFL-1.1&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://fonts/LICENSE;md5=3D55719faa0112708e946b=
820b24b14097&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/googlefonts/noto-emoj=
i;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/googlefonts/noto-emoji;branch=3Dmain;protocol=3Dhttps</a>&quot;<br>
-SRCREV =3D &quot;aac7ccaa4d1dea4543453b96f7d6fc47066a57ff&quot;<br>
-<br>
-PACKAGES =3D &quot;${PN}-color ${PN}-regular&quot;<br>
-FONT_PACKAGES =3D &quot;${PN}-color ${PN}-regular&quot;<br>
-<br>
-<br>
-FILES:${PN}-color =3D &quot;${datadir}/fonts/truetype/NotoColorEmoji.ttf&q=
uot;<br>
-FILES:${PN}-regular =3D &quot;${datadir}/fonts/truetype/NotoEmoji-Regular.=
ttf&quot;<br>
-<br>
-do_compile[noexec] =3D &quot;1&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128028): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128028" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128028</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120136605/431=
6185" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120136605/4316185</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:yoann.congal@smile.fr" t=
arget=3D"_blank">yoann.congal@smile.fr</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000bc3a440655ed5c05--

