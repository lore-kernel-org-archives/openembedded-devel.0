Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LwCBg-0007Wn-Ac
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 11:22:45 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LwC7Q-0004Lm-Pd
	for openembedded-devel@openembedded.org; Tue, 21 Apr 2009 09:18:20 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 09:18:20 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Apr 2009 09:18:20 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Apr 2009 11:18:10 +0200
Message-ID: <gsk30i$7bc$1@ger.gmane.org>
References: <49D3582F.4070304@xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b4pre) Gecko/20090415 Shredder/3.0b3pre
In-Reply-To: <49D3582F.4070304@xora.org.uk>
Sender: news <news@ger.gmane.org>
Subject: Re: klibc problems
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
X-List-Received-Date: Tue, 21 Apr 2009 09:22:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01-04-09 14:03, Graeme Gregory wrote:
> Ok, its no mystery to some people that klibc has problems with modern
> kernels.
>
> But I think we also have a problem with the package in OE. Seeing as
> klibc is machine dependent in that it includes mach-XXX/include/mach/*.h
> files it really should not be staged as part of the base arch. I think
> we need to stage it into ${MACHINE_ARCH} the same was as the kernel is.
>
> We can then work on fixing the application compiles. I think I have a
> suitable hack.

It will also fail in a multimachine environment and when you change 
kernels. To address the second point I propose one of the following:

* make klibc nostamp
* make klibc use MACHINE_KERNEL_PR (and all kernels and machines using 
klibc)

To address the first point I think we need to get Graeme's stuff in.

regards,

Koen



