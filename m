Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N0gS5-00053y-1n
	for openembedded-devel@openembedded.org; Wed, 21 Oct 2009 21:02:32 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9LIwlqo028068 for <openembedded-devel@openembedded.org>;
	Wed, 21 Oct 2009 19:58:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id e066jZ801GoY for <openembedded-devel@openembedded.org>;
	Wed, 21 Oct 2009 19:58:47 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n9LIweOP028059
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Oct 2009 19:58:42 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1256125373.14897.33.camel@opal>
References: <hbmose$gtv$1@ger.gmane.org>
	<200910211303.49278.holger+oe@freyther.de>
	<1256123428.14897.18.camel@opal>
	<hbmqrv$ne5$1@ger.gmane.org>  <1256125373.14897.33.camel@opal>
Date: Wed, 21 Oct 2009 19:57:40 +0100
Message-Id: <1256151460.23211.40.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Wed, 21 Oct 2009 19:02:32 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-10-21 at 13:42 +0200, Michael 'Mickey' Lauer wrote:
> Am Mittwoch, den 21.10.2009, 13:21 +0200 schrieb Koen Kooi:
> > If we continue down the sane-srcrevs.inc route we should consider moving 
> > PV_pn into there as well. Having SRCREV and PN in 2 different places 
> > only adds confusion and leads to misversions.
> 
> Correct.
> 
> > Speaking of misversioning, I should really go through all scm fetched 
> > packages I use and verify PV is correct for those.
> 
> Agreed, will have to do the same here.

Can I also suggest we start using SRCPV in PV, not SRCREV? This removed
the need to play a lot of games with PV...

(Poky has switched to this now)

Cheers,

Richard



