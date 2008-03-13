Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JZibO-0006aU-Lm
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Mar 2008 09:15:53 +0100
Received: by ug-out-1314.google.com with SMTP id i24so626429ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Mar 2008 01:13:42 -0700 (PDT)
Received: by 10.67.97.15 with SMTP id z15mr761937ugl.84.1205396022469;
	Thu, 13 Mar 2008 01:13:42 -0700 (PDT)
Received: from widy.localdomain ( [88.231.54.215])
	by mx.google.com with ESMTPS id u1sm5930688uge.14.2008.03.13.01.13.39
	(version=SSLv3 cipher=OTHER); Thu, 13 Mar 2008 01:13:40 -0700 (PDT)
Date: Thu, 13 Mar 2008 10:15:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080313101513.3e72ca08@widy.localdomain>
In-Reply-To: <f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
References: <47D71B8F.1030108@balister.org>
	<f96d234e0803120708r3286e264w6fbd21e6381bc235@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.5; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 66.249.92.174
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Thu, 13 Mar 2008 08:15:53 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 12 Mar 2008 10:08:26 -0400
"Cliff Brake" <cliff.brake@gmail.com> wrote:

> On Tue, Mar 11, 2008 at 7:53 PM, Philip Balister
> <philip@balister.org> wrote:
> > Given the only serious contenders for possible SCM's for OE appear
> > to be git or Hg, I am curious about the expertise level available
> > on this list.
> >
> >  Basically, let us know if you use git or Hg on a regular basis in
> > a two way workflow and consider yourself knowledgeable on sorting
> > out problems that crop up.
> 
> I use git regularly for kernel and u-boot development, and have
> managed to get a flow going with multiple public repositories where
> developers pull from public repositories.  This all works very well.
> I have not set up a shared public repository yet, but will give it a
> try to see how it works as I could use that capability that with a
> current project.
> 
> Mercurial looks very interesting and nice in many aspects, but I have
> not used it yet.  It seems to me one of the fundamental differences is
> the concept of cheap/easy local branches.  Mercurial is working on
> something like that
> (http://www.selenic.com/mercurial/wiki/index.cgi/LocalBranches), but
> it is obviously not central to its philosophy like git .  The idea of
> creating many local branches a normal port of your development
> workflow seems unique to git. As the gitmagic link below states, it
> makes it very easy to switch context to fix a bug, and then resume
> work on another feature.

Ok, so let's finally visualize how this unique feature would apply to
OE. So, we have set up all the BBPATH, build dir to reference to OE
working copy. Now, one magic spell, and OE working copy transmogrifies
into something else than it was before. What's next?

1. Suppose that we have thought that before, and prepared separate
build dir for this another local branch. Here, it's important to not
miss which build dir to use for which of workdir's phases of moon.
That's a bit harder that it would be with branches checked out into
separate workdirs, but careful people indeed can run many days before
making mistake. But all in all, "lightweight branching in OE" is not
that "lightweight" as just issuing SCM command.

2. Now suppose that we don't think that multiple builddirs is a must.
Then, we rm -rf tmp/ with each branch switch, or what? Btw, I wonder
how kernel people *actually* deal with that problem. Because only CS
freshman would buy into "very easy to switch context to fix a bug, and
then resume work on another feature." Real developers know, that fixes
are accompanied by testing.

3. Now let's think what happens if mistake was made per above (workdir
not switched, tmp dir not removed, ...) - we either already see errors
during build and end up with garbled builddir, or end up with builddir
garbled, but in silent manner. The latter is obvious good candidate
case for submitting in a week bugs that OE behaves.

4. And finally, what happens if we didn't think about all the above?
That's likely what will happen with newcomers and "mere users". They
may have no idea that building different OE branches may require
different builddirs. They may not know if given branch requires that,
or no. Ability to switch branches in-place would give them false
premise that it actually can be done easily. And give them good tool to
shoot themselves in feet.



What am I missing? Why it's not going to be like that, or why it's not
important? Let's think about that now, and not leave surprises (just
surprises for us, unpleasant surprises for our users) for later time.

[]

> Some more information on git branches:
> http://reddit.com/r/programming/info/69qe8/comments/c039eef
> http://www-cs-students.stanford.edu/~blynn/gitmagic/ch04.html
> http://mjtsai.com/blog/2007/07/15/subversion-to-git/
> http://www.dribin.org/dave/blog/archives/2007/12/30/why_mercurial/
> http://utsl.gen.nz/talks/git-svn/intro.html#howto-branch

Thanks for the links and mail, I believe that caused people unfamiliar
with hg to get to know it at least a bit, and led us to much more
grounded choice, than based on just personal preferences.

[]
> 
> Cliff
> 

[]

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


