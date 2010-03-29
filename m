Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NwMmZ-000115-7e
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Mar 2010 23:46:04 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2TLgoWf019934
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 22:42:50 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19407-10 for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 22:42:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o2TLggcF019928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Mar 2010 22:42:43 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100329174253.GC25428@gmail.com>
References: <1269878004.1681.331.camel@rex> <20100329174253.GC25428@gmail.com>
Date: Mon, 29 Mar 2010 22:42:39 +0100
Message-ID: <1269898959.1681.692.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Standalone gcc library builds
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
X-List-Received-Date: Mon, 29 Mar 2010 21:46:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2010-03-29 at 10:42 -0700, Khem Raj wrote:
> I have had gcc build all runtimes libraries separately. I think we should
> device gcc build and we can disable building certain directories via
> --disable-<dir>. We dont have to stash libgcc. Its not a big library and
> its probably better to rebuild it along with rest of runtime libraries IMO
> and probably we should have packages for each language runtime so people
> who dont need C++ or Java or fortran dont have to build those. The same
> should be tunable in gcc builds too.

I talked with Khem on irc but just for the record here, I've done some
testing with gcc 4.3.3 in Poky and have pushed my results to:

http://git.pokylinux.org/cgit.cgi/poky/log/?h=master-gcc-runtime-testing

This adds a gcc-runtime recipe which builds libgcc, libssp and libstdc++
as test cases. It will be possible to build other runtime libs
conditionally on whether they're enabled like libfortran easily enough.

We have to add in an extra dependency layer to the compiler bootstrap
but that isn't an issue.

The bit that is ugly is the stashing of headers in staging by gcc-cross.
The issue is we want to build the target libs in our normal "target"
context so cross.bbclass is not used by gcc-runtime. This means
HOST==TARGET and hence building gcc itself fails.

Discussion on how best to do this welcome :)

Cheers,

Richard



