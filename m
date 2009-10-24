Received: from [80.91.229.12] (helo=lo.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1N1iPg-0003WH-E2 for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 17:20:19 +0200
Received: from list by lo.gmane.org with local (Exim 4.50) id 1N1iOg-000210-ND
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Oct 2009 17:19:14 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 17:19:14 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Oct 2009 17:19:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 24 Oct 2009 17:18:51 +0200
Message-ID: <hbv5sr$85i$1@ger.gmane.org>
References: <200910230504.57681.holger+oe@freyther.de>	<hbru1e$m80$1@ger.gmane.org>
	<1256296026.9503.26.camel@hammer.suse.cz>	<200910231334.13581.holger+oe@freyther.de>	<1256337084.9460.9.camel@utx.utx.cz>
	<hbuf0m$esa$1@ger.gmane.org>
	<1256393164.15214.46.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.3pre) Gecko/20090811 Shredder/3.0b4pre
In-Reply-To: <1256393164.15214.46.camel@lenovo.internal.reciva.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert "package bbclass: strip static libs as well"
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
X-List-Received-Date: Sat, 24 Oct 2009 15:20:19 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24-10-09 16:06, Phil Blundell wrote:
> On Sat, 2009-10-24 at 10:48 +0200, Koen Kooi wrote:
>> On 24-10-09 00:31, Stanislav Brabec wrote:


>>> bison-2.3-r0: /usr/lib/liby.a
>
> That one is a special case: it wants to stay in the main bison package,
> since bison itself is a development tool.  I'm not sure why it is a
> static-only library; that might be an error.

I put that in ${PN}: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=koen/static-libs-rework


>>> flex-2.5.31-r4: /usr/lib/libfl.a
>
> This is like bison.

Ditto: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=koen/static-libs-rework


>>> gcc-4.3.3-r7.1: /usr/lib/libstdc++_pic.a
>>> gcc-4.3.3-r7.1: /usr/lib/libssp_nonshared.a
>
> Those are probably special.  I'm not quite sure what the deal is with
> libstdc++_pic, that would need some further investigation.

Gcc-package-*.inc overrides PACKAGES, so these won't be affected.

>>> glibc-2.9-r35.2: /usr/lib/libc_nonshared.a
>>> glibc-2.9-r35.2: /usr/lib/libmcheck.a
>>> glibc-2.9-r35.2: /usr/lib/libg.a
>>> glibc-2.9-r35.2: /usr/lib/libbsd-compat.a
>>> glibc-2.9-r35.2: /usr/lib/libieee.a
>>> glibc-2.9-r35.2: /usr/lib/libpthread_nonshared.a
>
> The nonshared ones are special.  The others belong in the -static
> package.

Already did that: 
http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=koen/static-libs-rework

I can run stanislavs scripts after the weekend to see if there are 
anymore special packages.

For people like Holger: you can add 
git://dominion.thruhere.net/var/cache/git/openembedded.git as a remote 
and fetch my branch from there.

regards,

Koen



