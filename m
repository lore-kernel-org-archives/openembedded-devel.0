Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9D96C109
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 03:23:36 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h10so50032020ljg.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 20:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y7goWk/DUNwNKL2TDLkX5sjA5tonqerGLELP1wWPcfM=;
	b=QQVRKDhFVys7b5INXmUIjaGPqDmtruU2FhpvtxHVHnvr7SVn0+HE98cu1SgV1LbsKe
	HK9VvvnRibqp+Gjy59kHIs6Hc+7IfL8FHxw5jDYeGdRoEStnm4cYUIcgyU+v1FC6Ltn3
	dtTjjHJkQbyndSTFdCrkuT4VJcR4MNZqAVQl+1gI4f0fN1Mej+lJC7fBrHRl8LI1VMiN
	wFcFJhmbFbddUbcZxzqOLHGT1KjGcoQDNSli4gGnaadWN/1Pu5KtRLPd/C5bJLhJimCx
	NbcNdrynhBMvTXFLlLT0m0kpJSUzWAHnEb/CWa1g57MHTtUAU0tzAa01DFwiO2jW23nv
	qmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y7goWk/DUNwNKL2TDLkX5sjA5tonqerGLELP1wWPcfM=;
	b=CfrxuKio7yhfTx32BhqAIXE2QLnDL6kQTKqM6YBlpC1vbF2nN14GrfKNCCV26+PsAW
	QHJVpfADALegVdUpOlSjRGxgTABFpWRrPFEceoGDNaGRoLLkowFP9ovbVNTsirFtYNEc
	/VUAVipj9g78VrK19xxqfb3994m72STOp701Tx17gWI4t0OQQkU81pJEd+D3gxbWU2sR
	Isyl7rhEHn7J8azKOyGBHpIIHgGFmkOjIKK3JX41OjyBN7BOPNtil/FMRPehFriSa4H4
	PZXUIgwwugyUvpSeNLmqmFdWM9FqT3sEazb24byvtlUzeRVdbj0U3tc9uugdkuIpBJff
	IW8Q==
X-Gm-Message-State: APjAAAVGdVNBfdrvZ/oAC2VqVjjyzlgPc4Ic5eukmYYc+vHUFxlRbBF9
	zd2WgpVBx9UeAyFVs+vfnTt5FEd2wlhMes4TIZU=
X-Google-Smtp-Source: APXvYqxSV9qjb1R1Bqc84XwhvO7Fl1czi0BYCOsWd4Ubkn9I7zc8zIwYhriPKz0N5rgVn2q7MEL9FquJFCFZjNLT0LM=
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr47478765ljj.78.1564111416599; 
	Thu, 25 Jul 2019 20:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
	<5D3A65EA.9090601@windriver.com>
	<CADkTA4OS653HqdcG8nm=VqmUQ85m-tPniauwUD8a=gZZY-3whQ@mail.gmail.com>
	<5D3A6DB3.9080207@windriver.com>
In-Reply-To: <5D3A6DB3.9080207@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 23:23:22 -0400
Message-ID: <CADkTA4NOAUebSDV2dUZzhoKS2pQefZentgwrXeaEOT3W8qxMzg@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
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
X-List-Received-Date: Fri, 26 Jul 2019 03:23:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 11:01 PM Yu, Mingli <mingli.yu@windriver.com> wrote=
:
>
>
>
> On 2019=E5=B9=B407=E6=9C=8826=E6=97=A5 10:46, Bruce Ashfield wrote:
> >
> >
> > On Thu, Jul 25, 2019 at 10:28 PM Yu, Mingli <mingli.yu@windriver.com
> > <mailto:mingli.yu@windriver.com>> wrote:
> >
> >
> >
> >     On 2019=E5=B9=B407=E6=9C=8825=E6=97=A5 21:45, Bruce Ashfield wrote:
> >      > On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com
> >     <mailto:mingli.yu@windriver.com>> wrote:
> >      >>
> >      >> From: Mingli Yu <Mingli.Yu@windriver.com
> >     <mailto:Mingli.Yu@windriver.com>>
> >      >
> >      > Can you share some details as to why this should be pulled from
> >      > meta-security into a different repo ?
> >
> >     Considering there is also some security related recipe under
> >     meta-oe/recipes-security/, I think it's not strange to add a new on=
e
> >     libseccomp and libseccomp also provides a basic common filtering
> >     mechanism.
> >
> >
> > .. but it is literally churn for the sake of churn.
> >
> > Meaning, that isn't a great reason to move something. If Armin wanted t=
o
> > put the recipe in meta-oe, he would have done it himself.
>
> ^_^, I noticed Armin did try to do this in this thread "[oe]
> [meta-oe][PATCH 1/2] libseccomp: move lib from meta-security to meta-oe"
> in Jun 1, 2018.

In that case, follow up to that thread so folks can remember why it
didn't happen, or check to see if it was simply forgotten. Putting the
maintainers on the cc' from the start of something like this helps
immensely.

But I see you added Armin to this thread, so that should be enough.

Bruce

>
> >
> >
> >     Meanwhile, the below yocto compliance check error disappears once w=
e
> >     move libseccomp from meta-security to meta-oe.
> >     ERROR: Nothing PROVIDES 'libseccomp' (but
> >     /buildarea/layers/meta-virtualization/recipes-containers/cri-o/cri-=
o_git.bb
> >     <http://cri-o_git.bb>
> >     DEPENDS on or otherwise requires it).
> >     Close matches:
> >     libcomps
> >     ERROR: Required build target 'meta-world-pkgdata' has no buildable
> >     providers.
> >
> >     Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> >     'cri-o', 'libseccomp']
> >
> >
> > Also not a valid reason. We've just fixed meta-virtualization, so
> > there's no need to shuffle something like this around, just to keep
> > another layers compliance check working.
> >
> > Bruce
> >
> >
> >     Thanks,
> >
> >      >
> >      > It seems to fit the mandate of meta-security quite nicely ;)
> >      >
> >      > Is there some sort of dependency issue, or other technical probl=
em
> >      > that is causing a problem ?
> >      >
> >      > Bruce
> >      >
> >      >>
> >      >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com
> >     <mailto:Mingli.Yu@windriver.com>>
> >      >> ---
> >      >>   .../recipes-security/libseccomp/files/run-ptest    |  4 +++
> >      >>   .../libseccomp/libseccomp_2.4.1.bb
> >     <http://libseccomp_2.4.1.bb>                 | 41 +++++++++++++++++=
+++++
> >      >>   2 files changed, 45 insertions(+)
> >      >>   create mode 100644
> >     meta-oe/recipes-security/libseccomp/files/run-ptest
> >      >>   create mode 100644
> >     meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >     <http://libseccomp_2.4.1.bb>
> >      >>
> >      >> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptes=
t
> >     b/meta-oe/recipes-security/libseccomp/files/run-ptest
> >      >> new file mode 100644
> >      >> index 0000000..54b4a63
> >      >> --- /dev/null
> >      >> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
> >      >> @@ -0,0 +1,4 @@
> >      >> +#!/bin/sh
> >      >> +
> >      >> +cd tests
> >      >> +./regression -a
> >      >> diff --git
> >     a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >     <http://libseccomp_2.4.1.bb>
> >     b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >     <http://libseccomp_2.4.1.bb>
> >      >> new file mode 100644
> >      >> index 0000000..dba1be5
> >      >> --- /dev/null
> >      >> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >     <http://libseccomp_2.4.1.bb>
> >      >> @@ -0,0 +1,41 @@
> >      >> +SUMMARY =3D "interface to seccomp filtering mechanism"
> >      >> +DESCRIPTION =3D "The libseccomp library provides and easy to u=
se,
> >     platform independent,interface to the Linux Kernel's syscall
> >     filtering mechanism: seccomp."
> >      >> +SECTION =3D "security"
> >      >> +LICENSE =3D "LGPL-2.1"
> >      >> +LIC_FILES_CHKSUM =3D
> >     "file://LICENSE;beginline=3D0;endline=3D1;md5=3D8eac08d22113880357c=
eb8e7c37f989f"
> >      >> +
> >      >> +SRCREV =3D "fb43972ea1aab24f2a70193fb7445c2674f594e3"
> >      >> +
> >      >> +SRC_URI =3D
> >     "git://github.com/seccomp/libseccomp.git;branch=3Drelease-2.4
> >     <http://github.com/seccomp/libseccomp.git;branch=3Drelease-2.4> \
> >      >> +           file://run-ptest \
> >      >> +"
> >      >> +
> >      >> +S =3D "${WORKDIR}/git"
> >      >> +
> >      >> +inherit autotools-brokensep pkgconfig ptest
> >      >> +
> >      >> +PACKAGECONFIG ??=3D ""
> >      >> +PACKAGECONFIG[python] =3D "--enable-python, --disable-python, =
python"
> >      >> +
> >      >> +do_compile_ptest() {
> >      >> +    oe_runmake -C tests check-build
> >      >> +}
> >      >> +
> >      >> +do_install_ptest() {
> >      >> +    install -d ${D}${PTEST_PATH}/tests
> >      >> +    install -d ${D}${PTEST_PATH}/tools
> >      >> +    for file in $(find tests/* -executable -type f); do
> >      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >      >> +    done
> >      >> +    for file in $(find tests/*.tests -type f); do
> >      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >      >> +    done
> >      >> +    for file in $(find tools/* -executable -type f); do
> >      >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> >      >> +    done
> >      >> +}
> >      >> +
> >      >> +FILES_${PN} =3D "${bindir} ${libdir}/${BPN}.so*"
> >      >> +FILES_${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/*
> >     ${libdir}/${PN}/tools/.debug"
> >      >> +
> >      >> +RDEPENDS_${PN}-ptest =3D "bash"
> >      >> --
> >      >> 2.7.4
> >      >>
> >      >> --
> >      >> _______________________________________________
> >      >> Openembedded-devel mailing list
> >      >> Openembedded-devel@lists.openembedded.org
> >     <mailto:Openembedded-devel@lists.openembedded.org>
> >      >> http://lists.openembedded.org/mailman/listinfo/openembedded-dev=
el
> >      >
> >      >
> >      >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

