Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M8KHs-0003TF-1p
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 May 2009 22:27:16 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KK60021C0G5F3G1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sun,
	24 May 2009 15:19:18 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A778414AF5F; Sun,
	24 May 2009 16:19:17 -0400 (EDT)
Date: Sun, 24 May 2009 16:19:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090524201917.GB1445@denix.org>
References: <A24693684029E5489D1D202277BE8944404C82BA@dlee02.ent.ti.com>
	<gv6j7v$hkq$2@ger.gmane.org>
	<A24693684029E5489D1D202277BE8944404C850E@dlee02.ent.ti.com>
	<gv6to9$iev$2@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <gv6to9$iev$2@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
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
X-List-Received-Date: Sun, 24 May 2009 20:27:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 22, 2009 at 09:17:29PM +0200, Koen Kooi wrote:
> On 22-05-09 20:30, Ambrose, Martin wrote:
>> On Fri, May 22, 2009 at 11:18:07, Koen Kooi wrote:
>>
>>>> I have searched this list and googled but can't find a way
>>>> to force a clean of
>>>> a package's dependencies.
>>>
>>> BB_STAMP_POLICY = "whitelist"?
>>
>> Thanks for the suggestion but it doesn't seem to work for me.
>> Looking at the mplayer recipe, e.g, the DEPENDS list includes freetype.
>> So my hope is that the latter 'ls' command in the following sequence
>> would be empty but it  is not.
>>
>> $ ls work/armv5te-none-linux-gnueabi | grep freetype
>> freetype-2.3.6-r0
>>
>> $ BB_STAMP_POLICY="whitelist" bitbake mplayer -c clean
>
> Is BB_STAMP_POLICY in BB_ENV_*WHITE for you? If not, you need to set it in 
> local.conf.

I believe Martin has BB_PRESERVE_ENV=1 set, which is default in Arago for now.

> Also, BB_STAMP_POLICY works in the other direction, it will invalidate 
> mplayer if you touch freetype.

-- 
Denys


