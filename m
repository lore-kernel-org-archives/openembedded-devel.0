Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MBEgB-0003zu-Vn
	for openembedded-devel@openembedded.org; Mon, 01 Jun 2009 23:04:25 +0200
Received: (qmail 20686 invoked from network); 1 Jun 2009 20:55:36 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 1 Jun 2009 13:55:36 -0700
Date: Mon, 1 Jun 2009 13:55:34 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090601205534.GD26065@smtp.west.cox.net>
References: <gr7nfd$32a$1@ger.gmane.org>
	<20090601165809.GZ23842@smtp.west.cox.net>
	<h012tn$v40$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <h012tn$v40$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
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
X-List-Received-Date: Mon, 01 Jun 2009 21:04:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 01, 2009 at 07:25:11PM +0200, Koen Kooi wrote:
> On 01-06-09 18:58, Tom Rini wrote:
>> On Sat, Apr 04, 2009 at 03:31:25PM +0200, Koen Kooi wrote:
>>
>>> Hi,
>>>
>>> For beagleboard I have a few things I need to rebuild everytime the
>>> kernel changes:
>>>
>>> * powervr kerneldrivers
>>> * sdma kernel module
>>> * dmai kernel module
>>> * codec-engine
>>>
>>> And I have roughly two kinds of kernel changes:
>>>
>>> 1) version upgrade (e.g. 2.6.29 ->  2.6.29)
>>
>> Based on the rest of the email, I assume you mean 2.6.28 ->  2.6.29
>
> right.
>
>>> 2) config changes (e.g. enable ethernet bridging)
>>
>> So, by coincidence I had this thread around still.  For (1), you already
>> have kernel-abiversion, but maybe we need some helpers to make this more
>> useful?  For (2) that's not true unless you're changing one of the
>> variables that actually changes the running kernel abi (which isn't
>> caught in kernel-abiversion file).  This shouldn't be a frequent
>> operation.
>
> 2) is *very* hard to track down, e.g. people don't expect that enabling  
> netfilter as modules breaks external wifi drivers since struct sk_buff  
> will change (ask nokia 770 tablet users).
> I bet there are a lot more cases where kernel runtime abi changes, so  
> every kernel PR bump will trigger a rebuild *and* (here's comes the most  
> important bit) an automatic PR bump for recipes using module*.bbclass.

So we need people to have a better understanding of the kernel, true.  I
think we've all been there at some point.  IIRC, netfilter is the
exception, not the rule.

> So far I've only seen suggestions that will trigger a rebuild of recipes  
> using module*bbclass, but no solutions for automagic version changes so  
> that the package manager will pick it up as well.

I think the problem is we're making an automatic hammer for a manual
screwdriver task, in 2/3. (1) does need better handling but we have that
information around already, in kernel-abiversion, we just need to export
that out.

-- 
Tom Rini


