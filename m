Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NCXqa-0001nS-QO
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 13:16:51 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANCC4sJ011973 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 12:12:04 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qPIdmdNLgExo
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 12:12:04 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	nANCC1vc011959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Nov 2009 12:12:03 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hedfru$gol$1@ger.gmane.org>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com> <20091122190547.GC3349@jama>
	<hedfru$gol$1@ger.gmane.org>
Date: Mon, 23 Nov 2009 12:15:16 +0000
Message-Id: <1258978516.10321.79.camel@dax.rpnet.com>
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
X-List-Received-Date: Mon, 23 Nov 2009 12:16:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-11-23 at 09:07 +0100, Koen Kooi wrote:
> On 22-11-09 20:05, Martin Jansa wrote:
> 
> > Every git recipe in OE tree should have some sane hash stored in
> > conf/distro/include/sane-srcrevs.inc
> 
> The cabal decided that checksums are "part of the metadata" and belongs 
> in the recipes. I don't understand why SRCREVs are so different. For 
> SRCREVs my life would be a lot easier if all SRCREV where put in their 
> respective recipes. Distros can always do
> 
> SRCREV_pn-foo = "bar"
> PV_pn-foo = "1.2.3+gitr$SRCPV"
> 
> in their distro.conf if needed. Due to scoping we do need some include 
> for EFL_SRCREV, since those recipes are tightly tied together.

FWIW I dislike it that we have SRCREVs elsewhere. There is a problem
(bug?) with bitbake that makes this necessary though and that bug is
hard to fix :(.

>  > But be carefull with persistent cache file
>  > something like this:
>  > tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite
> 
> So if I build pixman_git.bb for om-gta02 weekly, but monthly for 
> beagleboard or om-gta01 I'll also get different numbers, right?
> I think the count should only be in a machine specific database if the 
> SRC_URI/SRCREV is machine specific.

As I understand it you'll lock locking down the local build revisions
with Angstrom anyway?

If we try and solve every issue all at once with this, I doubt we're
going to get anywhere fast. If we take the issues one at a time and chip
away at them we may end up somewhere better.

The whole SRCREV thing is a can of worms. Its no secret I dislike the
thing and the fact we've never had a totally clean way to implement it.
I also recognise its useful though, I use it myself :/. SRCPV is a step
to fixing a number of problems, we just need to be careful we don't
create many others.

Cheers,

Richard




