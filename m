Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 413E477724
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 22:57:23 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 2so13612224uax.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ajwd7Ig5G/1rMODMxfk15X39KVETpWlBpTtF4DXksj8=;
	b=boaIjg5mkrSop0SwULHzCnWAudJQJzJ2yHAP8yMuE+1WBo6wdljgRkSY4oDwDkX+V+
	NRu8RsmEuXdudCgvizEEK01BTFJLJilEz81QININKYYt6gPW0P9Qw+10KGbdgmYAk7Oq
	tT6TEOJFDwDkkVIQ7NC/ovxj7Hb9tewRHKv7tmHvB6cR4zrmaOuylJWmAn3dwCYOmVCp
	yOTV6kl/unULCzMz7IHWHFHtLkS3aXe0bKD9brjYSvyZ5dy5ZtyXfHeNPu//Wmh7XPPG
	7w1GgnSCHnQVDGnQJ49WxNnA4pHksp2Sx8iGh1lVjqRb/+9lGM7hDcIjmAwZ8lESEN8M
	DtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ajwd7Ig5G/1rMODMxfk15X39KVETpWlBpTtF4DXksj8=;
	b=B2x7ZNwN/v4BmwDvZYEfpE2yderzf0ERH0x80Nm4xSNurGVkdG0x+IQpuUGLfoCqb2
	TiQbnz1Ia6Rg/tGzpgCW86vvFkfJRc+am5oeqkpcQAoLVeOnwHJbCOwq3IdLJptofVIa
	B+zz1ynhuKhAuXgbnm8d+1a97LlCL0pnlmq8ZZEsXiShbvtEv+maH0+RuRofd+t0/ETp
	EGzQVRb5tR4UNzdillqIczv472IKyfF+1khdR6tOk+6Crc/MTyC/mt4Rw4Pe45Vfe8nK
	gRx+jAIfigmy/oTlgwjBR+eC9sRYrli0fCS4TfpMpNB2DSx/7Z5RaypE6apLYsSh8OjJ
	Qa7Q==
X-Gm-Message-State: AIkVDXIHC+ORqjGH3uFcUW2uBVMJcedwBludX7mV2rPkaY0hhwUuCD0CFfk0huU7mlQ4Hzmru/uscy1tjOAP/g==
X-Received: by 10.176.71.86 with SMTP id i22mr197912uac.31.1482447444749; Thu,
	22 Dec 2016 14:57:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 22 Dec 2016 14:56:54 -0800 (PST)
In-Reply-To: <CABcZANm4R2Lg5oNLbYihDjH-cxCq-=sKt6BXBcF6es-8z=khuw@mail.gmail.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
	<CA+chaQd3YPtvxY7CN82m86v5V=fyaYk3pWs4fF9TqFknWzE7HA@mail.gmail.com>
	<CABcZANm4R2Lg5oNLbYihDjH-cxCq-=sKt6BXBcF6es-8z=khuw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Dec 2016 14:56:54 -0800
Message-ID: <CAMKF1srxNFSR2sr1akxGsFCMM38PWHK+WoL63GL1=HshneOYLA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 22 Dec 2016 22:57:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2016 at 2:35 PM, Christopher Larson <clarson@kergoth.com> w=
rote:
> On Thu, Dec 22, 2016 at 2:34 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> SUMMARY is for short summary, put long one into DESCRIPTION and create
>> short one for SUMMARY.
>>
>> Also missing sha265sum, so I doubt it was tested properly.
>>
>> On Thu, Dec 22, 2016 at 9:02 PM, Haris Okanovic <haris.okanovic@ni.com>
>> wrote:
>>
>> > https://www.open-mpi.org/projects/hwloc/
>> >
>> > "The Portable Hardware Locality (hwloc) software package provides a
>> > portable abstraction (across OS, versions, architectures, ...) of the
>> > hierarchical topology of modern architectures, including NUMA memory
>> > nodes, sockets, shared caches, cores and simultaneous multithreading.
>> > It also gathers various system attributes such as cache and memory
>> > information as well as the locality of I/O devices such as network
>> > interfaces, InfiniBand HCAs or GPUs."
>> >
>> > This recipe adds libhwloc and lstopo utility as two packages.
>> >
>> > Testing: Built in OE/Krogoth. Installed to x86_64 machine. Successfull=
y
>> > ran `lstopo` and verified it printed correct CPU and cache info.
>> >
>> > Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>> > ---
>> >  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 25
>> > +++++++++++++++++++++++++
>> >  1 file changed, 25 insertions(+)
>> >  create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> >
>> > diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> > b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> > new file mode 100644
>> > index 0000000..3a88f5b
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> > @@ -0,0 +1,25 @@
>> > +SUMMARY =3D "The Portable Hardware Locality (hwloc) software package =
\
>> > + provides a portable abstraction of the hierarchical topology of mode=
rn
>> \
>> > + architectures."
>> > +HOMEPAGE =3D "https://www.open-mpi.org/software/hwloc/"
>> > +SECTION =3D "base"
>> > +LICENSE =3D "BSD"
>> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3282e20dc3cec311deda3c6d4b=
1f99
>> 0b"
>> > +
>> > +SRC_URI =3D "https://www.open-mpi.org/software/${PN}/v1.11/
>> > downloads/${BP}.tar.bz2"
>> > +SRC_URI[md5sum] =3D "96c34136ff416d2b13a7821c27477bed"
>> > +
>> > +inherit autotools
>> > +
>> > +# Split hwloc library into separate subpackage
>> > +PACKAGES_prepend =3D "lib${PN}"
>> > +FILES_lib${PN} +=3D "${libdir}/lib${PN}.so*"
>> > +${PN}_RDEPENDS +=3D "lib${PN}"
>> > +
>> > +do_install_append() {
>> > +    # Let ldconfig do it's thing, no need for these symlinks
>> > +    test -L "${D}${libdir}/lib${PN}.so.5"
>> > +    test -L "${D}${libdir}/lib${PN}.so"
>> > +    rm "${D}${libdir}/lib${PN}.so.5"
>> > +    rm "${D}${libdir}/lib${PN}.so"
>>
>
> This link manipulation is also inconsistent with every other recipe. It=
=E2=80=99s
> not appropriate. If your distro wants to rely on ldconfig to handle the
> links, then your distro could do this for all recipes rather than just on=
e.
> This isn=E2=80=99t how things are done in our existing recipes.

There is global knob USE_LDCONFIG, perhaps thats what could be used
but generally I agree with Chris here.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

