Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCZwv-0008EK-VL
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 15:31:33 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANEQjS4023001 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 14:26:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eoUJccE-5kAY
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 14:26:44 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANEQgd0022977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 14:26:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hee2r8$bav$1@ger.gmane.org>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <20091122190547.GC3349@jama>
	<hedfru$gol$1@ger.gmane.org> <1258978516.10321.79.camel@dax.rpnet.com>
	<hee2r8$bav$1@ger.gmane.org>
Date: Mon, 23 Nov 2009 14:29:58 +0000
Message-Id: <1258986598.10321.99.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration - How SRCPV works!
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
X-List-Received-Date: Mon, 23 Nov 2009 14:31:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 14:31 +0100, Koen Kooi wrote:
> On 23-11-09 13:15, Richard Purdie wrote:
> 
> > As I understand it you'll lock locking down the local build revisions
> > with Angstrom anyway?
> 
> Dunno about that, ideally the SRCPV merge should have no impact at all 
> on existing distros, but it looks like everyone will be forced to lock 
> revisions/counts down.

How is locking the counts down using LOCALCOUNT any different to the
current situation?

> If there is a way to convert the database to a .inc file then we'd be a 
> step closer to coordinating counts between buildhosts (or rebuilds from 
> scratch).

Any method using .inc files is going to race. The only solution that is
likely to work is a single server allocating numbers in some form.

> Currently the SRCPV looks like a major step backwards to the current 
> situation unless you are on a single buildhost *and* never delete TMPDIR 
> *and* use AUTOREV *and* care about upgrade paths.

Well this clearly isn't the case. 

Its intended to be a neural step (apart from some PE issues) for
everyone except for the users of AUTOREV who it helps. Their use case is
limited to a single autobuilder model where they need to keep one file
in TMPDIR but can otherwise delete it.

> It would be a lot better if bitbake could just do the revlog | wc -l 
> trick after do_fetch has run. Or at least use that as localcount if a 
> snapshot exists in TMPDIR during parsing.

As you're more than well aware, two different behaviours depending on
whether "a snapshot exists in TMPDIR during parsing" is maintenance and
reproducibility nightmare.

The first suggestion would be nice, patches welcome.

Cheers,

Richard



