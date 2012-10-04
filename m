Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gmarco.dev@gmail.com>) id 1TJmQr-0007Mu-Si
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Oct 2012 16:29:46 +0200
Received: by mail-qa0-f47.google.com with SMTP id i29so3304745qaf.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Oct 2012 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	bh=uotEPj0/cnevfzEBnY4yYt+ppcg/1Gr1BWaps9i0SYQ=;
	b=f3Pcm0SjpdFEWq5tzn3qFj2aErPhKlh6dRGFOh+FklQxcUgLwKVh3eBItHB5xWFpRp
	mBlsa6Lr3MC5/V9RjTQM1n6jrx8CDFdsRLyZgOiH2Ih7B9I1oHDrDGdye0QCnwvK0muV
	iWI4kRzqQPz8N9VaGLZ+WpIQWbw2hOvYBbEsNzltUN6ORF0n0rXQRme3i5J3sAs6n2xV
	mE2n4qkeFp6Ig9gcd46vFfjdIiSo6OTXvE8bqu4qMXd+Rba/GViERTDXZB0KKLBfqkiL
	EDnzbN5sYpb0twV9VndurWX46vYjVRwuFfWJnrV1Kx7nDHI4TiSH+1bvqib5VX5fR1NC
	gBlQ==
MIME-Version: 1.0
Received: by 10.224.213.10 with SMTP id gu10mr12758248qab.10.1349360204406;
	Thu, 04 Oct 2012 07:16:44 -0700 (PDT)
Received: by 10.49.58.133 with HTTP; Thu, 4 Oct 2012 07:16:44 -0700 (PDT)
Date: Thu, 4 Oct 2012 16:16:44 +0200
Message-ID: <CA+qOGFeWVKCCaU3VtJ50C9wEEQN9=EgTAUKO3qxBsfabi8QCaQ@mail.gmail.com>
From: Marco Guerri <gmarco.dev@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: guerri.ma@gmail.com
Subject: External toolchain - Helloworld works but help needed
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
X-List-Received-Date: Thu, 04 Oct 2012 14:29:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi everybody,

I'm having some troubles trying to get a working filesystem for a custom
board based on a Freescale iMX35 SOC.
I'm trying to integrate an external working toolchain+glibc (freescale)
with OpenEmbedded. My problem is
that I do not have a complete understanding of the whole toolchain
management process done by OE. I anticipate
that I can compile a working helloworld image which runs correctly on the
hardware only if it is statically
linked aginst the libc. With dynamic linking it does not work (in the case
of helloworld: Kernel panic no
init found) I think the problem is that I cannot find a way to deploy the
libc into the filesystem (if I mount the fs
image on my host of course there's nothing except a dynamically linked
helloworld binary...).

My local.conf reports these TOOLCHAIN related options:

TOOLCHAIN_VENDOR = "-none"
TOOLCHAIN_TYPE = "external"
TOOLCHAIN_BRAND = "mtoolch"
TOOLCHAIN_PATH = "/opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3"
TOOLCHAIN_SYSPATH =
"/opt/freescale/usr/local/gcc-4.1.2-glibc-2.5-nptl-3/arm-none-linux-gnueabi"

As far as I've understood, the important recipe in this case should be
external-toolchain-mtoolch.bb. In particular:

    - do_stage() should copy all the important libraries (libc) in the
staging area in order to be able to
    link correctly during the build process.

    - do_install() should copy all the important libraries in the install
area so that they can be
    packaged and deployed in the filesystem.

I'm stuck at the second point. Right now I manually carry out the first
point (that is, I copy
the libc and all the libraries in the staging area). I'm sure that this
process works because all the binaries
are correctly linked against the libc (even the tiny helloworld program
which works on the hardware).
I've tried to write a do_install method but I think I'm misunderstaing
something: the do_install
method is basically the following

do_install() {

        install -d ${D}${libdir}
        install -d ${D}${base_libdir}
        install -d ${D}${includedir}

        cp -a
${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/vfp/lib/*
${D}${base_libdir}
        cp -a
${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/vfp/usr/lib/*
${D}${libdir}
        cp -a
${TOOLCHAIN_PATH}/arm-none-linux-gnueabi/arm-none-linux-gnueabi/sysroot/usr/include/*
${D}${includedir}
}

The result is that everything is copied into
build/work/i686-armv6-sdk-none-linux-gnueabi/external-toolchain-mtoolch-1.0-r3
and not in build/work/armv6-none-linux-gnueabi, where all the stuff that is
later deployed in the filesystem is copied. So
I do not have a clear understaing of what is going on and if I'm using
external-toolchain-mtoolch.bb properly or not.

Any suggestion is appreciated, I've ran out of ideas but I do not want to
give up at this point.
Thank you very much.

Marco

