Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1Ld9Ng-0002PN-4H
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Feb 2009 21:32:26 +0100
Received: by rv-out-0708.google.com with SMTP id b17so1353445rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2009 12:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:reply-to:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=p651pkPktUUezRSS2laYfLj6Rtg3vNsHoG6dxr0SKQg=;
	b=w0gaoVwtawVyFsbGRegrHqN9FXzrJJmaYjICkLMpMSH53nn4ngWVB7nzWyTEhCdGqC
	ala2UEmU/9ZFgeiCRW1FR9v9FhpdpvVv91CRTXAcBhk7aQOVpvKpT6QQkk0lDpUXs/NV
	5qTUV+9STwgyMsCLvHeT4I6GQ6HnwJ0zZ2tEA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:reply-to:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	b=RiJgpvqTUIS8gSmSErF2SgPElR9FqEBjPXPbuWmtnjR2pdudGVYBPiq53buhl0cPim
	xzQE+3mW5UQn1Mh2qGLgQH3S5BVhFGYcNa4WWpK7jzlMIX1lspV30cWVPZ6SI5GQlnKz
	Lc0Hmm/qk6PebAEFoeQAC2YCGyBDEguyZSPh8=
MIME-Version: 1.0
Received: by 10.141.177.2 with SMTP id e2mr1358040rvp.266.1235766533577; Fri, 
	27 Feb 2009 12:28:53 -0800 (PST)
In-Reply-To: <49A7BD17.2080407@dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF686@hiob.intern.dresearch.de>
	<49A7BD17.2080407@dresearch.de>
Date: Fri, 27 Feb 2009 12:28:53 -0800
Message-ID: <432beae0902271228w2150a17fo79e5a76c8eb71b42@mail.gmail.com>
From: Justin Patrin <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Ugly build problem with emacs/qemu
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
X-List-Received-Date: Fri, 27 Feb 2009 20:32:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Are the machines you're building on exactly the same? Do they perhaps
have different architectures or distributions? Have you tried updating
the systems?

This looks like a qemu failure to me.

On 2/27/09, Steffen Sledz <sledz@dresearch.de> wrote:
> Hi Justin and Richard,
>
>  this problem is still existing. Do you have an idea what's wrong here? Is there anything i can do to help finding the problem.
>
>
>  Steffen
>
>
>  > I'm not sure if this is a problem with emacs itself or qemu.
>  >
>  > I try to build exactly the same image with the same configuration (fyi CCACHE="") on different computers. On one everything builds fine on the other compiling emacs fails with a segmentation fault. :(
>  >
>  > NOTE: make QEMU=qemu-arm  -s 1048576 -L /home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi
>  > cd lib-src; make all  \
>  >           CC='arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mthumb' CFLAGS='-isystem/home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/i
>  > nclude -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2' CPPFLAGS='-D_BSD_SOURCE  -isystem/home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/include' \
>  >           LDFLAGS='-L/home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-link,/home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,-
>  > -hash-style=gnu -Wl,-znocombreloc' MAKE='make'
>  > make[1]: Entering directory `/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r0/emacs-22.3/lib-src'
>  > arm-angstrom-linux-gnueabi-gcc -march=armv5te -mtune=arm926ej-s -mthumb-interwork -mthumb -D_BSD_SOURCE -DHAVE_CONFIG_H -I. -I../src -I/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gn
>  > ueabi/emacs-22.3-r0/emacs-22.3/lib-src -I/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r0/emacs-22.3/lib-src/../src -L/home/sledz/oe/tmp.1/staging/armv5te-angstrom-
>  > linux-gnueabi/usr/lib -Wl,-rpath-link,/home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=gnu -Wl,-znocombreloc -D_BSD_SOURCE  -isystem/home/sled
>  > z/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/include -isystem/home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations -frename-registers
>  >  -fomit-frame-pointer -O2 -o test-distrib /home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r0/emacs-22.3/lib-src/test-distrib.c
>  > qemu-arm  -s 1048576 -L /home/sledz/oe/tmp.1/staging/armv5te-angstrom-linux-gnueabi ./test-distrib /home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r0/emacs-22.3/lib-s
>  > rc/testfile
>  > make[1]: *** [test-distrib] Segmentation fault
>  > make[1]: *** Deleting file `test-distrib'
>  > make[1]: Leaving directory `/home/sledz/oe/tmp.1/work/armv5te-angstrom-linux-gnueabi/emacs-22.3-r0/emacs-22.3/lib-src'
>  > make: *** [lib-src] Error 2
>  > FATAL: oe_runmake failed
>  > _______________________________________________
>  > Openembedded-devel mailing list
>  > Openembedded-devel@lists.openembedded.org
>  > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


-- 
Justin Patrin


