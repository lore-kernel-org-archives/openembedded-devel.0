Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M3GHs-0003Jx-G2
	for openembedded-devel@openembedded.org; Sun, 10 May 2009 23:10:20 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M3GBb-0000Sl-VP
	for openembedded-devel@openembedded.org; Sun, 10 May 2009 21:03:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 10 May 2009 21:03:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 10 May 2009 21:03:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 10 May 2009 23:03:36 +0200
Message-ID: <gu7ff8$cmr$1@ger.gmane.org>
References: <20090427141943.GG18788@smtp.west.cox.net>	<20090429161224.GB18788@smtp.west.cox.net>
	<49FCA524.10102@dls.net>	<c384c5ea0905030529n585de20awfcc6bb835a282483@mail.gmail.com>	<20090503165318.GA7973@smtp.west.cox.net>
	<20090510194704.GZ7973@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090427 Shredder/3.0b3pre
In-Reply-To: <20090510194704.GZ7973@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] Bring PREFERRED_LIBC to all distros
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
X-List-Received-Date: Sun, 10 May 2009 21:10:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10-05-09 21:47, Tom Rini wrote:
> On Sun, May 03, 2009 at 09:53:18AM -0700, Tom Rini wrote:
>> On Sun, May 03, 2009 at 02:29:53PM +0200, Leon Woestenberg wrote:
>>> Hello,
>>>
>>> On Sat, May 2, 2009 at 9:55 PM, Mike (mwester)<mwester@dls.net>  wrote:
>>>> Acked-by: Mike Westerhof<mwester@dls.net>
>>>>
>>> I think we can add this functionality now.
>>>
>>> By the recent merge of "micro.conf" and "micro-uclibc.conf", a new
>>> TODO is to merge the LIBC feature into micro distro as well.
>>> See "[oe] Pull request from DoréDevelopment - New: Micro distro/image"
>>
>> I'll push this out Monday AM us.  IMHO, for micro and micro-uclibc (and
>> similar for minimal/minimal-uclibc) is to merge them back into one and
>> make LIBC an easy override.
>
> So, here's a problem we've run into now.  With distros that use
> debian.bbclass, having an OVERRIDE of 'glibc' added causes the glibc
> recipe to not create a 'glibc' package, nor a 'libc6' package.  The
> libc6-dev package is created.

I suspect that's because ${PN} ('glibc') is now in overrides twice, try 
changing the override to libc-glibc or something similar.

regards,

KOen



