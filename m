Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id C22197C85D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jul 2019 02:47:02 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id u25so35999478wmc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jul 2019 19:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sFPMtqjUlY09FwIWB+yvgm5QgGT6ypOOCqs86Ao90Vo=;
	b=HDHv3Bdr9uK4kSbEL+b3rZlQRk2PcXYBLl2RNR8o9iZhic6GwpXMvhiDKDyMg8CFn9
	HrVJ/6YknhBaDflkpdl5e5uaQ2gQvxjFI1mpPM21iBw0+hzEqNixlXIBVqq02IoiXYx1
	UqPclPkLVxg/UN/KeswtGii2dOVNDhL7AAIqkzbPRTrZPTRPmWcaMliQJcGL2voFxb4B
	01ZSNgCBGlGq+duZIkkmsMxFTidWuT5URLp/msw6etNg0sL637D9CvtN2zIoXQp1/v7d
	mjQWW+doWx+GWVDT4aTyhhgEeza7k69bnxJmn2bw2crEIp7bqxi9GS0tfVRctXE+av/e
	tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sFPMtqjUlY09FwIWB+yvgm5QgGT6ypOOCqs86Ao90Vo=;
	b=sdEE8Jo9ysIBgM1egWhIZK41V/X58Jbygs8UBDG9XLNPPatkRgRkinvG7QjNHTu6ih
	6OCy7sa8SxILWe6FIJyyvHGsSNiV4MKHtBJPe+zfq12rHvQET+f2O8y2c7siJSZLoEEt
	+OjC+ObJyQ3+wyEMkdQjZD/5FCyaqoR2/DskiS3ysX1J1SiU491NRPIjIlWJhgRXIHfu
	bsg5QQ7aE1jaDSAr43gx71mItCnzG2U1V4/joYXoT56iAFATS/wrKU8jAxxW97HARpK6
	byKz392y89VRv3Qi2EoW/qidZ9clvLgLrCzzEiBue9p7XiIEpdHyjxGjYn2hQGkfeaN9
	HXlQ==
X-Gm-Message-State: APjAAAWICTBWYeT6mXXhdNP1zEbaz8MVYAivVnk8eu7T21gIwgAhPfPW
	8w99uSk/O7D3tZ4DWqxTcQ0Go76ehvNHYQzu0un1ux5f
X-Google-Smtp-Source: APXvYqx+ahIFX5veuhnjYXroRvqps32/k1OINZ/jqkv9LDSltBhewCWrSP95pgq7MI8xdseN8YT/uFYnZnADtF9rT5g=
X-Received: by 2002:a1c:b457:: with SMTP id d84mr86694102wmf.153.1564109223092;
	Thu, 25 Jul 2019 19:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <1564038385-372982-1-git-send-email-mingli.yu@windriver.com>
	<CADkTA4N3zMSfjBe=eOvvbrArfXEenwpYZcJGgwqt2Mhrr-1tGw@mail.gmail.com>
	<5D3A65EA.9090601@windriver.com>
In-Reply-To: <5D3A65EA.9090601@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 22:46:51 -0400
Message-ID: <CADkTA4OS653HqdcG8nm=VqmUQ85m-tPniauwUD8a=gZZY-3whQ@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 26 Jul 2019 02:47:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2019 at 10:28 PM Yu, Mingli <mingli.yu@windriver.com> wrote=
:

>
>
> On 2019=E5=B9=B407=E6=9C=8825=E6=97=A5 21:45, Bruce Ashfield wrote:
> > On Thu, Jul 25, 2019 at 3:06 AM <mingli.yu@windriver.com> wrote:
> >>
> >> From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > Can you share some details as to why this should be pulled from
> > meta-security into a different repo ?
>
> Considering there is also some security related recipe under
> meta-oe/recipes-security/, I think it's not strange to add a new one
> libseccomp and libseccomp also provides a basic common filtering mechanis=
m.
>

.. but it is literally churn for the sake of churn.

Meaning, that isn't a great reason to move something. If Armin wanted to
put the recipe in meta-oe, he would have done it himself.



>
> Meanwhile, the below yocto compliance check error disappears once we
> move libseccomp from meta-security to meta-oe.
> ERROR: Nothing PROVIDES 'libseccomp' (but
> /buildarea/layers/meta-virtualization/recipes-containers/cri-o/
> cri-o_git.bb
> DEPENDS on or otherwise requires it).
> Close matches:
> libcomps
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
>
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'cri-o', 'libseccomp']
>

Also not a valid reason. We've just fixed meta-virtualization, so there's
no need to shuffle something like this around, just to keep another layers
compliance check working.

Bruce



>
> Thanks,
>
> >
> > It seems to fit the mandate of meta-security quite nicely ;)
> >
> > Is there some sort of dependency issue, or other technical problem
> > that is causing a problem ?
> >
> > Bruce
> >
> >>
> >> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> >> ---
> >>   .../recipes-security/libseccomp/files/run-ptest    |  4 +++
> >>   .../libseccomp/libseccomp_2.4.1.bb                 | 41
> ++++++++++++++++++++++
> >>   2 files changed, 45 insertions(+)
> >>   create mode 100644 meta-oe/recipes-security/libseccomp/files/run-pte=
st
> >>   create mode 100644 meta-oe/recipes-security/libseccomp/
> libseccomp_2.4.1.bb
> >>
> >> diff --git a/meta-oe/recipes-security/libseccomp/files/run-ptest
> b/meta-oe/recipes-security/libseccomp/files/run-ptest
> >> new file mode 100644
> >> index 0000000..54b4a63
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-security/libseccomp/files/run-ptest
> >> @@ -0,0 +1,4 @@
> >> +#!/bin/sh
> >> +
> >> +cd tests
> >> +./regression -a
> >> diff --git a/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >> new file mode 100644
> >> index 0000000..dba1be5
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-security/libseccomp/libseccomp_2.4.1.bb
> >> @@ -0,0 +1,41 @@
> >> +SUMMARY =3D "interface to seccomp filtering mechanism"
> >> +DESCRIPTION =3D "The libseccomp library provides and easy to use,
> platform independent,interface to the Linux Kernel's syscall filtering
> mechanism: seccomp."
> >> +SECTION =3D "security"
> >> +LICENSE =3D "LGPL-2.1"
> >> +LIC_FILES_CHKSUM =3D
> "file://LICENSE;beginline=3D0;endline=3D1;md5=3D8eac08d22113880357ceb8e7c=
37f989f"
> >> +
> >> +SRCREV =3D "fb43972ea1aab24f2a70193fb7445c2674f594e3"
> >> +
> >> +SRC_URI =3D "git://github.com/seccomp/libseccomp.git;branch=3Drelease=
-2.4
> \
> >> +           file://run-ptest \
> >> +"
> >> +
> >> +S =3D "${WORKDIR}/git"
> >> +
> >> +inherit autotools-brokensep pkgconfig ptest
> >> +
> >> +PACKAGECONFIG ??=3D ""
> >> +PACKAGECONFIG[python] =3D "--enable-python, --disable-python, python"
> >> +
> >> +do_compile_ptest() {
> >> +    oe_runmake -C tests check-build
> >> +}
> >> +
> >> +do_install_ptest() {
> >> +    install -d ${D}${PTEST_PATH}/tests
> >> +    install -d ${D}${PTEST_PATH}/tools
> >> +    for file in $(find tests/* -executable -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >> +    done
> >> +    for file in $(find tests/*.tests -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
> >> +    done
> >> +    for file in $(find tools/* -executable -type f); do
> >> +        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
> >> +    done
> >> +}
> >> +
> >> +FILES_${PN} =3D "${bindir} ${libdir}/${BPN}.so*"
> >> +FILES_${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/*
> ${libdir}/${PN}/tools/.debug"
> >> +
> >> +RDEPENDS_${PN}-ptest =3D "bash"
> >> --
> >> 2.7.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> >
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

