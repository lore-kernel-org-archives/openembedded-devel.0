Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NA0v4-0005xu-Mt
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 13:43:01 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAGCcRRv021009 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:38:27 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PDBeWyt3SZhd
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:38:27 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nAGCcNxO020989
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 12:38:24 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hdrffa$do6$1@ger.gmane.org>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com> <hdrb9v$1dp$1@ger.gmane.org>
	<1258371591.5799.112.camel@dax.rpnet.com> <hdrffa$do6$1@ger.gmane.org>
Date: Mon, 16 Nov 2009 12:37:02 +0000
Message-Id: <1258375022.16625.3.camel@dax.rpnet.com>
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
X-List-Received-Date: Mon, 16 Nov 2009 12:43:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-16 at 13:10 +0100, Koen Kooi wrote:
> > How does Angstrom currently solve this problem? You bump the SRCREV
> > and override PV manually? 
> 
> With 'angstrom' you mean 'oe', right? If a SRCREV gets updated the 
> person doing that checks if PV or PR need to get changed to make it sort 
> higher (or lower, depending on the change). I don't see how SRCPV will 
> make life or less error-prone. By the looks of it it only makes things 
> worse.

I meant Angstrom which looks like it relies on anyone doing the updating
to OE in general to get this right :/. As I'm sure you're aware this is
less than ideal.

You have a point in that we can't lock down the local build revisions
and this causes a problem with the distributed nature of Angstrom's
builds.

I think we will have to hold off some of the SRCPV migration until
bitbake has some kind of lock down functionality for the local build
numbers. Any volunteers to write a patch?

Note that converting svn recipes can go ahead as they don't need local
build revisions, its mainly the distributed SCMS that have a problem
(e.g. git/hg).

Cheers,

Richard



