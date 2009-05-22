Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7aP9-0004qx-PI
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 21:27:43 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1M7aHi-0002Q9-9k
	for openembedded-devel@openembedded.org; Fri, 22 May 2009 19:20:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 19:20:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 22 May 2009 19:20:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 22 May 2009 21:17:29 +0200
Message-ID: <gv6to9$iev$2@ger.gmane.org>
References: <A24693684029E5489D1D202277BE8944404C82BA@dlee02.ent.ti.com>	<gv6j7v$hkq$2@ger.gmane.org>
	<A24693684029E5489D1D202277BE8944404C850E@dlee02.ent.ti.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b5pre) Gecko/20090519 Shredder/3.0b3pre
In-Reply-To: <A24693684029E5489D1D202277BE8944404C850E@dlee02.ent.ti.com>
Sender: news <news@ger.gmane.org>
Subject: Re: Force clean of dependencies
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
X-List-Received-Date: Fri, 22 May 2009 19:27:44 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22-05-09 20:30, Ambrose, Martin wrote:
> On Fri, May 22, 2009 at 11:18:07, Koen Kooi wrote:
>
>>> I have searched this list and googled but can't find a way
>>> to force a clean of
>>> a package's dependencies.
>>
>> BB_STAMP_POLICY = "whitelist"?
>
> Thanks for the suggestion but it doesn't seem to work for me.
> Looking at the mplayer recipe, e.g, the DEPENDS list includes freetype.
> So my hope is that the latter 'ls' command in the following sequence
> would be empty but it  is not.
>
> $ ls work/armv5te-none-linux-gnueabi | grep freetype
> freetype-2.3.6-r0
>
> $ BB_STAMP_POLICY="whitelist" bitbake mplayer -c clean

Is BB_STAMP_POLICY in BB_ENV_*WHITE for you? If not, you need to set it 
in local.conf.
Also, BB_STAMP_POLICY works in the other direction, it will invalidate 
mplayer if you touch freetype.

regards,

Koen



