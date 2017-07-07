Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id F1FC177E0D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jul 2017 13:44:42 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id f28so4021634lfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Jul 2017 06:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o7rC+/NKLS/LUval4wQIXU7wfAxJZWkjVVllAUZHF1I=;
	b=m17G8wPdV5wIUQn1vq3fwPr6+PbIR5zRcMnB8dFzRjCkGLKTD5jQeKAvC33rdTjV/T
	qa4+iE/4sKSAqKsTdJ35kc6T6HWGBLpbWPMy/6jKlf8DQk4qbDacz2hT2NGj/u1n5tu9
	JFDAU48PLA62qJpmIpvyf6QH29aTc3lKmimAIpk8Npcvm4HepadpldKPbaikDs3ec5Vf
	/iKuCAaAX3hddYh4AxBbQ1SBbNJsu7B2AVzAgtQckmIFT3wHoZuvDckWNgo2b2CgJ+c5
	nCR6j/XUkw2trQQV83kqcmhgQfntApK0CPJHgvGnuPp1hG/vq5GKc8tCOHPfslT89IA2
	c3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o7rC+/NKLS/LUval4wQIXU7wfAxJZWkjVVllAUZHF1I=;
	b=LPSOqyEHzU1ivCgxW1aRVbw2tGnpczGVCq0I7CVctq9ydBX9VUscMGVHcjhGNGpBud
	i3SIhglQitrJg+jProsPvx4Gswvl3XFAmgRd2Aetau3ScJ1q0VUeRWEREDGjPNP5QiEM
	A2fcJK6Q2pAhB+jRHnQz88AZ64B9u94ikAAPuzFP9GpSHvAOG4bxSawFoRKV9EPTa6Uh
	DYkL3vCC7QFtvQkVuit/Y+adzfOMoyokWdtknnCyqDCA1GOioyBvXykyYegoAGcnqPSd
	pelnKaYEX3X43LJdmj35h+wmrhMoAsZOHkzHdSiQSwnF/jbTfCWmCxBNHYfWJ6+VOFhO
	GIig==
X-Gm-Message-State: AIVw110OXORU9+aWiBEyZMLWvJrEie9ZQhX64STRbTyex+ewFvZxXyY3
	sOyLDyjc/Y7VcI1iBRc5tYr/xxCSeXkS
X-Received: by 10.80.145.198 with SMTP id h6mr2347998eda.108.1499435083145;
	Fri, 07 Jul 2017 06:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Fri, 7 Jul 2017 06:44:12 -0700 (PDT)
In-Reply-To: <1499423235-1999-1-git-send-email-liu.ming50@gmail.com>
References: <1499423235-1999-1-git-send-email-liu.ming50@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Jul 2017 06:44:12 -0700
Message-ID: <CAMKF1sp7DJ-t0JM3D3Nf4dwbL60Bk-_1MbG-mcH3Ws6QA899JA@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
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
X-List-Received-Date: Fri, 07 Jul 2017 13:44:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 7, 2017 at 3:27 AM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> This fixes following errors when building on mips/mipsel:
> ...
> src/RCF/ByteOrdering.cpp:115:13: error: 'MachineByteOrder' was not declared in this scope
>          if (MachineByteOrder != NetworkByteOrder)
>              ^~~~~~~~~~~~~~~~
> src/RCF/ByteOrdering.cpp:123:13: error: 'MachineByteOrder' was not declared in this scope
>          if (MachineByteOrder != NetworkByteOrder)
>
> src/RCF/ByteOrdering.cpp:131:16: error: 'MachineByteOrder' was not declared in this scope
>          return MachineByteOrder == NetworkByteOrder;
>
> src/RCF/ByteOrdering.cpp:136:16: error: 'MachineByteOrder' was not declared in this scope
>          return MachineByteOrder == LittleEndian;
> ...


already fixed by

http://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=5ed1dba5f8fdca6c78bf61128aedd0426eb98424

>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  .../librcf/librcf/0001-mips-mipsel-support.patch   | 34 ++++++++++++++++++++++
>  meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb  |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
>
> diff --git a/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch b/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
> new file mode 100644
> index 0000000..6d873c4
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/librcf/librcf/0001-mips-mipsel-support.patch
> @@ -0,0 +1,34 @@
> +From a0e6a851a7504150e5191b206b8885fa17ce9ab3 Mon Sep 17 00:00:00 2001
> +From: Ming Liu <peter.x.liu@external.atlascopco.com>
> +Date: Fri, 7 Jul 2017 10:46:45 +0200
> +Subject: [PATCH] Support build for mips/mipsel
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> +---
> + src/RCF/ByteOrdering.cpp | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/RCF/ByteOrdering.cpp b/src/RCF/ByteOrdering.cpp
> +index 5f3d937..ab99967 100755
> +--- a/src/RCF/ByteOrdering.cpp
> ++++ b/src/RCF/ByteOrdering.cpp
> +@@ -64,6 +64,14 @@ namespace RCF {
> +
> +     const ByteOrder MachineByteOrder = LittleEndian;
> +
> ++#elif defined(_MIPSEL) || defined(__MIPSEL) || defined(__MIPSEL__)
> ++
> ++    const ByteOrder MachineByteOrder = LittleEndian;
> ++
> ++#elif defined(_mips) || defined(__mips) || defined(__mips__)
> ++
> ++    const ByteOrder MachineByteOrder = BigEndian;
> ++
> + #elif defined(__bfin__)
> +
> +     const ByteOrder MachineByteOrder = LittleEndian;
> +--
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> index 4c9683a..4dac10e 100644
> --- a/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> +++ b/meta-oe/recipes-devtools/librcf/librcf_2.2.0.0.bb
> @@ -14,6 +14,7 @@ SRC_URI = "http://www.deltavsoft.com/downloads/RCF-${PV}.tar.gz \
>             file://0001-Add-CMake-build-files.patch \
>             file://aarch64-support.patch \
>             file://0001-ClientStub.hpp-fix-a-clang-compiling-issue.patch \
> +           file://0001-mips-mipsel-support.patch \
>            "
>
>  SRC_URI[md5sum] = "7ecb3c73f7eb66dba8790b659374f690"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

