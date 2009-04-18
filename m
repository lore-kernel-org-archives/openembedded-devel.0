Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LvFmU-0006wp-Ey
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 21:00:50 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LvFiT-0000AP-Nh
	for openembedded-devel@openembedded.org; Sat, 18 Apr 2009 13:56:41 -0500
Message-ID: <49EA225D.2040304@dls.net>
Date: Sat, 18 Apr 2009 13:56:29 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20090414234609.GA27890@denix.org>	<1239752998-7677-1-git-send-email-denis@denix.org>	<20090416163353.GG17629@smtp.west.cox.net>	<gsc6lq$rsp$1@ger.gmane.org>
	<20090418175649.GZ17629@smtp.west.cox.net>
In-Reply-To: <20090418175649.GZ17629@smtp.west.cox.net>
Subject: Re: [PATCH] udev 124: add cache invalidation logic on kernel change or its bootargs/cmdline
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
X-List-Received-Date: Sat, 18 Apr 2009 19:00:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> On Sat, Apr 18, 2009 at 11:31:38AM +0200, Koen Kooi wrote:
>> On 16-04-09 18:33, Tom Rini wrote:
>>> On Tue, Apr 14, 2009 at 07:49:58PM -0400, Denys Dmytriyenko wrote:
>>>
>>>> Signed-off-by: Denys Dmytriyenko<denis@denix.org>
>>>> ---
>>>>   recipes/udev/udev-124/init |   10 +++++++++-
>>>>   1 files changed, 9 insertions(+), 1 deletions(-)
>>> So, for making it optional, how about adding something to /etc/default
>>> to enable / disable dev caching all together?  And, I believe
>>> /proc/atags would just be cp /proc/atags /tmp/atags || touch /tmp/atags.
>> Do we really want atags in there? As the name says, they are ARM TAGs,  
>> and only when kexec is enabled. Does it buy us anything over 
>> /proc/cmdline?
> 
> I'll leave that up to mwester as it was his suggestion originally.

Executive Summary: I don't really care one way or another.


Detail for why this was mentioned in the first place:

The discussion that led up the ARM ATAG suggestion involved an
exploration of all the possible things that could happen to a device
that might cause trouble because of a stale cache.  Using /proc/cmdline
is good, but the suggestion to use the ATAG list was offered because it
captures not just the command line itself, but might also capture other
hardware changes.

As a specific example, consider the use case where one takes a bootable
SD-card image from one om-gta02 device, and plugs it into a different
one with a different hardware version (significant on the om-gta0x
devices).  The use of /proc/cmdline will result in a stale cache; the
use of /proc/atags will catch that the revision number in the atag list
has changed.

Is that sufficient reason to use /proc/atags?  I think that's a pretty
far-fetched and unusual use-case, and if someone is doing that, they
should expect things to break.

So I have no real-world concern if just /proc/cmdline is used.


Regards,
Mike (mwester)


