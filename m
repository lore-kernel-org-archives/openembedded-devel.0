Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MQyqF-0008DC-99
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 09:23:51 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MQydF-00067C-Sq
	for openembedded-devel@openembedded.org; Wed, 15 Jul 2009 07:10:26 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 15 Jul 2009 07:10:25 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 15 Jul 2009 07:10:25 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 15 Jul 2009 09:10:14 +0200
Message-ID: <h3jvcm$d6e$1@ger.gmane.org>
References: <200907121334.38852.raj.khem@gmail.com>	<20090713035713.GA21203@denix.org>	<1247600832.29960.18.camel@dax.rpnet.com>
	<h3iq36$riq$1@ger.gmane.org>
	<c384c5ea0907141413p49b39706t95e7b426d0d276a8@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1.1pre) Gecko/20090708 Shredder/3.0b3pre
In-Reply-To: <c384c5ea0907141413p49b39706t95e7b426d0d276a8@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: e2fsprogs-libs build failure analysis
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
X-List-Received-Date: Wed, 15 Jul 2009 07:23:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14-07-09 23:13, Leon Woestenberg wrote:
> Hello,
>
> On Tue, Jul 14, 2009 at 10:33 PM, Koen Kooi<k.kooi@student.utwente.nl>  wrote:
>> On 14-07-09 21:47, Richard Purdie wrote:
>>
>>> The real problem here is two packages providing the same library. This
>>> is actually a critical error and means your distro is screwed unless
>>> handled very carefully. Rather than hacking around the problem, I'd much
>>> rather we detect and abort in this case and warn the user something is
>>> about to break and that any package feeds will need careful attention.
>>
>> In this case it works as intended, at least in angstrom :)
>>
> Not sure, I get build errors on both packages.
>
> http://bugs.openembedded.org/show_bug.cgi?id=5149

I wasn't talking about build errors, I was getting at the "any package 
feeds will need careful attention" bit



