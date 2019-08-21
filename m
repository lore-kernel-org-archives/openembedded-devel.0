Return-Path: <kergoth@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7CF7E549
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 19:48:12 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w2so2126615pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 12:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:message-id:in-reply-to:references:subject:mime-version; 
	bh=GKQhwWu1sxYP/53CeOUxcFCnL4aXciVsR5mJnCG7sBw=;
	b=G2TxxTnKUhg027Kbp3BrQVFRU6JufrS1Wd8Z9aog381c905B55tTNv5oJg3UcmB/sl
	6lKAm7qJXOke7cWOzox1tFAtqEF1bqV9lCzqG820T7Pt1sotKR4Z06ARn5RsXoqr3ha8
	xdpo3uB/Dm6hUoy1GKRBOeCDN890oLBUeg775PmmNYhU7PU8uBt9DMoYBvNq3iMdQmU4
	NswfsD3mPFH8/dOuyhb/HWfsJ5xuok9c8Rv10o3zx8KVxdHb2FET0qWUthZgqnarD5ji
	lvfsdzTSBowwiQPzhewvyJ9cmAiL2aGKsUBzfg5l7uW78t03BZt0cafKZrwv4CW6JnJW
	bdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:message-id:in-reply-to:references
	:subject:mime-version;
	bh=GKQhwWu1sxYP/53CeOUxcFCnL4aXciVsR5mJnCG7sBw=;
	b=C24tpMYHkSO9qTq2YSdRz3I7GIrlGgkrU/MKODIMGkDh37YJZwKYbXYMAdUhZH2pDF
	YBXoqn6U1nrig86Z52kFf37zU1SXG2Ncb3z+Uoj1V3ZmHHDsC4PDbNDOR9ljQYhBi506
	r3oD7asrKTMJ9TwiZzyhjtyW/9MBypv30D+IVmvErYTL4y3orL7mMxqkMhoNeVFpuGSm
	u/vI5nwHcj9TNNEagisNzQKmHDBYg5FdI8Swn0vLbyUITZHRHsEXSlkPNXMX63AEjfzP
	Tv5M87pr6z4sLjDPb2YL/7XIvbgSa7g5jmxmN2eSRfRIZK6MbxP033atogsx1dY6UDcd
	NvIQ==
X-Gm-Message-State: APjAAAVGFs6+0KDuMgRWybQZ+7XbZekccFy6M6sboXbr6eCf3XCaAOsf
	9oOkRWWljowpQslS1t7nTioRnVs1
X-Google-Smtp-Source: APXvYqzZaEkF2Na7ZCP4poClNTULAkdKTnUvt6pf0jIQGIhUUeGFegwj381uhra4Pa1PKGOfRQPCAQ==
X-Received: by 2002:a17:90a:bc06:: with SMTP id
	w6mr1745628pjr.130.1566416893786; 
	Wed, 21 Aug 2019 12:48:13 -0700 (PDT)
Received: from [192.168.1.17] (ip70-180-21-74.ph.ph.cox.net. [70.180.21.74])
	by smtp.gmail.com with ESMTPSA id
	g1sm22549464pgg.27.2019.08.21.12.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Aug 2019 12:48:12 -0700 (PDT)
Date: Wed, 21 Aug 2019 12:48:05 -0700
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org, Piotr Tworek <tworaz@tworaz.net>
Message-ID: <0c014b1b-db67-4483-8814-3b58088ace61@Spark>
In-Reply-To: <20190821191214.4292-1-tworaz@tworaz.net>
References: <20190821191214.4292-1-tworaz@tworaz.net>
X-Readdle-Message-ID: 0c014b1b-db67-4483-8814-3b58088ace61@Spark
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libmxml: Use autotools bbclass and cleanup the recipe a bit.
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
X-List-Received-Date: Wed, 21 Aug 2019 19:48:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

EXTRA=5FAUTORECON=46 =3D =E2=80=9C--exclude=3Dautopoint,autoheader=22
On Aug 21, 2019, 12:12 PM -0700, Piotr Tworek <tworaz=40tworaz.net>, wrot=
e:
> The package does use autotools based build systemd but it comes with a
> bit of a twist. It explicitly disallows running autoheader on the sourc=
e
> tree. Unfortunately this is what autoreconf invoked by autotools bbclas=
s
> does. Still, there is an easy fix for this. When AUTOHEADER env variabl=
e
> is defined this is what autoreconf will invoke instead of autoheader
> binary found in PATH. If we set it to /bin/true we'll esentially satisf=
y
> mxml requirements without having to patch autotools bbclass.
>
> This patch also adds PACKAGECON=46IG option allowing the user to toggle=

> threading support in the library. Not sure how useful it is, but upstre=
am
> does offer such option, it works, and its not a lot of work to expose i=
t
> via PACKAGECON=46IG.
>
> Another improvement is related to package optimization handling.
> mxml has a nasty habit of disregarding optimization flags passed by the=

> user. It always appends -Os -g to C=46LAGS in its configure script. Its=

> a bit suprising to find out DEBUG=5FBUILD=3D1 in local.conf has no impa=
ct on
> libraries produced by mxml recipe. This can be fixed with a simple sed
> script.
>
> Sed is also used to enable verbose compilation output. Having full
> compiler invocations visible in the logs is generally useful, but
> more importantly it allows some of the QA checks to their work.
>
> While doing this cleanup I've also renamed the recipe from libxml=5Fgit=
.bb
> to libxml=5F3.0.bb. The git keyword suggests this recipe is for some
> random git snapshot, while in reality its for latest stable upstream
> release of the package. =46ortunately for us upstream also tags release=
s
> in git so we can use those tags to fetch correct version of the sources=
.
>
> Last but not least this patch removes the bin package. Current versions=
 of
> mxml no longer provide any tools. The package was empty.
>
> Signed-off-by: Piotr Tworek <tworaz=40tworaz.net>
> ---
> .../recipes-support/libmxml/libmxml=5F3.0.bb =7C 35 +++++++++++++++
> .../recipes-support/libmxml/libmxml=5Fgit.bb =7C 44 -------------------=

> 2 files changed, 35 insertions(+), 44 deletions(-)
> create mode 100644 meta-oe/recipes-support/libmxml/libmxml=5F3.0.bb
> delete mode 100644 meta-oe/recipes-support/libmxml/libmxml=5Fgit.bb
>
> diff --git a/meta-oe/recipes-support/libmxml/libmxml=5F3.0.bb b/meta-oe=
/recipes-support/libmxml/libmxml=5F3.0.bb
> new file mode 100644
> index 000000000..cc83e19c9
> --- /dev/null
> +++ b/meta-oe/recipes-support/libmxml/libmxml=5F3.0.bb
> =40=40 -0,0 +1,35 =40=40
> +DESCRIPTION =3D =22Tiny XML Library=22
> +LICENSE =3D =22Apache-2.0=22
> +LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D86d3f3a95c324c9479b=
d8986968f4327=22
> +HOMEPAGE =3D =22https://www.msweet.org/mxml/=22
> +BUGTRACKER =3D =22https://github.com/michaelrsweet/mxml/issues=22
> +
> +SRC=5FURI =3D =22git://github.com/michaelrsweet/mxml.git=22
> +SRCREV =3D =22v=24=7BPV=7D=22
> +S =3D =22=24=7BWORKDIR=7D/git=22
> +
> +inherit autotools
> +
> +PACKAGECON=46IG =3F=3F=3D =22threads=22
> +PACKAGECON=46IG=5Bthreads=5D =3D =22--enable-threads,--disable-threads=
=22
> +
> +=23 Package does not support out of tree builds.
> +B =3D =22=24=7BS=7D=22
> +
> +do=5Fconfigure=5Fprepend() =7B
> + =23 Respect optimization C=46LAGS specified by OE.
> + sed -e 's/-Os -g//' -i =24=7BS=7D/configure.ac
> +
> + =23 Enable verbose compilation output. This is required for extra QA =
checks to work.
> + sed -e '/.SILENT:/d' -i =24=7BS=7D/Makefile.in
> +
> + =23 The package uses autotools but it explicitly states it does not
> + =23 support running autoheader. The following export should make sure=

> + =23 autoreconf used by autotools.bbclass invokes /bin/true instead
> + export AUTOHEADER=3D=24(which true)
> +=7D
> +
> +do=5Finstall() =7B
> + =23 Package uses DSTROOT instread of standard DESTDIR to specify inst=
all location.
> + oe=5Frunmake install DSTROOT=3D=24=7BD=7D
> +=7D
> diff --git a/meta-oe/recipes-support/libmxml/libmxml=5Fgit.bb b/meta-oe=
/recipes-support/libmxml/libmxml=5Fgit.bb
> deleted file mode 100644
> index b17fc67e0..000000000
> --- a/meta-oe/recipes-support/libmxml/libmxml=5Fgit.bb
> +++ /dev/null
> =40=40 -1,44 +0,0 =40=40
> -DESCRIPTION =3D =22Tiny XML Library=22
> -LICENSE =3D =22Apache-2.0=22
> -LIC=5F=46ILES=5FCHKSUM =3D =22file://LICENSE;md5=3D86d3f3a95c324c9479b=
d8986968f4327=22
> -HOMEPAGE =3D =22https://www.msweet.org/mxml/=22
> -BUGTRACKER =3D =22https://github.com/michaelrsweet/mxml/issues=22
> -
> -SRC=5FURI =3D =22git://github.com/michaelrsweet/mxml.git=22
> -SRCREV =3D =22c7755b6992a2afdd34dde47fc9be97f1237cfded=22
> -S =3D =22=24=7BWORKDIR=7D/git=22
> -=23 v3.0
> -PV =3D =223.0=22
> -
> -CON=46IGUREOPTS =3D =22 --prefix=3D=24=7Bprefix=7D =5C
> - --bindir=3D=24=7Bbindir=7D =5C
> - --sbindir=3D=24=7Bsbindir=7D =5C
> - --libexecdir=3D=24=7Blibexecdir=7D =5C
> - --datadir=3D=24=7Bdatadir=7D =5C
> - --sysconfdir=3D=24=7Bsysconfdir=7D =5C
> - --sharedstatedir=3D=24=7Bsharedstatedir=7D =5C
> - --localstatedir=3D=24=7Blocalstatedir=7D =5C
> - --libdir=3D=24=7Blibdir=7D =5C
> - --includedir=3D=24=7Bincludedir=7D =5C
> - --oldincludedir=3D=24=7Boldincludedir=7D =5C
> - --infodir=3D=24=7Binfodir=7D =5C
> - --mandir=3D=24=7Bmandir=7D =5C
> - --host=3D=24=7BTARGET=5FSYS=7D =5C
> - --build=3D=24=7BBUILD=5FSYS=7D =5C
> - =24=7BPACKAGECON=46IG=5FCON=46ARGS=7D =5C
> - =22
> -
> -do=5Fconfigure() =7B
> - install -m 0755 =24=7BSTAGING=5FDATADIR=5FNATIVE=7D/gnu-config/config=
.guess =24=7BS=7D
> - install -m 0755 =24=7BSTAGING=5FDATADIR=5FNATIVE=7D/gnu-config/config=
.sub =24=7BS=7D
> - ./configure =24=7BCON=46IGUREOPTS=7D --enable-shared
> -=7D
> -
> -do=5Finstall () =7B
> - export DSTROOT=3D=24=7BD=7D
> - oe=5Frunmake install
> -=7D
> -
> -PACKAGES +=3D =22 =24=7BPN=7D-bin =22
> -=46ILES=5F=24=7BPN=7D =3D =22=24=7Blibdir=7D/*=22
> -=46ILES=5F=24=7BPN=7D-bin =3D =22=24=7Bbindir=7D/*=22
> --
> 2.21.0
>
> --
> =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
> Openembedded-devel mailing list
> Openembedded-devel=40lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

