Received: from smtpauth02.prod.mesa1.secureserver.net ([64.202.165.182])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1NrAtF-0006Ps-JP
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 15:03:31 +0100
Received: (qmail 18703 invoked from network); 15 Mar 2010 13:53:47 -0000
Received: from unknown (209.242.7.187)
	by smtpauth02.prod.mesa1.secureserver.net (64.202.165.182) with ESMTP;
	15 Mar 2010 13:53:47 -0000
Message-ID: <4B9E3BE8.1070800@mwester.net>
Date: Mon, 15 Mar 2010 08:53:44 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.23) Gecko/20090812 Thunderbird/2.0.0.23 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201003081300.19058.holger+oe@freyther.de>	<B6E39224-2467-4EDA-A0F4-94C4F9DAF9CD@vanille-media.de>	<201003081351.35463.holger+oe@freyther.de>
	<201003150446.26284.holger+oe@freyther.de>
In-Reply-To: <201003150446.26284.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 64.202.165.182
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 14:03:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Monday 08 March 2010 13:51:35 Holger Hans Peter Freyther wrote:
>> On Monday 08 March 2010 13:42:07 Dr. Michael Lauer wrote:
>>> While I'm not using it atm., I recall that samba-essential was the only
>>> recipe that worked relatively painless when Matthias Hentges create it
>>> back then.
>> Then please fix it. You will do a great service to our users. The following
>> CVEs are not addressed:
>> 	CVE-2009-2813, CVE-2009-2948, CVE-2009-2906, CVE-2009-1888,
>> CVE-2008-4314, CVE-2008-1105, CVE-2007-6015, CVS-2007-4572,  CVE-2007-5398,
>> CVE-2007-2444, CVE-2007-2446, CVE-2007-2447, CVE-2007-0452, CVE-2007-0453,
>> CVE-2007-0454, CAN-2006-1059..
> 
> 
> any update? Is anyone volunteering to update samba-essential or shall we 
> remove it from the tree? I think we have a responsibility to our users that if 
> we install a network daemon that we at least fix the known security issues with 
> this one or remove it from our recipe collection... Opinions?
> 
> z.

Sigh.

I really don't think this recipe is worthy of this much controversy.
It's essential (hence the name) for certain very small NAS devices.

I fail to see how its presence is impacting others -- if you don't like
it, don't use it.  Simple.

Nevertheless, the same issues I face that prevent me from having the
time to figure out how to fix this recipe right now also preclude me
from spending time discussing and arguing my case on this.

If the presence of this recipe is so loathsome and offensive to the core
OE members that they would prefer to toss a distro out of OE, then go
ahead and do so.

As an alternative, I'll be happy to commit a change to that recipe that
renders it unbuildable for all but SlugOS -- that would ensure that no
one can build and install this "vulnerable" software in error, and
should suffice to address the issue.

-Mike (mwester)



