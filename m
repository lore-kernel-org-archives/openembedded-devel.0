Received: from [217.146.130.193] (helo=chlothar.bnv-bamberg.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LexVb-0006P1-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 21:16:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bnv-bamberg.de; s=mail2008; h=Subject:From:To:In-Reply-To:
	References:Content-Type:Date:Message-Id:Mime-Version:
	Content-Transfer-Encoding; bh=Tx8SvJG5OWF8hE63Cg3L4S35iCOl5u4NUO
	LQ7J/44Q8=; b=p2bAeTUA3sU//nG/F9zk2BeQIRwzUP3KW40TkLGtwI94ICEGAc
	JqafQA/lnNtgzz2Za5D23SWvjRtiEjpYOxyjtntd58uUisdq7im6c6VbQV/RGDyq
	OSHaUVAQ5NPjRHnLFFUA64+7ghm7shHL1KIp2J9j7u2uRaxaa8hK2H02s=
Received: from localhost ([127.0.0.1] helo=chlothar.bnv-bamberg.de)
	by chlothar.bnv-bamberg.de with esmtp id 1LexRV-0004cS-RH 
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 21:11:49 +0100
Received: from w0659.w.pppool.de ([89.58.6.89] helo=[192.168.2.3])
	by chlothar.bnv-bamberg.de with esmtpa (Exim 4.69)
	(envelope-from <ba0547@bnv-bamberg.de>) id 1LexRV-0004Zz-EQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 21:11:49 +0100
From: harald <ba0547@bnv-bamberg.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090304194502.GX26343@smtp.west.cox.net>
References: <1236178350.4249.5.camel@debian.dorg.org>
	<20090304153617.GQ26343@smtp.west.cox.net>
	<1236195338.4249.20.camel@debian.dorg.org>
	<20090304194502.GX26343@smtp.west.cox.net>
Date: Wed, 04 Mar 2009 21:11:46 +0100
Message-Id: <1236197506.4249.25.camel@debian.dorg.org>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Wed, 04 Mar 2009 20:16:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 04.03.2009, 12:45 -0700 schrieb Tom Rini:
> On Wed, Mar 04, 2009 at 08:35:38PM +0100, harald wrote:
> > Am Mittwoch, den 04.03.2009, 08:36 -0700 schrieb Tom Rini:
> > > On Wed, Mar 04, 2009 at 03:52:30PM +0100, harald wrote:
> > > 
> > > > Hello,
> > > > 
> > > > tried to compile OE on my Sun Ultrasparc 64 machine running on debian
> > > > lenny. 
> > > > Compilation fails, package qemu-native fails to compile with an error in
> > > > zlib. please see build logs, machine h4000, user ba0547.
> > > 
> > > You might want to disable binary locale generation on the host and see
> > > what else falls down.  ENABLE_BINARY_LOCALE_GENERATION = 0 in your
> > > local.conf
> > > 
> > hello, 
> > 
> > binary_locale_generation has been set to 0.
> > 
> > now other packages fail to compile/install:
> > 
> > | Making all in mpn
> > | make[2]: Entering directory
> > `/home/stuff/tmp/work/sparc64-linux/gmp-native-4.2.4-r0/gmp-4.2.4/mpn'
> > | /bin/sh ../sparc64-linux-libtool --mode=compile
> > --tag=CC ../mpn/m4-ccas --m4="m4" ccache gcc -std=gnu99 -c
> > -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I.. -DOPERATION_`echo add_n
> > | sed 's/_$//'`
> > -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include
> > -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include -O2
> > -Wa,--noexecstack `test -f 'add_n.asm' || echo './'`add_n.asm
> > | sparc64-linux-libtool: compile:  ../mpn/m4-ccas --m4=m4 ccache gcc
> > -std=gnu99 -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP -I..
> > -DOPERATION_add_n
> > -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include
> > -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include -O2
> > -Wa,--noexecstack add_n.asm  -fPIC -DPIC -o .libs/add_n.o
> > | m4  -DHAVE_CONFIG_H -D__GMP_WITHIN_GMP -DOPERATION_add_n -DPIC
> > add_n.asm >tmp-add_n.s
> > |  ccache gcc -std=gnu99 -c -DHAVE_CONFIG_H -I. -I.. -D__GMP_WITHIN_GMP
> > -I.. -DOPERATION_add_n
> > -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include
> > -isystem/home/stuff/tmp/staging/sparc64-linux/usr/include -O2
> > -Wa,--noexecstack tmp-add_n.s -fPIC -DPIC -o .libs/add_n.o
> > | tmp-add_n.s: Assembler messages:
> > | tmp-add_n.s:66: Error: Architecture mismatch on "lduw".
> > | tmp-add_n.s:66:  (Requires v9|v9a|v9b; requested architecture is
> > sparclite.)
> > | tmp-add_n.s:67: Error: Architecture mismatch on "lduw".
> > | tmp-add_n.s:67:  (Requires v9|v9a|v9b; requested architecture is
> > sparclite.)
> > | tmp-add_n.s:69: Error: Architecture mismatch on "bl,pn %icc,.Lend1".
> > | tmp-add_n.s:69:  (Requires v9|v9a|v9b; requested architecture is
> > sparclite.)
> > | tmp-add_n.s:70: Error: Architecture mismatch on "lduw".
> > | tmp-add_n.s:70:  (Requires v9|v9a|v9b; requested architecture is
> > sparclite.)
> > | tmp-add_n.s:
> > 
> > cut....
> > 
> > for further details please see build log.
> > Any idea?
> 
> Looks like sparc has a host needs some serious poking around, sorry.
> Either libtool we're building isn't being configured right, or libtool
> has a bug.  It can't hurt to see if Debian has any sparc patches for
> libtool.
> 
hello,

libtool was not even installed. there is no libtool-devel package
available for lenny at all. for none of the architectures. have
installed libtool 1.5.26-4. No updates available. same message than
before. do i need to reconfigure if i installed addidional packages on
build host? if yes, how do i do it? think the problem is anywhere in
sparc configuration. system compiles without libtool on x86_64 machine.
 
regards, harald.



