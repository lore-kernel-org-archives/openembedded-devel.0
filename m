Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M6ijD-0002Ol-ID
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 12:09:01 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M6iby-0004U7-6s
	for openembedded-devel@openembedded.org; Wed, 20 May 2009 10:01:22 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 10:01:22 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 20 May 2009 10:01:22 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 20 May 2009 12:01:10 +0200
Message-ID: <gv0kd6$gn4$1@ger.gmane.org>
References: <c384c5ea0905150520k3e38f4f3q2d2279f714eded1a@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090515 Shredder/3.0b3pre
In-Reply-To: <c384c5ea0905150520k3e38f4f3q2d2279f714eded1a@mail.gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [HEADS UP] zecke-no-host-includes.patch is not compiled-in for gcc 4.3.2+ (4.3.x?)
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
X-List-Received-Date: Wed, 20 May 2009 10:09:40 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15-05-09 14:20, Leon Woestenberg wrote:
> Hello,
>
> I got a heads-up from one of the ptxdist guys that:
>
> http://cgit.openembedded.org/cgit.cgi?url=openembedded/tree/recipes/gcc/gcc-4.3.2/zecke-no-host-includes.patch
>
> no longer works for GCC 4.3.2 as GCC upstream changed "CROSS_COMPILE"
> to "CROSS_DIRECTORY_STRUCTURE".
>
> and the patch uses #ifdef CROSS_COMPILE
>
>
> The patch code thus is not compiled-in.
>
>
> I currently have no gcc 4.3.x oe builds, maybe someone who does can
> verify this quickly?

I can confirm that the code doesn't get compiled in for 4.3.3.

could anyone confirm that my checkin from this morning fixes it? (it 
doesn't break, I've tested that)

regards,

Koen



