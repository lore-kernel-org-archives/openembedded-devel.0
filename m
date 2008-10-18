Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pb@reciva.com>) id 1KrCuM-0003mQ-9X
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 16:35:59 +0200
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <pb@reciva.com>) id 1KrCuB-0004jN-S0
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:35:47 +0100
Received: from mill.internal.reciva.com ([192.168.106.87])
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <pb@reciva.com>) id 1KrCuB-0002Z9-KQ
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 15:35:47 +0100
From: Phil Blundell <pb@reciva.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200810181537.33825.zecke@selfish.org>
References: <1224320609.5215.15.camel@dax.rpnet.com>
	<200810181432.38565.zecke@selfish.org>
	<200810181520.05743.zecke@selfish.org>
	<200810181537.33825.zecke@selfish.org>
Date: Sat, 18 Oct 2008 15:35:44 +0100
Message-Id: <1224340544.3140.98.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
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
X-List-Received-Date: Sat, 18 Oct 2008 14:35:59 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, 2008-10-18 at 15:37 +0200, Holger Freyther wrote:
> On Saturday 18 October 2008 15:20:05 Holger Freyther wrote:
> > On Saturday 18 October 2008 14:32:37 Holger Freyther wrote:
> >
> > More in depth:
> - We need to make sure that people do not introduce PR but use FILE_PR
> 
> Oops I missed my requirements:
> 	- Easy to understand what is going on
> 	- Package name and Workdir matching with each other
> 	- Full rebuild on DISTRO_PR bump
> 	- Not reusing the same build directory

These seem like fine requirements.  The additional one from me, which I
try to apply to more or less any change in OE, is that any change to the
grammar of .bb files should be both forwards and (to the greatest extent
possible) backwards compatible.  That is, unless there are overriding
reasons why it is impossible, two use cases should both be supported:

(a) backporting cherry-picked recipes from the .dev tree to the stable
branch; and

(b) merging recipes from other, parallel development trees that might be
using slightly older standards or processes.

> And here two patches. The amount of changes is a lot smaller. The downside is 
> it is not as easy to understand as changin PR to FILE_PR (think of the people 
> merging OE into their private trees that know little about the classes...). 
> Anyway this is something we can talk about..

Right, this seems like a good solution.  I'm not sure that it really is
any harder to understand than the FILE_PR thing, and to be honest the
internals of the packaging classes are already cryptic enough that I
doubt many people make any attempt to comprehend them in detail.  The
relationship between PR and PKG_PR is clearly shown in bitbake.conf,
rather than buried in some obscure piece of python, so there should be
no difficulty in understanding for anybody who looks at it.

Requiring a new bitbake version is obviously a bit of a shame but there
is plenty of precedent for that, and the bitbake change looks like it
should be backwards compatible with no problem.

I haven't actually tested the patches so I can't speak for their correct
functionality.  But the general approach seems like a good one to me.

p.




