Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H1Atd-0004Yz-M3
	for openembedded-devel@openembedded.org; Mon, 01 Jan 2007 01:19:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l010IRSY014565
	for <openembedded-devel@openembedded.org>; Mon, 1 Jan 2007 00:18:27 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14294-05 for <openembedded-devel@openembedded.org>;
	Mon,  1 Jan 2007 00:18:25 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l010IKpo014557
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 1 Jan 2007 00:18:20 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20061231233933.GA29768@hezmatt.org>
References: <E1H19G7-0002Ph-6z@linuxtogo.org>
	<1167605141.5592.37.camel@localhost.localdomain>
	<20061231233933.GA29768@hezmatt.org>
Date: Mon, 01 Jan 2007 00:18:23 +0000
Message-Id: <1167610703.5592.44.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] org.oe.dev Split STAGING_BINDIR into CROSS	and	NATIVE versions. This means there is no need to rename -config scripts	and	multimachine won't break with binconfig.bbclass. ***NOTE: This change	will	require staging to be rebuilt***
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
X-List-Received-Date: Mon, 01 Jan 2007 00:19:22 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-01-01 at 10:39 +1100, Matthew Palmer wrote:
> On Sun, Dec 31, 2006 at 10:45:41PM +0000, Richard Purdie wrote:
> > On Sun, 2006-12-31 at 23:34 +0100, rpurdie commit wrote:
> > > Split STAGING_BINDIR into CROSS and NATIVE versions. This means there
> > > is no need to rename -config scripts and multimachine won't break with
> > > binconfig.bbclass. ***NOTE: This change will require staging to be
> > > rebuilt***
> > 
> > Please note the above. Peoples staging are potentially broken now as all
> > the *-config files have moved around and been renamed.
> 
> What's the easiest way to fix this?  Just rm -rf ${TMPDIR}/staging, and let
> the system rebuild stuff as it needs to?  Do I need to delete all the
> populate_staging stamps as well, perhaps?

You'd certainly have to remove the populate_staging stamps. I'm not 100%
sure that will be enough but it could work (I've give it a 90% chance).
The safest thing to do is remove tmp entirely.

Richard



