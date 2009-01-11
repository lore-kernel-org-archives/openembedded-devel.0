Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1LM9h5-0007dK-QC
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jan 2009 00:26:11 +0100
Received: from andromeda.vanille.de (e180135253.adsl.alicedsl.de
	[85.180.135.253])
	by drlauer-research.com (Postfix) with ESMTP id 1E07E5843DB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2009 00:40:08 +0100 (CET)
From: "Michael 'Mickey' Lauer" <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 Jan 2009 00:19:45 +0100
User-Agent: KMail/1.9.10
MIME-Version: 1.0
Message-Id: <200901120019.45621.mickey@vanille-media.de>
Subject: python roadmap
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
X-List-Received-Date: Sun, 11 Jan 2009 23:26:11 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

You may have seen that I just branched off mickey/python2.6. Python 2.6 has 
been in org.oe.dev for quite a while and I have did extensive tests with it. 
It's now ready for public consumption, however since it's a major version 
upgrade, I need to bump all packages that ship something to 
${libdir}/python2.x.

To get this in one commit, I'll do it in the branch. I'll also take this 
chance to go over all python related packages and run a cleanup round -- if 
there's something to clean up.

I expect this to be complete in one or two weeks. Please hold off any major 
changes to Python-recipes until then.

With regards to Python 3, I will probably add it in February. It's going to be 
a long time until the critical mass of external packages have upgraded to v3, 
I expect not before 2010. We can take it easy with BitBake as well, but we 
should start removing the stuff that Python 2.6 claims to be deprecated asap.

Cheers,

Mickey.


