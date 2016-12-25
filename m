Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7092C71A05
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 23:55:54 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id kp2so47006609wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Dec 2016 15:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sQHdHI2L3I/x+xjw5qw70Ss9B+DBbk0cnOW8Q4O6+YU=;
	b=CT4kuYl5t/NXqRJG8yTa6CkOFM4r6x/dmgVTdlJNQSEG65GTaG86A+xfv7yXGD0lQK
	DOH+O2Cqifo+5zGDqbX43CwYRP/98tgY7ntAqcsZv4ozjnO8YxKYKJawrLx8J41wL1bb
	YiXkpzAmhmGFnW5c3oRp9itWE4XrTXhNpjK+KWLufpk+Uz1TwNdnQPUaVDVZzMkLh5xl
	EwRjZI1EJO+1/xWGDUklrxIooeaiJ1Rt5jDAZEyichYp4RwdqJvzfi6D3rWFHwdbrdwb
	dw73rRxzJ1GGnvEHWs8StodwJaWKAtQQpgr/wPQg8crjk8JyfiFBhYCkq5bXNFccJKfm
	9LIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sQHdHI2L3I/x+xjw5qw70Ss9B+DBbk0cnOW8Q4O6+YU=;
	b=AbYVrn6PMyd81Dgtq7l/M45MHqpKIrqQDA922jz+KwTjl3m+K5wta3xk5wLYm8UAHu
	23gGrfhSkMPi2B4ZeDAl4NASU9+vUNry1tH3Mzrfb0yPy4c/82CrEjJXjQRz76f6ndfJ
	MzsFJ5E8ZaNQE7MXwSDLsoRxdmz4j7tVrSlNjs0xbZUdGcxO4WooMJqeIsMeCPSO6zFx
	J7/jIGv8J6fvyfxUhbNt716Wr3amvK+etzxC8fCbtv0fe4uwetELCPdA5/uBBsgsCXc/
	AAS1UB9DEi7TUscO0ZVKOUgKCfs0TDX448usC+iTi6toJTSmxuPrvpGTItuVUT/IrRCb
	PTVg==
X-Gm-Message-State: AIkVDXIBpGuPwtc4/dr9hnUIGkAdKGmcpnDUq4gCHH2WbgHext9q63jQK7nBbU4AdU0+wq+UCJUOjxOKmZASeQ==
X-Received: by 10.194.41.163 with SMTP id g3mr20992859wjl.162.1482710155206;
	Sun, 25 Dec 2016 15:55:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Sun, 25 Dec 2016 15:55:54 -0800 (PST)
In-Reply-To: <CAMKF1srxNFSR2sr1akxGsFCMM38PWHK+WoL63GL1=HshneOYLA@mail.gmail.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
	<CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
	<CABcZANm4R2Lg5oNLbYihDjH-cxCq-=sKt6BXBcF6es-8z=khuw@mail.gmail.com>
	<CAMKF1srxNFSR2sr1akxGsFCMM38PWHK+WoL63GL1=HshneOYLA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Dec 2016 00:55:54 +0100
Message-ID: <CA+chaQesRK_aTrcYM5Ow+TeNXtLkvzr3+dAxjKFvoLaQn_Fbuw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Haris Okanovic <haris.okanovic@ni.com>
Subject: Re: [PATCH] hwloc: Add
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
X-List-Received-Date: Sun, 25 Dec 2016 23:56:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Missing dependencies and PACKAGES_prepend breaks hwloc-dbg, because of
missing space at the end of the prepended value.



hwloc-1.11.5: hwloc: Files/directories were installed but not shipped
in any package:
  /usr/src
  /usr/src/debug
  /usr/src/debug/hwloc
  /usr/src/debug/hwloc/1.11.5-r0
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5
  /usr/src/debug/hwloc/1.11.5-r0/build
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-xml.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-text.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-fig.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-draw.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-color.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-cairo.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/lstopo/lstopo-ascii.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/misc.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-ps.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-patch.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-info.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-dump-hwdata=
.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-dump-hwdata=
-knl.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-distrib.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-distances.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-diff.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-calc.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-calc.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-bind.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-assembler.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/utils/hwloc/hwloc-annotate.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/traversal.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-xml.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-xml-nolibxml.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-xml-libxml.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-x86.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-synthetic.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-pci.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-noos.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-linux.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-hardwired.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/topology-custom.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/pci-common.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/misc.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/distances.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/diff.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/components.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/bitmap.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/bind.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/src/base64.c
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/xml.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/private.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/misc.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/debug.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/cpuid-x86.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/private/components.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/plugins.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/linux.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/inlines.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/helper.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/diff.h
  /usr/src/debug/hwloc/1.11.5-r0/hwloc-1.11.5/include/hwloc/bitmap.h
  /usr/src/debug/hwloc/1.11.5-r0/build/src
  /usr/src/debug/hwloc/1.11.5-r0/build/include
  /usr/src/debug/hwloc/1.11.5-r0/build/src/static-components.h
  /usr/src/debug/hwloc/1.11.5-r0/build/include/hwloc
  /usr/src/debug/hwloc/1.11.5-r0/build/include/hwloc/autogen
  /usr/src/debug/hwloc/1.11.5-r0/build/include/hwloc/autogen/config.h
Please set FILES such that these items are packaged. Alternatively if
they are unneeded, avoid installing them or delete them within
do_install.
hwloc: 75 installed and not shipped files. [installed-vs-shipped]
hwloc-1.11.5: hwloc rdepends on numactl, but it isn't a build
dependency, missing numactl in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on cairo, but it isn't a build
dependency, missing cairo in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on libpciaccess, but it isn't a build
dependency, missing libpciaccess in DEPENDS or PACKAGECONFIG?
[build-deps]
hwloc-1.11.5: hwloc rdepends on libx11, but it isn't a build
dependency, missing libx11 in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on libcap, but it isn't a build
dependency, missing libcap in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on zlib, but it isn't a build dependency,
missing zlib in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on ncurses-libtinfo, but it isn't a build
dependency, missing ncurses in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on libxml2, but it isn't a build
dependency, missing libxml2 in DEPENDS or PACKAGECONFIG? [build-deps]
hwloc-1.11.5: hwloc rdepends on libudev, but it isn't a build
dependency, missing systemd in DEPENDS or PACKAGECONFIG? [build-deps]


On Thu, Dec 22, 2016 at 11:56 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Dec 22, 2016 at 2:35 PM, Christopher Larson <clarson@kergoth.com>
> wrote:
> > On Thu, Dec 22, 2016 at 2:34 PM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> SUMMARY is for short summary, put long one into DESCRIPTION and create
> >> short one for SUMMARY.
> >>
> >> Also missing sha265sum, so I doubt it was tested properly.
> >>
> >> On Thu, Dec 22, 2016 at 9:02 PM, Haris Okanovic <haris.okanovic@ni.com=
>
> >> wrote:
> >>
> >> > https://www.open-mpi.org/projects/hwloc/
> >> >
> >> > "The Portable Hardware Locality (hwloc) software package provides a
> >> > portable abstraction (across OS, versions, architectures, ...) of th=
e
> >> > hierarchical topology of modern architectures, including NUMA memory
> >> > nodes, sockets, shared caches, cores and simultaneous multithreading=
.
> >> > It also gathers various system attributes such as cache and memory
> >> > information as well as the locality of I/O devices such as network
> >> > interfaces, InfiniBand HCAs or GPUs."
> >> >
> >> > This recipe adds libhwloc and lstopo utility as two packages.
> >> >
> >> > Testing: Built in OE/Krogoth. Installed to x86_64 machine.
> Successfully
> >> > ran `lstopo` and verified it printed correct CPU and cache info.
> >> >
> >> > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> >> > ---
> >> >  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 25
> >> > +++++++++++++++++++++++++
> >> >  1 file changed, 25 insertions(+)
> >> >  create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> >> >
> >> > diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> >> > b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> >> > new file mode 100644
> >> > index 0000000..3a88f5b
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> >> > @@ -0,0 +1,25 @@
> >> > +SUMMARY =3D "The Portable Hardware Locality (hwloc) software packag=
e \
> >> > + provides a portable abstraction of the hierarchical topology of
> modern
> >> \
> >> > + architectures."
> >> > +HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
> >> > +SECTION =3D "base"
> >> > +LICENSE =3D "BSD"
> >> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D
> 3282e20dc3cec311deda3c6d4b1f99
> >> 0b"
> >> > +
> >> > +SRC_URI =3D "https://www.open-mpi.org/software/${PN}/v1.11/
> >> > downloads/${BP}.tar.bz2"
> >> > +SRC_URI[md5sum] =3D "96c34136ff416d2b13a7821c27477bed"
> >> > +
> >> > +inherit autotools
> >> > +
> >> > +# Split hwloc library into separate subpackage
> >> > +PACKAGES_prepend =3D "lib${PN}"
> >> > +FILES_lib${PN} +=3D "${libdir}/lib${PN}.so*"
> >> > +${PN}_RDEPENDS +=3D "lib${PN}"
> >> > +
> >> > +do_install_append() {
> >> > +    # Let ldconfig do it's thing, no need for these symlinks
> >> > +    test -L "${D}${libdir}/lib${PN}.so.5"
> >> > +    test -L "${D}${libdir}/lib${PN}.so"
> >> > +    rm "${D}${libdir}/lib${PN}.so.5"
> >> > +    rm "${D}${libdir}/lib${PN}.so"
> >>
> >
> > This link manipulation is also inconsistent with every other recipe. It=
=E2=80=99s
> > not appropriate. If your distro wants to rely on ldconfig to handle the
> > links, then your distro could do this for all recipes rather than just
> one.
> > This isn=E2=80=99t how things are done in our existing recipes.
>
> There is global knob USE_LDCONFIG, perhaps thats what could be used
> but generally I agree with Chris here.
>
> > --
> > Christopher Larson
> > clarson at kergoth dot com
> > Founder - BitBake, OpenEmbedded, OpenZaurus
> > Maintainer - Tslib
> > Senior Software Engineer, Mentor Graphics
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

