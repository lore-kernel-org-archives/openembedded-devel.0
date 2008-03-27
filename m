Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JevKP-00081f-8q
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 17:51:49 +0100
Received: from hoat.troll.no (tedur.troll.no [62.70.27.154])
	by hoat.troll.no (Postfix) with SMTP id A6A0C20AD3
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 17:51:47 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id A0DAB20ACE
	for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 17:51:47 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m2RGpkbD008974
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Mar 2008 17:51:46 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Thu, 27 Mar 2008 17:51:46 +0100 (CET)
Date: Thu, 27 Mar 2008 17:52:07 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803271752.07855.thomas.cooksey@trolltech.com>
In-Reply-To: <200803271544.02819.zecke@selfish.org>
References: <200803271217.41967.thomas.cooksey@trolltech.com>
References: <200803271544.02819.zecke@selfish.org>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
Subject: Re: LEAD_SONAME?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2008 16:51:49 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Disposition: inline

On Thursday 27 March 2008 15:44:02 Holger Freyther wrote:
> On Thursday 27 March 2008 12:17:41 Tom Cooksey wrote:
> > I get a warning saying:
> >
> > NOTE: Multiple libraries (...) found and LEAD_SONAME not defined
> 
> this has to do with debian package renaming. This happens when someone (e.g. 
> your distro as part of its policies) INHERITS the debian bbclass.
> 
> What is happening:
> 	Imagine I have a package foo and only install a libfoo.so.1.0.0 in the 
> libdir. AFAIK according to debian packaging policies the package gets renamed 
> from foo to libfoo1. If you have more than one lib installed OE does not know 
> which lib name to pick and will print the warning (debian.bbclass:83).

Ok, well I'm not sure I like the idea of packages being renamed outside my control,
I wouldn't know which name to use in DEPENDS in other recipies. There is also the
issue of image recipies not knowing about the new name, so I can't just add my
package to the list in the image recipie.

> Your options are:
> 	- Ignore the warning
My prefered option, but only if this is not causing my dissappearing library issue.

> 	- Define a LEAD_SONAME of your primary lib
> 	- More finegrained packaging.
Do you mean doing having LEAD_SONAME_foo, LEAD_SONAME_bar, etc. ? That
could work?

> helpful?
Always. :-)



