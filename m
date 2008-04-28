Received: from [81.169.183.159] (helo=coruscant.onosendai.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JqbEx-0007KI-8Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 23:50:27 +0200
Received: from [92.117.75.129] (helo=[10.161.75.129])
	by coruscant.onosendai.de with esmtpsa
	(TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <zecke@selfish.org>) id 1JqbEX-0002oY-HZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 23:50:01 +0200
From: Holger Freyther <zecke@selfish.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Apr 2008 23:49:46 +0200
User-Agent: KMail/1.9.9
References: <200804281451.05548.geoffrey@pager.net>
In-Reply-To: <200804281451.05548.geoffrey@pager.net>
MIME-Version: 1.0
Message-Id: <200804282349.46539.zecke@selfish.org>
X-Broken-Reverse-DNS: no host name found for IP address 92.117.75.129
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Mon, 28 Apr 2008 21:50:27 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Monday 28 April 2008 21:51:05 Geoffrey Wossum wrote:
> Hi all,
>
> I'm having a brand new issue building uClibc-0.9.29 for the AVR32.  When
> running do_configure for uclibc, it gets a bunch of errors like:
>
>
> gcc -DCURSES_LOC="<ncurses.h>" -DLOCALE
> -I/home/geoff/lrs/playpaq/tmp/staging/avr32-angstrom-linux-uclibc/usr/inclu
>de  -lncursesw conf.o  zconf.tab.o -o conf
>
> | conf.o: In function `strip':
> | conf.c:(.text+0x20): undefined reference to `__ctype_b'
> | conf.c:(.text+0x97): undefined reference to `__ctype_b'
> | conf.o: In function `conf_sym':
> | conf.c:(.text+0x5bf): undefined reference to `__stdout'
>
> ...continues on...
>
> I think the problem is the following line in packages/uclibc/uclibc.inc:
> EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}'
> HOSTCFLAGS='-I${STAGING_INCDIR}'"
>
> Seems to me like that should be STAGING_INCDIR_NATIVE instead of
> STAGING_INCDIR.  If I make that change, then everything works again.
>
> Does this seem correct?


hmm, in autoconf terminology host is:
"  --host=HOST       cross-compile to build programs to run on HOST [BUILD]"

if uclibc has the same terminology your patch is wrong, I don't know it 
though.


