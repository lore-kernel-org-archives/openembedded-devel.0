Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NGYxg-0007dh-MQ for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:16:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NGYw6-0005qO-DD
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Dec 2009 15:15:06 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 15:15:06 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Dec 2009 15:15:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 04 Dec 2009 15:12:33 +0100
Message-ID: <hfb5cg$nqi$3@ger.gmane.org>
References: <E1NGUiP-00061U-6s@melo.openembedded.org>	<141020e30912040151l26670979g9cb02c4d4539da38@mail.gmail.com>	<20091204095951.6846190d@xora.org.uk>
	<20091204100443.GA13717@jama>	<hfanak$9l5$1@ger.gmane.org>
	<20091204132917.GB13717@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <20091204132917.GB13717@jama>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: David-John Willis : font-util: Add 1.1.1 target and native.
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
X-List-Received-Date: Fri, 04 Dec 2009 14:16:47 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04-12-09 14:29, Martin Jansa wrote:
> On Fri, Dec 04, 2009 at 11:12:36AM +0100, Koen Kooi wrote:
>> On 04-12-09 11:04, Martin Jansa wrote:
>>
>>> Should I merge oe.dev to that "short lived" xorg-7.5 branch? (lots of
>>> commits but better to resolve conflicts once there than in every
>>> distribution tester who merge that branch as shr do).
>>
>> That'd be nice.
>
> Pushed..
>
> woglinde suggested pushing remaining recipes with
> DEFAULT_PREFERRENCE = "-1"
> I would add
> DEFAULT_PREFERRENCE_shr = "1"
> as we are already using it without include for preferred-xorg-versions,
> can I merge that branch with those 2 in all new recipes (except util-macros
> and font recipes)?
>
> Or can Angstrom include
> preferred-xorg-versions-X11R7.4-updates.inc
> + updates already used in Angstrom (ie util-macros, pixman, fonts). Then
> I could merge it without DEFAULT_PREFERRENCE change..

I actually want 7.5 in angstrom, so there shouldn't be a need for the 
DEFAULT_PREFERENCE stuff.

regards,

Koen



