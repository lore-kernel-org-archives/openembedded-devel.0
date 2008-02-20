Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JRp99-0006w3-HA
	for openembedded-devel@openembedded.org; Wed, 20 Feb 2008 14:38:10 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1KDb3oO031021;
	Wed, 20 Feb 2008 13:37:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30892-05; Wed, 20 Feb 2008 13:36:59 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1KDar39031011
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 20 Feb 2008 13:36:53 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <20080220131153.6dc67355@widy.localdomain>
References: <20080216150111.3737b02b@widy.localdomain>
	<74d0deb30802160739o7aafbbbdo4093d7c9ef38beb9@mail.gmail.com>
	<20080216175242.724b75a6@widy.localdomain>
	<20080220131153.6dc67355@widy.localdomain>
Date: Wed, 20 Feb 2008 13:36:52 +0000
Message-Id: <1203514612.8040.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Re: [Angstrom-devel] [RFC] Per-ANGSTROM_MODE caches for	Angstrom
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
X-List-Received-Date: Wed, 20 Feb 2008 13:38:11 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-02-20 at 13:11 +0200, Paul Sokolovsky wrote:
> So, no objections? I'll add it then, and RFC adding to stable branch
> too. I'd like to keep that extra check for ANGSTROM_MODE being set - it
> at least consistent with existing MACHINE check.

See below.

> On Sat, 16 Feb 2008 17:52:42 +0200
> Paul Sokolovsky <pmiscml@gmail.com> wrote:
> 
> > > > --- conf/distro/include/angstrom.inc
> > > > b86b952c90304d1fd39f1415f6af7f71d02e00df +++
> > > > conf/distro/include/angstrom.inc
> > > > e7921869d30b7e5df3fd39fbd4bec5d2495b5d31 @@ -12,6 +12,7 @@
> > > > ANGSTROM_MODE ?= "glibc" # Can be "glibc", "eglibc" or "uclibc"
> > > > ANGSTROM_MODE ?= "glibc"
> > > >
> > > > +CACHE = "${TMPDIR}/cache${@['', '/' +
> > > > str(bb.data.getVar('ANGSTROM_MODE', d,
> > > > 1))][bool(bb.data.getVar('ANGSTROM_MODE', d, 1))]}${@['', '/' +
> > > > str(bb.data.getVar('MACHINE', d,
> > > > 1))][bool(bb.data.getVar('MACHINE', d, 1))]}" DEPLOY_DIR =
> > > > "${TMPDIR}/deploy/${ANGSTROM_MODE}" require
> > > > conf/distro/include/angstrom-${ANGSTROM_MODE}.inc
> > > 
> > > +1, for the  idea, but why not just
> > > ${TMPDIR}/cache/${ANGSTROM_MODE} ?
> > 
> > Well, nice question ;-). To be generic and putable even in
> > bitbake.conf ;-)

Please use the latter form, not the one with all the python in it. You
also need MACHINE in there.

> > > And I don't understand why you need to include MACHINE there.
> > > I've never needed to rebuild caches when switching MACHINE, and I
> > > shouldn't have to.
> > 
> > Heh, multimachine puts it there ;-)

In order to set MACHINE on the commandline, you need MACHINE in CACHE
and bitbake.conf does that for exactly this reason.

Cheers,

Richard




