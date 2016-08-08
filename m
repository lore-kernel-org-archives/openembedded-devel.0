Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED7B771D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 23:16:24 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id x130so1031518ite.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Aug 2016 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=su0tfLLVT97z5vkG5MINEll7u/mRR+3LU8XTK/kcYnk=;
	b=m+9MzFc/r7eVznFFTvAtZBKhfNCjeAZpNpLUldGFrkxFjg+L+7UJDDPsNVaUHFzP8q
	HbHnT6W+IRmFcVEbV0q88OLnXLrNRHeIqE3ij3eul2f4x6wiV6+Ri11Bb8RSWe0AKzfQ
	8Pxo2ymvJaz5fIQ1eawtULZkGi4V0/nZmivTPgYrIxmNMNDXNHNs3++kO2zGt3/QUAI5
	kzkHwZdFVHg7c5PStTZ+nucYoPnhDrqThxTgBhXcVs/8W6C7BHSbNlw2r7sT5OeEM7FI
	zV7YaAkgjX6BCypJZ+5fU+4i+/lF24igsMYo12wSmWZORZI/+GrszKF+c5b3fP0o8Iad
	wbEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=su0tfLLVT97z5vkG5MINEll7u/mRR+3LU8XTK/kcYnk=;
	b=h2fI4TRFYOM60cHVGdJbBvOA/8NzlGYIMg6GklOE+pmGQY9hxCB5pOBUhuIn3J3o+r
	WtTp4p2wLqeN+/5ivXfH4JmuVAO92+GYauHvHzrDhzrs/QVXRfr2wy9ORT9nWFOMnB9G
	kYC0CD/0gsI9KJPUj+yYfEt0W17G6/hYZph7uXvWYFIn2B2s1X8Wkh41XrM1ZluJiSjZ
	HYrl/BPOr2EPWJqoURXcqfcZx2P1IXJ2/TaBjczJXbM9HA5ATR6aqNfY5cePBZ3kQdwM
	Syjrzuna/q1WtacDrT/AufVP3lMaYArBiTMxsENZn8C6pbr+5fVEfltj0eAoxyS+BPW/
	qS6A==
X-Gm-Message-State: AEkoouvgaEJr56FgGHHt+azcgq8jy586AXb2IILxcC5TbAQMluwdPUH7LBooQTAlzrWP61oJ2o3nyvyXVB/lHRBt
X-Received: by 10.36.20.75 with SMTP id 72mr20546865itg.83.1470698185183; Mon,
	08 Aug 2016 16:16:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 16:16:04 -0700 (PDT)
In-Reply-To: <1470671991.8166.44.camel@linuxfoundation.org>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
	<1470647765.4581.23.camel@andred.net>
	<ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
	<1470671991.8166.44.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Aug 2016 00:16:04 +0100
Message-ID: <CAJTo0LY-MVSANSLRBzBGTL2ZJ=Ga=Xijps6jwAGosLK3aE4QLg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Yocto Discussion Mailing List <yocto@yoctoproject.org>
Subject: Re: [OE-core] [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 23:16:26 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 16:59, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> FWIW, I think the connmand segfault on mips and powerpc is hinted at
> with this bug:
>
> https://bugs.launchpad.net/ubuntu/+source/lua5.3/+bug/1570055
>
> connmand is a binary linked with a linker version-script. If I build
> connmand without that option, it doesn't segfault, at least on mips.
>
> The binutils manuals say you shouldn't build binaries with version
> scripts:
>
> http://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html
>
> Its suspected connman might do this to limit the function exposure to
> its plugins.
>
> Now sure exactly what needs to happen here without more research but it
> certainly hits at where the problem is. I suspect its the same issue on
> ppc.
>

I've verified that with binutils 2.26 on x86-64, a minimal test case for an
executable using a version script to limit exported symbols to dlopen()d
modules does in fact work.  A toolchain is building now to see what happens
in different environments.

Ross

