Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lamiaposta71@gmail.com>) id 1O7R7a-0000JG-L7
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Apr 2010 12:38:28 +0200
Received: by bwz20 with SMTP id 20so4519071bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Apr 2010 03:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=oY/teWLzTEppdPWPTWE2r3Y4Tx6VMjSz+OLGTCG2+r8=;
	b=m3/mQQ8fO3tV+fuUt8ktT8w64wJkErdJfz0ax9+Zxk9i1g5CVMrpNma0xs6wq7hXVK
	RgWhYQj1tU/hVdQjHax3k2P2NifuwzlMoTfxLrFK8hRxHuLZkCzbXuELE6FhB5fmIlCZ
	xXLbNO91FFBmiNh/MnaMFcaGx9b61jV1Y9Ibw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LTKh+oplrSQzCuSIRLDmXbedcvk6jHBcBOqC2e0pSuuIyikysX/G2OmnQpjGQoMU6t
	pozym4phjGHgzVuvjDwDJH1eV2kf2Ry/69OSpE5enJuZguMaoRWyWnctkxMkaIauJz2r
	kqTCKVehH6OTY3ZwS9zVQy/h3qdzNANHHhSHE=
MIME-Version: 1.0
Received: by 10.204.84.83 with SMTP id i19mr5726716bkl.175.1272537223433; Thu, 
	29 Apr 2010 03:33:43 -0700 (PDT)
Received: by 10.204.84.13 with HTTP; Thu, 29 Apr 2010 03:33:42 -0700 (PDT)
In-Reply-To: <B4E2B620-1CC1-4540-B76E-EC69AB2FC2EC@pilsoft.com>
References: <h2ub7a795c81004290008z458edaf3wd76e38ed4784cd64@mail.gmail.com>
	<B4E2B620-1CC1-4540-B76E-EC69AB2FC2EC@pilsoft.com>
Date: Thu, 29 Apr 2010 12:33:42 +0200
Message-ID: <n2hade1bdc1004290333sf80add4ao336fdc3a8175cc4a@mail.gmail.com>
From: Raffaele Recalcati <lamiaposta71@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: lamiaposta71@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Apache2 on angstrom
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
X-List-Received-Date: Thu, 29 Apr 2010 10:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

It seems that

   1. configure:30880: ccache arm-angstrom-linux-gnueabi-gcc -march=armv5te
   -mtune=arm926ej-s -mthumb-interwork -mno-thumb -c
   -I/home/sources/OE/angstrom-dev/staging/armv5te-angstrom-linux-gnueabi/usr/include/openssl
   -isystem/home/sources/OE/angstrom-dev/staging/armv5te-angstrom-linux-gnueabi/usr/include
   -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
   -DPATH_MAX=4096
   -isystem/home/sources/OE/angstrom-dev/staging/armv5te-angstrom-linux-gnueabi/usr/include
   -DLINUX=2 -D_REENTRANT -D_GNU_SOURCE conftest.c >&5
   2. conftest.c: In function 'main':
   3. conftest.c:31: error: 'CRYPTD' undeclared (first use in this function)
   4. conftest.c:31: error: (Each undeclared identifier is reported only
   once
   5. conftest.c:31: error: for each function it appears in.)
   6. conftest.c:31: error: expected ';' before 'buffer'
   7. conftest.c:32: error: 'buffer' undeclared (first use in this function)
   8. configure:30880: $? = 1


Thre problem seems the compatibility with old crypt_r call.
But I don't know where CRYPTD macro is defined and if it is important to
support it.

This is the test that fails:

#include <crypt.h>
int
main ()
{
CRYPTD buffer;
  crypt_r("passwd", "hash", &buffer);
  ;
  return 0;
}



2010/4/29 David Hemmo <david.oe@pilsoft.com>

> Hello Fabio,
>
> I guess it is related to the kernel you are using or the kernel header you
> included
> I don't know in what version of Linux CRYPTD has been added, but it must be
> posterior to the one you are using
>
> David Hemmo
>
> On Apr 29, 2010, at 9:08 AM, Fabio Mauri wrote:
>
> > Hi all,
> >
> >   I am trying to build an image with Apache2 and modphp installed.
> > During the compilation I get this error message:
> >
> > http://pastebin.com/uBCr1sYE
> >
> > following the error message there is the related config.log
> > Does someone know what is missing in my setup?
> >
> >
> > --
> > Fabio Mauri
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
www.opensurf.it

