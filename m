Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L8Hli-00026c-3Y
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 18:13:38 +0100
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1L8HiE-00051Q-P7
	for openembedded-devel@openembedded.org; Thu, 04 Dec 2008 17:10:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 17:10:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 04 Dec 2008 17:10:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 04 Dec 2008 18:06:03 +0100
Message-ID: <gh92ls$ip9$2@ger.gmane.org>
References: <20081204080249.GR16628@smtp.west.cox.net>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b3pre) Gecko/20081130 Shredder/3.0b1pre
In-Reply-To: <20081204080249.GR16628@smtp.west.cox.net>
Sender: news <news@ger.gmane.org>
Subject: Re: gdb-cross-sdk hacking around gcc-4.3 warnings?
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
X-List-Received-Date: Thu, 04 Dec 2008 17:13:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-08 09:02, Tom Rini wrote:
> Hello, I see that in
> http://gitweb.openembedded.net/?p=openembedded.git;a=commit;h=6348b3baf7a61fc07626a3ecb29b539d438cfb4f
> we dropped -Werror from gdb-cross-sdk.  Was this for gcc-4.3 support?
> If so, could we replace that by importing
> http://patches.ubuntu.com/g/gdb/extracted/gcc-4.3-build-error.patch
> instead?  I'll do the work, just don't want to step on anyones toes if
> there was a different reason behind the change, thanks!

I'm not fond of enabling -Werror in crossbuilders, since simple, 
harmless warnings will break your build.
If you are *completely* sure your patch removes *all* -Werror related 
problems, then go ahead.

regards,

Koen




