Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JZLSZ-0006Yi-Hv
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Mar 2008 08:33:18 +0100
Received: by wa-out-1112.google.com with SMTP id l24so4168173waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Mar 2008 00:31:08 -0700 (PDT)
Received: by 10.114.88.1 with SMTP id l1mr6336670wab.126.1205307068334;
	Wed, 12 Mar 2008 00:31:08 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Wed, 12 Mar 2008 00:31:08 -0700 (PDT)
Message-ID: <19c1b8a90803120031xcabf069w36fe76aabfce5587@mail.gmail.com>
Date: Wed, 12 Mar 2008 00:31:08 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47D774A4.3040207@linuxdevelopment.de>
MIME-Version: 1.0
References: <200803111746.59194.geoffrey@pager.net>
	<1205277784.16531.18.camel@dax.rpnet.com>
	<47D774A4.3040207@linuxdevelopment.de>
X-SA-Exim-Connect-IP: 209.85.146.182
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Stuck with AVR32 segfaults in init
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Mar 2008 07:33:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Geoffrey

Did you rebuild OE with the above gcc patches applied. You should give
it a shot.

On Tue, Mar 11, 2008 at 11:13 PM, Robert W=F6rle
<robert@linuxdevelopment.de> wrote:
>
>  >
>  > If you take an OE binary and run it within a working filesystem from
>  > whereever, what happens? If it segfaults there you may be able to debu=
g
>  > it. If it doesn't, try copying libs from OE into that system until it
>  > breaks? That should at least tell you where the problem is.
>
>  Dear all
>  I was starting a oe build the day koen announced the merge and it went
>  with some obstacles and finished the major libs nicely but i cant tell
>  what i had to do to get past the uclibc parts.
>
>  I did then get a 0.9.28 based libs and apps which i now merge with a
>  atmel bsp kernel and uClibc.
>  So i can now run all oe libs ( beside uClibc) with that and it feels
>  wonderful. I am currently running the ngw100 with a 5.7 lcd attached and
>  can get up a Xfbdev + gtk+ + x11vnc within the nand and nor ( totale of
>  16 mb)  Hurray the power if footprinting of oe !!
>
>
>  But i am also stuck now redoing this and rebuilding a new oe toolchain
>  for avr32 . I cant get pass the external-toolchain ERROR mentioned in
>  some earlier mails.
>  I tried both oe uclibc 0.9.28 and 0.9.29
>  So i now have one tool chain up and running and i can go on to develop
>  my target application but nobody is allowed to touch my laptop with that
>  toolchain or he dies !!
>
>  Maybe we need some of the guru`s here to help us poor avr32 small users
>  to get the basic oe toolchain up and running and stable at least for the
>  ucLibc part.
>
>  Robert
>
>
> >
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


