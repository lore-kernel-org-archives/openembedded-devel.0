Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0D24A77726
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:35:21 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id v84so34194365oie.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=dLmET5AFW4iHfc8oOmlyQXtyl797OgJUQiz5jfwUN1k=;
	b=Ld5kmTlKssBMIVpcJyNOD0FndRoVsKxvmo9AkBdkbA3KVTddaipWn2pMtG3WPcwuGy
	lwO7UkssV7ZXa92KMAdzH4SxEw9mgk0cbPkqzYSdJiNPNH7+dOAnuBerf7hUZFnoSa7N
	f0CiiqAcfMo3I+Km3rGIJ/+H7EeTmln8/1CaFRy51PpheLSQudWBCoLKR43bh5CnDrEU
	5q7nVlb24BDbfybl0mEs+pIAyRCH4Gkmht+4yHkbyvK37fa+eDXfYlE0eA5+kTJbPOj8
	T/LpEsUbV+fqrcyUSA1VHm8rKZO3vpLqsmeoMECN5KTTt3hmHTEmbtn4eTgrK5vyYwYn
	Y09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=dLmET5AFW4iHfc8oOmlyQXtyl797OgJUQiz5jfwUN1k=;
	b=Op6TGpWm5bCWyWusjzTEKgriv6173LD1jJ/EsWtnl3BfYz9hs4aZmDtIaWhJHh0R1L
	B7xpLrpOGkhlQ2vIMWX3AVPojJW/64e7wERP30y6RdMikILaO7v2AN79FvuGrINERvSI
	/jTSt1ufIm0xIFuIRzF3KT5kcexlflx7poW59GOMQExjPQusH4A4zPmX68qhs99q6Ppb
	owvW7HCVePq+PROUqjlcT5HaT3t6VGLXT+ERnyvEKhz+eEvsH6WcuSLJwU8rkjhSBLVJ
	i+kmxNp47zIO2tnBBcnNjh/G88iJClkTdmxW+j5D2kFg4TDZ9LtV9Z3fGbnmTno/M3Gb
	NjbQ==
X-Gm-Message-State: AIkVDXIfQQIdBYs05ruV/WDHyo99VqR51efMP2DkT1Gv+OfLPVXE2HcfjXxWeWRVEbM7LPmo1cJySddTjo9MWQ==
X-Received: by 10.202.231.68 with SMTP id e65mr6351843oih.200.1482446122790;
	Thu, 22 Dec 2016 14:35:22 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.19.10 with HTTP; Thu, 22 Dec 2016 14:35:02 -0800 (PST)
In-Reply-To: <CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
	<CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 22 Dec 2016 15:35:02 -0700
X-Google-Sender-Auth: PihiNpmPQvNVOtpQGuxjidas1to
Message-ID: <CABcZANm4R2Lg5oNLbYihDjH-cxCq-=sKt6BXBcF6es-8z=khuw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 22 Dec 2016 22:35:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2016 at 2:34 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> SUMMARY is for short summary, put long one into DESCRIPTION and create
> short one for SUMMARY.
>
> Also missing sha265sum, so I doubt it was tested properly.
>
> On Thu, Dec 22, 2016 at 9:02 PM, Haris Okanovic <haris.okanovic@ni.com>
> wrote:
>
> > https://www.open-mpi.org/projects/hwloc/
> >
> > "The Portable Hardware Locality (hwloc) software package provides a
> > portable abstraction (across OS, versions, architectures, ...) of the
> > hierarchical topology of modern architectures, including NUMA memory
> > nodes, sockets, shared caches, cores and simultaneous multithreading.
> > It also gathers various system attributes such as cache and memory
> > information as well as the locality of I/O devices such as network
> > interfaces, InfiniBand HCAs or GPUs."
> >
> > This recipe adds libhwloc and lstopo utility as two packages.
> >
> > Testing: Built in OE/Krogoth. Installed to x86_64 machine. Successfully
> > ran `lstopo` and verified it printed correct CPU and cache info.
> >
> > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
> > ---
> >  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 25
> > +++++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> >
> > diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> > b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> > new file mode 100644
> > index 0000000..3a88f5b
> > --- /dev/null
> > +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
> > @@ -0,0 +1,25 @@
> > +SUMMARY =3D "The Portable Hardware Locality (hwloc) software package \
> > + provides a portable abstraction of the hierarchical topology of moder=
n
> \
> > + architectures."
> > +HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
> > +SECTION =3D "base"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3282e20dc3cec311deda3c6d4b1=
f99
> 0b"
> > +
> > +SRC_URI =3D "https://www.open-mpi.org/software/${PN}/v1.11/
> > downloads/${BP}.tar.bz2"
> > +SRC_URI[md5sum] =3D "96c34136ff416d2b13a7821c27477bed"
> > +
> > +inherit autotools
> > +
> > +# Split hwloc library into separate subpackage
> > +PACKAGES_prepend =3D "lib${PN}"
> > +FILES_lib${PN} +=3D "${libdir}/lib${PN}.so*"
> > +${PN}_RDEPENDS +=3D "lib${PN}"
> > +
> > +do_install_append() {
> > +    # Let ldconfig do it's thing, no need for these symlinks
> > +    test -L "${D}${libdir}/lib${PN}.so.5"
> > +    test -L "${D}${libdir}/lib${PN}.so"
> > +    rm "${D}${libdir}/lib${PN}.so.5"
> > +    rm "${D}${libdir}/lib${PN}.so"
>

This link manipulation is also inconsistent with every other recipe. It=E2=
=80=99s
not appropriate. If your distro wants to rely on ldconfig to handle the
links, then your distro could do this for all recipes rather than just one.
This isn=E2=80=99t how things are done in our existing recipes.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

