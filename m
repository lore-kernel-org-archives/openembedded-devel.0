Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0966D3B991
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 19:28:24 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16238.1765308499926573568
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 11:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UA7XfsmD;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-78c696717dbso1931317b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 11:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765308499; x=1765913299; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5sE7jCIpUeW/Z19/AXmhntUvZ/dn60rPZrhaa+skg/E=;
        b=UA7XfsmDcBqvcTLobdqb1mvfUGt7iUFeX1gqQhoOmkvrZTo+P1MHyeu4rbgeTjiH65
         T1z08QBjPN0ubaVZLt7YmCicRK7BedFOCLjslKmaHJJVUHUAU13mUClWp/3vprX93V+f
         Z582PDpcy+IkC57qgXrpCu74a3D5kRNvbrajJubPcL6GKYCa1N1ZLmodmc17dAkBTHBy
         nk5eTlMT6/Tc7omjxLB4b5GZwzsxSO1Y7bKDVLxmzJNaW/1UrihPq+NTQU/0JdjDDufM
         m7E06wQfHkwnnNbvWvTPw+yv6vFUZqk79PanZzo5cHmrSUVYogFjNDdoa6Lgibz65o7f
         mCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765308499; x=1765913299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sE7jCIpUeW/Z19/AXmhntUvZ/dn60rPZrhaa+skg/E=;
        b=Ww9mIasS+FAlV/IEWWCMnlSS5bjmGbS9LM/iWr6FDjy5Dt94WHPw0YFWk5Os17WNJp
         JO8gW19kORqlO5YFvdrnpWZt6o888G7Jp+k5FrmiyhdJYnIoFAgTmByfXYJs6ITJt241
         DFOBShf/MPmMZfvvjSyUIYxGHEGqV2p8u23jMfxfCs2Se8w69ReuXIwzpk7nx5DAdBwT
         cGDH+IuVgAwQlNwWM2VM6GAWsBfl/I7JCwjldyy/XXIpEZ+WtTA7k6ryWbHXjDQk8hI/
         0epj4OTvUwmDMiLLc9GDo3z/o5JyWdF2EEeFLbiNGHhfHcT7+XYmEKxAy0ePdA7WLyw9
         IYjA==
X-Gm-Message-State: AOJu0YzkBtYhwKb8Vpl+4ty4zL+2rZVx6kcUACvyesuraBl64E9NFi+4
	jaDG2m3cofBfTdWMGN7OMnIJHlQAzlbcOT0y0LtojbqpJOhK0COM4r0ik8KZeLQ4kKQOgdwbqaU
	ZoMboj+QynGqCEcXBU+vumfQOn1uHYkH246p6+T4=
X-Gm-Gg: AY/fxX6Xz3fwAHbX7tWyvCS0EDeQduiUaNO5yvC0mqR8MmX6MF3yIy7P+8rkVzSn8Jo
	2oaPqUAXdivMtqU/RzT6g+lP+euJQB2ZfhOMHjapXApd0thAvdkM6W0XuyFlNrXfBfBC1Fw7nq/
	OXK+X2iIbXISrXWCZsYKYXuBcc3yV4GjylbsgzdNTb9lx/6lTV3Z+aeHFCBKP047BkPAfE+y4s9
	D6qC1+HOeorO1jcGI+0rjw7FQcqR9rGt/o2bIjNXLaIIjNBX7+L2SfzquZn9bFf1a5VA83CNUgQ
	FvXKvP1pq4Lp2Iu68m04A60qc4StuYP4W0imtEld6w8BbLCA/pktFmTi/j9dSUtN8tjBzvBiKTG
	wYziHXIa8qEpp3rrI5l7FVInbkD4KXVxxqxFUzO9Y
X-Google-Smtp-Source: AGHT+IEvTVREw4xnoPoOeT5x7O0FlgN4kkbrou7oU/NvAIgQtT7sZu3RBD/5nUlzVWnylPp5QX+0JDt3xTdLTBVXxg8=
X-Received: by 2002:a05:690e:2444:b0:642:84a:7bdc with SMTP id
 956f58d0204a3-6446eb643d5mr1408d50.83.1765308498901; Tue, 09 Dec 2025
 11:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20251209055428.22306-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20251209055428.22306-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 11:27:52 -0800
X-Gm-Features: AQt7F2prxx9_JN7JdG-zyHm4f_NEVANlQqGaq4L6HypdZQmKZ4JqvkNZg9x-RPE
Message-ID: <CAMKF1sppy5X_3SjfJvz_RqJEQHMeq3ipQCx26Qc_ARjFpWWVuQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 1/5] gflags: upgrade 2.2.2 -> 2.3.0
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fefea2064589e990"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 19:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122474

--000000000000fefea2064589e990
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 9:54=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> 1.Change log:
>   https://github.com/gflags/gflags/releases/tag/v2.3.0
>
> 2. Drop 0001-allow-build-with-cmake-4.patch as it was mergerd upstream.
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../0001-allow-build-with-cmake-4.patch       | 69 -------------------
>  .../{gflags_2.2.2.bb =3D> gflags_2.3.0.bb}      |  5 +-
>  2 files changed, 2 insertions(+), 72 deletions(-)
>  delete mode 100644
> meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.patch
>  rename meta-oe/recipes-support/gflags/{gflags_2.2.2.bb =3D> gflags_2.3.0=
.bb}
> (79%)
>
> diff --git
> a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.pat=
ch
> b/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.pat=
ch
> deleted file mode 100644
> index bc3ca94de8..0000000000
> ---
> a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.pat=
ch
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -From b533cf275db99b1d37ba20d96497cafcedc9ace0 Mon Sep 17 00:00:00 2001
> -From: Alper Ak <alperyasinak1@gmail.com>
> -Date: Tue, 8 Jul 2025 18:57:26 +0300
> -Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
> - compatibility
> -
> -Fix:
> -
> -| CMake Error at CMakeLists.txt:73 (cmake_minimum_required):
> -|   Compatibility with CMake < 3.5 has been removed from CMake.
> -|
> -|   Update the VERSION argument <min> value.  Or, use the <min>...<max>
> syntax
> -|   to tell CMake that the project requires at least <min> but has been
> updated
> -|   to work with policies introduced by <max> or earlier.
> -|
> -|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyw=
ay.
> -|
> -|
> -| -- Configuring incomplete, errors occurred!
> -
> -Upstream-Status: Backport [
> https://github.com/gflags/gflags/commit/70c01a642f08734b7bddc9687884844ca=
117e080
> ]
> -
> -Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ----
> - CMakeLists.txt             | 2 +-
> - test/config/CMakeLists.txt | 2 +-
> - test/nc/CMakeLists.txt     | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 657a1f4..a5440bb 100644
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -70,7 +70,7 @@
> - ## - GFLAGS_INSTALL_SHARED_LIBS
> - ## - GFLAGS_INSTALL_STATIC_LIBS
> -
> --cmake_minimum_required (VERSION 3.0.2 FATAL_ERROR)
> -+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
> -
> - if (POLICY CMP0042)
> -   cmake_policy (SET CMP0042 NEW)
> -diff --git a/test/config/CMakeLists.txt b/test/config/CMakeLists.txt
> -index 6190b25..205121e 100644
> ---- a/test/config/CMakeLists.txt
> -+++ b/test/config/CMakeLists.txt
> -@@ -1,6 +1,6 @@
> - ## gflags package configuration tests
> -
> --cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
> -+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
> -
> - project (gflags_${TEST_NAME})
> -
> -diff --git a/test/nc/CMakeLists.txt b/test/nc/CMakeLists.txt
> -index d00b07d..1b4d511 100644
> ---- a/test/nc/CMakeLists.txt
> -+++ b/test/nc/CMakeLists.txt
> -@@ -1,6 +1,6 @@
> - ## gflags negative compilation tests
> -
> --cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)
> -+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)
> -
> - if (NOT TEST_NAME)
> -   message (FATAL_ERROR "Missing TEST_NAME CMake flag")
> ---
> -2.43.0
> -
> diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> b/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
> similarity index 79%
> rename from meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> rename to meta-oe/recipes-support/gflags/gflags_2.3.0.bb
> index 925aa6d6e6..0e510bb59a 100644
> --- a/meta-oe/recipes-support/gflags/gflags_2.2.2.bb
> +++ b/meta-oe/recipes-support/gflags/gflags_2.3.0.bb
> @@ -3,9 +3,8 @@ HOMEPAGE =3D "https://github.com/gflags/gflags"
>  LICENSE =3D "BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING.txt;md5=3Dc80d1a3b623f72bb85a4c75b556551df"
>
> -SRC_URI =3D "git://
> github.com/gflags/gflags.git;branch=3Dmaster;protocol=3Dhttps \
> -        file://0001-allow-build-with-cmake-4.patch"
> -SRCREV =3D "e171aa2d15ed9eb17054558e0b3a6a413bb01067"
> +SRC_URI =3D "git://github.com/gflags/gflags.git;branch=3Dmain;protocol=
=3Dhttps"
>

As a followup, it will be good to add tag=3Dv${PV} to SRC_URI


> +SRCREV =3D "33bb3461e10864b5406353d3a1fb7ff34c2314b8"
>
>  inherit cmake
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122394):
> https://lists.openembedded.org/g/openembedded-devel/message/122394
> Mute This Topic: https://lists.openembedded.org/mt/116690267/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fefea2064589e990
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 8, =
2025 at 9:54=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"mail=
to:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">1.=
Change log:<br>
=C2=A0 <a href=3D"https://github.com/gflags/gflags/releases/tag/v2.3.0" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/gflags/gflags/releases=
/tag/v2.3.0</a><br>
<br>
2. Drop 0001-allow-build-with-cmake-4.patch as it was mergerd upstream.<br>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../0001-allow-build-with-cmake-4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
9 -------------------<br>
=C2=A0.../{<a href=3D"http://gflags_2.2.2.bb" rel=3D"noreferrer" target=3D"=
_blank">gflags_2.2.2.bb</a> =3D&gt; <a href=3D"http://gflags_2.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gflags_2.3.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 5 +-<br>
=C2=A02 files changed, 2 insertions(+), 72 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-support/gflags/gflags/0001-allow-b=
uild-with-cmake-4.patch<br>
=C2=A0rename meta-oe/recipes-support/gflags/{<a href=3D"http://gflags_2.2.2=
.bb" rel=3D"noreferrer" target=3D"_blank">gflags_2.2.2.bb</a> =3D&gt; <a hr=
ef=3D"http://gflags_2.3.0.bb" rel=3D"noreferrer" target=3D"_blank">gflags_2=
.3.0.bb</a>} (79%)<br>
<br>
diff --git a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cm=
ake-4.patch b/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-c=
make-4.patch<br>
deleted file mode 100644<br>
index bc3ca94de8..0000000000<br>
--- a/meta-oe/recipes-support/gflags/gflags/0001-allow-build-with-cmake-4.p=
atch<br>
+++ /dev/null<br>
@@ -1,69 +0,0 @@<br>
-From b533cf275db99b1d37ba20d96497cafcedc9ace0 Mon Sep 17 00:00:00 2001<br>
-From: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" target=3D"_b=
lank">alperyasinak1@gmail.com</a>&gt;<br>
-Date: Tue, 8 Jul 2025 18:57:26 +0300<br>
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+<b=
r>
- compatibility<br>
-<br>
-Fix:<br>
-<br>
-| CMake Error at CMakeLists.txt:73 (cmake_minimum_required):<br>
-|=C2=A0 =C2=A0Compatibility with CMake &lt; 3.5 has been removed from CMak=
e.<br>
-|<br>
-|=C2=A0 =C2=A0Update the VERSION argument &lt;min&gt; value.=C2=A0 Or, use=
 the &lt;min&gt;...&lt;max&gt; syntax<br>
-|=C2=A0 =C2=A0to tell CMake that the project requires at least &lt;min&gt;=
 but has been updated<br>
-|=C2=A0 =C2=A0to work with policies introduced by &lt;max&gt; or earlier.<=
br>
-|<br>
-|=C2=A0 =C2=A0Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configur=
ing anyway.<br>
-|<br>
-|<br>
-| -- Configuring incomplete, errors occurred!<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/gflags/gflags/com=
mit/70c01a642f08734b7bddc9687884844ca117e080" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/gflags/gflags/commit/70c01a642f08734b7bddc968788=
4844ca117e080</a>]<br>
-<br>
-Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" tar=
get=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
----<br>
- CMakeLists.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- test/config/CMakeLists.txt | 2 +-<br>
- test/nc/CMakeLists.txt=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- 3 files changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
-index 657a1f4..a5440bb 100644<br>
---- a/CMakeLists.txt<br>
-+++ b/CMakeLists.txt<br>
-@@ -70,7 +70,7 @@<br>
- ## - GFLAGS_INSTALL_SHARED_LIBS<br>
- ## - GFLAGS_INSTALL_STATIC_LIBS<br>
- <br>
--cmake_minimum_required (VERSION 3.0.2 FATAL_ERROR)<br>
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)<br>
- <br>
- if (POLICY CMP0042)<br>
-=C2=A0 =C2=A0cmake_policy (SET CMP0042 NEW)<br>
-diff --git a/test/config/CMakeLists.txt b/test/config/CMakeLists.txt<br>
-index 6190b25..205121e 100644<br>
---- a/test/config/CMakeLists.txt<br>
-+++ b/test/config/CMakeLists.txt<br>
-@@ -1,6 +1,6 @@<br>
- ## gflags package configuration tests<br>
- <br>
--cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)<br>
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)<br>
- <br>
- project (gflags_${TEST_NAME})<br>
- <br>
-diff --git a/test/nc/CMakeLists.txt b/test/nc/CMakeLists.txt<br>
-index d00b07d..1b4d511 100644<br>
---- a/test/nc/CMakeLists.txt<br>
-+++ b/test/nc/CMakeLists.txt<br>
-@@ -1,6 +1,6 @@<br>
- ## gflags negative compilation tests<br>
- <br>
--cmake_minimum_required (VERSION 2.8.12 FATAL_ERROR)<br>
-+cmake_minimum_required (VERSION 3.5 FATAL_ERROR)<br>
- <br>
- if (NOT TEST_NAME)<br>
-=C2=A0 =C2=A0message (FATAL_ERROR &quot;Missing TEST_NAME CMake flag&quot;=
)<br>
--- <br>
-2.43.0<br>
-<br>
diff --git a/meta-oe/recipes-support/gflags/<a href=3D"http://gflags_2.2.2.=
bb" rel=3D"noreferrer" target=3D"_blank">gflags_2.2.2.bb</a> b/meta-oe/reci=
pes-support/gflags/<a href=3D"http://gflags_2.3.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gflags_2.3.0.bb</a><br>
similarity index 79%<br>
rename from meta-oe/recipes-support/gflags/<a href=3D"http://gflags_2.2.2.b=
b" rel=3D"noreferrer" target=3D"_blank">gflags_2.2.2.bb</a><br>
rename to meta-oe/recipes-support/gflags/<a href=3D"http://gflags_2.3.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">gflags_2.3.0.bb</a><br>
index 925aa6d6e6..0e510bb59a 100644<br>
--- a/meta-oe/recipes-support/gflags/<a href=3D"http://gflags_2.2.2.bb" rel=
=3D"noreferrer" target=3D"_blank">gflags_2.2.2.bb</a><br>
+++ b/meta-oe/recipes-support/gflags/<a href=3D"http://gflags_2.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">gflags_2.3.0.bb</a><br>
@@ -3,9 +3,8 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/gflags/gfl=
ags" rel=3D"noreferrer" target=3D"_blank">https://github.com/gflags/gflags<=
/a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING.txt;md5=3Dc80d1a3b623f72bb8=
5a4c75b556551df&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/gflags/gflags.git;bra=
nch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.=
com/gflags/gflags.git;branch=3Dmaster;protocol=3Dhttps</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-allow-build-with-cmake-4.patch&quo=
t;<br>
-SRCREV =3D &quot;e171aa2d15ed9eb17054558e0b3a6a413bb01067&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/gflags/gflags.git;bra=
nch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/gflags/gflags.git;branch=3Dmain;protocol=3Dhttps</a>&quot;<br></blockquot=
e><div><br></div><div>As a followup, it will be good to add tag=3Dv${PV} to=
 SRC_URI=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
+SRCREV =3D &quot;33bb3461e10864b5406353d3a1fb7ff34c2314b8&quot;<br>
<br>
=C2=A0inherit cmake<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122394): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122394" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122394</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116690267/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116690267/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000fefea2064589e990--

