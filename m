Received: from [87.193.137.78] (helo=mail.extern.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1MgDOo-0000Wi-Uo
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 09:58:32 +0200
Received: from consult.extern.dresearch.de (consult.extern.DResearch.DE
	[87.193.137.68])
	by mail.extern.dresearch.de (Postfix) with ESMTP id 1D38116E23B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 09:40:36 +0200 (CEST)
Received: from hiob.intern.dresearch.de (unknown [87.193.137.50])
	by consult.extern.dresearch.de (Postfix) with ESMTP id D09F72A419E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 09:40:35 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by hiob.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 26 Aug 2009 09:40:30 +0200
Message-ID: <4A94E6CB.6050604@dresearch.de>
Date: Wed, 26 Aug 2009 09:39:55 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A8E3AA6.10609@dresearch.de>	<200908211344.53306.holger+oe@freyther.de>	<4A92AB1F.3060404@dresearch.de>	<200908250403.12093.holger+oe@freyther.de>	<4A93C0BB.50206@dresearch.de>
	<4A93FA79.80706@techworks.ie>
In-Reply-To: <4A93FA79.80706@techworks.ie>
X-OriginalArrivalTime: 26 Aug 2009 07:40:30.0281 (UTC)
	FILETIME=[7C7C4B90:01CA2620]
Subject: Re: Variable reference (was: Documentation update about	machine conf files)
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
X-List-Received-Date: Wed, 26 Aug 2009 07:58:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Christian Gagneraud wrote:
> Actually i was thinking as well to have a document presented as a matrix
> that will show quickly when and where this variables are intended to be
> used or not, ie:
> 
> For each variable, there could be a:
> - one line documentation
> - default value
> - Used by (see below)
> - Used in (see below)
> 
> For "Used by" and "Used in", it could be nice to specify yes, no or
> maybe (with default to no) for the following:
>   - bitbake itself
>   - <file>.bbclass
>   - <package>.bb
>   - <meta>.bb
>   - <image>.bb
>   - bitbake.conf
>   - <distro>.conf
>   - <machine>.conf
>   - local.conf
>   - any other interesting things...
> 
> For the difference between used by and used in, here is an example:
> CMDLINE is used in <machine>.conf or local.conf, and is used by linux.inc
> 
> I'm not (yet) familiar with bitbake and bbclass, but I guess that it is
> possible to extract all these information and generate say an xml file
> that can be in turn transformed into anything people like.
> ...

This sounds really good.

If this can done be automatically may be the best place for it could be a generated appendix to the user manual.

Steffen




