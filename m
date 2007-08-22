Received: from [66.249.82.234] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1INuVI-0007BT-VH
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Aug 2007 20:00:31 +0200
Received: by wx-out-0506.google.com with SMTP id h27so230265wxd
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Aug 2007 10:59:19 -0700 (PDT)
Received: by 10.90.99.20 with SMTP id w20mr4949651agb.1187805558446;
	Wed, 22 Aug 2007 10:59:18 -0700 (PDT)
Received: by 10.90.31.16 with HTTP; Wed, 22 Aug 2007 10:59:18 -0700 (PDT)
Message-ID: <c384c5ea0708221059t640c0b23lad82421cd2686784@mail.gmail.com>
Date: Wed, 22 Aug 2007 19:59:18 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1187683447.6234.4.camel@localhost.localdomain>
MIME-Version: 1.0
References: <c384c5ea0708201339j44462d85o286bbb548b256aec@mail.gmail.com>
	<46CA0337.9050709@gmail.com>
	<c384c5ea0708201452q3b596e76j8d7623cd6907c799@mail.gmail.com>
	<1187683447.6234.4.camel@localhost.localdomain>
Subject: Re: Add Intel Core 2 machine support (prescott and nocona)
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
X-List-Received-Date: Wed, 22 Aug 2007 18:00:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Richard,

thanks for your feedback!

On 8/21/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Mon, 2007-08-20 at 23:52 +0200, Leon Woestenberg wrote:
> > My current proposal is:
> >
> > ...
> > conf/machine/x86_64-nocona.conf
> > conf/machine/include/x86_64-nocona.conf
> > -arch=nocona
> > TARGET_ARCH=x86_64
> >
> > starting with GCC 4.3:
> > conf/machine/x86_64-core2.conf
> > conf/machine/include/x86_64-core2.conf
> > -arch=core2
> > TARGET_ARCH=x86_64
>
> Please don't use '_' in the names. It may work but it has the potential
> to mess up bitbake's override handling and would be better avoided. I
> know people have had issues with "x86_64" already due to this.
>

What are the constraints TARGET_ARCH should meet?

Does it have anything to do with the GNU machine tuple?

Doesn't TARGET_ARCH propogated into several package's configure/Makefile's etc?

For example:

linux-libc-headers:

do_configure () {
    case ${TARGET_ARCH} in
        alpha*)   ARCH=alpha ;;
        arm*)     ARCH=arm ;;
        cris*)    ARCH=cris ;;
        hppa*)    ARCH=parisc ;;
        i*86*)    ARCH=i386 ;;
        ia64*)    ARCH=ia64 ;;
        mips*)    ARCH=mips ;;
        m68k*)    ARCH=m68k ;;
        powerpc*) ARCH=ppc ;;
        s390*)    ARCH=s390 ;;
        sh*)      ARCH=sh ;;
        sparc64*) ARCH=sparc64 ;;
        sparc*)   ARCH=sparc ;;
        x86_64*)  ARCH=x86_64 ;;
    esac
    if test !  -e include/asm-$ARCH; then
        oefatal unable to create asm symlink in kernel headers
    fi



> When using optimised output like that you really do need to use a
> different TARGET_ARCH since as you say, the packages will not run on
> standard i686/x86_64...
>
That's why I suggested "x86_64-nocona".

I could only think of using "amd64" instead of "x86_64" but most
distributions are favouring the last one over the first one recently.


Regards,

Leon.


