Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZRyR-00057v-0X
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 15:30:44 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZRwL-0002RM-47
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 14:28:21 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 14:28:21 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 14:28:21 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 12 Mar 2008 15:28:13 +0100
Message-ID: <fr8p9u$8s0$1@ger.gmane.org>
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Git versus Hg
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
X-List-Received-Date: Wed, 12 Mar 2008 14:30:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Cliff Brake schreef:

| Mercurial looks very interesting and nice in many aspects, but I have
| not used it yet.  It seems to me one of the fundamental differences is
| the concept of cheap/easy local branches.  Mercurial is working on
| something like that
| (http://www.selenic.com/mercurial/wiki/index.cgi/LocalBranches), but
| it is obviously not central to its philosophy like git .  The idea of
| creating many local branches a normal port of your development
| workflow seems unique to git.  As the gitmagic link below states, it
| makes it very easy to switch context to fix a bug, and then resume
| work on another feature.  This is a lot more than just "being good at
| generating patches"; it is a change in the way we work.

I can see how that's a good thing for what I call "traditional
application development" where a bunch of source files get compiled into
a single application (kernel, u-boot, xserver etc) where working on
multiple things at once doesn't work, since it makes building and
testing a nightmare. Easy branching solves that.

But OE isn't like that, it's a collection of build descriptions, which
makes it possible to be working on a 1000 different recipes at the same
time. This also is one of the reasons why mtn is so slow for us: lots of
files with a shortlived life spam and ±30 commits per day.

I like hg so much because it's the svn to monotones cvs: virtually
identical UI, without the crap.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH1+h9MkyGM64RGpERAjc6AKCF0CIEIJml44MVR8xhuCxw4PwHIACfSnMh
rMWrhQTsv+0T6E6f7qWDT8U=
=lmbo
-----END PGP SIGNATURE-----



