Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJozp-0007aF-DH
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 19:14:01 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so562865eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2012 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MjfV9EJWD5L3bWp+cAcOgWdOpV+LiwstRaC4d2gg9sc=;
	b=FmM3elrJhLXSUJ2p9i3Hvf4aCnADP+xeUeIuz0xtyEjoLar/QP3THtjO3Ku0swymfD
	zJMJhahg+7NK0hvzev9o1+peEGGoK6Fhf1MO8O/bRr7/05EXZicGwkkEdgDs5t83RVR9
	/o6tP5ulnMRPpwILCgE/UsrHWXZ6DLVoM4BW3Xu40LASliJIC+Y5++zhPiQAOEe4/OSp
	GrfOwDb17/RehTC9knTVuuyDY/H+fIaoVnOlh7kfOVPzFUWAvfSBAAlpm/yNxJREZZ4K
	yNMuONX6atnShHGYClr6M2rtP69Luh7YNoI4i4HTpZvkrh2u+87X01Ijaob21AX90hay
	9Clw==
Received: by 10.14.4.201 with SMTP id 49mr9319364eej.0.1349370060530; Thu, 04
	Oct 2012 10:01:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 4 Oct 2012 10:00:30 -0700 (PDT)
In-Reply-To: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
References: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Oct 2012 10:00:30 -0700
Message-ID: <CAMKF1spYYO-Cufe6xjY10OuhZOjM51cKgAFyhemHd8ppPCGQqw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: guerri.ma@gmail.com
Subject: Re: External toolchain - Helloworld works but help needed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 04 Oct 2012 17:14:01 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 4, 2012 at 7:16 AM, Marco Guerri <gmarco.dev@gmail.com> wrote:
> Hi everybody,
>
> I'm having some troubles trying to get a working filesystem for a custom
> board based on a Freescale iMX35 SOC.
> I'm trying to integrate an external working toolchain+glibc (freescale)
> with OpenEmbedded. My problem is
> that I do not have a complete understanding of the whole toolchain
> management process done by OE. I anticipate
> that I can compile a working helloworld image which runs correctly on the
> hardware only if it is statically
> linked aginst the libc. With dynamic linking it does not work (in the case
> of helloworld: Kernel panic no
> init found) I think the problem is that I cannot find a way to deploy the
> libc into the filesystem (if I mount the fs
> image on my host of course there's nothing except a dynamically linked
> helloworld binary...).
>
> My local.conf reports these TOOLCHAIN related options:
>
> TOOLCHAIN_VENDOR = "-none"
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "mtoolch"
> TOOLCHAIN_PATH = "/opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3"
> TOOLCHAIN_SYSPATH =
> "/opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi"
>
> As far as I've understood, the important recipe in this case should be
> external-toolchain-mtoolch.bb. In particular:
>
>     - do_stage() should copy all the important libraries (libc) in the
> staging area in order to be able to
>     link correctly during the build process.
>
>     - do_install() should copy all the important libraries in the install
> area so that they can be
>     packaged and deployed in the filesystem.
>
> I'm stuck at the second point. Right now I manually carry out the first
> point (that is, I copy
> the libc and all the libraries in the staging area). I'm sure that this
> process works because all the binaries
> are correctly linked against the libc (even the tiny helloworld program
> which works on the hardware).
> I've tried to write a do_install method but I think I'm misunderstaing
> something: the do_install
> method is basically the following
>
> do_install() {
>
>         install -d ${D}${libdir}
>         install -d ${D}${base_libdir}
>         install -d ${D}${includedir}
>
>         cp -a
> ${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/vfp/lib/*
> ${D}${base_libdir}
>         cp -a
> ${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/vfp/usr/lib/*
> ${D}${libdir}
>         cp -a
> ${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/usr/include/*
> ${D}${includedir}
> }
>
> The result is that everything is copied into
> build/work/i686-armv6-sdk-none-linux-gnueabi/external-toolchain-mtoolch-1.0-r3
> and not in build/work/armv6-none-linux-gnueabi, where all the stuff that is
> later deployed in the filesystem is copied. So
> I do not have a clear understaing of what is going on and if I'm using
> external-toolchain-mtoolch.bb properly or not.
>
> Any suggestion is appreciated, I've ran out of ideas but I do not want to
> give up at this point.
> Thank you very much.
>


I would suggest to start with external-sourcery-toolchain.bb recipe in OE-Core
and then model a recipe for your toolchain based on that. Although be
warned that
gcc 4.1 might be inadequate for the recipes we have currently so you might
run into more bumps.

> Marco
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


