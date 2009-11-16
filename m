Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N9y95-0007yX-EU
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 10:45:18 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAG9eif8001544 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 09:40:44 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bGh1LokRFdJA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 09:40:44 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAG9edrF001532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 09:40:41 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hdr31n$8b0$1@ger.gmane.org>
References: <20091115163618.GA3317@jama>  <hdr31n$8b0$1@ger.gmane.org>
Date: Mon, 16 Nov 2009 09:39:16 +0000
Message-Id: <1258364356.5799.94.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 09:45:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-16 at 09:38 +0100, Koen Kooi wrote:
> If something needs a PE bump, make sure you do it properly and bump PE 
> on the non scm fetched entries as well. For the kernel I wouldn't bump 
> PE, since too many machines can use different kernel recipes.
> 
> And can someone tell me how SRCPV works when you have multiple 
> buildmachines across the world, how does one keep SRCPV in sync between 
> all those machines?
> 
> How does SRCPV work when you have recipes for 1.2+gitrfoo, 1.3+gitrbar, etc?

They'd become 1.2+LOCALBUILDREV+gitrfoo and 1.3+LOCALBUILDREV+gitrfoo.

> IOW: will it create more work for me (like the proposed checksums 
> changes) instead of making things easier?

SRCPV solves one particular set of bugs where local build revisions were
only injected into revisions part of the time. This change makes things
more consistent and predicable in that its always injected.

Nobody has ever written code to share the bitbake persistent data
between machines. It shouldn't be that hard with some kind of database
server but nobody has done it.

It doesn't really change the position for Angstrom as I understand it
though as you don't (can't) use these packages now due to the multiple
build servers and that position hasn't changed :/.

Cheers,

Richard



