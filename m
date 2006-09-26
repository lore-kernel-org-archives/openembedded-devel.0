Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GSDzi-00030S-Eu
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 16:33:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QESHdg006867;
	Tue, 26 Sep 2006 15:28:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06772-02; Tue, 26 Sep 2006 15:28:15 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8QESFUR006860
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Tue, 26 Sep 2006 15:28:15 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>, bitbake-dev@lists.berlios.de
Date: Tue, 26 Sep 2006 15:28:15 +0100
Message-Id: <1159280896.5573.123.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Bitbake past, present and future [long]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 14:33:10 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Paul's comments in #oe have highlighted the fact that whilst I and
perhaps some others know where things are going (and have come from), a
lot of things are in my head which isn't perhaps the best place for
them.

History/background
==================

Once upon a time, we didn't do anything with the runtime variables
RDEPENDS, RRECOMMENDS etc. This lead to a lot of duplication within the
metadata because of the two separate namespaces - you'd have have to add
BOOTSTRAP_EXTRA_DEPENDS = "virtual/kernel" and BOOTSTRAP_EXTRA_RDEPENDS
= "kernel-module-uinput". I complained about this and was told by Rene
to shutup, or fix it if it bothered me so much. So I did :) (well, have
attempted to anyway)

Circa bitbake 1.3, I added handling for the RDEPENDS variables so
bitbake could convert RDEPENDS into a set of DEPENDS. This was quite a
painful process, I changed a lot of the way .dev worked and I resolved
95% of the problems encountered. I'm 100% certain this process was
essential to allow OE to evolve. The end result was the modern neat
looking task packages and the removal of all the add to RDEPENDS and
make sure something equivalent is added to DEPENDS logic in .dev. I
don't think anyone can look at what was there before, look at what there
is now and not say it was an improvement. Things like task-base were
simply not realistically possible under the old system.

One of the big issues that was highlighted was should you RDEPEND on
fontconfig or libfontconfig? That would depend on whether you inherit
debian.bbclass or not. We don't require people to use debian.bbclass but
most just happen to. There are also other classes that do subtle
renaming (such as the kernel modules).

Solution: We now always use unrenamed package names in the runtime
variables and debian.bbclass handles renaming just as the packages are
created.

The problem is this isn't 100% foolproof. Consider:

RDEPENDS_A = "B"
RDEPENDS_B = "A"

Which do we build first? We can't package A without packaging B first
and vice versa. 

In bitbake 1.3 there were certain types of circular dependencies we
errored on and shouldn't have done. In fixing those, I managed to let
errors like the above slip through the net. This problem still exists in
bitbake 1.6 as things like:

DEPENDS_A = "B"
RDEPENDS_B = "A"

doesn't error and should (assuming you use debian.bbclass). Thankfully,
these kind of dependencies very rarely happen.

As the RDEPENDS handling was added, the code in bitbake went out of
control and became unmaintainable. Arguably I understand it better than
anyone and I couldn't fix the above problem in the existing codebase. 

Another related issue is that in bitbake 1.6, bitbake only handles
things as packages with no real understanding of the tasks that make up
the package which is really a dependency problem. I had problems trying
to express the task dependencies required by debian.bbclass. I also had
to make a choice about whether a multithreaded bitbake would operate at
the package or the task level. I chose the task level as it offers more
interesting possibilities in the future and addresses a lot more issues.
This did mean the core of bitbake would need rewriting as it was
previously package based.

At the time, nothing in the metadata properly explained the dependencies
at a task level. See these mails:

http://www.handhelds.org/hypermail/oe/102/10285.html
http://www.handhelds.org/hypermail/oe/102/10299.html

As you can see, I threw out the old dependency notation (bbdepcmd) and
replaced it with the items detailed above.

I also carefully considered what our expectations of things like "-c
fetch" are. For a long time, I've been getting confused as users want
"-c fetch" to fetch all dependencies for something like opie-image, yet
nothing in the metadata gives that dependency.

After much thought, I concluded that "-c fetch" should only run the
fetch task for the packages specified.  To make "-c fetch" fetch all its
dependencies, you could add something like this to the metadata for
bitbake trunk:

do_fetch[recrdeptask] = "do_fetch"

I plan to either add an option "-c fetch -xyz" which simply injects the
above metadata fragment, or we add a fetchall task in OE which does this
and hence give users what they want/need in a maintainable way. 

Note, we also lose the horrible BUILD_ALL_DEPS variable I added as a
mistake when working on bitbake 1.3 - whilst I hate the thing now, it
did buy us time to step back and fix all this properly though!

The final problem is that bitbake prior to 1.7 computes provider
decisions "on the fly". When it starts building, it has no idea what it
will end up doing. If/when a package fails, it would rethink what it was
doing and only then try and compute a way out. It would only find the
next alternative. This is the final barrier to multithreading - no
predetermined paths but all computed dynamically. Again, this cries out
for consideration as part of the rewrite. I'm acutally sad to lose the
dynamic approach but it has too many drawbacks (see usability below).


What did we do?
===============

Hopefully the above tells you why we needed to throw away some of the
old code. My plan was simple - implement a multithreading capable
bitbake and at the same time, rewrite the dependency code with sanity in
mind. I threw away the old code and added a new two level system:

taskdata.py - handles the metadata, works out the dependencies and
parses into a list of tasks
runqueue.py - takes the list of tasks, filters them, decides on the
optimal execution order and then runs them.

Some of the handling is quite subtle. taskdata's data structures are
reusable, runqueue's are not. When a package fails, we throw away the
runqueue and ask taskdata for a new list of tasks (if possible). It is
now hopefully structured code we can maintain with a semblance of an API
(not stable yet though!).

I'll also note that bitbake is actually *much* faster now. Compare the
speed of a bitbake opie-image --dry-run under bitbake 1.6 with the new
one. This is despite doing all the computation in advance! :)


Where are we now?
=================

The position in trunk is that these two modules basically work. They are
not hooked into the rest of bitbake in a way which exposes all their
power. New commandline options might help with the and/or improvements
to the metadata as mentioned above. Of course there are also the
inevitable corner cases in the metadata the new code highlights.

One is the circular dependency example mentioned above which affects
opie-mediaplayer1. I'm certain its not a bitbake issue but
debian.bbclass being flawed. The solution is to split packaging into two
stages:

1. packaging-prepare - split the files into the packages and calculate
the renaming
2. packaging - actually make the packages and write in the RDEPENDS
lines.

This means we can write:

do_package[rdeptask] = "do_package_prepare"
(instead of do_package[rdeptask] = "do_package")

and the whole circular dependency problem goes away.

I've already covered the "-c fetch" problem and the two potential
solutions.

Another current issue is handling of the "-f" option. taskdata and
runqueue need to be taught about that and currently it sometimes works
but is unpredictable.

The final issue I'm aware of is a usability one. I'm convinced
taskdata/runqueue work but their output to the user is even less helpful
than bitbake was previously (which was bad enough). I have see bitbake
stop dead seemingly with no output at the moment which is no good. I
have split things into logging domains as a first step to rectify this
but it still needs a ton of work. The problem is knowing when a given
message is important and the user needs to see it/do something about it
and when a message should just appear as low level debug. I'm fixing
cases of bad messages when I find them but I'm really going to need help
with this in both identifying the cases and improving the existing
messages.

The point to keep in mind is that it was near impossible to improve the
logging in the old dependency code due to its on the fly computation
nature. Under the new code, we actually have the dependency data in
advance and I'm therefore convinced that we stand a much better chance
of improving usability against this new backdrop.

I suspect I've rambled enough now :)

If anyone wants to discuss any of this or better still help with the
code, please do so!

Richard



