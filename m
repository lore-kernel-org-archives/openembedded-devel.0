Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Kq4La-0001eg-91
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 13:15:22 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Kq4GY-0002uk-Ld
	for openembedded-devel@openembedded.org; Wed, 15 Oct 2008 11:10:10 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 11:10:10 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Oct 2008 11:10:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Oct 2008 13:09:56 +0200
Message-ID: <gd4j24$lq3$1@ger.gmane.org>
References: <200810151022.38477.zecke@selfish.org>
	<c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20081006 Shredder/3.0b1pre
In-Reply-To: <c384c5ea0810150343i1ad5429aubf37b9bdef2165a6@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 Oct 2008 11:15:22 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-10-2008 12:43, Leon Woestenberg wrote:
> Hello,
>
> On Wed, Oct 15, 2008 at 10:22 AM, Holger Freyther<zecke@selfish.org>  wrote:
>> Hey guys,
>>
>> I would start linking everything with -Wl,--hash-style=both as this is said to
>> speed up the loading of shared libraries by about 50% (google is your
>>
> If we care about dynamic link speed we should maybe revisit the rpath issue.
>
> I remember seeing strace's where on each .so, 10 attempts were made
> before the right location was attempted.
>
> Actually, it is still on my to do:
>
> http://bugs.openembedded.net/show_bug.cgi?id=2140

Doesn't insane.bbclass log bad rpaths? Or are you talking about spurious 
rpaths that don't point to staging or workdir?
AIUI libtool 2.x should solve a lot of these.

regards,

Koen



