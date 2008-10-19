Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Krchm-0006lQ-R6
	for openembedded-devel@openembedded.org; Sun, 19 Oct 2008 20:08:43 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9JI8SdE008417
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Oct 2008 19:08:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08029-10 for <openembedded-devel@openembedded.org>;
	Sun, 19 Oct 2008 19:08:22 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9JI8L16008411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Oct 2008 19:08:21 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224438415.4235.266.camel@lenovo.internal.reciva.com>
References: <gdfm8d$apg$1@ger.gmane.org>
	<200810191847.04533.mickey@vanille-media.de>
	<1224438415.4235.266.camel@lenovo.internal.reciva.com>
Date: Sun, 19 Oct 2008 19:08:23 +0100
Message-Id: <1224439703.5211.14.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: busybox recipe isappearances
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
X-List-Received-Date: Sun, 19 Oct 2008 18:08:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Sun, 2008-10-19 at 18:46 +0100, Phil Blundell wrote:
> On Sun, 2008-10-19 at 18:47 +0200, Michael 'Mickey' Lauer wrote:
> > Ack. Been bitten my that more than once. We should either leave the versions 
> > and just add newer ones or change the preferred-providers to match (if sure 
> > it's a minor update of a stable version). 
> > 
> > (This time it was an error on my side though.)
> 
> It's long been my view that we should just add newer ones and leave the
> old ones alone.  There's really no reason to delete old recipes and,
> even if you check for PREFERRED_VERSIONs in the git tree, there is no
> real way to know who else might be relying on the version you are about
> to delete. 
> 
> Making an explicit distinction between minor and major updates as far as
> PREFERRED_VERSION goes is quite an interesting idea though.  I can
> certainly imagine that I might, for example, want to pin libglib to
> 2.14.x but be prepared to accept minor version updates within that
> series.  I don't think there's currently any syntax to allow that but it
> would be a neat enhancement.

I've also hit a problem where we want PREFERRED_VERSION = "3.4.5+svnrX"
where X can vary with SRCREV. Allowing a * character in the
PREFERRED_VERSION fields could be useful for both problems?

Cheers,

Richard





