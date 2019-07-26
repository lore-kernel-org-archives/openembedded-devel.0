Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8ACB37EEC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 22:27:51 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id l9so54122980qtu.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 15:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=iZ15y6mLD/czJSg/F6WKu+66YcZ/haYDAXJykkC+wrQ=;
	b=UhICjhV3+mcgbcfkMJS8ZbThaS2sQSTZfEHSuCsXPCpMrDNroSnB3x54XyeRngI5v+
	JMwmKRA5nOT5nfvBvqKJyqxPrl5oaplmeMoAJHDnGTg7dCxGfAUnACVkySyo3q5X61ji
	evIOcTZJ9aU3Uyx9UvsKAIEjIb06r37CiMEN9zsX/ByR637Hd61q+vHnFPHTRnefbjKR
	fl1YEJ60ur0ViAKbC+gEYZDIZcEgZZ0QhAFAm0ZT21+fSS7gHz+Uh0fxOUBYGaKoOAaT
	zGunaiAIV31O4bbUaxTM0EKNxwT2o2haEd3H5LMAHQkvyEHME7C8SClBgst5JgncBPkT
	so0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=iZ15y6mLD/czJSg/F6WKu+66YcZ/haYDAXJykkC+wrQ=;
	b=b7qx1JiGKqJQ6+LeX8zktnyvmc7uroLj+/xhgc6W4ori35Rsxol5XXeweubzpHbSn/
	fy23cKwdqAqzuVacrwIvR4lCTkzD75BwSDmxPwMifI+BWBA/YEHG5b9SFsAUstBeBorX
	hwFq2F0ui/lYWnnmKVrNSrd1mCKTUx4p9ql8fAlNKQSKUx6LRI/Gd9dhqMDIykHIUeRy
	eUV8mP1PVox1UvBYl7C79j4jtxBioO6QxHI8yK2P28sNi60MzXg5BYxinmdo5cCI9b03
	pGsmEB0B3lNbrSJDicsafT9B9NlzOaMhhhrYwD+qb+kWkfrkeDbsFewUVWBzQm8Oi+pD
	Pk+g==
X-Gm-Message-State: APjAAAW3i5qezG9bl0qJbI1lfiBSXLtOtHem1nlPk6jBUeH6gP+TCmcf
	hAsUpckksI6PeNZjABtBs7y1YXnr1ruzWwee87Y=
X-Google-Smtp-Source: APXvYqxubwUqvW1JPWn1giFh1wJa+5oUTbbz2g46FqX5qv5siGbZ3j3I5A8lpgH0hDIj4LncNkwWl4107V2rE/jA4wA=
X-Received: by 2002:ac8:1183:: with SMTP id d3mr6501683qtj.53.1564180071972;
	Fri, 26 Jul 2019 15:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
	<5D3A65EA.9090601@windriver.com>
	<CADkTA4OS653HqdcG8nm=VqmUQ85m-tPniauwUD8a=gZZY-3whQ@mail.gmail.com>
	<5D3A6DB3.9080207@windriver.com>
	<CADkTA4NOAUebSDV2dUZzhoKS2pQefZentgwrXeaEOT3W8qxMzg@mail.gmail.com>
	<cdafa962-f7b1-bf15-c3bf-fa10bb76d160@gmail.com>
In-Reply-To: <cdafa962-f7b1-bf15-c3bf-fa10bb76d160@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jul 2019 15:27:36 -0700
Message-ID: <CAMKF1spDOFiZQ22QnHHnhnyyX_oOtuF1NjrLDiAdMVYgtoUM5Q@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libseccomp: import from meta-security
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
X-List-Received-Date: Fri, 26 Jul 2019 22:27:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2019 at 2:00 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 7/25/19 8:23 PM, Bruce Ashfield wrote:
> > On Thu, Jul 25, 2019 at 11:01 PM Yu, Mingli <mingli.yu@windriver.com> w=
rote:
> >>
> >>
> >> On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 10:46, Bruce Ashfield wrote:
> >>>
> >>> On Thu, Jul 25, 2019 at 10:28 PM Yu, Mingli <mingli.yu@windriver.com
> >>> <mailto:mingli.yu@windriver.com>> wrote:
> >>>
> >>>
> >>>
> >>>     On 2019=E5=B9=B407=E6=9C=8825=E6=97=A5 21:45, Bruce Ashfield wrot=
e:
> >>>      > On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com
> >>>     <mailto:mingli.yu@windriver.com>> wrote:
> >>>      >>
> >>>      >> From: Mingli Yu <Mingli.Yu@windriver.com
> >>>     <mailto:Mingli.Yu@windriver.com>>
> >>>      >
> >>>      > Can you share some details as to why this should be pulled fro=
m
> >>>      > meta-security into a different repo ?
> >>>
> >>>     Considering there is also some security related recipe under
> >>>     meta-oe/recipes-security/, I think it's not strange to add a new =
one
> >>>     libseccomp and libseccomp also provides a basic common filtering
> >>>     mechanism.
> >>>
> >>>
> >>> .. but it is literally churn for the sake of churn.
> >>>
> >>> Meaning, that isn't a great reason to move something. If Armin wanted=
 to
> >>> put the recipe in meta-oe, he would have done it himself.
> >> ^_^, I noticed Armin did try to do this in this thread "[oe]
> >> [meta-oe][PATCH 1/2] libseccomp: move lib from meta-security to meta-o=
e"
> >> in Jun 1, 2018.
> > In that case, follow up to that thread so folks can remember why it
> > didn't happen, or check to see if it was simply forgotten. Putting the
> > maintainers on the cc' from the start of something like this helps
> > immensely.
> >
> > But I see you added Armin to this thread, so that should be enough.
>
> I am fine if we move the recipe. The issue was Khem didn't want the
> "bash" dependency and I never followed up to clean that up.
>

I think this cleanup would be good to have before we move this in. It
has built well
in preliminary build testing, since there are recipes in meta-oe using
this package it
will become a common place to have it so there might be value.

Other way would be to see if security-recipes in meta-oe could be
moved out into meta-security

> I would have responded sooner but this is the first time I have reliable
> Internet.
>
> - armin
> >
> > Bruce
> >
> >>>
> >>>     Meanwhile, the below yocto compliance check error disappears once=
 we
> >>>     move libseccomp from meta-security to meta-oe.
> >>>     ERROR: Nothing PROVIDES 'libseccomp' (but
> >>>     /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cr=
i-o_git.bb
> >>>     <http://cri-o_git.bb>
> >>>     DEPENDS on or otherwise requires it).
> >>>     Close matches:
> >>>     libcomps
> >>>     ERROR: Required build target 'meta-world-pkgdata' has no buildabl=
e
> >>>     providers.
> >>>
> >>>     Missing or unbuildable dependency chain was: ['meta-world-pkgdata=
',
> >>>     'cri-o', 'libseccomp']
> >>>
> >>>
> >>> Also not a valid reason. We've just fixed meta-virtualization, so
> >>> there's no need to shuffle something like this around, just to keep
> >>> another layers compliance check working.
> >>>
> >>> Bruce
> >>>
> >>>
> >>>     Thanks,
> >>>
> >>>      >
> >>>      > It seems to fit the mandate of meta-security quite nicely ;)
> >>>      >
> >>>      > Is there some sort of dependency issue, or other technical pro=
blem
> >>>      > that is causing a problem ?
> >>>      >
> >>>      > Bruce
> >>>      >
> >>>      >>
> >>>      >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
> >>>     <mailto:Mingli.Yu@windriver.com>>
> >>>      >> ---
> >>>      >>   .../recipes-security/libseccomp/files/run-ptest    |  4 +++
> >>>      >>   .../libseccomp/libseccomp_2.4.1.bb
> >>>     <http://libseccomp_2.4.1.bb>                 | 41 +++++++++++++++=
+++++++
> >>>      >>   2 files changed, 45 insertions(+)
> >>>      >>   create mode 100644
> >>>     meta-oe/recipes-security/libseccomp/files/run-ptest
> >>>      >>   create mode 100644
> >>>     meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >>>     <http://libseccomp_2.4.1.bb>
> >>>      >>
> >>>      >> diff --git a/meta-oe/recipes-security/libseccomp/files/run-pt=
est
> >>>     b/meta-oe/recipes-security/libseccomp/files/run-ptest
> >>>      >> new file mode 100644
> >>>      >> index 0000000..54b4a63
> >>>      >> --- /dev/null
> >>>      >> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
> >>>      >> @@ -0,0 +1,4 @@
> >>>      >> +#!/bin/sh
> >>>      >> +
> >>>      >> +cd tests
> >>>      >> +./regression -a
> >>>      >> diff --git
> >>>     a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >>>     <http://libseccomp_2.4.1.bb>
> >>>     b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >>>     <http://libseccomp_2.4.1.bb>
> >>>      >> new file mode 100644
> >>>      >> index 0000000..dba1be5
> >>>      >> --- /dev/null
> >>>      >> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >>>     <http://libseccomp_2.4.1.bb>
> >>>      >> @@ -0,0 +1,41 @@
> >>>      >> +SUMMARY =3D "interface to seccomp filtering mechanism"
> >>>      >> +DESCRIPTION =3D "The libseccomp library provides and easy to=
 use,
> >>>     platform independent,interface to the Linux Kernel's syscall
> >>>     filtering mechanism: seccomp."
> >>>      >> +SECTION =3D "security"
> >>>      >> +LICENSE =3D "LGPL-2.1"
> >>>      >> +LIC_FILES_CHKSUM =3D
> >>>     "file://LICENSE;beginline=3D0;endline=3D1;md5=3D8eac08d2211388035=
7ceb8e7c37f989f"
> >>>      >> +
> >>>      >> +SRCREV =3D "fb43972ea1aab24f2a70193fb7445c2674f594e3"
> >>>      >> +
> >>>      >> +SRC_URI =3D
> >>>     "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.4
> >>>     <http://github.com/seccomp/libseccomp.git;branch=3Drelease-2.4> \
> >>>      >> +           file://run-ptest \
> >>>      >> +"
> >>>      >> +
> >>>      >> +S =3D "${WORKDIR}/git"
> >>>      >> +
> >>>      >> +inherit autotools-brokensep pkgconfig ptest
> >>>      >> +
> >>>      >> +PACKAGECONFIG ??=3D ""
> >>>      >> +PACKAGECONFIG[python] =3D "--enable-python, --disable-python=
, python"
> >>>      >> +
> >>>      >> +do_compile_ptest() {
> >>>      >> +    oe_runmake -C tests check-build
> >>>      >> +}
> >>>      >> +
> >>>      >> +do_install_ptest() {
> >>>      >> +    install -d ${D}${PTEST_PATH}/tests
> >>>      >> +    install -d ${D}${PTEST_PATH}/tools
> >>>      >> +    for file in $(find tests/* -executable -type f); do
> >>>      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >>>      >> +    done
> >>>      >> +    for file in $(find tests/*.tests -type f); do
> >>>      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >>>      >> +    done
> >>>      >> +    for file in $(find tools/* -executable -type f); do
> >>>      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> >>>      >> +    done
> >>>      >> +}
> >>>      >> +
> >>>      >> +FILES_${PN} =3D "${bindir} ${libdir}/${BPN}.so*"
> >>>      >> +FILES_${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/*
> >>>     ${libdir}/${PN}/tools/.debug"
> >>>      >> +
> >>>      >> +RDEPENDS_${PN}-ptest =3D "bash"
> >>>      >> --
> >>>      >> 2.7.4
> >>>      >>
> >>>      >> --
> >>>      >> _______________________________________________
> >>>      >> Openembedded-devel mailing list
> >>>      >> Openembedded-devel@lists.openembedded.org
> >>>     <mailto:Openembedded-devel@lists.openembedded.org>
> >>>      >> http://lists.openembedded.org/mailman/listinfo/openembedded-d=
evel
> >>>      >
> >>>      >
> >>>      >
> >>>
> >>>
> >>>
> >>> --
> >>> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >>> thee at its end
> >>> - "Use the force Harry" - Gandalf, Star Trek II
> >>>
> >
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

