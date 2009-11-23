Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCeXF-000371-4b
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 20:25:20 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANJKVML018954 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 19:20:31 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id unCoNPS4Ffiy
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 19:20:31 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANJKThF018940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 19:20:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0911231043h75ae7402me61d82d90b8234bd@mail.gmail.com>
References: <c384c5ea0911230925u5d6e29b4v5801057f25971574@mail.gmail.com>
	<1259001133.10321.140.camel@dax.rpnet.com>
	<c384c5ea0911231043h75ae7402me61d82d90b8234bd@mail.gmail.com>
Date: Mon, 23 Nov 2009 19:23:48 +0000
Message-Id: <1259004228.10321.168.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: what is the expected STAGING_INCDIR for cross packages?
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
X-List-Received-Date: Mon, 23 Nov 2009 19:25:20 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 19:43 +0100, Leon Woestenberg wrote:
> Hello Richard,
> 
> On Mon, Nov 23, 2009 at 7:32 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Mon, 2009-11-23 at 18:25 +0100, Leon Woestenberg wrote:
> >> what is the expected STAGING_INCDIR for -cross packages?
> >
> > Where is this used and what kind of problem is occurring?
> >
> It's in binutils-cross.
> 
> I'm adding a new architecture (nios2) which has additional staging
> steps in which it brings out a few binutils build-host specifics,
> in order for the following "elf2flt" tool to build.
> 
> Up-to-current binutils-cross did not stage anything, so we never saw this there.
> 
> (I'm aware this should fold into install with your packaged-staging
> cleanup, but I don't dare to move the binutils to the new approach
> just yet).

Take a look at what cross.bbclass looks like in Poky. There are things
like ${target_includedir} defined there for exactly this kind of
problem.

Cheers,

Richard



