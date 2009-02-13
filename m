Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LXu4z-000142-8u
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 10:11:25 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1LXu3e-00054C-Py
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 09:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 09:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 09:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 13 Feb 2009 10:05:02 +0100
Message-ID: <gn3d3v$um5$2@ger.gmane.org>
References: <200902121727.21796.roman@khimov.ru>	<c384c5ea0902120728n459671f4y32957b212a8af0ed@mail.gmail.com>	<gn1j5m$qc5$2@ger.gmane.org>
	<200902130952.52664.roman@khimov.ru>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090209 Shredder/3.0b2pre
In-Reply-To: <200902130952.52664.roman@khimov.ru>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] icecc: base fix for cross and native builds
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
X-List-Received-Date: Fri, 13 Feb 2009 09:11:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13-02-09 07:52, Roman I Khimov wrote:
> Koen Kooi:
>> On 12-02-09 16:28, Leon Woestenberg wrote:
>>> On Thu, Feb 12, 2009 at 3:27 PM, Roman I Khimov<roman@khimov.ru>   wrote:
>>>> There are severe problems with icecc builds currently in OE.
>>>> Cross-compiler tarball created wrong, PATH set incorrectly, etc.
>>> Excellent!
>>>
>>> It's probably a little-used class, but if we get it to work more
>>> robustly, we can make more noise about it.
>>>
>>> I will try to do some tests here over the next few weeks with your
>>> patch, time permitting.
>> Once icecc works we should have a chat with the suse buildservice
>> people. PARALLEL_MAKE = "-j256", here we come :)
>
> I'm running it with "-j14" there and combined with bitbake parallel task
> execution it just rocks, the only slowdowns are blacklisted packages like
> gcc and glibc.
>
> So, if anyone cares enough to commit? ;)


AIUI Leon wants to give it a spin first, but you have my +1.

regards,

Koen



