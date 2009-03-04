Received: from [68.230.241.41] (helo=fed1rmmtao105.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1Lex5p-0005Tm-Rd
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 20:49:26 +0100
Received: from fed1rmimpo01.cox.net ([70.169.32.71]) by fed1rmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090304194505.SHIY15318.fed1rmmtao105.cox.net@fed1rmimpo01.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 4 Mar 2009 14:45:05 -0500
Received: from localhost ([68.230.63.214]) by fed1rmimpo01.cox.net with bizsmtp
	id P7l21b00B4dMFYL037l2UV; Wed, 04 Mar 2009 14:45:04 -0500
X-Authority-Analysis: v=1.0 c=1 a=af50XY3WUk0A:10 a=xz7DMSkBCQEA:10
	a=Fdw0bDfj8vGueOqhC6kA:9 a=GdLpJpgAPsjN9kueyqgA:7
	a=ueED1OG7zlWRVIGwJ9MgEfFy1PsA:4 a=LY0hPdMaydYA:10
X-CM-Score: 0.00
Date: Wed, 4 Mar 2009 12:45:02 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090304194502.GX26343@smtp.west.cox.net>
References: <1236178350.4249.5.camel@debian.dorg.org>
	<20090304153617.GQ26343@smtp.west.cox.net>
	<1236195338.4249.20.camel@debian.dorg.org>
MIME-Version: 1.0
In-Reply-To: <1236195338.4249.20.camel@debian.dorg.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: Compile OE on Sun Ultrasparc 64 architecture?
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
X-List-Received-Date: Wed, 04 Mar 2009 19:49:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2009 at 08:35:38PM +0100, harald wrote:
> Am Mittwoch, den 04.03.2009, 08:36 -0700 schrieb Tom Rini:
> > On Wed, Mar 04, 2009 at 03:52:30PM +0100, harald wrote:
> > 
> > > Hello,
> > > 
> > > tried to compile OE on my Sun Ultrasparc 64 machine running on debian
> > > lenny. 
> > > Compilation fails, package qemu-native fails to compile with an error in
> > > zlib. please see build logs, machine h4000, user ba0547.
> > 
> > You might want to disable binary locale generation on the host and see
> > what else falls down.  ENABLE_BINARY_LOCALE_GENERATION = 0 in your
> > local.conf
> > 
> hello, 
> 
> binary_locale_generation has been set to 0.
> 
> now other packages fail to compile/install:
> 
> | Making all in mpn
> | make[2]: Entering directory
> `/home/stuff/tmp/work/sparc64-linux/gmp-native-4.2.4-r0/gmp-4.2.4/mpn'
> | /bin/sh ../sparc64-linux-libtool --mode=compile
> --tag=CC ../mpn/m4-ccas --m4="m4" ccache gcc -std=gnu99 -c
> -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_n
> | sed 's/_$//'`
> -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include
> -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include -O2
> -Wa,--noexecstack `test -f 'add_n.asm' || echo './'`add_n.asm
> | sparc64-linux-libtool: compile:  ../mpn/m4-ccas --m4=m4 ccache gcc
> -std=gnu99 -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I..
> -DOPERATION_add_n
> -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include
> -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include -O2
> -Wa,--noexecstack add_n.asm  -fPIC -DPIC -o .libs/add_n.o
> | m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_add_n -DPIC
> add_n.asm >tmp-add_n.s
> |  ccache gcc -std=gnu99 -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP
> -I.. -DOPERATION_add_n
> -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include
> -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include -O2
> -Wa,--noexecstack tmp-add_n.s -fPIC -DPIC -o .libs/add_n.o
> | tmp-add_n.s: Assembler messages:
> | tmp-add_n.s:66: Error: Architecture mismatch on "lduw".
> | tmp-add_n.s:66:  (Requires v9|v9a|v9b; requested architecture is
> sparclite.)
> | tmp-add_n.s:67: Error: Architecture mismatch on "lduw".
> | tmp-add_n.s:67:  (Requires v9|v9a|v9b; requested architecture is
> sparclite.)
> | tmp-add_n.s:69: Error: Architecture mismatch on "bl,pn %icc,.Lend1".
> | tmp-add_n.s:69:  (Requires v9|v9a|v9b; requested architecture is
> sparclite.)
> | tmp-add_n.s:70: Error: Architecture mismatch on "lduw".
> | tmp-add_n.s:70:  (Requires v9|v9a|v9b; requested architecture is
> sparclite.)
> | tmp-add_n.s:
> 
> cut....
> 
> for further details please see build log.
> Any idea?

Looks like sparc has a host needs some serious poking around, sorry.
Either libtool we're building isn't being configured right, or libtool
has a bug.  It can't hurt to see if Debian has any sparc patches for
libtool.

-- 
Tom Rini


