Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Leodt-0002df-8X
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 11:48:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LeoZr-0000S9-26
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 10:43:51 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 10:43:51 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 04 Mar 2009 10:43:51 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 04 Mar 2009 11:43:42 +0100
Message-ID: <golm0u$b4f$1@ger.gmane.org>
References: <20090304101045.GA736@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20090225 Shredder/3.0b3pre
In-Reply-To: <20090304101045.GA736@gmail.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [patch] Fix for nfs-utils tools build
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
X-List-Received-Date: Wed, 04 Mar 2009 10:48:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-03-09 11:10, Khem Raj wrote:
> Hi
>
> Currently nfs-utils 1.1.2 does not build correctly. The reason is that
> there are certain tools which are passed in CFLAGS in their makefiles
> even though they are to be build using host compiler for them to be run
> on host machine.
>
> Current builds use target headers to build them due to CFLAGS funkiness
> where we have alters system include dirs. This goes ok with arm and x86
> but on mips you see errors.

I can trigger this on arm as well, FWIW.

> This patch fixes the issue
>
> OK for .dev

Yes :)

regards,

Koen



