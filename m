Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ophnl-000216-PS
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 15:20:02 +0200
Received: by iwn2 with SMTP id 2so3984394iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 06:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3hVEjFTo2KhXek0OaO1Gs3LcvbrO4Eb7nSYciYDXcCo=;
	b=dz+HQa2a4ldiHuaMnDcZ8Zv42BqUNwXwxsAz4z+nCxCfzjl9pt7WNObUqhT5HD1TIV
	w3h/WjgQXIluLk/nYAI5UrpXCx2fgi0rLZLN/2avGZRjmPy6iSK1b7TJhYX3yob0NIOB
	W2pL1xhLKiwxirkUYT42VjIyGQrJg98wImlPU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AzzFap3536xO9r8qJWkQLe9aXJ1ihgwJFc+rsJYIbmrzN1EURdES2kzQowYAid73zW
	eoOhurPhYVVh11/jfv0H2jLGIXxix6RjVexOXtg81mUriEbnkt4rXkwwy6heLXQy4JgA
	DKtSBn9dpPtTYJWTsOYVCAeimEvV7uTTErryI=
MIME-Version: 1.0
Received: by 10.231.19.197 with SMTP id c5mr3832062ibb.91.1283087972057; Sun,
	29 Aug 2010 06:19:32 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 29 Aug 2010 06:19:31 -0700 (PDT)
In-Reply-To: <4C79B2E7.6070806@mwester.net>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
	<AANLkTi=stV1ahzagn-7Fzq73pL3xYDDBZpAsfRUbA86v@mail.gmail.com>
	<AANLkTinPBor3x6fYemS6h7_R-TR8Tx01exHzG+YhTAz=@mail.gmail.com>
	<4C79B2E7.6070806@mwester.net>
Date: Sun, 29 Aug 2010 15:19:31 +0200
Message-ID: <AANLkTikQHt0QdM7b+s9SyYWMRBE3gULYJ4q3_QqMdmg0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sun, 29 Aug 2010 13:20:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/29 Mike Westerhof <mike@mwester.net>:
> Frans Meulenbroeks wrote:
>> Koen brought up this in the thread on the review process. As it
>> (mostly) is about this thread I felt it was more appropriate here.
> [snip]
>> I don't know what others think about it, but I see only a few matches.
> [snip]
>> PS: I think this is also an excellent case why it is a good idea to
>> identify the maintainer within the recipe/

Mike, thanks for your reply.
I'd like to address your remarks.
>
> I think this gets at the heart of why Frans' recent changes make *me*
> uncomfortable -- their scope is broad and the general approach by Frans
> is to make everyone else provide detailed and precise arguments
> defending why the broad change should not apply to specific items.

No. This is not true.
There are several things at hand.

One thing is the rejection of patches with a simple NAK without any reasoni=
ng.
I feel that if someone takes the time to submit a patch and sends it
to the list for review deserves some more feedback than just a NAK.
Some explanation on why a change is no good is helpful to the person
who submitted the patch (as he/she can learn from it and/or improve
the patch), as well as for the list readers (as they also can learn
from it).
I have never said that detailed and precise arguments are needed, but
some indication why the patch is rejected is not more than polite and
not providing one does is offensive to the person who did the work and
does not really help the community.

As far as reverting deletions, I'm not aware that I asked for detailed
and precise arguments.
I prefer to have some kind of rationale for it though (beyond the "I
don't like it "level).

> I, for one, would like to understand where this "cleanup" effort is
> ultimately going to go. =A0What distros will ultimately remain in OE?

As far as I'm concerned every distro which is maintained can stay.
However if a distro is not maintained any more, I'd rather prefer to
have it removed, or, better, flagged as such (e.g. by moving it onto a
non-maintained directory which people can decide to add or remove to
their BBFILES).
Root cause is that if it is not maintained it is unlikely to build
after a while, and problems are not resolved. I feel people that still
want to build that distro are better off using a tagged version which
is known to be the last-known-working-version for that distro.
Having said that, I think it would be very good to have a clear
indication of who is the maintainer of a distro (and I would suggest
that this is recorded in the distro conf file).
As I analysed before the status of several distro's is shady. No clean
maintainer is known for some of them. If no one takes care about it
then what is the point of keeping them?
Better move them to a non-maintaned directory so people know the
status (and if someone steps up who is interested in the distro it can
be revived).
But as long as a distro is maintained at least I feel we should keep it.

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-August/022=
698.html

> What what will be the final criteria for recipes being permitted to
> remain in OE (it seems to be converging on "it must build with bitbake
> world, despite the many emails that have offered sound reasons for why
> that is a poor test of recipe quality (which begs the question of why
> recipe buildability might be a valid measure of quality in the first
> place)).

That is a very good question. I do feel buildability is a good
starting point for a recipe.
If a recipe is not buildable, it is probably not worth to keep it in
the main tree  (probably with the exception of recipes that are being
created, but I guess these at least will have DEFAULT_PREFERENCE =3D
"-1" in it, or are otherwise marked as being work-in-progress). I can
imagine that some are worthwhile to be kept, but let's then put them
in a separate dir. That way people immediately know the state of the
recipe.
BTW: I view buildable quite broad. If it builds for a certain arch, I
consider it fine (but e.g. COMPATIBLE_MACHINE should indicate it). It
is obvious to me that e.g. an arm specific recipe will most likely not
build for ppc.

Also I'd say that a good recipe is one which has a guardian who looks
after it. For example I'm not too keen on having a recipe around that
has been created and committed by someone 4 years ago, of which it is
unclear what it does, why we have it, whether it is still useful etc
etc). And if it is kept, I prefer to know upfront what I am facing.
Otherwise we'll end up in being a junk yard of recipes.

But of course that is solely my opinion. I know others feel different about=
 it.

>
> Most of the patches and changes in OE have very specific distros in
> mind, or they set out to solve reasonably bounded problems when they
> cross distro boundaries. =A0Frans' changes do not. =A0The result is that
> each and every of these patches must be carefully reviewed. =A0I asked a
> specific question of Frans earlier that he did not answer, for whatever
> reason. =A0I'll ask again: What distros does Frans test to ensure that hi=
s
> patches are sane?

I regularly build minimal and sometimes angstrom. Having said that
I'll be the first to admit that the changes have not been tested
properly.
I've apologized for that in the past, and I'll apologize for it here again.
Also one should not only look at the distro but also at the images
that are used to test. E.g. building console-image will probably not
find errors in X11 or gnome.

This does however not tackle the root cause. The root cause seems to
be that people do create recipes, but do not clean up recipes.
To pick my favourite example. Abiword at some point had around 10
versions. Sorry, but I fail to see the benefit of that.
If version  x.y.z is tested and works properly and known to fix
issues, then what is the point to keep x.y.z-1, x.y.z-2 etc
Or, even worse: x.y.z.rc1, x.y.z.rc2 etc.
If recipe maintainers had kept their dirs clean, this would all not be need=
ed.
Now someone needs to mop things up. That person may have less
knowledge, increasing the risk of errors.
It is then easy to blame the person who did the unrewarding, boring
job of cleaning but I feel the root cause of the problems are the fact
that recipes are not or not properly maintained (and I don't want to
say that this is common practice, lots of our recipes are
well-maintained (fortunately). However, we did accrue some stuff over
time that is somewhat questionable.
And especially with the amount of work needed to get rid of legacy
staging and merge native recipes, it felt a good plan to reduce the
number of recipes that need to be processed (but to be honest at some
point I didn't look to carefully at that again and it became a more
generic cleanup action).

Wrt the testing. I didn't test too well, we already concluded that.
However, I did things to minimze the errors.

My procedure when making those changes was a fairly standard process:
I went to the directory, if there are many versions of a recipe and if
the recipe was not a core recipe (like gcc, u-boot etc etc), I checked
what versions were pinned by distro's.
This was done by doing a grep -r package-name conf/
All pinned recipes were kept so your distro and all others still have
their pinnings available (unless they were not there when I started).
(and if I accidently made a mistake and removed something that was
pinned, I'll happily revert the change)
Then I checked what the last used version was. That version (and all
higher ones with a DEFAULT_PREFERENCE =3D "-1") were also kept. Also svn
and git based recipes have been kept. Versions that are the last
release of a major version of a recipe were also retained  In most
cases most of the remaining recipes were removed (with their
associated files).
(btw this is a description of what I did. Whether it was good or not
is a different discussion)

While doing that I made a few mistakes (probably because of the boring
nature it became too much of an autopilot activity).
Let's examine these in some more detail:

the docbook failure:
We have the files:
docbook-sgml-dtd/docbook-sgml-dtd-3.1-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-4.1-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-4.4-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-4.5-native.bb
docbook-sgml-dtd/docbook-sgml-dtd-native.inc
What happened was that I misrerad the 3.1, 4.1 etc as version numbers
and accidently removed 3.1 (and maybe others as well, don't remember)
while some recipes had this as a dependency.
Better testing would have revealed this problem, but alas, it did not happe=
n.

The openssl failure:
Actually here I made a few mistakes
First of all I underestimated the coreness of this recipe. Should I
have realised that, I would have left the recipe untouched (which I
also did for other recipes I didn't feel too happy about).
Secondly while going to the openssl website to find out the age of 0.9
I saw that the version we had had some security advisories. At that
point I made the error to shortcircuit my workflow.
I did check the pinings but forgot to check the DEFAULT_PREFERENCE,
but right away removed the version with the security vulnerabilties.
Forgetting the last test made me accidentally remove 0.9m which
resulted in the problems Koen encountered.
This mistake was pointed out to me the day after I removed this
version after which I restored it as soon as I could.

Root cause of all the fuzz is that some people automated take the git
head, build things and put them on their package feeds to be used by
others who maybe base production work on it).
I think every QA manager can tell you that with a project with
probably more than 30 people having commit access  this is not really
a good plan, because you never know what you are giving to your users.

(btw our 0.9.8 version is at 0.9.8m, 0.9.8n came out in march, and the
current 0.9.8 version is 0.9.8p; no idea who maintains this, it is not
listed in MAINTAINERS).
>
> It's great that we "clean up" OE, but in my opinion, it's being done
> with a sledgehammer approach, and I for one find it uncomfortable being
> "threatened" by the creator of these global giant patches setting
> policies about same that require the community to carefully defend their
> work or interests, or else.

I am sorry if you feel threatened by what I wrote or by my actions. If
that is the case, rest assured that this is not intended, and my
apologies for creating that impression.
It was my intention to improve the quality (and I know opinions differ
on whether I did or not) and reduce the workload for getting rid of
legacy staging and for merging native/target recipes.
>
> C'mon folks -- I'm not the only one who's busy, and who's uncomfortable
> with this. =A0Dev branch or not, this is NOT the way to get a community
> working together.

I admit that I have been too enthusiastic. I have already apologized
several times for that (with s and z :-), I always mix up UK and US
spelling).
Then again I feel something had to happen (I agree with what Khem says
in the next message after yours), and at least the topic is now
clearly on the table.
But yes, I feel that it would be better if we could come up with a
more structured approach to the problems (and e.g. get rid of legacy
staging), and yes, I could have done better.
Then again I see that sending patches does not really help either. Too
often a patch receives no feedback at all, and I think if I had send
out patches nothing had happened.

Then again the rude behaviour that I have seen from some other
developer on this, is also something that not really helps to get a
community working together.
BTW: these opinions are mine. They are open to discussion. I think it
is good to do some cleaning though.
Then again I have had contact with the TSC and I have been asked not
to perform such massive actions any more without prior discussing them
and getting support.
Of course I will adhere to this (and I am happy to participate in
cleanup activities)
>
> -Mike (mwester)
>
Best regards, Frans.

PS: Mike do you feel responsible for upslug? If so, would you mind
cleaning up that recipe. I guess the old versions are not really
useful as 11 is quite mature. Also native culd be integrated and for
upslug do_stage could go.


