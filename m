Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LEmks-0001Bh-Og
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 16:31:39 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LEmg5-0006Jz-RH
	for openembedded-devel@openembedded.org; Mon, 22 Dec 2008 15:26:42 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 15:26:41 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 22 Dec 2008 15:26:41 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 22 Dec 2008 16:26:26 +0100
Message-ID: <giobj2$m1g$1@ger.gmane.org>
References: <d1b08f940812220656u73035a94i83aa41d4480ccf53@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081217 Shredder/3.0b2pre
In-Reply-To: <d1b08f940812220656u73035a94i83aa41d4480ccf53@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: libc and ARM_INSTRUCTION_SET
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
X-List-Received-Date: Mon, 22 Dec 2008 15:31:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-12-08 15:56, Andrea Adami wrote:
> Hi,
> I'm testing uclibcgnueabi on c7x0.
>
> Two doubts:
>
> 1) arm / thumb
>
> Now armv5te machine defaults to "thumb" and uclibc fails do_compile:
> http://tinderbox.openembedded.net/public/logs/2601805.txt
>
> My solution offhand is to set ARM_INSTRUCTION_SET = "arm" in
> uclibc.inc but perhaps someone can sort out a proper patch.

Having uclibc (and hence libm) in ARM mode would probably be a good thing.


> 2) is it actual and correct that uclibc and klibc are machine-specific?

uclibc is machine specific since the defconfigs are machine specific, 
because at the time OE lacked fine grained architecture overrides.

regards,

Koen



