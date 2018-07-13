Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id DABA378555
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 16:24:18 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id k12-v6so63216297oiw.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2018 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ps5PQjHrAznycNyhsOHYmdnvcTU1LceZ6NWMsCQNtRQ=;
	b=QwUDk86Mvdf95lCFcmF4mlTTeXa7/NuZnovcWX9Zx6FXKE83N49ll2c9+8jRDZHEEY
	SVfY0kX82jO2+jDE1AcZdJwbOJjV7Sa0XgDPnRgfhVKfu30S6Mx4P56MdCRFJd05Fa18
	RkERT8IVbrEF2KgU3aRQeEGIxU8znoLlzYsmcCxDTlx9ZprJMdp+YayiqROILRoCpLPy
	X6Lu5CvLr2kCfyM/0lbn+gTE/8mugeFXA3H11JxW0NyXZD0Omw3m9rt+Qj5a8/eGrj4V
	EO/t28gddwHpLx87BMymZ4Oe0iDCGAxQbdZTy6okbcpGZDXH0TDfspKlgu//M/mp5gMS
	4rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ps5PQjHrAznycNyhsOHYmdnvcTU1LceZ6NWMsCQNtRQ=;
	b=ETaLzt9tYh+1YlWA14jAiQSmDecZuIt15+7VhCqiEX/mQm567cJfukBhjBhplmoIx3
	YGh/YMx2N8p2Ze1KklE/e23CPDT5ZR5MwLjX5xA8GUtK+M0hn9k/Lf4vHabR5AOSanQZ
	Bt6ljEIwWjkZbSWuYmlcAf4UX4Z9s1phiecVC8Y4T9Pr3B4/L7gQ4WaCUMVOlAYCuChr
	RjEtmeOu2NG9x9zxonbxmKVZClaN5j9ErEmEKhzHZh0QUjU75XPbkjuLmQQuOJ+bv9L+
	iWGaLN/HVpgo9akJnUHkxR7W/FPBKQj6xSFAmSEoNTutxcl+VHsnAt1i8vAYkmnkWgBb
	VWng==
X-Gm-Message-State: AOUpUlFygWmw8T5oYTFJZO+PBUjxtikg6Bz8R7E8hpiK+waK0vjzFqV5
	Zs8n1Od0uDcoZnz+ZJXDUWx6/tlz+R/AQaycabZnQg==
X-Google-Smtp-Source: AAOMgpeHDyu9mWSadtQ3B4CZhSV2raCMkP0I4QTyhTivVNjQ0oBzxS6VffrVReAfW/KtFpDywGAV7NVnNB9hfr/KFks=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr8137782oih.102.1531499059623; 
	Fri, 13 Jul 2018 09:24:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 09:23:59
	-0700 (PDT)
In-Reply-To: <20180713140616.15664-2-hongzhi.song@windriver.com>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<20180713140616.15664-2-hongzhi.song@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Jul 2018 17:23:59 +0100
Message-ID: <CAJTo0LbXD42g6wJ4z3Kgg+TXSRaAueLgWzYjkkdq13YO3aVb+Q@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Fri, 13 Jul 2018 16:24:19 -0000
Content-Type: text/plain; charset="UTF-8"

On 13 July 2018 at 15:06, Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \

Why are you shipping your own copy of the kernel's COPYING file even
though you copy another in that prefunc?

Isn't it possible to just depend on kernel-source and build directly
from the kernel source tree?

> +# for bpf and vm
> +DEPENDS = " \
> +    elfutils \
> +    libcap \
> +    libcap-ng \
> +    fuse \
> +    util-linux \
> +    rsync-native \
> +"

Really not convinced these dependencies are accurate.

> +TEST_LIST = "bpf \
> +             vm \
> +"

You're not listing memfd in here, but that is the only place which
uses fuse as far as I can tell.

My suggestion is to trim the DEPENDS back to the core minimum and use
PACKAGECONIG to select what directories get built. This means you can
have optional test suites where the dependencies are not in oe-core
(fuse for memfd, for example), and get the right RDEPENDS too.

> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install

FHS says /opt is for sysadmin-installed tools that are not package
managed.  You're building a package.  You're also building a package
which is essentially ptest.  I'd say inherit ptest, write a runner,
and put all the binaries in $PTESTDIR.

Ross

