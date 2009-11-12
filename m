Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1N8V4L-0000hv-M9
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 09:30:20 +0100
Received: from [192.168.1.7] (dialbs-092-079-168-007.static.arcor-ip.net
	[92.79.168.7])
	by drlauer-research.com (Postfix) with ESMTP id 0142A128001A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 10:14:59 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
To: openembedded-devel@lists.openembedded.org
Organization: Vanille-Media
Date: Thu, 12 Nov 2009 09:29:00 +0100
Message-ID: <1258014540.6879.18.camel@opal>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: OEDEM: Summary of the 'Splitting the tree' session
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
X-List-Received-Date: Thu, 12 Nov 2009 08:30:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi guys,

here's the summary of the 'splitting the tree' session:

Nobody seems to disagree with splitting the metadata tree into more
managable chunks. The expected goals are:

1. Making it easier to find things,
2. Being able to mask whole groups out for improved parsing
3. Identifying core code which needs to always work, hence improving the
observed quality of OE.

Several criteria for splitting were discussed and there was a consensus
for splitting by functional complex. A tentative list of directories to
be used is:

base (10% underlying recipes)
toolchain
x11
framebuffer
gtk (includes gnome apps)
qte (includes opie and kde)
efl

The attendendees were well aware of all the inherent problems with
taxonomy and its different meaning to anybody in the first place as well
as that some recipes will always be difficult to categorize since they
are very flexible to configure. This did not prevent the consensus that
splitting up will be necessary to improve quality.

It was noted that oestats should be enhanced to be able to report a
subset of stats to start developing a test matrix of things which should
always work.

More discussion shall be carried on on this list and after the TSC has
been elected, it will make a final decision.

Cheers,

:M:




