Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1N8u8S-0003RM-ED
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 12:16:15 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADBBltk020879 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 11:11:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rLrVPp3lcHCl
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 11:11:47 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nADBBiu8020872
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 11:11:45 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LFD.2.00.0911130555020.3622@localhost>
References: <alpine.LFD.2.00.0911130555020.3622@localhost>
Date: Fri, 13 Nov 2009 11:10:04 +0000
Message-Id: <1258110604.5799.10.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: how to remove all traces of a previous package build?
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
X-List-Received-Date: Fri, 13 Nov 2009 11:16:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-13 at 05:56 -0500, Robert P. J. Day wrote:
> surely a dumb question, but what's the recipe for deleting every
> trace of a single previous package build, so i know i'm rebuilding it
> absolutely from step one?  i'll use that to test a rebuild of the
> packages that are failing for me.

bitbake X -c clean

where X is the package you want to remove.

Cheers,

Richard



