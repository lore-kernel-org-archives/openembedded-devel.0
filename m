Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N189p-000667-4M
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 02:37:32 +0200
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 7FBE41B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 00:45:38 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2009 02:36:18 +0200
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200910141652.11828.holger+oe@freyther.de>
In-Reply-To: <200910141652.11828.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200910230236.18070.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: What is the state of the gcc, binutils and libc6-dev packages?
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
X-List-Received-Date: Fri, 23 Oct 2009 00:37:32 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Wednesday 14 October 2009 16:52:11 Holger Hans Peter Freyther wrote:
> Hey,
> 
> one short question has anyone recently tried to build and install a
> "toolchain" on the device? I'm asking because even after installing gcc,
> bintuils, cpp, libc6-dev and the -symlinks packages I have problems like:
> 
> gcc searching in /usr/lib/gcc/BUILD_SYSTEM/4.4.1/include for header files
>  and compile failing  because stuf flike stddef, stdargs.h can not be
>  found.
> 
> After cheating it fails that a simple program can not be linked because of
> undefined references to __libc_csu_init and _fini.

Okay,

we have a major issue with our SDK and "gcc" packages now:

arm-angstrom-linux-gnueabi-gcc -o foo.file foo.c 
/usr/local/angstrom/arm/arm-angstrom-linux-gnueabi/usr/lib/crt1.o: In function `_start':
init.c:(.text+0x2c): undefined reference to `__libc_csu_fini'
init.c:(.text+0x34): undefined reference to `__libc_csu_init'
collect2: ld returned 1 exit status

This is stock angstrom and glibc, gcc and binutils major version is
unchanged from the last successful build.

Do we stage the wrong crt1.o? How did it happen?

z.


