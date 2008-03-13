Received: from [72.14.204.238] (helo=qb-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1JZpGF-00013o-Fe
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 16:22:32 +0100
Received: by qb-out-0506.google.com with SMTP id p30so3041718qba.14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 08:20:16 -0700 (PDT)
Received: by 10.114.171.1 with SMTP id t1mr9713304wae.83.1205418360943;
	Thu, 13 Mar 2008 07:26:00 -0700 (PDT)
Received: by 10.114.190.2 with HTTP; Thu, 13 Mar 2008 07:26:00 -0700 (PDT)
Message-ID: <f96d234e0803130726q446bb89dg3698e2cec8c675e3@mail.gmail.com>
Date: Thu, 13 Mar 2008 10:26:00 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>
In-Reply-To: <20080313101513.3e72ca08@widy.localdomain>
MIME-Version: 1.0
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
	<20080313101513.3e72ca08@widy.localdomain>
X-SA-Exim-Connect-IP: 72.14.204.238
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 13 Mar 2008 15:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Mar 13, 2008 at 4:15 AM, Paul Sokolovsky <pmiscml@gmail.com> wrote:
>  On Wed, 12 Mar 2008 10:08:26 -0400
>  "Cliff Brake" <cliff.brake@gmail.com> wrote:
>  > Mercurial looks very interesting and nice in many aspects, but I have
>  > not used it yet.  It seems to me one of the fundamental differences is
>  > the concept of cheap/easy local branches.  Mercurial is working on
>  > something like that
>  > (http://www.selenic.com/mercurial/wiki/index.cgi/LocalBranches), but
>  > it is obviously not central to its philosophy like git .  The idea of
>  > creating many local branches a normal port of your development
>  > workflow seems unique to git. As the gitmagic link below states, it
>  > makes it very easy to switch context to fix a bug, and then resume
>  > work on another feature.
>
>  Ok, so let's finally visualize how this unique feature would apply to
>  OE. So, we have set up all the BBPATH, build dir to reference to OE
>  working copy. Now, one magic spell, and OE working copy transmogrifies
>  into something else than it was before. What's next?
>
>  1. Suppose that we have thought that before, and prepared separate
>  build dir for this another local branch. Here, it's important to not
>  miss which build dir to use for which of workdir's phases of moon.
>  That's a bit harder that it would be with branches checked out into
>  separate workdirs, but careful people indeed can run many days before
>  making mistake. But all in all, "lightweight branching in OE" is not
>  that "lightweight" as just issuing SCM command.

I would use git branches for working on features at the tip of OE, and
branches are also very useful for keeping track of customizations at
several points in a source tree's history.  For example with kernel
work on one project, I have the following branches:

  2.6.23-rc4-rt1
  2.6.24-rt1
  cmx270
  cmx270_2.6.21
  cmx270_2.6.22
  cmx270_2.6.23
* cmx270_2.6.24
  cmx270_2.6.24-rc5
  cmx270_old
  cmx270_old2
  master
  svs_2.6.20
  svs_2.6.22
  svs_2.6.23-rc4-rt1
  svs_2.6.23-rc6
  svs_2.6.23-rc6_backup
  svs_2.6.23-rt1
  svs_2.6.24
  svs_2.6.24-rc5
  svs_2.6.24-rc5-rt1
  svs_2.6.24-rc5-rt1_old
  svs_2.6.24-rc8
  svs_2.6.24-rt1
  svs_old
  v2.6.20_test

Git branches allow me to keep the old branch for reference if I ever
need to go back to it, and easily move it forward to a new point in
the kernel development.  I suppose the same thing can be done with
tags.  I really don't like the idea of creating separate
repositories/workspaces for different branches.  But, with different
tools, you just develop a different workflow.  With monotone, I use
overlays ...

>  2. Now suppose that we don't think that multiple builddirs is a must.
>  Then, we rm -rf tmp/ with each branch switch, or what? Btw, I wonder
>  how kernel people *actually* deal with that problem. Because only CS
>  freshman would buy into "very easy to switch context to fix a bug, and
>  then resume work on another feature." Real developers know, that fixes
>  are accompanied by testing.

This is a valid concern, but again the assumption is that if you are
using git branches in OE, it is probably near the tip of the OE tree.
Bitbake -c clean works well.  If you move back in time, then cleaning
tmp or switching tmp is obviously advised.

BTW, the kernel build system _can_ handle switching branches very well
without "make clean".  I routinely switch branches in a workspace and
type make without cleaning and it just works.  Try it sometime, you
may like it :-)  I may be a CS freshman, but that is irrelevant
because it does work very well and many people use it.

Interesting discussion and good points.  I guess the bottom line is
there are different tools, and different people will have different
preferences because people work differently, which is fine.  I'm ok
with either choice (not that it really matters), and I'm not opposed
to learning something new -- matter of fact, I would love a good
excuse to learn hg.  I do think it is difficult for anyone to make
informed decisions about tools of this complexity without having used
it to do real work.  That is where most of us stand with hg.

I still maintain that that tools do impact developer workflow, and
this should be a serious consideration when selecting tools.  What is
the workflow that will maximize the productivity and output of the OE
community?  The tool selection should follow.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


