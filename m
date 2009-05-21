Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1M7Fh1-0004hb-6n
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 23:20:47 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1M7FZe-00064O-3G
	for openembedded-devel@openembedded.org; Thu, 21 May 2009 21:13:10 +0000
Received: from p5b3b3e33.dip.t-dialin.net ([91.59.62.51])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 21:13:10 +0000
Received: from no2spam by p5b3b3e33.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 21 May 2009 21:13:10 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 21 May 2009 23:12:49 +0200
Message-ID: <gv4g4j$2r4$1@ger.gmane.org>
References: <gv4d2h$oft$1@ger.gmane.org> <gv4ea5$sbp$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b3e33.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <gv4ea5$sbp$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] policy about nonworking recipes
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
X-List-Received-Date: Thu, 21 May 2009 21:20:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Koen Kooi wrote:
> On 21-05-09 22:20, Rolf Leggewie wrote:
> 
>> I think that, eventually, "bitbake world" should be working again and
>> usable as a test case.
> 
> A laudable goal...

But not the only one.  And essentially not even the main motivation 
behind this.  For lack of a better description I'd say it's "OE should 
just work" instead of "OE has a gazillion recipes to build a 
fantastillion packages"*.

* "but most of them won't build for you and you only find out after 
compiling for 48 hours, sorry"

>> I suggest to use COMPATIBLE_MACHINE because I
>> assume that to be the more common issue.
> 
> NAK, we have a perfectly good EXCLUDE_FROM_WORLD = "1" for that, which 
> is already used in lots (well, 23) recipes and classes.

Any bb in the repo should be buildable or clearly say where it is not 
and exclude itself from any build where it isn't suitable. 
EXCLUDE_FROM_WORLD does not do that, so it's not a solution.

DEFAULT_PREFERENCE -1 would be feasible but that just says "doesn't 
work" whereas COMPATIBLE_MACHINE is more than likely to be a step in the 
right direction (again, assuming most situations where things don't work 
here but work for somebody else will be machine-dependent).  The 
semantics of COMPATIBLE_MACHINE being "no compatible machines known to 
the last committer".  If it turns out to be a host-dependent issue, 
instead, then the next commit should replace the COMPATIBLE_MACHINE line 
with one listing only the COMPATIBLE_HOSTs.

I'm all ears for differing suggestions, but EXCLUDE_FROM_WORLD isn't 
really a solution.

Regards

Rolf



