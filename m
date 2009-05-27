Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M9N0W-0001eM-V7
	for openembedded-devel@openembedded.org; Wed, 27 May 2009 19:33:41 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M9Msa-0002pz-B2
	for openembedded-devel@openembedded.org; Wed, 27 May 2009 17:25:28 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 27 May 2009 17:25:28 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 27 May 2009 17:25:28 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 27 May 2009 19:25:17 +0200
Message-ID: <gvjt1t$h21$1@ger.gmane.org>
References: <gvivan$clg$1@ger.gmane.org> <4A1D768E.4050101@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090522 Shredder/3.0b3pre
In-Reply-To: <4A1D768E.4050101@balister.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH] linux-omap: sync everything with .dev
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
X-List-Received-Date: Wed, 27 May 2009 17:33:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27-05-09 19:21, Philip Balister wrote:
> Koen Kooi wrote:
>> [ This is only the diffstat, the complete 4 megabyte big patch is at
>> http://dominion.thruhere.net/koen/OE/0001-linux-omap-sync-everything-with-.dev.patch
>> ]
>>
>> linux-omap: sync everything with .dev
>> * also sync the machine files to match the kernels
>
> Koen,
>
> I patched .stable and tried building console-image. This build failed on
> omap3-sgx-modules. Is there a way we can avoid building this? I suspect
> I can make it build by reading the bb file and downloading something
> from the TI website, but I'd like stable to build without having to do
> that.

The sgx modules don't need any evil bits :) My plan was to update the 
sgx modules and codec-engine, dmai, etc in seperate patches along the way.

regards,

Koen



