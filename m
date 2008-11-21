Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L3Y8Q-00076J-D5
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 16:41:30 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L3Y5r-00059P-S7
	for openembedded-devel@openembedded.org; Fri, 21 Nov 2008 15:38:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 15:38:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 21 Nov 2008 15:38:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 21 Nov 2008 16:38:44 +0100
Message-ID: <gg6km4$c2d$1@ger.gmane.org>
References: <gg6aes$5vf$1@ger.gmane.org> <4926D1D1.6030204@dresearch.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <4926D1D1.6030204@dresearch.de>
Sender: news <news@ger.gmane.org>
Subject: Re: Revert "busybox: Disable busybox shadow support for Angstrom"
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
X-List-Received-Date: Fri, 21 Nov 2008 15:41:30 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21-11-08 16:20, Steffen Sledz wrote:
> Koen Kooi wrote:
>> Graeme and I reverted "busybox: Disable busybox shadow support for
>> Angstrom", the commit message explains it:
>>
>> "Revert "busybox: Disable busybox shadow support for Angstrom"
>
> Mea culpa! Mea maxima culpa!
>
> My fault. I will write down the new committers instructions 100 times as penalty. OK?
>
> But back to the problem. It was reportet as bug 4808 (see http://bugs.openembedded.net/show_bug.cgi?id=4808) on November the 6th. Busybox 1.11.3 for Angstrom is build with shadow support, but Angstrom does not install /etc/shadow. This results in problems when calling the passwd command. Earlier busybox versions do not enable shadow support for Angstrom.
>
> I see two possible solutions:
>
> 1. the patch i committed illegaly
>
> 2. install /etc/shadow and fully support it (i believe ther is something more to do here)

2) is what is wanted for the angstrom 2008 release.

regards,

Koen



