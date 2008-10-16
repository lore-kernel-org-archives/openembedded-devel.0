Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KqN85-0001i7-3g
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 09:18:41 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KqN33-0005sM-Ep
	for openembedded-devel@openembedded.org; Thu, 16 Oct 2008 07:13:29 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 07:13:29 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 16 Oct 2008 07:13:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 16 Oct 2008 09:13:21 +0200
Message-ID: <gd6pih$v2p$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <200810151022.38477.zecke@selfish.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Enable --hash-style=both for all recent gcc4 targets
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
X-List-Received-Date: Thu, 16 Oct 2008 07:18:41 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 10:22, Holger Freyther wrote:
> Hey guys,
>
> I would start linking everything with -Wl,--hash-style=both as this is said to
> speed up the loading of shared libraries by about 50% (google is your
> friend). This is an option for binutils and was introduced with binutils
> 2.17. Now there are two ways to achieve this:
>
> Change TARGET_LDFLAGS in e.g. the distro config (as this knows if binutils has
> this option available) or to change the "specs" of gcc to enable this by
> default. There is a patch from debian for gcc4.3 but it is leaving
> arm/armeabi out. What do you guys prefer?

So, the first problem report:

gdb fails to build[1] with:

configure: loading cache .././config.cache
configure: error: `LDFLAGS' has changed since the previous run:
configure:   former value: 
-L/OE/angstrom-dev/staging/arm-oabi-angstrom-linux/usr/lib 
-Wl,-rpath-link,/OE/angstrom-dev/staging/arm-oabi-angstrom-linux/usr/lib 
-Wl,-O1 -Wl,--hash-style=gnu  -s
configure:   current value: 
-L/OE/angstrom-dev/staging/arm-oabi-angstrom-linux/usr/lib 
-Wl,-rpath-link,/OE/angstrom-dev/staging/arm-oabi-angstrom-linux/usr/lib 
-Wl,-O1 -Wl,--hash-style=gnu -s
configure: error: changes in the environment can compromise the build
configure: error: run `make distclean' and/or `rm .././config.cache' and 
start over
configure: error: /bin/sh 
'/OE/angstrom-dev/work/arm-oabi-angstrom-linux/gdb-6.8-r1.1/gdb-6.8/gdb/testsuite/configure' 
failed for testsuite

It seems that it's removing a stray space (' ') which trips up the 
build. Any ideas where this bug is being introduced?

regards,

Koen


[1] http://bugs.openembedded.net/show_bug.cgi?id=4733



