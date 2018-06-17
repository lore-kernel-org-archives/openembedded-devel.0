Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id D465075264
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 07:39:20 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id d74-v6so7857893vke.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jun 2018 00:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=cLDLmGKdmTF7v/RSsdq/m54bmvyGdy8So10j4PW7qxk=;
	b=UQxQHGrY90LOBKPK97Fivf7nde1Yl2PiTjlEB3JxY0wJUikeUO45ptJkjW3N8RAZ8X
	QfNZo+M/kh6Qe9o4MPFCKFQUBi4G+YScNzdnk446b3mjtWPiCEclTKcyqrMDtKKYS4fr
	OLeYA1MNVd+FRi8rLGkr3aFol7x6fn51VNVsmR4CvlMCDdfAwcye/RteLJBsJZxKVPEH
	j7272HPI+gFkLFSV4/ZL9q1RACVNuafO7BejPsIAzaAHwRI9cbeSo4kDDHZ8MhaFMnQo
	S58OAqnQfuU0o+J+FlJ9EbL2wBI7HXm5TWX2ZDe3FsrpMRHx3JEoJb0ykz1Ta0oittWE
	S03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=cLDLmGKdmTF7v/RSsdq/m54bmvyGdy8So10j4PW7qxk=;
	b=MSy7UeeQhiAQSvQIPLBHedR1D8sMlzZX1QVrzP7BIPywOALtIRpa3ZxG+nppsGj3wT
	leTacoNBOgOl+VciFWpsrVIjhf78W5wOu6A+ABGh0hsSh4MVcWFzUp/AQCyJ+gkovxmp
	okvXaWf/4nbAZHCLu1HotiKmSUldk//NghlQtxAaL4SD8ekQqVHE+Gcve50qOz0Xs4Th
	d3aK78EekpylJWFm18qqq8SuaVL+/LIsAcmF6/Cf4W/HER7uWbgqW43ZLm7eE0cAriaK
	q2iG/4WGHJsOdvaSeIhvgMTD8eGXWuMKG2fjnReGgO9oiYlBSfl8m0OvlvUZ9k70tTiS
	lxXw==
X-Gm-Message-State: APt69E0OexEuoJ49x1LgeOT+5YbNNcRPPeabpABOKsG+it0DL4RlMZdx
	y8jujkkEkOBI1j/8hNWkrCaEVuVTjqx/tWORozk=
X-Google-Smtp-Source: ADUXVKKPJWuYxv/iydIS+PjeD1iLG1xlCz2tpYgOCOsd2dZU6UOgirpiZmhX0haKVO/CH5H8jtQKED2tT3p67lvc4XE=
X-Received: by 2002:a1f:2c0d:: with SMTP id
	s13-v6mr4458917vks.106.1529221161557; 
	Sun, 17 Jun 2018 00:39:21 -0700 (PDT)
MIME-Version: 1.0
References: <20180613063512.1755-1-raj.khem@gmail.com>
	<20180613063512.1755-4-raj.khem@gmail.com>
	<CA+chaQc5cV4xR28z-ORZf2v7fPXMa2eTd6=q8U9BPJkj8jOw2w@mail.gmail.com>
In-Reply-To: <CA+chaQc5cV4xR28z-ORZf2v7fPXMa2eTd6=q8U9BPJkj8jOw2w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Jun 2018 00:38:08 -0700
Message-ID: <CAMKF1sqH0ZF5r-kfcC3-MMoouAmMLUgni75T8O_6DoMmW+X3hQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 4/5] cpprest: Fix build with gcc-8
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
X-List-Received-Date: Sun, 17 Jun 2018 07:39:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 17, 2018 at 12:34 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> I think you're missing '=3D' in -Wno-format-truncation (it's shown in the=
 error message, so I was always adding it with '=3D' as well, but it seems =
that both work).


there is a level you can set and that when you need '=3D'
-Wformat-truncation is same as -Wformat-truncation=3D1

>
> cpprest/2.10.2-r0/git/Release/src/utilities/asyncrt_utils.cpp:702:42: err=
or: '%s' directive output may be truncated writing up to 8 bytes into a reg=
ion of size between 1 and 65 [-Werror=3Dformat-truncation=3D]
>          snprintf(output, sizeof(output), "%s%sZ", datetime_str, buf);
>                                           ^~~~~~~                ~~~
> cpprest/2.10.2-r0/git/Release/src/utilities/asyncrt_utils.cpp:702:17: not=
e: 'snprintf' output between 2 and 74 bytes into a destination of size 65
>          snprintf(output, sizeof(output), "%s%sZ", datetime_str, buf);
>          ~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Also can you please drop one of these? The one in meta-networking is stil=
l failing
>

yes good point.


> ./meta-oe/recipes-support/cpprest
> ./meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
> ./meta-oe/recipes-support/cpprest/cpprest-2.10.2
> ./meta-networking/recipes-support/cpprest
> ./meta-networking/recipes-support/cpprest/cpprest_2.10.2.bb
> ./meta-networking/recipes-support/cpprest/cpprest-2.10.2
>
> Added in:
> meta-oe:
> commit 9eb8b9a2c416da018c4a8acb416ef38797436f50
> Author:     Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
> AuthorDate: Thu Apr 19 19:12:07 2018 +0200
> Commit:     Armin Kuster <akuster808@gmail.com>
> CommitDate: Tue May 1 18:17:02 2018 -0700
>
>     cpprest: add new recipe based on Debian packaging
>
>     Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>     Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.=
com>
>     Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> meta-networking:
> commit 12e8c3ea698905e2ed0edd9b7f351a497a1bd68d
> Author:     Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
> AuthorDate: Sun Apr 29 20:02:06 2018 +0200
> Commit:     Armin Kuster <akuster808@gmail.com>
> CommitDate: Thu May 17 08:32:26 2018 -0700
>
>     cpprest: add new recipe based on Debian packaging
>
>     The patches were imported from the Debian repository
>     (https://salsa.debian.org/debian/casablanca) as of commit id 5b586370=
16a569a5d54714bd151a800028f77532
>
>     Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
>     Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.=
com>
>     Co-developed-by: Cristiano Prato <cristiano.prato@cnhind.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
>
> On Wed, Jun 13, 2018 at 9:01 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../0001-disable-more-Werror-warnings.patch   | 48 +++++++++++++++++++
>>  .../recipes-support/cpprest/cpprest_2.10.2.bb |  1 +
>>  2 files changed, 49 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-=
disable-more-Werror-warnings.patch
>>
>> diff --git a/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable=
-more-Werror-warnings.patch b/meta-oe/recipes-support/cpprest/cpprest-2.10.=
2/0001-disable-more-Werror-warnings.patch
>> new file mode 100644
>> index 0000000000..febfd5bc96
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/cpprest/cpprest-2.10.2/0001-disable-more-W=
error-warnings.patch
>> @@ -0,0 +1,48 @@
>> +From ee92f84a96a507b0a7a3c54929ce190ee28b4ecd Mon Sep 17 00:00:00 2001
>> +From: Alexander Moriarty <amoriarty@fetchrobotics.com>
>> +Date: Wed, 6 Jun 2018 10:38:43 -0700
>> +Subject: [PATCH] disable more -Werror warnings
>> +
>> +gcc-8: -Wno-format-truncation
>> +
>> +clang-6: -Wdelete-non-virtual-dtor
>> +clang-6: -Wunused-lambda-capture
>> +
>> +removed duplicated: -Wno-reorder
>> +
>> +This fixes #778
>> +
>> +Upstream-Status: Pending [https://github.com/Microsoft/cpprestsdk/pull/=
779]
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + Release/CMakeLists.txt | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/Release/CMakeLists.txt b/Release/CMakeLists.txt
>> +index 1267aff1..fb291ccd 100644
>> +--- a/Release/CMakeLists.txt
>> ++++ b/Release/CMakeLists.txt
>> +@@ -166,12 +166,12 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
>> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-attributes -Wno-point=
er-arith")
>> +   elseif(CMAKE_SYSTEM_NAME MATCHES "Linux")
>> +     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=3D2 -=
Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs =
-Wpacked -Wredundant-decls)
>> +-    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversio=
n -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -W=
no-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-u=
nused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unu=
sed-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unus=
ed-local-typedefs)
>> ++    set(LINUX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversio=
n -Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -W=
no-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-u=
nused-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unu=
sed-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-type=
defs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
>> +     set(WARNINGS ${WARNINGS} ${LINUX_SUPPRESSIONS})
>> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-return-type-c-linkage=
 -Wno-unneeded-internal-declaration")
>> +   else()
>> +     set(WARNINGS -Wall -Wextra -Wcast-qual -Wconversion -Wformat=3D2 -=
Winit-self -Winvalid-pch -Wmissing-format-attribute -Wmissing-include-dirs =
-Wpacked -Wredundant-decls)
>> +-    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion =
-Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno=
-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unu=
sed-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unuse=
d-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-reorder -Wno-unused=
-local-typedefs)
>> ++    set(OSX_SUPPRESSIONS -Wno-overloaded-virtual -Wno-sign-conversion =
-Wno-deprecated -Wno-unknown-pragmas -Wno-reorder -Wno-char-subscripts -Wno=
-switch -Wno-unused-parameter -Wno-unused-variable -Wno-deprecated -Wno-unu=
sed-value -Wno-unknown-warning-option -Wno-return-type-c-linkage -Wno-unuse=
d-function -Wno-sign-compare -Wno-shorten-64-to-32 -Wno-unused-local-typede=
fs -Wno-delete-non-virtual-dtor -Wno-unused-lambda-capture)
>> +     set(WARNINGS ${WARNINGS} ${OSX_SUPPRESSIONS})
>> +
>> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=3Dlibc++ -Wno-retu=
rn-type-c-linkage -Wno-unneeded-internal-declaration")
>> +@@ -184,7 +184,7 @@ if(CMAKE_CXX_COMPILER_ID MATCHES "Clang" OR IOS)
>> + elseif(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
>> +   message("-- Setting gcc options")
>> +
>> +-  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qu=
al -Wconversion -Wformat=3D2 -Winit-self -Winvalid-pch -Wmissing-format-att=
ribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code=
)
>> ++  set(WARNINGS -Wall -Wextra -Wunused-parameter -Wcast-align -Wcast-qu=
al -Wconversion -Wformat=3D2 -Winit-self -Winvalid-pch -Wmissing-format-att=
ribute -Wmissing-include-dirs -Wpacked -Wredundant-decls -Wunreachable-code=
 -Wno-format-truncation)
>> +   set(LD_FLAGS "${LD_FLAGS} -Wl,-z,defs")
>> +
>> +   set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=3Dc++11 -fno-strict-ali=
asing")
>> diff --git a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb b/meta-oe=
/recipes-support/cpprest/cpprest_2.10.2.bb
>> index 1dbe093bee..fea5d4b2eb 100644
>> --- a/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
>> +++ b/meta-oe/recipes-support/cpprest/cpprest_2.10.2.bb
>> @@ -9,6 +9,7 @@ SRC_URI =3D "git://github.com/Microsoft/cpprestsdk.git;p=
rotocol=3Dhttps;branch=3Dmaste
>>             file://fix-cmake-install.patch \
>>             file://0001-Fix-a-build-problem-on-Clang.patch;patchdir=3D..=
 \
>>             file://0002-Define-virtual-destructor.patch;patchdir=3D.. \
>> +           file://0001-disable-more-Werror-warnings.patch;patchdir=3D..=
 \
>>             "
>>
>>  # tag 2.10.2
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

