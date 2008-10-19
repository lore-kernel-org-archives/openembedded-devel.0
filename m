Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KrahV-0002n1-5z
	for openembedded-devel@openembedded.org; Sun, 19 Oct 2008 18:00:17 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KrahG-0004oJ-T7
	for openembedded-devel@openembedded.org; Sun, 19 Oct 2008 16:00:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 19 Oct 2008 16:00:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Oct 2008 16:00:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 19 Oct 2008 17:55:16 +0200
Message-ID: <gdfl94$866$1@ger.gmane.org>
References: <20081017131704.GA4334@jama>	<200810172041.10116.openembedded@haerwu.biz>	<20081018183016.GA4310@jama>
	<c384c5ea0810181249x4d700cdbw2e409eb1fecefaab@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081015 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0810181249x4d700cdbw2e409eb1fecefaab@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: checksums.ini - should check only against filename not uri_src
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
X-List-Received-Date: Sun, 19 Oct 2008 16:00:17 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18-10-2008 21:49, Leon Woestenberg wrote:
> Hello,
>
> On Sat, Oct 18, 2008 at 8:30 PM, Martin Jansa<Martin.Jansa@mk.cvut.cz>  wrote:
>> On Fri, Oct 17, 2008 at 08:41:09PM +0200, Marcin Juszkiewicz wrote:
>> could be used. From discussion on irc it seemed like global checksums.ini
>> is not a good idea at all, at least because of high probability of merge
>> conflicts, and that checksums should be moved to .bb files or defined on
>> per-package files.
>>
> Yes, I agree the checksums solution should be redesigned.
>
>
> Note that I have written a package to help import, learn and
> automatically google for missing packages, from which some ideas might
> be ripped.

Could we use it in OE as do_fetch error handler? If we know the sha256 
sum of a package it is safe to pull it from a semi-random place on the 
net when debian cleans out their archive again.

regards,

Koen


>
> Source here:
>
> http://www.sidebranch.com/leon/witpa_20080730.tar.bz2
>
> Regards,




