Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1Jevfo-0000MH-6x
	for openembedded-devel@openembedded.org; Thu, 27 Mar 2008 18:13:56 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RHDttl012617
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 17:13:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12496-04 for <openembedded-devel@openembedded.org>;
	Thu, 27 Mar 2008 17:13:51 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2RHDocK012610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Thu, 27 Mar 2008 17:13:50 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803271752.07855.thomas.cooksey@trolltech.com>
References: <200803271217.41967.thomas.cooksey@trolltech.com>
	<200803271752.07855.thomas.cooksey@trolltech.com>
Date: Thu, 27 Mar 2008 17:13:51 +0000
Message-Id: <1206638031.4514.53.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 27 Mar 2008 17:13:56 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, 2008-03-27 at 17:52 +0100, Tom Cooksey wrote:
> Ok, well I'm not sure I like the idea of packages being renamed outside my control,
> I wouldn't know which name to use in DEPENDS in other recipies. There is also the
> issue of image recipies not knowing about the new name, so I can't just add my
> package to the list in the image recipie.

There used to be this problem but it doesn't exist these days. In
DEPENDS you use the recipe PN. In R* varaibles like RDEPENDS you use the
name as it is in PACKAGES. Any renaming will automatically be taken into
account.

debian.bbclass is the typical example of this and probably where your
LEAD_SONAME warning is coming from.

> > Your options are:
> > 	- Ignore the warning
> My prefered option, but only if this is not causing my dissappearing library issue.
> 
> > 	- Define a LEAD_SONAME of your primary lib
> > 	- More finegrained packaging.
> Do you mean doing having LEAD_SONAME_foo, LEAD_SONAME_bar, etc. ? That
> could work?

No, select one e.g. if libfoo is the most "important", LEAD_SONAME =
"libfoo".

Cheers,

Richard



