Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7C29974D73
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 03:00:44 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id h4-v6so6510196qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 20:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=VJqiVihxUn7rj9gEZ+eblVXtRvHPyrT1/KtYWReJ5zk=;
	b=U7TLRwSpi8Ny7vX6YpdEE7erhUu9boUugL4bUkJfz0HU7cmQIyyZWcRosiIjywKJZz
	i5LRPhxO4Se07fFypTWMNP96JI4yEbj8+bbQSNXTPHJAF8j2W7BBf8mq51VOtJ+OJrjl
	JEtND7P3hH8RZ+xtZ4NJNVm0dpRRGPoK+9KP75S2Wg046VUtbXVzevqKjGOdWEhnK7ve
	xQe2l+3eKTsYiedLD8gQWr8lEInLEAAKVhACZfpLrCNw8qg/bh73YWw4+ZVm26YBYXoq
	4eVYV1cEJSj+NmfXNNwfmO71ggtVKs6IkRWOObiWsunXMSU6XCul1DDzrGICRrKAnuJN
	x0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=VJqiVihxUn7rj9gEZ+eblVXtRvHPyrT1/KtYWReJ5zk=;
	b=Y3HNhoTY0xWlzfXLNRH4+2boqZniuLUi9iEgNxo0PcmvU18BOA3H86iAbjU0ay3GiH
	VBz1qvLcP/57NUOQ8hfmo0RRogpQAsv5ks8fFCbiMrnrq7gG5e6ZKCh6/Ac5ch4mw/o6
	FteAdPcfNDImrvlbX7b432GWge01SOxNpgq8RVh+lgXmsCLF9oCWm955vrEt9LfD/TZu
	P1RSdFmDgtxBt9d2sLwK6HYYq12gFXPu9BEl2SgLdB8nA9BsTqzH8MAQAD+68+H79SZK
	j3l+dz/qtFTpQ6Hb26C7+XvzulIZW6DSylbuYQb67KeI4flYe43PZyGMca2dlv0WN7tl
	mx9g==
X-Gm-Message-State: APzg51BnBj1pfhR4EuswBxQr4022PrWk3bpJ4PO7QywbdfrjCBLK7I4n
	CoEELPF1bvUX5qU7gFlBq0hHnx0dwyRD3uHL5WU=
X-Google-Smtp-Source: ANB0VdbX7OniH4aEMVhu8aJOR4g8FNG1WCg7IL1+qhymGKjxNwZ/kbWbIQoVhfxPZIMcRpyH6bOgsVg5pQWu8WF2gqk=
X-Received: by 2002:ac8:18f1:: with SMTP id
	o46-v6mr33173333qtk.256.1536116445078; 
	Tue, 04 Sep 2018 20:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180904115659.46185-1-zhe.he@windriver.com>
	<CAMKF1sqm8h1A07vs7gMhUGLiE+=PZi8QC8EkV1gogHz77X8wQw@mail.gmail.com>
	<d4cc309b-4b81-d4ff-d924-7dda6d888431@windriver.com>
In-Reply-To: <d4cc309b-4b81-d4ff-d924-7dda6d888431@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Sep 2018 20:00:19 -0700
Message-ID: <CAMKF1sqi2u2_8NeeN__ycQT60kEfJ3gdexUotVhZiC0QOxaJmQ@mail.gmail.com>
To: zhe.he@windriver.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Wed, 05 Sep 2018 03:00:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 4, 2018 at 7:52 PM He Zhe <zhe.he@windriver.com> wrote:
>
> Hi Raj,
>
> I tried to config it as nodistro+musl+clang, but got the following. Could=
 you please help fix spice for clang by the way? Thanks.
>
> ERROR: clang-native-6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0 do_patch: C=
ommand Error: 'quilt --quiltrc /build/spice/tmp-musl/work/x86_64-linux/clan=
g-native/6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0/recipe-sysroot-native/et=
c/quiltrc push' exited with 0  Output:
> Applying patch 0009-clang-Driver-Avoid-invalidated-iterator-in-insertTar.=
patch
> patching file tools/driver/driver.cpp
> Hunk #1 FAILED at 212.
> 1 out of 1 hunk FAILED -- rejects in file tools/driver/driver.cpp
> Patch 0009-clang-Driver-Avoid-invalidated-iterator-in-insertTar.patch can=
 be reverse-applied
> ERROR: clang-native-6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0 do_patch: F=
unction failed: patch_do_patch
> ERROR: Logfile of failure stored in: /build/spice/tmp-musl/work/x86_64-li=
nux/clang-native/6.0.1+gitAUTOINC+5136df4d08_2f27999df4-r0/temp/log.do_patc=
h.3654
> ERROR: Task (virtual:native:/meta-clang/recipes-devtools/clang/clang_git.=
bb:do_patch) failed with exit code '1'
>

user clang-7.0 branch

> Zhe
>
>
> On 2018=E5=B9=B409=E6=9C=8805=E6=97=A5 04:56, Khem Raj wrote:
> > Fails to build ( with clang )
> > http://errors.yoctoproject.org/Errors/Details/190549/
> >
> > On Tue, Sep 4, 2018 at 4:57 AM He Zhe <zhe.he@windriver.com> wrote:
> >> Adjust location of spice-common source as new spice asks spice-common
> >> to be put under "subprojects" directory.
> >>
> >> Signed-off-by: He Zhe <zhe.he@windriver.com>
> >> ---
> >>  meta-networking/recipes-support/spice/spice_git.bb | 9 +++++----
> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta=
-networking/recipes-support/spice/spice_git.bb
> >> index 38b8bf306..022a09e19 100644
> >> --- a/meta-networking/recipes-support/spice/spice_git.bb
> >> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> >> @@ -13,18 +13,19 @@ architectures."
> >>  LICENSE =3D "BSD & LGPLv2.1+"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3=
64516c"
> >>
> >> -PV =3D "0.14.0+git${SRCPV}"
> >> +PV =3D "0.14.1+git${SRCPV}"
> >>
> >> -SRCREV_spice =3D "f1050bfc76c9c4146257e087baf74e0b62d7d218"
> >> -SRCREV_spice-common =3D "95743f40a2da39e0a19859c305e69e2c99d39e42"
> >> +SRCREV_spice =3D "eaa07ef15cfc3bf57a69da2576af66f028787774"
> >> +SRCREV_spice-common =3D "6b93b3fce8909b836ef1d1434d191900d8aa00be"
> >>
> >>  SRCREV_FORMAT =3D "spice_spice-common"
> >>
> >>  SRC_URI =3D " \
> >>      git://anongit.freedesktop.org/spice/spice;name=3Dspice \
> >> -    git://anongit.freedesktop.org/spice/spice-common;destsuffix=3Dgit=
/spice-common;name=3Dspice-common \
> >> +    git://anongit.freedesktop.org/spice/spice-common;destsuffix=3Dgit=
/subprojects/spice-common;name=3Dspice-common \
> >>      file://0001-Convert-pthread_t-to-be-numeric.patch \
> >>  "
> >> +
> >>  FOO =3D "\
> >>      file://0001-build-allow-separated-src-and-build-dirs.patch \
> >>  "
> >> --
> >> 2.11.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

