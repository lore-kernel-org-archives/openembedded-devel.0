Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1KrFSO-0007xH-Kh
	for openembedded-devel@openembedded.org; Sat, 18 Oct 2008 19:19:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9IHJ85C009243
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 18:19:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09008-05 for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 18:19:01 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m9IHIvt7009237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 18 Oct 2008 18:18:57 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1224340544.3140.98.camel@mill.internal.reciva.com>
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<200810181432.38565.zecke@selfish.org>
	<200810181520.05743.zecke@selfish.org>
	<200810181537.33825.zecke@selfish.org>
	<1224340544.3140.98.camel@mill.internal.reciva.com>
Date: Sat, 18 Oct 2008 18:18:57 +0100
Message-Id: <1224350337.5215.58.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: FILE_PR and my requirements Re: Some open issues
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
X-List-Received-Date: Sat, 18 Oct 2008 17:19:17 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 15:35 +0100, Phil Blundell wrote:
> On Sat, 2008-10-18 at 15:37 +0200, Holger Freyther wrote:
> > On Saturday 18 October 2008 15:20:05 Holger Freyther wrote:
> > > On Saturday 18 October 2008 14:32:37 Holger Freyther wrote:
> > >
> > > More in depth:
> > - We need to make sure that people do not introduce PR but use FILE_PR
> > 
> > Oops I missed my requirements:
> > 	- Easy to understand what is going on
> > 	- Package name and Workdir matching with each other
> > 	- Full rebuild on DISTRO_PR bump
> > 	- Not reusing the same build directory
> 
> These seem like fine requirements.  The additional one from me, which I
> try to apply to more or less any change in OE, is that any change to the
> grammar of .bb files should be both forwards and (to the greatest extent
> possible) backwards compatible.  That is, unless there are overriding
> reasons why it is impossible, two use cases should both be supported:
> 
> (a) backporting cherry-picked recipes from the .dev tree to the stable
> branch; and
> 
> (b) merging recipes from other, parallel development trees that might be
> using slightly older standards or processes.
> 
> > And here two patches. The amount of changes is a lot smaller. The downside is 
> > it is not as easy to understand as changin PR to FILE_PR (think of the people 
> > merging OE into their private trees that know little about the classes...). 
> > Anyway this is something we can talk about..
> 
> Right, this seems like a good solution.  I'm not sure that it really is
> any harder to understand than the FILE_PR thing, and to be honest the
> internals of the packaging classes are already cryptic enough that I
> doubt many people make any attempt to comprehend them in detail.  The
> relationship between PR and PKG_PR is clearly shown in bitbake.conf,
> rather than buried in some obscure piece of python, so there should be
> no difficulty in understanding for anybody who looks at it.

I talked with Holger on irc about this. The need is primarily to have a
way of regenerating a full set of packages after some package abi
change. I raised the idea of using DISTRO_PR in a somewhat similar way
to SANITY_ABI where if it changes the user is warned about it and then
can handle as they see fit. DISTRO_PR is appended to the PR values at
package generation time if set. For autobuilders this wouldn't be good
so for those cases I'm suggesting they incorporate DISTRO_PR into the
TMPDIR value their autobuilder uses.

Yes, this kind of change may break some scripts out there. That is
unfortunate but we should use this opportunity to improve the scripts to
use commands like "bitbake -e | grep ^DEPLOY_DIR_IMAGES" and similar to
find things rather than making assumptions about path layout.

The advantages to this approach are that we don't need changes to
bitbake, we don't break the file format, we don't change the file layout
and we leave options open for other requirements that may come along in
the future.

Holger started a patch implementing this which I've added some code
which is shared as:

http://git.openembedded.net/?p=openembedded.git;a=shortlog;h=refs/heads/shared/file-pr-revert

I also took the opportunity to split the ABI variables into a separate
clearly identifiable conf file like Poky.

Cheers,

Richard



