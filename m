Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L55xQ-0008VB-He
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 23:00:34 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L55uY-0001W8-NB
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 21:57:34 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 21:57:34 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 21:57:34 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Nov 2008 22:57:27 +0100
Message-ID: <gghsc8$jot$1@ger.gmane.org>
References: <gghjh1$dg1$1@ger.gmane.org>	<200811252113.50363.openembedded@haerwu.biz>	<gghp49$76g$1@ger.gmane.org>
	<200811252242.05674.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <200811252242.05674.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Tue, 25 Nov 2008 22:00:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25-11-08 22:42, Marcin Juszkiewicz wrote:
> Tuesday 25 of November 2008 22:02:00 Koen Kooi napisał(a):
>
>> How would a non-OE user know that http://openembedded.org/dl/ICA2.txt
>> is the license? Shipping the license itself in the packages would be
>> better, but that will need a lot of thought,
>
>> since we can't have a 1000 packages shipping
>> /usr/share/licenses/GPLv2, and *all* packages from a recipe need a
>> license, even -doc, -dev -and -dbg.
>
> /usr/share/common-licenses/ is part of base-files-doc now and consists
> GPL, LGPL, BSD, Artistic and few other licenses. We can extend this list
> and create 'common-licenses' package which would be installed in each
> image.
>
>> The concrete problem I have is that I have a bunch of licenses that
>> don't have a name (not even inside the company that wrote them), so
>> my recipes have things like
>>
>> LICENSE = "proprietary binary"
>> LICENSE = "evil binary"
>
> So add license.txt into /usr/share/doc/${PN}/ with content of that
> package license. I have done few such packages during last year as some
> copyright holders gave permissions to distribute their stuff *ONLY* with
> attached license. This kind of stuff does not even need nothing new - it
> is just another file in SRC_URI.

I like that idea very much, but the license file will have to be in 
every entry in PACKAGES, so ${PN} won't work. Do you have a suggestion 
on how to handle that?

>> So as short term solution I'd like to be able to point to a url for
>> the 'licenses without a proper name'

> Yeah.. especially when license contents is available only in restricted
> area for which simple person can not get access (for example Marvell
> extranet). If there are packages which have own license then such
> license should be inside of package.

So you agree that in those situations we can point to an URL, but in 
other cases either use the name or include it in the package?

regards,

Koen



