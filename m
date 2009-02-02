Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LU4ge-0007F0-Re
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 20:42:32 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LU4Yu-0004ec-Bq
	for openembedded-devel@openembedded.org; Mon, 02 Feb 2009 19:34:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 19:34:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 02 Feb 2009 19:34:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 02 Feb 2009 20:34:16 +0100
Message-ID: <gm7hro$nph$1@ger.gmane.org>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF61D@hiob.intern.dresearch.de>
	<1233597587.5363.76.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090123 Shredder/3.0b2pre
In-Reply-To: <1233597587.5363.76.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
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
X-List-Received-Date: Mon, 02 Feb 2009 19:43:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02-02-09 18:59, Richard Purdie wrote:
> On Mon, 2009-02-02 at 16:35 +0100, Sledz, Steffen wrote:
>> I'm not really sure what's the problem here, maybe it has the same background like<http://bugs.gentoo.org/show_bug.cgi?id=226577>. Can someone help?
>>
>> ERROR: log data follows (/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/temp/log.do_compile.30454)
>> | NOTE: make
>> | make[1]: Entering directory `/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12'
>> | /bin/bash /home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/libtool --silent --mode=compile i486-angstrom-linux-gcc -march=i486   -isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -DHAVE_CONFIG_H -DLINUX=2 -D_REENTRANT -D_GNU_SOURCE  -isystem/home/sledz/oe/tmp.1/staging/i486-angstrom-linux/usr/include -I./include -I/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/include/arch/unix -I./include/arch/unix -I/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/include  -o passwd/apr_getpass.lo -c passwd/apr_getpass.c&&  touch passwd/apr_getpass.lo
>> | /home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/libtool: line 460: CDPATH: command not found
>> | /home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12/libtool: line 1138: func_opt_split: command not found
>> | libtool: Version mismatch error.  This is libtool 2.2.4, but the
>> | libtool: definition of this LT_INIT comes from an older release.
>> | libtool: You should recreate aclocal.m4 with macros from libtool 2.2.4
>> | libtool: and run autoconf again.
>> | make[1]: *** [passwd/apr_getpass.lo] Error 63
>> | make[1]: Leaving directory `/home/sledz/oe/tmp.1/work/i486-angstrom-linux/apr-1.2.12-r0/apr-1.2.12'
>> | make: *** [all-recursive] Error 1
>> | FATAL: oe_runmake failed
>
> I'd try the recipes in Poky for apr and apr-utils as they have fixes for
> a load of issues like this...

I 'fixed' apr today, but I wouldn't mind some more poky goodness in .dev :)

regards,

Koen



