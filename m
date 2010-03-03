Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NmtLw-0003Ec-Lx
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Mar 2010 19:31:38 +0100
Received: by pwi5 with SMTP id 5so982128pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 10:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=b4NgfAYvWOortmf4h8D0awfJhd1ToBmfjLwbl5P+VG8=;
	b=WVZrUPdwog5ys5GMoDf+a0Lr8+uvkBnHUMDvudkF8qI6aOnTo5e1+TCSXMnbAr5VOQ
	nLnr+5WDPcZnT81X4b+hpaINa65N0RTid2G54uxCaY60L9vuFwZZwG8HlEwYIheT8GAH
	TTNmhSav2G/pgY8e2IglGFxC2kQsuE6i9CEsU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=c9J/0GjbfXvL/9J1ljKcrKQIs6Fjyts5bOa8EdINrv7zgYqJTUy3zqommEdel/NLC8
	l3lJsKzx1vxACKm0vYMTeMTRxqeLQ5yR1JjeF6GbHEgLVwDG/3muMjXuUZDpo4zZ7si2
	HdRJB9Z802egDV4xO5AeDhwVqrc9dkeVgyXAY=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.26.16 with SMTP id d16mr489402wfj.287.1267640912115; Wed, 
	03 Mar 2010 10:28:32 -0800 (PST)
In-Reply-To: <1267638229.2259.147.camel@rex>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com> 
	<1267638229.2259.147.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 3 Mar 2010 11:28:12 -0700
X-Google-Sender-Auth: 6259edccd62487da
Message-ID: <b6ebd0a51003031028q1b948bb4y2e40d734252f0fb6@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] Initial Proposal for Packaged Staging Revamp (was [RFC] Make some big changes right after next stable)
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
X-List-Received-Date: Wed, 03 Mar 2010 18:31:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2010 at 10:43 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Wed, 2010-03-03 at 10:09 -0700, Chris Larson wrote:
> > Proposal for the Revamp of "Packaged Staging"
> >
> > Goals:
> > - Simple implementation
> > - Managed staging area
> > - "Build" from cached/prebuilt binaries
> > - Reduce behavioral differences between the prebuilt and from scratch
> cases
> > - Intrinsic to the system, no longer opt-in
>
> I had to smile when I read this as you make it sound this isn't the
> direction packaged-staging is already moving in :). The things you
> describe are all things I've had in mind, just the practicalities of the
> real world mean we're not there yet.
>

No, I think I didn't make this clear enough.  These goals are for the entir=
e
implementation, not the diff of the current method against new.  These are
the end goals of the needs we want this entire notion of binary caching and
package managed staging to solve.  I didn't intend for it to sound like
pstage wasn't moving in that direction.  I just believe it is good time to
step back and consider what we're trying to accomplish, and how best to get
there.

Basically when you describe is what I also want to see packaged staging
> and OE in general doing. You're right to point out that what we're
> trying to achieve is beyond the scope of plain "put staging under the
> control of a package manager".
>

I'm glad to hear we want to move in similar directions, that avoids problem=
s
in making this happen, and keeps the TSC out of it ;)

 Where we might differ how exactly to do it technically. I really dislike
> some of the way packaged-staging works but its all done that way for a
> reason. The reasons most likely become apparent when you try and find an
> alternative to what it does.
>

Yes, I know, as I say toward the end of the email, I implemented this idea
in a prototype of private staging, so I ran into at least some of the
reasons behind the current work.  I readily admit you must have more
experience with the pstage quirks, since you wrote the thing, so I welcome
as much input as you're willing to give on the subject.


> > I would like to propose an alternative to the current implementation,
> which
> > I believe will aleviate some headaches (for example, those caused by th=
e
> > stagefile bits, which is more functionality that slips beyond the
> original
> > intent of package managed staging), make it easier to add more
> traceability
> > to the builds, reduce behavioral differences between the use of cached
> > binaries and building from scratch, and should help to prepare for some
> > possible moves in the future.
> >
> > To summarize, I propose the creation of an archive/package which acts a=
s
> the
> > primary artifact to come out of the build of a recipe.
>
> My view on this is a kind of hybrid. Firstly, we need to adopt some kind
> checksum system which represent staging packages. If the checksum
> doesn't match what we want, the staging package is invalid.
>

Yes, I agree that we need this, but I believe that's a secondary issue.  In
order to implement that properly, we need to more fully track the *input*
into the build as well, not just the output, otherwise there's no good way
to determine how to invalidate.  If we start naive, we could capture only
the variables that are already captured in the PSTAGE_PKGPATH & the like
into a signature, coupled with a hash of the SRC_URI contents, as the input=
,
and an associated hash for do_install as the output of the operation.  Hmm.

Secondly, I agree we need to capture all output of a task we do that
> already, just badly. I like the idea of creating structures under
> WORKDIR where these things are put, like the output of do_install, the
> output of do_package (split up do_install and some package data) as well
> as the output of the package generation step.
>
> Your usecase is too focused on your specific problems and on do_install
> though. Why is do_install special? I'd go one step further and allow the
> "staging package" output of a recipe to be multiple packages each one
> representing a task.
>

As I mentioned on IRC, do_install *is* special, at least in my opinion,
because it's the final output of the upstream build/buildsystem.  It is wha=
t
we want/need from them.  Everything else we do can come from that, and all
the tasks before it are intermediate steps whose results are of limited
usefulness, other than for traceability (which I agree we need, just don't
necessarily think we need that *now*).  I have a prototype of using git to
track changes to WORKDIR through the tasks, with automatic commits of the
task output and corresponding tags for each task.  I think that kind of
thing would be extremely useful, but I think pursuing that route would be
better done as a subsequent task.

We could go as far as mandating only output under WORKDIR should be made
> (in specified directories per task). bitbake could then have a
> postprocessing task defined which looks at an output directory and
> generates a corresponding "staging" package and also applies it to a
> core sysroot directory / wherever.
>

This is what I already suggested in my email  =E2=80=94 the archive from do=
_install
is the primary artifact, *everything* comes from / is generated from that,
including the package for use with package managed staging.

So, if you build an rpm based image, it sees all the package_write_rpm
> prebuilds and just makes sure they're installed, nothing else. This
> approach seems extensible and generic, things which serve us well.
>
> The pitfalls of this are (random brainstorming):
>
> 1. Stamp file handling - needs a total rethink really. Not sure how to
>   do it but I have given it thought before.
>

This isn't an issue if you look at it the way I did in my proposal, which i=
s
that this artifact/archive is the primary result of a build of a recipe, an=
d
all the tasks that lead up to do_install (not those that may run earlier,
just those that do_install depends upon directly or indirectly) are
intermediate steps, and can be skipped.  Setscene can certainly generate
that, rather than extracting it in the form of stamps from the pstage
package.  You've obviously had more experience in working out stamp madness
than I have, and maybe I'm making this simpler than it is, but maybe it's
simpler than you think as well.


> 2. staging package covering tmpdir - we did this to cover pkgdata,
>   cross, stamps, deploy as well as staging.
>

cross is going away if we go the toolchain-desuck route, which I think we
should.  stamps aren't a serious problem other than corner cases, if you
approach it the way I suggest, and deploy and staging would both come from
the aforementioned archive (or archives/repository, as in your suggestion).

3. Optional packages staging - should be made mandatory to simplify code
> 4. Logistics of doing it. We can't even get packaged staging merged
>   into OE :(
>

I've found that most of the time it's just a matter of someone sitting down
and implementing it.  Many things I've wanted to see in OE since it was
started were just a matter of sitting down for 48 hours and coding it up.
 If someone did a patch to make the current pstage mandatory, I suspect we
could get it in, but I feel this is a good opportunity for us to take a ste=
p
back, rather than just removing conditionals..

So, to summarize, you disagree with the notion of the 'make install' being
the primary artifact of the recipe, and want instead deep tracking of the
output of every task, with caching at that level.  I like that idea as a
means of adding traceability, as I mention above with the prototype of git
task tracking, but I don't necessarily see it as being something that has t=
o
be either/or.  If we can agree that everything *up to* do_install is an
intermediate step, and not necessary for binary caching (though yes, useful
for traceability), I think we can build what you want for tasks *after*
do_install on top of what I suggest, rather than as an alternative to what =
I
suggest.  Thoughts on this?  I'd like to find a compromise that can satisfy
both of us for the future, but which allows me to get to the coding of this
piece of it immediately.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

