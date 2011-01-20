Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pfre5-0006TZ-0q
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 11:21:37 +0100
Received: by iwn8 with SMTP id 8so468962iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 02:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=TS/9ZQSa+/+MO/xC2xyx38MyV/O7JpptWxYuzX3/2sE=;
	b=BStecnK+WWOoGTZ/r3cThgw2DP06e9YVAEKdHspuUVTyzs/wDhwtSp0dHAUzH1zkC2
	P7S9voJA02nVlOqt+4bGgtgE6jOpGUIlelPHH75cUzQjFs7W8pqL7Cf4MGBmQsb2SlZJ
	1bcLsvDfU2FMA41/BPvsbaRavzbNKp5O/QPiI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Uf1g0U0gr/YdKq7Y58RzVrfVm5QZ+Ufg+6ARuBLB8tF/Mqk6qjFazc0mPQOrza9oNF
	IadCXypBwsP7wS+zPB2kdtFJPlaqwFZ2YcoFDMrPyYzi8y/y3j4QzzOn4AeAwppqk2eE
	9q96mmIuzeDANdkUkmHpimWbGAKP6JlIYIwkA=
MIME-Version: 1.0
Received: by 10.231.39.74 with SMTP id f10mr2269561ibe.84.1295518856935; Thu,
	20 Jan 2011 02:20:56 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Thu, 20 Jan 2011 02:20:56 -0800 (PST)
In-Reply-To: <AANLkTinRKmmzUT-6T6_cGR+HHrB6hYFYhdS4GuZHRS+Z@mail.gmail.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com>
	<AANLkTinHP=9S6tAFdiWHfk8zZi0MhvfNTgW71Ugx++9w@mail.gmail.com>
	<AANLkTi=aMnnfnaQZNLpZW_8MUWq_jckou9tr_bA8NBY6@mail.gmail.com>
	<4D36A64E.9060804@xora.org.uk>
	<AANLkTi=8uKvujKLqG2cw3h3gLmmcU=KNfdmSwB5imfsH@mail.gmail.com>
	<1295436662.2540.14.camel@scimitar>
	<AANLkTik9-k_euvDGZd+CFfQ9LyxD_7mubpVxPqyEsEVU@mail.gmail.com>
	<4D36FE98.3070606@mwester.net>
	<AANLkTimMHd-eH9tEL1tUtoUKa+zwX4+9kUdT3k_NP9nG@mail.gmail.com>
	<AANLkTimyPb-4pLrbF4ZeFwnh+9WyZtcPY1uXeYBnwUqQ@mail.gmail.com>
	<AANLkTinRKmmzUT-6T6_cGR+HHrB6hYFYhdS4GuZHRS+Z@mail.gmail.com>
Date: Thu, 20 Jan 2011 11:20:56 +0100
Message-ID: <AANLkTin8mbWMymQyNeuf8dtEy6McUJQYTKfhuUgR3Mf8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Yocto Project and OE - Where now?
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
X-List-Received-Date: Thu, 20 Jan 2011 10:21:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Responding to both Khem's and Mike's replies.

2011/1/19 Khem Raj <raj.khem@gmail.com>:
> On Wed, Jan 19, 2011 at 1:55 PM, C Michael Sundius <msundius@sundius.com> wrote:
>> It seems to me that this is a bit of a battle between the package
>> maintainers and the distro maintainers.. Looking at this from my managements
>> side of things, we use OE as a tool and its really just a means to the end.
>> our customers demand that we do not change things (versions of software),
>> they demand stability and they view a change in busybox or anything else a
>> threat to stability. our management has also made an edict that we can not
>> use gplv3. For completely non technical reasons we simply cannot move to new
>> package versions without a substantial business justification. I suspect
>> that that there are many (more than you realize) folk out there who are
>> using OE for their own distro. If you simply whack package versions because
>> something newer came out you will have these people maintaining separate
>> recipes and we'll be swamped with the load and this tool will loose one of
>> its best attributes.

I understand your problem. Actually our situation is somewhat similar to yours.
However we've solved this in a much more rigid way.
Basically we pin a version of OE for a (range of) products.
We have an overlay that contains backports of newer recipes and
bugfixes that we need, but we will not upgrade automatically to a new
busybox release and not even take a new patch if it is not needed.
And if it is needed it will only be done after reviewing and testing
the changes.
The philosophy is "if it ain't broken, don't fix it", so if a patch
for busybox comes along that solves a problem we do not have (e.g.
because we do not use the applet) it will not get in.

As such some of our products still use busybox 1.13.2, and actually I
had to resolve a small isssue with it the other day.
upstream will probably laugh their pants off when I submit a bug
report for such an old version, and I do not expect OE to support this
version.
If we have a problem using this version we either find a patch that we
can backport, move to a new version or patch locally. What happens
depends on the issue at hand.
(and if we solve ourself and the problem is still in the latest
version we submit the patch upstream).

>>
>> The comment that disturbed me was that distros should just move ahead
>> "because its making things hard for the package maintainer". That doesn't
>> wash with me because if people are using your package then you should
>> support it or let someone else be the maintainer.

I only partially agree with that.
You cannot expect from a package maintainer to maintain a large number
of versions. There are definitely reasons to support more than one
version (especially for a lib)., but for me as a package maintainer it
more or less stops where upstream stops. E.g. if a package is upstream
at version X.5 and does not support X.3 any more and OE has both X.3
and X.5, then as a package maintainer I'm more than happy to peek into
issues with X.5 but I am not too interested to backport patches to
X.0, X.1, X.2, X.3 and X.4 or resolve problems in these releases.
Sorry to sound so rigid, but (generally speaking) if you have a
problem in a version that upstream does not support any more, and the
problem is solved in a version supported by upstream and this upstream
version is in OE, I am not too sure if you can expect from a package
maintainer to resolve it for you.
After all we're all just volunteers and for most of the people time is limited.

And if you feel you can do better wrt maintainership, feel free to let
me know which of the recipes I maintain, you want to take over.
Or alternately, pay me to support the version that you want to keep around.
>
> I think keeping packages forever is not going to work either. If your
> customer is someone with EOL of 20 years
> OE should not keep versions you need just for you unless you invest
> efforts in keeping that packages uptodate
> thats why releases are for.

releases and SCM.
fully agree.
>
> In essence the distro's
>> use of that package are your customers and the reason you have a job. OE

ROTFLOL. job. I think for most of the contributors (including me) no
one pays for the effort spent
Most of the work in OE is done by volunteers!
Basically most of the things I maintain is because I needed them for
some reason, wrote the recipe and submitted them (or updated and
submitted an orphaned recipe that I needed).
This is done as a service to the public and to give back to the
community, but I do not see it as a job, but more as a gift.

>> does not exist as a product, rather a tool that enables customers, you can't
>> create this in a vacuum without understanding who is using it.
>>
>
> yes and assuming a package is being used by someone is also not the
> right thing. IMO for products you should
> base off on a release and maintain that for however long you wish and
> give some space to OE to develop. Extreme on
> both ends are unwanted thats why we are discussing what versions to
> keep. Keeping every possible version around has
> a cost and I believe if the recipe is not actively being tested its a
> bit-rot. So we are trying to reduce that burden on OE devs
> at the same time increase the quality of recipes.

Agree.

And as said before, as a package maintainer I try to follow upstream
and support what upstream supports.
I do not want to take over the role of upstream wrt the package maintenance.
As a package maintainer I feel it as my task to make sure the version
from upstream builds in the OE environment, and ideally patches are
only there to deal with cross build issues, although every once in a
while a local bugfix is added.
That is how I see the role of a package maintainer, but others might
see things differently.
(btw for toolchain related things I can imagine we want to retain
older versions for a longer time, especially when there are functional
changes (I'm especially thinking about autohell))
And apologies if I sketch the things black and white, but at least
that makes things clear.
But also when it becomes to package maintainers tasks there is a gray area.
>
>> distro maintainers are not all dumb and if they are they'll be the last

This is not always in line with my experience. E.g. for mythtv one
distro maintainer for a while refused to go to a newer version because
the communication between client and backend changed and his mythbuntu
box or debian system or so was not yet using that new version.
Mythtv is not our most complicated recipe, but it is also not a
trivial one. The burden of maintaining one version takes more than
enough time, and I really didn't have the time, resources and
motivation to backport all metadata changes to the previous version.

>> single one using an outdated version of the software. When that happens a
>> smart package maintainer will call it out leave out the old package.
>> Further, it would be nice for a warning to take place so that it might have
>> a "depracated" tag associated with the recipe for one release cycle to see
>> if anyone cribs.
>
>
> recipes move into obsolete/ or nonworking/ dirs thats enough of a warning imo

If we want to fully support that then we should never use git mv to
create a new version, but (assuming the old version will be gone) move
the old version to obsolete or so and create a new recipe (of course
probably by starting with a copy of the old one). This is not the
current practice.
>
>>
>> So I'm standing with the guy w/ asbestos short on. I'd like to see that OE
>> err on the side of "do no harm" to existing users. Its hard enough to rally

I understand your problem, but that will eventually halt the system.
Sometimes disruptive changes are unavoidable (unless we want to keep
10 years of history or so).
The solution here is pinning on a release or a git rev. Then no one
will harm you.
You can't keep the cake and eat it too!

>> the troops to move to updated packages much less updated meta without you
>> leaving perfectly reasonable versions of software out of oe-core.

Best regards, Frans


