Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L555r-000271-DF
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 22:05:11 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L552y-0007tJ-9x
	for openembedded-devel@openembedded.org; Tue, 25 Nov 2008 21:02:12 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 21:02:12 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 25 Nov 2008 21:02:12 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Nov 2008 22:02:00 +0100
Message-ID: <gghp49$76g$1@ger.gmane.org>
References: <gghjh1$dg1$1@ger.gmane.org>
	<200811252113.50363.openembedded@haerwu.biz>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081116 Shredder/3.0b1pre
In-Reply-To: <200811252113.50363.openembedded@haerwu.biz>
Sender: news <news@ger.gmane.org>
Subject: Re: [RFC] LICENSE fields and packages
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
X-List-Received-Date: Tue, 25 Nov 2008 21:05:11 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25-11-08 21:13, Marcin Juszkiewicz wrote:
> Tuesday 25 of November 2008 20:26:24 Koen Kooi napisał(a):

>> Back to the point: what do you think of allowing URLs in the LICENSE
>> field?
>
> Show me code which will make use of it first? Why not add license to
> SRC_URI?

At this point it's not about code, it's about being able to show a legal 
department that the license is referenced in the package.

How would a non-OE user know that http://openembedded.org/dl/ICA2.txt is 
the license? Shipping the license itself in the packages would be 
better, but that will need a lot of thought, since we can't have a 1000 
packages shipping /usr/share/licenses/GPLv2, and *all* packages from a 
recipe need a license, even -doc, -dev -and -dbg.

The concrete problem I have is that I have a bunch of licenses that 
don't have a name (not even inside the company that wrote them), so my 
recipes have things like

LICENSE = "proprietary binary"
LICENSE = "evil binary"

So as short term solution I'd like to be able to point to a url for the 
'licenses without a proper name' and for the long term have a proper, 
package format independant solution.

regards,

Koen



