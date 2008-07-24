Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KLwiU-0005Yy-Tq
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 11:02:30 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KLwhE-000516-R3
	for openembedded-devel@openembedded.org; Thu, 24 Jul 2008 09:01:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 09:01:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 24 Jul 2008 09:01:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 24 Jul 2008 11:01:01 +0200
Message-ID: <g69gcd$nm3$1@ger.gmane.org>
References: <200807240048.20980.bluelightning@bluelightning.org>	<g69aeh$5cu$1@ger.gmane.org>
	<1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird/3.0a2pre (Macintosh; 2008062403)
In-Reply-To: <1404.78.86.188.127.1216886903.squirrel@webmail12.pair.com>
Sender: news <news@ger.gmane.org>
Subject: Re: PATCH: make h2200-bootloader load & depend on mtdblock
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 24 Jul 2008 09:02:31 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Paul Eggleton wrote:
> Koen Kooi wrote:
>> Never ever rdepend on a kernelmodules, since it might be built in to the
>> kernel in the future (like it was in the past), only use
>>
>> RRECOMMENDS_${PN} = "kernel-module-foo"
>
> OK, so please excuse my ignorance and I don't have OE in front of me to
> test it, but does that mean that kernel-module-mtdblock will be included
> in images where h2200-bootloader is included? If not, then it needs to be
> done some other way.

It means that h2200-bootloader (but not the -dev and -dbg packages) with 
have this in its opkg controlfile:

Recommends: kernel-module-foo

regards,

Koen



