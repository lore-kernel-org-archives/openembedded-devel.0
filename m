Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MBBOj-000674-IQ
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 19:34:09 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MBBGG-00051f-S8
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 17:25:24 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 17:25:24 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 01 Jun 2009 17:25:24 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 01 Jun 2009 19:25:11 +0200
Message-ID: <h012tn$v40$1@ger.gmane.org>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090526 Shredder/3.0b3pre
In-Reply-To: <20090601165809.GZ23842@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Rebuild external kernel modules on kernel change
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
X-List-Received-Date: Mon, 01 Jun 2009 17:34:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-06-09 18:58, Tom Rini wrote:
> On Sat, Apr 04, 2009 at 03:31:25PM +0200, Koen Kooi wrote:
>
>> Hi,
>>
>> For beagleboard I have a few things I need to rebuild everytime the
>> kernel changes:
>>
>> * powervr kerneldrivers
>> * sdma kernel module
>> * dmai kernel module
>> * codec-engine
>>
>> And I have roughly two kinds of kernel changes:
>>
>> 1) version upgrade (e.g. 2.6.29 ->  2.6.29)
>
> Based on the rest of the email, I assume you mean 2.6.28 ->  2.6.29

right.

>> 2) config changes (e.g. enable ethernet bridging)
>
> So, by coincidence I had this thread around still.  For (1), you already
> have kernel-abiversion, but maybe we need some helpers to make this more
> useful?  For (2) that's not true unless you're changing one of the
> variables that actually changes the running kernel abi (which isn't
> caught in kernel-abiversion file).  This shouldn't be a frequent
> operation.

2) is *very* hard to track down, e.g. people don't expect that enabling 
netfilter as modules breaks external wifi drivers since struct sk_buff 
will change (ask nokia 770 tablet users).
I bet there are a lot more cases where kernel runtime abi changes, so 
every kernel PR bump will trigger a rebuild *and* (here's comes the most 
important bit) an automatic PR bump for recipes using module*.bbclass.

So far I've only seen suggestions that will trigger a rebuild of recipes 
using module*bbclass, but no solutions for automagic version changes so 
that the package manager will pick it up as well.

regards,

Koen



