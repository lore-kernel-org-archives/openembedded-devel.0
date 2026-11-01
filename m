Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1735.1793575214643120580
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 15:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=a3XHUMYF;
 spf=pass (domain: snapchat.com, ip: 209.85.128.54, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so19152405e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 15:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793575212; cv=none;
        d=google.com; s=arc-20260327;
        b=i25zZTUA3qPhCMVpPjvBRWMsqQVxb9E9ed5JLaNMxspkth2ZOQIfmF6l9ROjVnYO0j
         uimjn2umA8eyjtChyIxxIVlZsKGow3vt0vMEAaY/8YCEwbOvtAJCISulW67AMYUnCpJM
         kkQakd9vVEaPBxcDLyB6zrBM0cEWRjMS4pYH5Y9SuvWLZsMYcdJyDiwKnl24Vz8tKMcH
         Ji4CNpKKA0KQeiZkb4N5V9NXs6Ft1SrVo3U71ePfpkviHsVjG1H7qO5dk3VLzqvDJYsR
         ggoYLREad+hZGMxzRBnxpw+Fm1ZZba+fGLo6fxramWmcJ4USZ3q2ZgPDnUAvEiF/ZiKb
         wZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GTJ/UsPSmURO7iM0HvZrOgw0X1nkfA6YLDp+x+nXSZA=;
        fh=pgSuNtBd9WV+mTof3gYKFZAQkk03g+8G5+Acac4ed14=;
        b=DM+SVhBm+67GqeUxNBIzFK4R13v1ku2wyU6qHG26O/Zts0sTw7WP3dwN/0Kth0DSB3
         PF18hWn2ctwxWfT2AnmVxRKQMtchJMRxwFWAC7PvJUJQJb32ZeipaYBhOgX/H9BM0/OR
         EVas679omQ9sWTk6Jru2N79hS1Lib58SZBp5AR9GsBD+f4Esom4ftjzDiGvc+O9CdyLF
         pR5TV8DUCaja7d0IX90Q5h3A0i77AnNxzOF/fx5+kwrV/o+bioglRIkNS23QCJ95huqC
         nFbZGlQioFTTm5pYTS7b/CFRicMHd5k0KIPKBOQCEYQzz6iehV33th8Tv9ftN1Dc64k4
         +oog==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1793575212; x=1794180012; darn=lists.openembedded.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTJ/UsPSmURO7iM0HvZrOgw0X1nkfA6YLDp+x+nXSZA=;
        b=a3XHUMYF0ZoYjGy6tvf2GwTXH0EWv03LxbyOO7yeJ5Wpg9ZdyE9EhZH/gAr/4ZLqWx
         ENdFSiriM2hKhUpoOgwQKazr2eFSSbTZbdRQU7Qhl6SkT+RQKDLUjgXzJU3lMPuVs16M
         5/x7kPC9YiTdr9OmK2FbhCyYNf01oGPQVFiZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793575212; x=1794180012;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GTJ/UsPSmURO7iM0HvZrOgw0X1nkfA6YLDp+x+nXSZA=;
        b=j1rfQ1+fsakf9uI8HEmbBE6l95QlkZwl7+tWeSobPUm7tdT3e6WCN+/4sGP8gvmUOA
         v12/1X0C7fQFj2MhHLxJOEzm5Jcvwmn2dZfIAiNDwttb5p0MOhcsH83SmAQUQWcuZ2xF
         o2G6soyC/ox0RbNJ9M6+rItbGH7zcvmS5vB6f256/IIx+beFRh4EEP9h06Z1bXx8zd+8
         I+R+JI11REAie2puSRYz0IWfviuKrD8+38OfRM8jFMBsNThu+n9C0PU/GbU5e+dGhQeE
         5Sl9IpSX+zlgWlLZljLrBF+G2uJKDGQkbFxnakzIEJ6vnAiL5TEh1ppL/ADthzulwlmN
         2HqA==
X-Gm-Message-State: AFq9FYJopr80FCyzZn4fjsC0spoeoLVi4WuI2NVITUTE+wkcHRCl8bta
	q2VAiP4HSqCCOi5nCI/hnTcCsRQD+pD2jGfbaul2ddBypmvdVhv4eigd+g4oloXL5MLvAhxuSdl
	aKeciMMAYQFLWriuXXGD6mlqf7st34VNZwcJUhSvMpgy5gSU17k61No6YJQ==
X-Gm-Gg: AYBFou19PRwfWxBhBm8kOaXBmK4WnADkawScdq1g2cyl/5+vtXJUKQuEEzr/mrmOJcA
	MnPcMRyzxtCBbdPyCU6hFiVLI4oZDbBQ16wVDPagJC6/epAEqxKW+YBXo9pgVjMrjlnmU/91LtF
	t5RJ0HSOlSYQ8Z/HWqJkXLeYqPZ/TNgbTYS6DKifAsHLXrY6L82l161ARuUlHPTKkIti1aFKFI/
	OpXRIfiUJurGbyqw+0dBZ4BA0ozBCFvYp5zFyNgIQrVjbb/uw1nVO584ilUnHO/VKkCStSN79u4
	Wj6B8gGyD0cHupBnHcPAQIZe63xFr75PGjqlmmdo6lwRD6+DZovPZu3ARRB0toOnYEiciI5eFFF
	Sb8XRAd2fClC1FJc0ozHWufndCcQ3tlj96QHHWdrVJsvFa7FDs8a6YXUfPqgee3L3V1bF
X-Received: by 2002:a05:600c:3d05:b0:4a1:faa1:3813 with SMTP id
 5b1f17b1804b1-4ac187a6960mr194601065e9.27.1793575212225; Sun, 01 Nov 2026
 15:20:12 -0800 (PST)
MIME-Version: 1.0
References: <20261022142449.2372030-1-ecordonnier@snap.com>
In-Reply-To: <20261022142449.2372030-1-ecordonnier@snap.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 2 Nov 2026 00:20:01 +0100
X-Gm-Features: AclHuK9pjYXCyFTh4il9QlDs8T9fl-aW13PZVtpvTTkf_mglaetZEU0VtV99PJ4
Message-ID: <CAHUKmYZ6AJ_WSb9xP1QCMyG=m0bvfzMATUBHPzjR440wJox-RA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] android-tools: drop GPL-2.0-only from LICENSE
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000674eea065f3f457e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 23:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131733

--000000000000674eea065f3f457e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
what is the status of this patch? It still applies on master-next.
I double-checked again and Arch/nmeum list GPL/LGPL only because they also
ship e2fsprogs/f2fs-tools and link libsepol into fastboot, none of which
are in the Debian sources or selectable via TOOLS_TO_BUILD in meta-oe
bitbake recipe.

=C3=89tienne

On Thu, Oct 22, 2026 at 4:24=E2=80=AFPM <ecordonnier@snap.com> wrote:

> From: Etienne Cordonnier <ecordonnier@snap.com>
>
> The GPL-2.0 entry dates back to the first recipe (AOSP android-5.1.1_r37,
> 2016) and was carried over unchanged to the Debian android-platform-tools
> based 35.0.2 recipe.
>
> In the android-5.1.1_r37 repos the recipe fetched, the only GPLv2 mention=
s
> are headers which are dual licensed "Apache 2.0 OR GPLv2"
> (system/core include/cutils/ashmem.h, include/utils/ashmem.h,
> include/log/logger.h), kernel headers in libion which are not built, and
> documentation templates. Apache-2.0 can be chosen for all of them.
>
> The 35.0.2 sources come from Debian's android-platform-tools, whose
> debian/copyright lists no GPL license: the files are Apache-2.0, BSD,
> Expat, Khronos, PSF and public-domain, and a scan of the unpacked tarball
> finds no GPL licensed source files.
>
> Remove GPL-2.0-only from LICENSE and LIC_FILES_CHKSUM so that the recipe =
is
> not wrongly treated as GPL by license based tooling (e.g. copyleft source
> archiving).
>
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> ---
>  meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/android-tools/
> android-tools_35.0.2.bb b/meta-oe/recipes-devtools/android-tools/
> android-tools_35.0.2.bb
> index 65529c1b53..b7cb062410 100644
> --- a/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_35.0.2.bb
> @@ -1,9 +1,8 @@
>  DESCRIPTION =3D "Various utilities from Android"
>  SECTION =3D "console/utils"
> -LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0-on=
ly"
> +LICENSE =3D "Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D " \
>
>  file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17d99a7cacdbeed46a0=
096b10
> \
> -
> file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d171dd6425610833=
a22dbe6
> \
>
>  file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc04cda31daea161b1b=
c15da69f
> \
>
>  file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D550794465ba0ec5312d6919e=
203a55f9
> \
>  "
> --
> 2.43.0
>
>

--000000000000674eea065f3f457e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>what is the status of this patch? It still applies =
on master-next.<br>I double-checked again and=C2=A0Arch/nmeum list GPL/LGPL=
 only because they also ship e2fsprogs/f2fs-tools and link libsepol into fa=
stboot, none of which are in the Debian sources or selectable via TOOLS_TO_=
BUILD in meta-oe bitbake recipe.<br><br>=C3=89tienne</div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, Oct 22, 2026 at 4:24=E2=80=AFPM &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com">ecordonnier@snap.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Etienne Cordonnier &lt;<a href=3D"mailto:=
ecordonnier@snap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
<br>
The GPL-2.0 entry dates back to the first recipe (AOSP android-5.1.1_r37,<b=
r>
2016) and was carried over unchanged to the Debian android-platform-tools<b=
r>
based 35.0.2 recipe.<br>
<br>
In the android-5.1.1_r37 repos the recipe fetched, the only GPLv2 mentions<=
br>
are headers which are dual licensed &quot;Apache 2.0 OR GPLv2&quot;<br>
(system/core include/cutils/ashmem.h, include/utils/ashmem.h,<br>
include/log/logger.h), kernel headers in libion which are not built, and<br=
>
documentation templates. Apache-2.0 can be chosen for all of them.<br>
<br>
The 35.0.2 sources come from Debian&#39;s android-platform-tools, whose<br>
debian/copyright lists no GPL license: the files are Apache-2.0, BSD,<br>
Expat, Khronos, PSF and public-domain, and a scan of the unpacked tarball<b=
r>
finds no GPL licensed source files.<br>
<br>
Remove GPL-2.0-only from LICENSE and LIC_FILES_CHKSUM so that the recipe is=
<br>
not wrongly treated as GPL by license based tooling (e.g. copyleft source<b=
r>
archiving).<br>
<br>
Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.co=
m" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</=
a> | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://andro=
id-tools_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0=
.2.bb</a> b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://androi=
d-tools_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.=
2.bb</a><br>
index 65529c1b53..b7cb062410 100644<br>
--- a/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</=
a><br>
+++ b/meta-oe/recipes-devtools/android-tools/<a href=3D"http://android-tool=
s_35.0.2.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_35.0.2.bb</=
a><br>
@@ -1,9 +1,8 @@<br>
=C2=A0DESCRIPTION =3D &quot;Various utilities from Android&quot;<br>
=C2=A0SECTION =3D &quot;console/utils&quot;<br>
-LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause AND GPL-2.0=
-only&quot;<br>
+LICENSE =3D &quot;Apache-2.0 AND BSD-2-Clause AND BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=3D89aea4e17=
d99a7cacdbeed46a0096b10 \<br>
-=C2=A0 =C2=A0 file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=3D801f80980d17=
1dd6425610833a22dbe6 \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=3Dcb641bc=
04cda31daea161b1bc15da69f \<br>
=C2=A0 =C2=A0 =C2=A0file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=3D5507944=
65ba0ec5312d6919e203a55f9 \<br>
=C2=A0&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000674eea065f3f457e--
