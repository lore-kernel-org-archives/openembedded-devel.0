Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id 887BE77D67
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 13:51:04 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id r125so17822612vkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jul 2017 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iejvZVLc1e/SVc6m2r2FLTIeXTDkAgb762Rf+RhM9DU=;
	b=JCibDG7thB/X/XDxPNvK1yPyXtUchCh+mHFjkuG5wZRhtrcJZAxqZAYLAvc2LALcks
	gCYWBj/xO0UGRpYb2mFVhPeCEJvcvgIMmlc4qUQSXNlc+9WcvfackQ7vP+AvgBYtnfW1
	pO6zdWy/A630kIzpn1U3/7MvgHvE7vISYRX5Xj/n8j26Mswj5p+hM623B75H8E1viqUC
	K1rrtopd340ZOncl/Gjx4G8FyVCi9AsRy7Ugsw+kVg8b0Fru4YABfLuCo6glSo3oF6as
	qw9YOlNM8rdDV1D28pkad/12mDJ8uvZtAeUx7g01ZbxGdiOm+Do5ndmkjxOIujtHtAM5
	5OxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iejvZVLc1e/SVc6m2r2FLTIeXTDkAgb762Rf+RhM9DU=;
	b=PA49pkZtrgN6c9w+zEy/mvsYzWq9Mp7M2UlkhPZ0OiUhC/v3HA6cxNc6k3bXtzRQHs
	dybVcC16v+BlUK2lI/M6Xt5p6wztgQLYCUvVtrWLufHgqtmUitnfID7zCaS5HK/ukeAp
	1leFckegEQTzSqMfKi6dQo4sZiihOUQEJz6lCNgJKiugFqV5d3w9sg6OeA+VnxPLtQgz
	hsP6CL5vbFZ1abwh+VGWC8EFDgZWpAOeGkjpw0TFTe5cqKafImYBWfyuyznE20cs4qKn
	3vq1hxbbzvWuxW7yZ2UFchKshzl4TVUNnBZlptHVlxk/qbHNfEHotbhE9M5r1GRaUpqW
	ZYHA==
X-Gm-Message-State: AIVw112Kcks6aYWiRUP+eJPYPKDSgNvYzquhd0c4+OTVyEStjuNj8EV2
	0naJrUyQHkHHqsSOWiLImbdaENyZdw==
X-Received: by 10.31.3.228 with SMTP id f97mr747268vki.120.1499435465617; Fri,
	07 Jul 2017 06:51:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Fri, 7 Jul 2017 06:51:05 -0700 (PDT)
In-Reply-To: <CAMKF1sp7DJ-t0JM3D3Nf4dwbL60Bk-_1MbG-mcH3Ws6QA899JA@mail.gmail.com>
References: <1499423235-1999-1-git-send-email-liu.ming50@gmail.com>
	<CAMKF1sp7DJ-t0JM3D3Nf4dwbL60Bk-_1MbG-mcH3Ws6QA899JA@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Fri, 7 Jul 2017 15:51:05 +0200
Message-ID: <CALatG=6JRt79k1bWeELmuGZiEwJ68V4bC0dXOyGKXD+3LJz4qQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [PATCH] librcf: support build on mips/mipsel
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
X-List-Received-Date: Fri, 07 Jul 2017 13:51:06 -0000
Content-Type: text/plain; charset="UTF-8"

Arha, please ignore my patch then. Thanks.

//Ming Liu


2017-07-07 15:44 GMT+02:00 Khem Raj <raj.khem@gmail.com>:

> On Fri, Jul 7, 2017 at 3:27 AM,  <liu.ming50@gmail.com> wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > This fixes following errors when building on mips/mipsel:
> > ...
> > src/RCF/ByteOrdering.cpp:115:13: error: 'MachineByteOrder' was not
> declared in this scope
> >          if (MachineByteOrder != NetworkByteOrder)
> >              ^~~~~~~~~~~~~~~~
> > src/RCF/ByteOrdering.cpp:123:13: error: 'MachineByteOrder' was not
> declared in this scope
> >          if (MachineByteOrder != NetworkByteOrder)
> >
> > src/RCF/ByteOrdering.cpp:131:16: error: 'MachineByteOrder' was not
> declared in this scope
> >          return MachineByteOrder == NetworkByteOrder;
> >
> > src/RCF/ByteOrdering.cpp:136:16: error: 'MachineByteOrder' was not
> declared in this scope
> >          return MachineByteOrder == LittleEndian;
> > ...
>
>
> already fixed by
>
> http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=
> 5ed1dba5f8fdca6c78bf61128aedd0426eb98424
>
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  .../librcf/librcf/0001-mips-mipsel-support.patch   | 34
> ++++++++++++++++++++++
> >  meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  1 +
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-mips-
> mipsel-support.patch
> >
> > diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
> b/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
> > new file mode 100644
> > index 0000000..6d873c4
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/librcf/librcf/0001-mips-
> mipsel-support.patch
> > @@ -0,0 +1,34 @@
> > +From a0e6a851a7504150e5191b206b8885fa17ce9ab3 Mon Sep 17 00:00:00 2001
> > +From: Ming Liu <peter.x.liu@external.atlascopco.com>
> > +Date: Fri, 7 Jul 2017 10:46:45 +0200
> > +Subject: [PATCH] Support build for mips/mipsel
> > +
> > +Upstream-Status: Pending
> > +
> > +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > +---
> > + src/RCF/ByteOrdering.cpp | 8 ++++++++
> > + 1 file changed, 8 insertions(+)
> > +
> > +diff --git a/src/RCF/ByteOrdering.cpp b/src/RCF/ByteOrdering.cpp
> > +index 5f3d937..ab99967 100755
> > +--- a/src/RCF/ByteOrdering.cpp
> > ++++ b/src/RCF/ByteOrdering.cpp
> > +@@ -64,6 +64,14 @@ namespace RCF {
> > +
> > +     const ByteOrder MachineByteOrder = LittleEndian;
> > +
> > ++#elif defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
> > ++
> > ++    const ByteOrder MachineByteOrder = LittleEndian;
> > ++
> > ++#elif defined(_mips) || defined(__mips) || defined(__mips__)
> > ++
> > ++    const ByteOrder MachineByteOrder = BigEndian;
> > ++
> > + #elif defined(__bfin__)
> > +
> > +     const ByteOrder MachineByteOrder = LittleEndian;
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> > index 4c9683a..4dac10e 100644
> > --- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> > +++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> > @@ -14,6 +14,7 @@ SRC_URI = "http://www.deltavsoft.com/
> downloads/RCF-${PV}.tar.gz \
> >             file://0001-Add-CMake-build-files.patch \
> >             file://aarch64-support.patch \
> >             file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch
> \
> > +           file://0001-mips-mipsel-support.patch \
> >            "
> >
> >  SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

