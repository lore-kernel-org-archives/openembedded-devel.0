Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LvEqb-0008HS-Re
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 20:01:02 +0200
Received: from fed1rmimpo02.cox.net ([70.169.32.72]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090418175653.BKZB27308.fed1rmmtao101.cox.net@fed1rmimpo02.cox.net>
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Apr 2009 13:56:53 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo02.cox.net with bizsmtp
	id h5wp1b0064dMFYL045wpRM; Sat, 18 Apr 2009 13:56:52 -0400
X-Authority-Analysis: v=1.0 c=1 a=ecVkfYrEE2AA:10 a=DeDhTLAQbfcA:10
	a=0gcC27t9AAAA:8 a=bCH52ZkrCSCCnKK8fpIA:9
	a=lsVXsGi999YUoUJY2yh9u_TnK3kA:4 a=4KgpRpU3nOMA:10
X-CM-Score: 0.00
Date: Sat, 18 Apr 2009 10:56:49 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090418175649.GZ17629@smtp.west.cox.net>
References: <20090414234609.GA27890@denix.org>
	<1239752998-7677-1-git-send-email-denis@denix.org>
	<20090416163353.GG17629@smtp.west.cox.net>
	<gsc6lq$rsp$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gsc6lq$rsp$1@ger.gmane.org>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel	change or its bootargs/cmdline
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
X-List-Received-Date: Sat, 18 Apr 2009 18:01:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Apr 18, 2009 at 11:31:38AM +0200, Koen Kooi wrote:
> On 16-04-09 18:33, Tom Rini wrote:
>> On Tue, Apr 14, 2009 at 07:49:58PM -0400, Denys Dmytriyenko wrote:
>>
>>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>>> ---
>>>   recipes/udev/udev-124/init |   10 +++++++++-
>>>   1 files changed, 9 insertions(+), 1 deletions(-)
>>
>> So, for making it optional, how about adding something to /etc/default
>> to enable / disable dev caching all together?  And, I believe
>> /proc/atags would just be cp /proc/atags /tmp/atags || touch /tmp/atags.
>
> Do we really want atags in there? As the name says, they are ARM TAGs,  
> and only when kexec is enabled. Does it buy us anything over 
> /proc/cmdline?

I'll leave that up to mwester as it was his suggestion originally.

-- 
Tom Rini


