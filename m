Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jin@mediatomb.cc>) id 1JqpZa-0001jd-Dh
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Apr 2008 15:08:44 +0200
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id D8501832CA; Tue, 29 Apr 2008 15:08:12 +0200 (CEST)
Date: Tue, 29 Apr 2008 15:08:12 +0200
From: Sergey Jin' Bostandzhyan <jin@mediatomb.cc>
To: Stanislav Brabec <utx@penguin.cz>
Message-ID: <20080429130812.GB30664@deadlock.dhs.org>
References: <20080428192607.GB28476@deadlock.dhs.org>
	<19c1b8a90804281454m3e3ea43fv2d84596976c0487@mail.gmail.com>
	<20080429123310.GA30664@deadlock.dhs.org>
	<1209474099.3949.136.camel@hammer.suse.cz>
MIME-Version: 1.0
In-Reply-To: <1209474099.3949.136.camel@hammer.suse.cz>
User-Agent: Mutt/1.5.15 (2007-04-06)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: problem building meta-toolchain for arm/uclibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Tue, 29 Apr 2008 13:08:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 29, 2008 at 03:01:38PM +0200, Stanislav Brabec wrote:
> > libc.so.6 in the whole work directory I found this:
> 
> You could check your config.log for site script inclusion.

Thanks for the hint, let's see...

binutils-cross-sdk loads these scripts to that looks ok:
org.openembedded.stable/site/endian-little
org.openembedded.stable/site/common-glibc
org.openembedded.stable/site/ix86-common
org.openembedded.stable/site/common
org.openembedded.stable/site/common

same for gcc-cross SDK
 
> If you will see, that site scripts .../site/arm-* are included, it is be
> the same problem I described five days ago in the mail "brokenness of
> native builds by cross-compile site scripts".
> 
> It needs a fox of class/siteinfo.bbclass. Probably don't include
> anything if compiling native packages.

Seems that I am not hitting this particular problem... must be something else.

Kind regards,
Jin



