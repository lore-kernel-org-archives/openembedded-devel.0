Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web09.5303.1615675038030129007
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 14:37:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R80XQ1pJ;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id l27so14461609vsj.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 14:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ep9HKIlVUAFAdzNzGuQBgMoZcIx1ltxHZVGKufhv05k=;
        b=R80XQ1pJ/qlS0kUrMhzDmQtDdbPT+4eeSEp0Z/A8+edld0dG24pXa/vfX8Ukm+V41q
         voQUUtcH31vlvJjOwSbx3kYriDkbfhKG7EP/ngrk8xhaSGh52GNYjQww0xuhdSC3yaLd
         Wu6xuXlqIoUBsnm7mpO6ldvJKVLUQ5ZwkJ+F2wKStBpfua3HbBAxvzS9jPMNEs619gUc
         7ERlUhT/Dig5iJWPbQcsT5P0IEKdho34z5CZZn1IYt8PFTIjeDat1JzbOz8fl+LCaq4+
         TSUA49GM94HxjRCTi/Z5GjYR413OZUjyqVEW2UrBTg7O+nCPYn9hOuIDoV1kc+B/fpem
         vNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ep9HKIlVUAFAdzNzGuQBgMoZcIx1ltxHZVGKufhv05k=;
        b=WeD6GFiy2I0Z420U5dl7VYSyLV7jXrvYwXYjkn7bpkWVBMOnIOi9drP0R1gRhSlOyf
         SfDDaEHulvH0IGiHzKKkqivLskw0+7Ehsw7IvWN8QyWm5bFr5yB498PY5VqTnbgsL/Ug
         /1wHt7pKMo9+M9R5IpyXzj5dYVEtftBcsIKeUxOCKoVzdQZQ7hEAI1dKSSe5cTJxlgSl
         bJQHHkSKVUgMO8I3yXLKcLuuaqFtqKyeWkmSmkqS2TYtM9Xp+w4GSP79rfQTHiC8/nJC
         G+OlwdX2e/5Mo54gKOVFnakFpJVtEb0W6ks+NMkMBZxPFQQBjM3HTK8l9MaVCF4zcNFy
         lWMw==
X-Gm-Message-State: AOAM531nn9YUjNCrGnkwKQ6oaJbE5EU1RpMNjeSkpfluWgILw+RbpupC
	q1wBQIZ30qwdVjr50JT/58h0dVdMTPB+hegmKtc=
X-Google-Smtp-Source: ABdhPJwKJXcd3+PiuG8+kdcMJD6RGYycSfWaqjw4RWN6r5WKeyR2vGa2gL3+8jzlKR9yG91yhdkfaGAGVlkZlRWZXpc=
X-Received: by 2002:a05:6102:74a:: with SMTP id v10mr1951836vsg.20.1615675037025;
 Sat, 13 Mar 2021 14:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20210313213415.396489-1-Randy.MacLeod@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 13 Mar 2021 23:37:05 +0100
Message-ID: <CANNYZj9hdSLBmqsTSg0wW0Lb54QHyw1ms16TzQfafQeeU-OURw@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/2] zstd: upgrade 1.4.8 -> 1.4.9
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000a78a0f05bd72a8a2"

--000000000000a78a0f05bd72a8a2
Content-Type: text/plain; charset="UTF-8"

Zstd has been added to oe-core I think? Somehow it wasn't removed from
meta-oe :-/

Alex

On Sat, 13 Mar 2021 at 22:34, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Drop backported patch.
>
> CHANGELOG:
>
> v1.4.9  (Mar 1, 2021)
> bug: Use `umask()` to Constrain Created File Permissions (#2495,
> @felixhandte)
> bug: Make Simple Single-Pass Functions Ignore Advanced Parameters (#2498,
> @terrelln)
> api: Add (De)Compression Tracing Functionality (#2482, @terrelln)
> api: Support References to Multiple DDicts (#2446, @senhuang42)
> api: Add Function to Generate Skippable Frame (#2439, @senhuang42)
> perf: New Algorithms for the Long Distance Matcher (#2483, @mpu)
> perf: Performance Improvements for Long Distance Matcher (#2464, @mpu)
> perf: Don't Shrink Window Log when Streaming with a Dictionary (#2451,
> @terrelln)
> cli: Fix `--output-dir-mirror`'s Rejection of `..`-Containing Paths
> (#2512, @felixhandte)
> cli: Allow Input From Console When `-f`/`--force` is Passed (#2466,
> @felixhandte)
> cli: Improve Help Message (#2500, @senhuang42)
> tests: Remove Flaky Tests (#2455, #2486, #2445, @Cyan4973)
> tests: Correctly Invoke md5 Utility on NetBSD (#2492, @niacat)
> tests: Avoid Using `stat -c` on NetBSD (#2513, @felixhandte)
> build: Zstd CLI Can Now be Linked to Dynamic `libzstd` (#2457, #2454
> @Cyan4973)
> build: Hide and Avoid Using Static-Only Symbols (#2501, #2504, @skitt)
> build: CMake: Enable Only C for lib/ and programs/ Projects (#2498,
> @concatime)
> build: CMake: Use `configure_file()` to Create the `.pc` File (#2462,
> @lazka)
> build: Fix Fuzzer Compiler Detection & Update UBSAN Flags (#2503,
> @terrelln)
> build: Add Guards for `_LARGEFILE_SOURCE` and `_LARGEFILE64_SOURCE`
> (#2444, @indygreg)
> build: Improve `zlibwrapper` Makefile (#2437, @Cyan4973)
> contrib: Add `recover_directory` Program (#2473, @terrelln)
> doc: Change License Year to 2021 (#2452 & #2465, @terrelln & @senhuang42)
> doc: Fix Typos (#2459, @ThomasWaldmann)
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta-oe/recipes-extended/zstd/{zstd_1.4.5.bb => zstd_1.4.9.bb} | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-oe/recipes-extended/zstd/{zstd_1.4.5.bb => zstd_1.4.9.bb}
> (91%)
>
> diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
> b/meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
> similarity index 91%
> rename from meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
> rename to meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
> index d0cc625aa..0063a31be 100644
> --- a/meta-oe/recipes-extended/zstd/zstd_1.4.5.bb
> +++ b/meta-oe/recipes-extended/zstd/zstd_1.4.9.bb
> @@ -12,10 +12,9 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
>  inherit lib_package
>
>  SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1 \
> -           file://0001-Fix-legacy-build-after-2103.patch \
>             "
>
> -SRCREV = "b706286adbba780006a47ef92df0ad7a785666b6"
> +SRCREV = "e4558ffd1dc49399faf4ee5d85abed4386b4dcf5"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
>  S = "${WORKDIR}/git"
> --
> 2.27.0
>
>
> 
>
>

--000000000000a78a0f05bd72a8a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Zstd has been added to oe-core I think? Somehow it wa=
sn&#39;t removed from meta-oe :-/<br></div><div><br></div><div>Alex<br></di=
v></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Sat, 13 Mar 2021 at 22:34, Randy MacLeod &lt;<a href=3D"mailto:randy.m=
acleod@windriver.com">randy.macleod@windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Drop backported patch.<br>
<br>
CHANGELOG:<br>
<br>
v1.4.9=C2=A0 (Mar 1, 2021)<br>
bug: Use `umask()` to Constrain Created File Permissions (#2495, @felixhan=
dte)<br>
bug: Make Simple Single-Pass Functions Ignore Advanced Parameters (#2498, =
@terrelln)<br>
api: Add (De)Compression Tracing Functionality (#2482, @terrelln)<br>
api: Support References to Multiple DDicts (#2446, @senhuang42)<br>
api: Add Function to Generate Skippable Frame (#2439, @senhuang42)<br>
perf: New Algorithms for the Long Distance Matcher (#2483, @mpu)<br>
perf: Performance Improvements for Long Distance Matcher (#2464, @mpu)<br>
perf: Don&#39;t Shrink Window Log when Streaming with a Dictionary (#2451,=
 @terrelln)<br>
cli: Fix `--output-dir-mirror`&#39;s Rejection of `..`-Containing Paths (#=
2512, @felixhandte)<br>
cli: Allow Input From Console When `-f`/`--force` is Passed (#2466, @felix=
handte)<br>
cli: Improve Help Message (#2500, @senhuang42)<br>
tests: Remove Flaky Tests (#2455, #2486, #2445, @Cyan4973)<br>
tests: Correctly Invoke md5 Utility on NetBSD (#2492, @niacat)<br>
tests: Avoid Using `stat -c` on NetBSD (#2513, @felixhandte)<br>
build: Zstd CLI Can Now be Linked to Dynamic `libzstd` (#2457, #2454 @Cyan=
4973)<br>
build: Hide and Avoid Using Static-Only Symbols (#2501, #2504, @skitt)<br>
build: CMake: Enable Only C for lib/ and programs/ Projects (#2498, @conca=
time)<br>
build: CMake: Use `configure_file()` to Create the `.pc` File (#2462, @laz=
ka)<br>
build: Fix Fuzzer Compiler Detection &amp; Update UBSAN Flags (#2503, @ter=
relln)<br>
build: Add Guards for `_LARGEFILE_SOURCE` and `_LARGEFILE64_SOURCE` (#2444=
, @indygreg)<br>
build: Improve `zlibwrapper` Makefile (#2437, @Cyan4973)<br>
contrib: Add `recover_directory` Program (#2473, @terrelln)<br>
doc: Change License Year to 2021 (#2452 &amp; #2465, @terrelln &amp; @senh=
uang42)<br>
doc: Fix Typos (#2459, @ThomasWaldmann)<br>
<br>
Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver=
.com" target=3D"_blank">Randy.MacLeod@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-extended/zstd/{<a href=3D"http://zstd_1.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.4.5.bb</a> =3D&gt; <a href=3D"htt=
p://zstd_1.4.9.bb" rel=3D"noreferrer" target=3D"_blank">zstd_1.4.9.bb</a>} =
| 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-extended/zstd/{<a href=3D"http://zstd_1.4.5.b=
b" rel=3D"noreferrer" target=3D"_blank">zstd_1.4.5.bb</a> =3D&gt; <a href=
=3D"http://zstd_1.4.9.bb" rel=3D"noreferrer" target=3D"_blank">zstd_1.4.9.=
bb</a>} (91%)<br>
<br>
diff --git a/meta-oe/recipes-extended/zstd/<a href=3D"http://zstd_1.4.5.bb=
" rel=3D"noreferrer" target=3D"_blank">zstd_1.4.5.bb</a> b/meta-oe/recipes-=
extended/zstd/<a href=3D"http://zstd_1.4.9.bb" rel=3D"noreferrer" target=3D=
"_blank">zstd_1.4.9.bb</a><br>
similarity index 91%<br>
rename from meta-oe/recipes-extended/zstd/<a href=3D"http://zstd_1.4.5.bb"=
 rel=3D"noreferrer" target=3D"_blank">zstd_1.4.5.bb</a><br>
rename to meta-oe/recipes-extended/zstd/<a href=3D"http://zstd_1.4.9.bb" r=
el=3D"noreferrer" target=3D"_blank">zstd_1.4.9.bb</a><br>
index d0cc625aa..0063a31be 100644<br>
--- a/meta-oe/recipes-extended/zstd/<a href=3D"http://zstd_1.4.5.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.4.5.bb</a><br>
+++ b/meta-oe/recipes-extended/zstd/<a href=3D"http://zstd_1.4.9.bb" rel=
=3D"noreferrer" target=3D"_blank">zstd_1.4.9.bb</a><br>
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc7f0b16=
1edbe52f5f345a3d1311d0b32 \<br>
=C2=A0inherit lib_package<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/facebook/zstd.g=
it;nobranch=3D1" rel=3D"noreferrer" target=3D"_blank">github.com/facebook/z=
std.git;nobranch=3D1</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-legacy-build-aft=
er-2103.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;b706286adbba780006a47ef92df0ad7a785666b6&quot;<br>
+SRCREV =3D &quot;e4558ffd1dc49399faf4ee5d85abed4386b4dcf5&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&qu=
ot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.27.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a78a0f05bd72a8a2--
