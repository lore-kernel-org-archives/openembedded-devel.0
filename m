Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NnCoo-00077D-BS
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 16:18:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o24FFcdP032370
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Mar 2010 15:15:38 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32209-02-2 for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Mar 2010 15:15:19 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o24FAgxf032126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Mar 2010 15:10:43 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <b6ebd0a51003031028q1b948bb4y2e40d734252f0fb6@mail.gmail.com>
References: <b6ebd0a51003030909u58f72751u19f5b3caab614450@mail.gmail.com>
	<1267638229.2259.147.camel@rex>
	<b6ebd0a51003031028q1b948bb4y2e40d734252f0fb6@mail.gmail.com>
Date: Thu, 04 Mar 2010 10:09:27 +0000
Message-ID: <1267697367.2259.239.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	o24FFcdP032370
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=AWL,BAYES_00,
	DATE_IN_PAST_03_06, RDNS_DYNAMIC, TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 04 Mar 2010 15:18:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-03-03 at 11:28 -0700, Chris Larson wrote:
> No, I think I didn't make this clear enough.  These goals are for the e=
ntire
> implementation, not the diff of the current method against new.  These =
are
> the end goals of the needs we want this entire notion of binary caching=
 and
> package managed staging to solve.  I didn't intend for it to sound like
> pstage wasn't moving in that direction.  I just believe it is good time=
 to
> step back and consider what we're trying to accomplish, and how best to=
 get
> there.

Ultimately I think we do want to achieve fundamentally the same thing,
ignoring a few of the implementation details.

The current pstage approach suffers a lot for a few reasons:

a) It had to be optional and opt-in
b) It has to cope with legacy staging mode
c) Discoveries were made during its implementation which required=20
   fixes, some of which were more hacky than I'd have liked.
d) It had to be a smooth continual migration path

I guess I will be frustrated if we now decide the hoops I jumped through
so far to move things forward were unnecessary and taking a shortcut is
in fact ok. Its been made clear to me in the past that changes need to
be incremental.

Whilst I do strongly dislike the current code I do not think its beyond
redemption and I would also prefer to do a migration to an improvement
based on the existing code, rather then engineering from scratch.

> I'm glad to hear we want to move in similar directions, that avoids pro=
blems
> in making this happen, and keeps the TSC out of it ;)

Well, we do seem to fundamentally disagree on the approach to this and I
think the TSC does need to approve a change on this scale, particularly
if its as much of a change in direction as you want to take.

> Yes, I know, as I say toward the end of the email, I implemented this i=
dea
> in a prototype of private staging, so I ran into at least some of the
> reasons behind the current work.  I readily admit you must have more
> experience with the pstage quirks, since you wrote the thing, so I welc=
ome
> as much input as you're willing to give on the subject.

I will do my best to provide it...

> > My view on this is a kind of hybrid. Firstly, we need to adopt some k=
ind
> > checksum system which represent staging packages. If the checksum
> > doesn't match what we want, the staging package is invalid.
>=20
> Yes, I agree that we need this, but I believe that's a secondary issue.

First time around we decided several things would be "later" and we have
the partial implementation we have now. We're doing the painful work in
OE regarding the do_stage functions and whilst that happens there is no
hurry to write a new solution since all solutions pretty much depend on
that work being completed.

Since we have time whilst that happens I'd like to see a complete
coherent proposal which covers all the issues. It may or may not be
obvious but I'm doing certain development work on Poky and staging is
one of the targets. As an example of this we've massively improved the
mirror handling within bitbake and allowed fetching of staging packages
from multiple sources. This was done taking a step back and fixing all
levels of the code to do what actually makes sense.

For Poky I have a list of requirements and have plans laid out on how to
address them. They're based on incremental steps on existing code slowly
evolving to the end goal as agreed by the former OE core team, as
discussed at OEDEM and touched on in the TSC meetings. To list the plans
I have in mind which address some of the requirements I have:

a) Remove legacy code path (now never used in Poky)
b) Make the code default not optional (not done in Poky but only so OE=20
   can keep in sync easily)
c) Add fetching of staging packages (done in Poky including better=20
   mirror handling code for bitbake)
d) Add checksum support (not implemented yet)
e) Look at the general stamp problem (most likely need to change=20
   bitbake)
f) Rename staging to sysroots (done in Poky, not OE yet)
g) Move cross into native sysroot (OE has patches in progress)
h) Make cross and native staging packages path independent (partially=20
   complete in Poky)
i) Split the deploy/ipk, deploy/rpm, deploy/deb data into separate=20
   staging packages
j) Fix staging package architecture issues
k) General cleanup having achieved all the above

Its been commented that I'm being defensive of the current code/approach
and taking it personally. I think its fair to say I've spent a lot of
time getting to where we are now and have also plans in mind for the
future. Being told that actually we need to take a step back, do it from
scratch and so on implies we're on the wrong path so its only natural
there will be a defensive element to my position.

>   In
> order to implement that properly, we need to more fully track the *inpu=
t*
> into the build as well, not just the output, otherwise there's no good =
way
> to determine how to invalidate.  If we start naive, we could capture on=
ly
> the variables that are already captured in the PSTAGE_PKGPATH & the lik=
e
> into a signature, coupled with a hash of the SRC_URI contents, as the i=
nput,
> and an associated hash for do_install as the output of the operation.  =
Hmm.

I agree this is not a simple problem but that doesn't mean we shouldn't
do something about it. The solution I envisage would capture a lot more
variables (probably *unexpanded* versions) into the checksum. I even
have ideas about including things like the do_xyz function contents in
the checksum. How efficiently we can do this I'm as yet unsure but I
think its possible to make it work really well.

From an implementation standpoint, I'd see a hash being generated at
finalise time after parsing. A task's hash would be this hash combined
with the hashes of its dependencies.

I can see the checksums pretty much removing the need for the current
stamp handling if we get it right. The stamp files caused me no end of
grief last time around and if the checksums work we simply don't need
them anymore.

So if we can remove the problems with stamps by using strong checksums,
perhaps even at the bitbake level I would not call this issue
secondary ;-).

> As I mentioned on IRC, do_install *is* special, at least in my opinion,
> because it's the final output of the upstream build/buildsystem.

On this we fundamentally disagree. do_install is one form of output and
is an intermediate step on the way to many of our other outputs.
Different users will find those different outputs of differing value.

If I'm building an image, I do not want to have to run the
do_package_write_ipk functions for every staging package I just
downloaded just in order to build the image.

I see no reason why I shouldn't be able to add some other task which
processes the compiled source and generates some other kind of output
either.

Yes, my view is more complex but its this kind of attention to detail
which makes OE what it is and why it wins compared to a lot of other
build systems.

In my view, *any* solution which requires do_package_write_ipk to have
to run again in order to build an image is broken and inferior to what
we have now.

>   It is what
> we want/need from them.  Everything else we do can come from that, and =
all
> the tasks before it are intermediate steps whose results are of limited
> usefulness, other than for traceability (which I agree we need, just do=
n't
> necessarily think we need that *now*).

You have a very narrow focus. How about things like build speed and
efficiency and having an architecture which is suitably generic and
powerful?

>   I have a prototype of using git to
> track changes to WORKDIR through the tasks, with automatic commits of t=
he
> task output and corresponding tags for each task.  I think that kind of
> thing would be extremely useful, but I think pursuing that route would =
be
> better done as a subsequent task.

I think all these things are intertwined.

> We could go as far as mandating only output under WORKDIR should be mad=
e
> > (in specified directories per task). bitbake could then have a
> > postprocessing task defined which looks at an output directory and
> > generates a corresponding "staging" package and also applies it to a
> > core sysroot directory / wherever.
>=20
> This is what I already suggested in my email  =E2=80=94 the archive fro=
m do_install
> is the primary artifact, *everything* comes from / is generated from th=
at,
> including the package for use with package managed staging.

The two paragraphs above are not equal. My proposal is:

do_install           - creates ${WORKDIR}/install
do_package           - creates ${WORKDIR}/install-split
do_package_write_ipk - creates ${WORKDIR}/ipk
do_deploy            - creates ${WORKDIR}/deploy

so we stop tasks writing outside WORKDIR by convention. We can then add
something to bitbake's function handling which allows for definition of
a post process routine which can probably also double as a staging
package install routine. The directories would be set using flags:

do_deploy[outputdir] =3D "${WORKDIR}/deploy"
do_deploy[postprocess] =3D "do_deploy_postprocess"
do_deploy_postprocess () {
	cp -r ${WORKDIR}/deploy/* ${DEPLOY_DIR}
}


so then if a build needs the ipks say to build an image, it only has to
install the do_package_write_ipk task output package.

Note some interesting ways my proposal could work in that if you change
FILES, it would invalidate the stamps for do_package but not do_install
(assuming we do task level checksums?) so the do_install package could
install and then just be repackaged. The first system to do this could
share those results into the staging package pool so then other machines
could just build the image from the _ipk packages again.


Your proposal is that do_install is the output package and everything
beyond that *always* has to be rebuilt.

I don't think people will be happy with having to rerun do_package
(including the QA) and the package_write_* tasks every time compared to
an accelerated build from staging packages.


> > 1. Stamp file handling - needs a total rethink really. Not sure how t=
o
> >   do it but I have given it thought before.
>=20
> This isn't an issue if you look at it the way I did in my proposal, whi=
ch is
> that this artifact/archive is the primary result of a build of a recipe=
, and
> all the tasks that lead up to do_install (not those that may run earlie=
r,
> just those that do_install depends upon directly or indirectly) are
> intermediate steps, and can be skipped.  Setscene can certainly generat=
e
> that, rather than extracting it in the form of stamps from the pstage
> package.  You've obviously had more experience in working out stamp mad=
ness
> than I have, and maybe I'm making this simpler than it is, but maybe it=
's
> simpler than you think as well.

It depends what level of assumptions and hardcoding you want in
setscene. Anytime someone adds a new task are you going to need to
update the setscene function?=20

The current solution is generic which was painful but we don't get weird
bug reports when people add tasks or change the task orders around.

> > 2. staging package covering tmpdir - we did this to cover pkgdata,
> >   cross, stamps, deploy as well as staging.
>=20
> cross is going away if we go the toolchain-desuck route, which I think =
we
> should.

Yes, I was just highlighting this was a dependency.

>   stamps aren't a serious problem other than corner cases, if you
> approach it the way I suggest,

I wish I was so sure about that. My conclusion is we'll end up replacing
them with something containing a hash.

>  and deploy and staging would both come from
> the aforementioned archive (or archives/repository, as in your suggesti=
on).

deploy functions are going to need a rewrite

> 3. Optional packages staging - should be made mandatory to simplify cod=
e
> > 4. Logistics of doing it. We can't even get packaged staging merged
> >   into OE :(
>=20
> I've found that most of the time it's just a matter of someone sitting =
down
> and implementing it.  Many things I've wanted to see in OE since it was
> started were just a matter of sitting down for 48 hours and coding it u=
p.

Many things are but this one is a major architecture change depending on
changes to every recipe. We've started that process, I'd like to see it
through.

>  If someone did a patch to make the current pstage mandatory, I suspect=
 we
> could get it in, but I feel this is a good opportunity for us to take a=
 step
> back, rather than just removing conditionals..

Now, we could get that in I think yes. A year ago - no chance. See above
on why "taking a step back" grates a bit, particularly if the proposal
is doesn't cover the things we need to cover and is a regression in some
ways.

> So, to summarize, you disagree with the notion of the 'make install' be=
ing
> the primary artifact of the recipe, and want instead deep tracking of t=
he
> output of every task, with caching at that level.

Correct.

>   I like that idea as a
> means of adding traceability, as I mention above with the prototype of =
git
> task tracking, but I don't necessarily see it as being something that h=
as to
> be either/or.  If we can agree that everything *up to* do_install is an
> intermediate step, and not necessary for binary caching (though yes, us=
eful
> for traceability),

I agree with this, the output of those tasks is not useful in a packaged
format.

>  I think we can build what you want for tasks *after*
> do_install on top of what I suggest, rather than as an alternative to w=
hat I
> suggest.  Thoughts on this? =20

but I disagree with the leap of logic here. I don't like the "on top of"
part of the proposal, I think we need something generic, flexible and in
keeping with the rest of the core.

> I'd like to find a compromise that can satisfy
> both of us for the future, but which allows me to get to the coding of =
this
> piece of it immediately.

How about coding things incrementally upon the foundations we already
have?

The trouble is you have a very focused view of what you want to achieve.
I have a much bigger picture in mind and feel that replacing pstage with
what you describe is partly a step backwards and will hamper certain
future developments which we need equally badly as a pstage cleanup
(which is what this amounts to).

Cheers,

Richard




