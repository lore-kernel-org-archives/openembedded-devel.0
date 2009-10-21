Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N0Zbc-0001l5-Nm
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Oct 2009 13:43:55 +0200
Received: from [192.168.1.12] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 808CA584B25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 14:27:01 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hbmqrv$ne5$1@ger.gmane.org>
References: <hbmose$gtv$1@ger.gmane.org>
	<200910211303.49278.holger+oe@freyther.de>
	<1256123428.14897.18.camel@opal> <hbmqrv$ne5$1@ger.gmane.org>
Organization: Vanille-Media
Date: Wed, 21 Oct 2009 13:42:53 +0200
Message-Id: <1256125373.14897.33.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SCM fetched recipes without a SRCREV - e.g. libgee-native
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
X-List-Received-Date: Wed, 21 Oct 2009 11:43:55 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 21.10.2009, 13:21 +0200 schrieb Koen Kooi:
> On 21-10-09 13:10, Michael 'Mickey' Lauer wrote:
> >> 1.) bitbake -cfetchall task
> >>
> >> then remove network and
> >>
> >> 2.) bitbake task...
> >>
> >> if that is not the case we suck.
> >
> > Agreed. Perhaps it's really time to add some git commit checks as things
> > like the presence of a SRCREV_pn entry in sane-srcrev.inc can easily be
> > checked.
> 
> If we continue down the sane-srcrevs.inc route we should consider moving 
> PV_pn into there as well. Having SRCREV and PN in 2 different places 
> only adds confusion and leads to misversions.

Correct.

> Speaking of misversioning, I should really go through all scm fetched 
> packages I use and verify PV is correct for those.

Agreed, will have to do the same here.

Regards,

:M:




