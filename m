Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1LU3BW-0003bs-Tk
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 19:06:24 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n12Hw9Rs031808
	for <openembedded-devel@openembedded.org>; Mon, 2 Feb 2009 17:58:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31341-10 for <openembedded-devel@openembedded.org>;
	Mon,  2 Feb 2009 17:58:05 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id n12Hw3Wl031802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 2 Feb 2009 17:58:04 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF61D@hiob.intern.dresearch.de>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF61D@hiob.intern.dresearch.de>
Date: Mon, 02 Feb 2009 17:59:47 +0000
Message-Id: <1233597587.5363.76.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: config/compile problem with apr-1.2.12
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
X-List-Received-Date: Mon, 02 Feb 2009 18:06:31 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-02-02 at 16:35 +0100, Sledz, Steffen wrote:
> I'm not really sure what's the problem here, maybe it has the same background like <http://bugs.gentoo.org/show_bug.cgi?id=226577>. Can someone help?
> 
> ERROR: log data follows (/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/temp/log.do_compile.30454)
> | NOTE: make
> | make[1]: Entering directory `/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12'
> | /bin/bash /home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/libtool --silent --mode=compile i486-angstrom-linux-gcc -march=i486   -isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -DHAVE_CONFIG_H -DLINUX=2 -D_REENTRANT -D_GNU_SOURCE  -isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include -I./include -I/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/include/arch/unix -I./include/arch/unix -I/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/include  -o passwd/apr_getpass.lo -c passwd/apr_getpass.c && touch passwd/apr_getpass.lo
> | /home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/libtool: line 460: CDPATH: command not found
> | /home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/libtool: line 1138: func_opt_split: command not found
> | libtool: Version mismatch error.  This is libtool 2.2.4, but the
> | libtool: definition of this LT_INIT comes from an older release.
> | libtool: You should recreate aclocal.m4 with macros from libtool 2.2.4
> | libtool: and run autoconf again.
> | make[1]: *** [passwd/apr_getpass.lo] Error 63
> | make[1]: Leaving directory `/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12'
> | make: *** [all-recursive] Error 1
> | FATAL: oe_runmake failed

I'd try the recipes in Poky for apr and apr-utils as they have fixes for
a load of issues like this...

Cheers,

Richard



