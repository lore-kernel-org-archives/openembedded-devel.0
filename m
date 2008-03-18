Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JbezL-0000We-OU
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 17:48:40 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2IGmaU8003056
	for <openembedded-devel@openembedded.org>; Tue, 18 Mar 2008 16:48:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02703-08 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 16:48:32 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2IGmUF2003048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Tue, 18 Mar 2008 16:48:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <frojpb$m6j$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>
	<200803180849.21108.geoffrey@pager.net>  <frojpb$m6j$1@ger.gmane.org>
Date: Tue, 18 Mar 2008 16:48:30 +0000
Message-Id: <1205858910.7500.39.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 16:48:40 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2008-03-18 at 15:32 +0100, Koen Kooi wrote:
> Geoffrey Wossum schreef:
> | I understand that opkg is a fork of ipkg, since ipkg was unmaintained.
>   But
> | could someone explain what, if anything, this means to me as someone
> | currently building a product using OpenEmbedded for the underpinning?
> 
> It means that after this gets applied you login to your product:
> 
> ssh user@mytarget
> $ su -
> Password:
> # ipkg update
> sh: ipkg: : command not found
> # opkg update
> <output of opkg downloading stuff from feeds>
> 
> So from a device user POV you need to type 'opkg' instead of 'ipkg'.
> ~From a developer POV you gain PGP signed packages.

That isn't the full story since the config files moved
from /usr/lib/ipkg to /usr/lib/opkg and distro maintainers need to be
wary of the transition. I think Angstrom has something to help with this
but I'm not sure?

While I think about this, would now be a good time to move the config
files to /var instead of /usr? 

Poky can't do that yet since we don't have the var changes in OE but I
think most of /var in OE is persistent now?

Cheers,

Richard



