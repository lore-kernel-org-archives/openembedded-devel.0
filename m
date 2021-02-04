Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.115.1612458415920811987
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 09:06:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CxudKSgZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id s77so4013125qke.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 09:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YOM6+8KQs6AIpDq/SHmvham60zVNhPCnh7FjmIeZmmk=;
        b=CxudKSgZbX74sIdnNsh3mSrDF4u1WkdOQueXjdnUEHiZKEDFo6gpp8nf+jOeul//WD
         1LarbMw3MfP170eYwIE/ILIuVgQLh6wlu3T5eVlvlQ/aqBBUtm24w1Z4KHr7q4Xaut6R
         HiINvcWlm9qlGwpgEH3sBrL592U2XociU3K3j5mKaC09QOVpkZm50nXiMDT/GOSFqsFt
         hD2+DCE5kYAmJzMcNwjH54qIdgn4d8h4A+iDqCcXyfo3fTjSWyyeJiaciXEWbFGDZ7pp
         oVeGylDqbT0m4dn4gJQ0mVkFufsTbLO6U/HoiELUU3hKVn/Pm5hpuHApD4RortmKrLKz
         nJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YOM6+8KQs6AIpDq/SHmvham60zVNhPCnh7FjmIeZmmk=;
        b=iZxZlbSdUFx4+b+PtU7IiX0GG6ZWbU1B8trZCwAVVPsu9c9hwLkWPoXlP9YCFar+7p
         BiTG71zJw8AEghZl5b/xVPIjfeUBHjs4S6Zx//Vif34FIDw9EACx5ocoT+pfOTZnK0nh
         O9+ySPFc4X78qZz1fgF0fZ0/NHSMoh1ckhdKPuVG2B0foT8TYsHyxXwbIjSQQVt2pjwo
         cpAR6YLTwLFGKt9m2pb2P6dkdc9Banm5XFEvtAMtIQy7Z2pPoz/1cmHg/7oO6KSCjOtW
         EUh8tsjx+6Ay5prQ47yYx+7qo0Q8Buef+dg2AhzBjqTYKsquaUMmbWxGh/l4rdnv2EW6
         zf2w==
X-Gm-Message-State: AOAM530p2G6vMSL2eV/6G+w/l9RJJiKJwj5PM1So6MCgAOny9ps7QAW5
	mSZDHOeA2SZKjF/LXXR7dWTJsl0lNq3Idb3Uqt8=
X-Google-Smtp-Source: ABdhPJyecQCjInKVejdVSJsIw8JMtcrRVkOwg97oc7qlBAqwuXwc77PjYQOLqIXkFvcXU18FoBJf0e1R3x59p2sQD4o=
X-Received: by 2002:a37:a70b:: with SMTP id q11mr77254qke.474.1612458415004;
 Thu, 04 Feb 2021 09:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20210203020115.2759192-1-raj.khem@gmail.com> <c5337d31cd64447d8aa29cc276eba6cd@XBOX03.axis.com>
In-Reply-To: <c5337d31cd64447d8aa29cc276eba6cd@XBOX03.axis.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 4 Feb 2021 09:06:28 -0800
Message-ID: <CAMKF1sqVTq1sZYT5jD8cAq0ZQjhCBobo+BHtLUkP0KDV70RfvA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH V2] cereal: add cereal a header-only c++11 serialization library
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	Adam Miartus <adam.miartus@softhows.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Peter, I did not realize that they could be merged but
relooking it seems to be a better option
I have asked the developer to look into it

On Thu, Feb 4, 2021 at 8:31 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> We already have meta-oe/recipes-support/libcereal/libcereal_1.3.0.bb!
>
> I recommend ./meta-oe/recipes-devtools/cereal/cereal_1.0.bb is removed
> again, and any relevant changes added to libcereal instead.
>
> //Peter
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org <openembedded-
> > devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: den 3 februari 2021 03:01
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Adam Miartus <adam.miartus@softhows.eu>; Khem Raj
> > <raj.khem@gmail.com>
> > Subject: [oe] [meta-oe][PATCH V2] cereal: add cereal a header-only c++1=
1
> > serialization library
> >
> > From: Adam Miartus <adam.miartus@softhows.eu>
> >
> > Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix packaging errors
> >
> >  .../packagegroups/packagegroup-meta-oe.bb     |  2 +-
> >  ...cense-files-for-components-of-cereal.patch | 99 +++++++++++++++++++
> >  meta-oe/recipes-devtools/cereal/cereal_1.0.bb | 36 +++++++
> >  3 files changed, 136 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-devtools/cereal/cereal/0001-add-
> > license-files-for-components-of-cereal.patch
> >  create mode 100644 meta-oe/recipes-devtools/cereal/cereal_1.0.bb
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 94830e2970..ba85596995 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -961,7 +961,7 @@ RDEPENDS_packagegroup-meta-oe-fortran-packages =3D =
"\
> >  # nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
> >  # glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
> >  # spdlog span-lite uthash websocketpp catch2 properties-cpp cpp-netlib
> > -
> > +# cereal
> >  # rsyslog conflicts with syslog-ng so its not included here
> >
> >  EXCLUDE_FROM_WORLD =3D "1"
> > diff --git a/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-
> > files-for-components-of-cereal.patch b/meta-oe/recipes-
> > devtools/cereal/cereal/0001-add-license-files-for-components-of-
> > cereal.patch
> > new file mode 100644
> > index 0000000000..0000ab9197
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/cereal/cereal/0001-add-license-files-for=
-
> > components-of-cereal.patch
> > @@ -0,0 +1,99 @@
> > +From 481b2aa46b3f54d9bee059d9da68263edece2bb3 Mon Sep 17 00:00:00 2001
> > +From: Adam Miartus <adam.miartus@softhows.eu>
> > +Date: Mon, 1 Feb 2021 16:15:01 +0100
> > +Subject: [PATCH] add license files for components of cereal
> > +
> > +Signed-off-by: Adam Miartus <adam.miartus@softhows.eu>
> > +---
> > + include/cereal/external/LICENSE               | 21 ++++++++++++++
> > + include/cereal/external/rapidjson/LICENSE     | 13 +++++++++
> > + .../external/rapidjson/msinttypes/LICENSE     | 29 ++++++++++++++++++=
+
> > + 3 files changed, 63 insertions(+)
> > + create mode 100644 include/cereal/external/LICENSE
> > + create mode 100644 include/cereal/external/rapidjson/LICENSE
> > + create mode 100644 include/cereal/external/rapidjson/msinttypes/LICEN=
SE
> > +
> > +diff --git a/include/cereal/external/LICENSE
> > b/include/cereal/external/LICENSE
> > +new file mode 100644
> > +index 00000000..66300b68
> > +--- /dev/null
> > ++++ b/include/cereal/external/LICENSE
> > +@@ -0,0 +1,21 @@
> > ++Copyright (C) 2004-2008 Ren=C3=A9 Nyffenegger
> > ++
> > ++This source code is provided 'as-is', without any express or implied
> > ++warranty. In no event will the author be held liable for any damages
> > ++arising from the use of this software.
> > ++
> > ++Permission is granted to anyone to use this software for any purpose,
> > ++including commercial applications, and to alter it and redistribute i=
t
> > ++freely, subject to the following restrictions:
> > ++
> > ++1. The origin of this source code must not be misrepresented; you mus=
t
> > not
> > ++  claim that you wrote the original source code. If you use this sour=
ce
> > code
> > ++  in a product, an acknowledgment in the product documentation would =
be
> > ++  appreciated but is not required.
> > ++
> > ++2. Altered source versions must be plainly marked as such, and must n=
ot
> > be
> > ++  misrepresented as being the original source code.
> > ++
> > ++3. This notice may not be removed or altered from any source
> > distribution.
> > ++
> > ++Ren=C3=A9 Nyffenegger rene.nyffenegger@adp-gmbh.ch
> > +diff --git a/include/cereal/external/rapidjson/LICENSE
> > b/include/cereal/external/rapidjson/LICENSE
> > +new file mode 100644
> > +index 00000000..4546f15a
> > +--- /dev/null
> > ++++ b/include/cereal/external/rapidjson/LICENSE
> > +@@ -0,0 +1,13 @@
> > ++Tencent is pleased to support the open source community by making
> > RapidJSON available.
> > ++
> > ++Copyright (C) 2015 THL A29 Limited, a Tencent company, and Milo Yip.
> > All rights reserved.
> > ++
> > ++Licensed under the MIT License (the "License"); you may not use this
> > file except
> > ++in compliance with the License. You may obtain a copy of the License =
at
> > ++
> > ++http://opensource.org/licenses/MIT
> > ++
> > ++Unless required by applicable law or agreed to in writing, software
> > distributed
> > ++under the License is distributed on an "AS IS" BASIS, WITHOUT
> > WARRANTIES OR
> > ++CONDITIONS OF ANY KIND, either express or implied. See the License fo=
r
> > the
> > ++specific language governing permissions and limitations under the
> > License.
> > +diff --git a/include/cereal/external/rapidjson/msinttypes/LICENSE
> > b/include/cereal/external/rapidjson/msinttypes/LICENSE
> > +new file mode 100644
> > +index 00000000..e3d96f8f
> > +--- /dev/null
> > ++++ b/include/cereal/external/rapidjson/msinttypes/LICENSE
> > +@@ -0,0 +1,29 @@
> > ++ISO C9x  compliant stdint.h for Microsoft Visual Studio
> > ++Based on ISO/IEC 9899:TC2 Committee draft (May 6, 2005) WG14/N1124
> > ++
> > ++ Copyright (c) 2006-2013 Alexander Chemeris
> > ++
> > ++Redistribution and use in source and binary forms, with or without
> > ++modification, are permitted provided that the following conditions ar=
e
> > met:
> > ++
> > ++  1. Redistributions of source code must retain the above copyright
> > notice,
> > ++     this list of conditions and the following disclaimer.
> > ++
> > ++  2. Redistributions in binary form must reproduce the above copyrigh=
t
> > ++     notice, this list of conditions and the following disclaimer in
> > the
> > ++     documentation and/or other materials provided with the
> > distribution.
> > ++
> > ++  3. Neither the name of the product nor the names of its contributor=
s
> > may
> > ++     be used to endorse or promote products derived from this softwar=
e
> > ++     without specific prior written permission.
> > ++
> > ++THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
> > IMPLIED
> > ++WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
> > ++MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. =
IN
> > NO
> > ++EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL=
,
> > ++SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> > LIMITED TO,
> > ++PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
> > PROFITS;
> > ++OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
> > LIABILITY,
> > ++WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE =
OR
> > ++OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN I=
F
> > ++ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> > +--
> > +2.29.2
> > +
> > diff --git a/meta-oe/recipes-devtools/cereal/cereal_1.0.bb b/meta-
> > oe/recipes-devtools/cereal/cereal_1.0.bb
> > new file mode 100644
> > index 0000000000..dd3dc189dc
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/cereal/cereal_1.0.bb
> > @@ -0,0 +1,36 @@
> > +SUMMARY =3D "cereal is a header-only C++11 serialization library"
> > +HOMEPAGE =3D "https://uscilab.github.io/cereal"
> > +LICENSE =3D "BSD & MIT & BSL-1.0"
> > +LIC_FILES_CHKSUM =3D "\
> > +    file://LICENSE;md5=3De612690af2f575dfd02e2e91443cea23 \
> > +
> > file://include/cereal/external/rapidxml/license.txt;md5=3Dd63ab70ba21ca=
0544
> > b03284958324301 \
> > +
> > file://include/cereal/external/LICENSE;md5=3Db07578c9df99c0b8b45eb041ef=
d4a6
> > 45 \
> > +
> > file://include/cereal/external/rapidjson/LICENSE;md5=3De7abb663111d4ac1=
7cf0
> > 0323698aff08 \
> > +
> > file://include/cereal/external/rapidjson/msinttypes/LICENSE;md5=3Ddffce=
65b9
> > 8c773976de2e338bd130f46 \
> > +"
> > +
> > +inherit cmake pkgconfig
> > +
> > +RDEPENDS_${PN}-dev =3D ""
> > +
> > +SRC_URI =3D " \
> > +    git://github.com/USCiLab/cereal.git;protocol=3Dhttps \
> > +    file://0001-add-license-files-for-components-of-cereal.patch \
> > +"
> > +
> > +SRCREV =3D "48fda3f0a6b58f9a9278ec15c15e7b7c3dceeceb"
> > +
> > +EXTRA_OECMAKE +=3D "\
> > +    -DCEREAL_INSTALL=3DTRUE \
> > +    -DJUST_INSTALL_CEREAL=3DTRUE \
> > +"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +PROVIDES +=3D "${PN}-dev"
> > +
> > +FILES_${PN}-dev =3D " \
> > +    ${includedir} \
> > +    ${libdir} \
> > +"
> > +
> > --
> > 2.30.0
>
