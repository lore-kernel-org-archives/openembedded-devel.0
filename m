Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pgwvl-0004H3-Ol
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 11:12:23 +0100
Received: by iwn8 with SMTP id 8so3463085iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 02:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=yFKQEF8eGLjBgc3Dc27084oK0Sb+4eImh36+VlqTv9Y=;
	b=UL+G/Ypdy+nNj+RZrwdiOOzW70RxFvBBGNcH5n/sjY7UvRm2LAuRohVKjvg4aXMp5a
	fVjCdLapMfEG+hvXnDUlgbhS33x3H39ZUW9WW+oxOCHm+pEyPZ3xp6g9+A4B87V5kWCS
	PVjCu283Z1qxbN9eqR+2Ikz2qtMrocbLoEoCc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZQAjG5cOsNLHTaB5N+qIg4ckZRsRhTfXQ3oLs12qpdSXGbK12ZlOw+vBIty4f8rqbO
	gVdb96aUSbCi5fkNjuwBA/kPWML47YzEYVHSVI8SIvX1oXv7LtG5hsi/De57tykbz0mJ
	s3JUzAcRm2YuQ0H4Sk0pq2eg6Q3JnjXj5Ykag=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr3215750iba.33.1295777498876; Sun,
	23 Jan 2011 02:11:38 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Sun, 23 Jan 2011 02:11:38 -0800 (PST)
In-Reply-To: <4D3B1F00.4040109@mentor.com>
References: <1295027350.14388.6527.camel@rex>
	<AANLkTi=QXykmerKTJJgCNDbqSE18_3Jhqj1utKmf1Ynw@mail.gmail.com>
	<4D353F81.50301@xora.org.uk>
	<AANLkTi=WOr_395Tya3GOhyLpg1oj9stLxSWdgo--uAhz@mail.gmail.com>
	<4D35C5C3.60205@mentor.com> <ih4s84$gbj$1@dough.gmane.org>
	<4D35FC8B.1090404@mentor.com> <ih52qr$l1v$1@dough.gmane.org>
	<AANLkTi=A2kgqgkhfw4p_Og8k9y1MBMrZLDvgwuq5Mxfj@mail.gmail.com>
	<AANLkTimHg3tkDnm93ycBGokAOsWomT6n+bfTduYPA=G+@mail.gmail.com>
	<4D3B1F00.4040109@mentor.com>
Date: Sun, 23 Jan 2011 11:11:38 +0100
Message-ID: <AANLkTik7Ce9P79RB8d8Rh7uo4WZTYQmFAjbtbOVucuDg@mail.gmail.com>
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
X-List-Received-Date: Sun, 23 Jan 2011 10:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/22 Tom Rini <tom_rini@mentor.com>:
> On 01/19/2011 02:25 AM, Frans Meulenbroeks wrote:
>>
>> 2011/1/19 Frans Meulenbroeks<fransmeulenbroeks@gmail.com>:
>>>
>>> 2011/1/18 Koen Kooi<k.kooi@student.utwente.nl>:
>>> =A0if we make the delta between the 3 be just
>>>>>
>>>>> the SRC_URI + checksums?
>>>>
>>>> Something like:
>>>>
>>>> * keep gplv2 around if upstream switched to gplv3 at some point
>>>
>>> agree; as said before suggest to reflect the switch in the name of the
>>> recipe.
>>>
>>>> * allow old stable, stable and dev (e.g. glib 2.24, 2.26 and 2.27+git)
>>>
>>> I'd say retire old stable after a while (e.g. after stable is there
>>> for half a year, unless of course there are compelling reasons to keep
>>> it).
>>> Wrt dev: if we want to go to a maintainers model similar to u-boot and
>>> linux, I would expect this to live in a separate branch or layer.
>>> Once proven stable the maintainers pulls it into the core archive.
>>>
>>>> * allow active contributers some leeway to test multiple subreleases
>>>> (e.g. busybox 1.18.[0-99]
>>>
>>> Again here, I feel it is much better to put it into a different branch
>>> or layer, and once stable it is pulled into the mainline.
>>> Again similar to what Linus and Wolfgang do.
>>>
>>>> * The maintainer can have as many versions as he wants to.
>>>
>>> my preference: not in the main layer.
>>>
>>>> * toolchain is exempt from all that since having 20 binutils versions =
is
>>>> sometimes needed when building for 20 different archs[1].
>>>
>>> Fully agree.
>>>>
>>>> But I seriously think we are overengineering this. We should have peop=
le
>>>> actually working on oe-core and meta-oe reach a consensus when
>>>> encountering problems.
>>>
>>> I beg to disagree on this.
>>> We have a unique opportunity at hand to improve, so it seems wise to
>>> raise the bar quality wise.
>>>
>>> E.g. wrt what Richard wrote in the start post
>>>
>>> [quote]
>>> * Creation of a subset of metadata that has a consistent high quality
>>> =A0standard:
>>> =A0 - removal of legacy components (pkgconfig hacks, libtool hacks,
>>> =A0 =A0 legacy staging, unneeded compiler arguments)
>>> =A0 - consistent metadata layout, spacing, use of variables
>>> =A0 - migration away from outdated practises (e.g. use BBCLASSEXTEND)
>>> [/quote]
>>>
>>> I feel when migrating recipes we should also assure that they adhere
>>> to a certain quality standard. That would need us to define a minimal
>>> standard though.
>>> Currently I feel we are just moving recipes, only fixing what is
>>> really needed to get things running (like removing legacy staging)
>>> whereas we could do much better.
>>> There are currently some things in OE that could use some improvement
>>> and we should take the opportunity to improve.l
>
> Here's what I worry about. =A0It shouldn't take an overly active maintain=
er
> for most recipes. =A0Sure, some programs (and of course the toolchain) re=
quire
> some care and knowledge. =A0But lots of things don't. I fear we're trying=
 to
> get to the point where if someone is going to submit a recipe for some
> program they need to sign up to make sure it's always pointing to the mos=
t
> up to date upstream and other mandates. =A0One of the strengths of OE tod=
ay is
> that it's not overly burdensome to submit changes back and have them
> accepted.

Tom, good points.

We should not make it too difficult to submit recipes (but I would
appreciate if submitted recipes adhere to some to-be-defined minimal
set of QA rules).
But it would help to know if a recipe has an active maintainer or not.
I think I would be more inclined to fix issues or update the recipe in
case it is unmaintained.
If a recipe is maintained, I would probably first see if the
maintainer takes action (and trigger him/her). It also makes clear who
to contact  if there is an issue. Now it is not always too clear who
is working on what).

The issue is also that if you pick up a recipe that is (or seems)
unmaintained and update it, and make a mistake there is always someone
around the corner with some nasty remarks, making it not too
interesting to work on these recipes.

Wrt your coment on "submit changes back and have them accepted". I
fear I see this not as a strength. The process is ok, but it does not
work too well for those unmaintained recipes.
Typically the unmaintained recipes are in some corner of OE and not
many people care about those. So if you submit a patch to these, it is
quite common to get no feedback at all.
A policy saying: submit patch, wait two weeks for feedback, if none
given, send a ping, wait another two weeks still no feedback, does not
work too well (but the scenario I sketchted happens too often.
Now after this process I feel I can apply the patch (with 4 weeks
delay, which seems quite a lot if the patch is small), but if the
submitter has no commit rights it'll just land in patchwork waiting
for someone to pick things up.
Especially the latter scenario will cause that that person submitting
the patch will give up after submitting one or two patches.
Maybe I'm drawing a black scenario, but this is what I see happen.
>
>>>
>>> And yes, I have no problem in spending time to improve things, but if
>>> there is no consensus on where we should go this is not going to be
>>> effective (and actually makes it harder to improve quality wise).
>>> To take the bikeshed analogy up again. It does not really help if
>>> everyone start to paint in his own favourite color (unless maybe if
>>> you are still stuck in the flower power era).
>>>
>>> Frans
>>>
>> I know it is fairly schizofrenic to reply on ones own post, but I just
>> peeked into the meta-oe layer and found an excellent case on what we
>> should try to avoid when bringing over recipes from oe to meta-oe.
>> path: root/recipes-graphics/directfb
>> Mode =A0 =A0Name =A0 =A0Size
>> d--------- =A0 =A0 =A0++dfb =A0 48 =A0 =A0 =A0logplain
>> -rw-r--r-- =A0 =A0 =A0++dfb_1.0.0.bb =A0588 =A0 =A0 logplain
>> d--------- =A0 =A0 =A0directfb-1.2.8 =A050 =A0 =A0 =A0logplain
>> d--------- =A0 =A0 =A0directfb-1.4.6 =A041 =A0 =A0 =A0logplain
>> -rw-r--r-- =A0 =A0 =A0directfb-examples_1.0.0.bb =A0 =A0 =A0406 =A0 =A0 =
logplain
>> -rw-r--r-- =A0 =A0 =A0directfb-examples_1.2.0.bb =A0 =A0 =A0409 =A0 =A0 =
logplain
>> -rw-r--r-- =A0 =A0 =A0directfb.inc =A0 =A02038 =A0 =A0logplain
>> -rw-r--r-- =A0 =A0 =A0directfb_1.4.6.bb =A0 =A0 =A0 615 =A0 =A0 logplain
>> d--------- =A0 =A0 =A0files =A0 415 =A0 =A0 logplain
>> d--------- =A0 =A0 =A0fusionsound-1.1.0+git20070709 =A0 54 =A0 =A0 =A0lo=
gplain
>> -rw-r--r-- =A0 =A0 =A0fusionsound_1.1.0+git20070709.bb =A0 =A0 =A0 =A014=
79 =A0 =A0logplain
>> -rw-r--r-- =A0 =A0 =A0lite_0.9.26+cvs20070207.bb =A0 =A0 =A01140 =A0 =A0=
logplain
>>
>> Why is there a directfb-examples_1.0.0.bb? In OE no-one is pinning
>> this version, and given the fact that these are examples there is
>> probably little reason to keep it.
>
> They are example programs for directfb which also means they are handy de=
mo
> programs for "hey, is directfb working on my platform and looking right".

I understand that. and I am not saying that the recipe should go. What
I wanted to say is that if we have a 1.2.0 version (of a recipe for
example progs) what is the point to keep also version1.0.0 around.
It is unpinned so I see little reason to keep 1.0.0. Of course 1.2.0
should be kept.
>
>> Something similar for directfb-1.2.8. Maybe I overlooked things but I
>> could not find a the user of this dir. I guess it could be gone.
>
> I suppose it could be updated to 1.2.10, yes. =A0And directfb is enough b=
y
> itself, although it would be nice if we went and took a stab at making it=
 an
> option to use rather than X, when possible again.

The issue at hand is that there is no recipe directfb 1.2.8 any more.
We only have 1.4.6. However the patch files for 1.2.8 are still left,
but there seem no users left of this dir.
So basically unused files have been moved to meta-oe. I doubt that
that is desirable.
>
>> If we want to improve on quality it is probably not a bad idea to at
>> least have a checklist with improvement actions that should be done
>> when migrating recipes (e.g. remove stale patches, unused& =A0unpinned
>> older versions etc etc). I know it takes time, but it can also
>> increase the overall quality. Let's take that opportunity.
>
> OK, but what's wrong in this directory? =A0It's on known to work for some=
one
> versions, I don't see legacy staging and iirc the pkg-config changes aren=
't
> hacks but fixing upstream.

As mentioned above there are files in it that are not used by any
recipe, it contains a recipe that is probably better removed (the
1.0.0 version of the examples, keeping the 1.2.0 version as the sole
version).
I can also imagine the files dir could be renamed or split (I haven't
really checked if the patches are for one recipe or shared, but I
suspect the former).
I did not peek into the recipes itself but I can imagine they could
also be given a more standard layout (oe-stylize).

Nothing dramatically, just some small changes that gives things a more
constent look (both at the directory level and at the content level).
I fee the move to meta-oe could be used to raise the bar a little bit.

Wrt the LICENSE field and the recipe names (and your next post)..
I was just coining an idea. I feel it is useful to have an indication
why there are multiple versions of a recipe instead of one.
Especially in the case of recipes that have no maintainer this seems
useful information, as in that case someone who wants to change the
recipe gets an idea why it is useful to fix the old recipe too.
(the options for such a person are: fix old recipe too, if no one uses
it, it is a waste of time, do not fix the recipe and leave a possibly
broken recipe, or remove the old recipe and risk that there is a
whiner who apparently does not care to fix the recipe, but does
complain if someone does a best effort attempt to fix things.

Encoding this in the name makes it very explicit what the reason is to
have two versions and reduces the chance of errors.

For gplv2/v3 LICENSE can be used, but that does not help if e.g. we
want to keep an old version of foo because the footprint is much
smaller.
So either we need a different name, a comment in the recipe or a
README like file describing the differences).

With LICENSE the chance is a little bit higher that someone accidently
overlooks that that is the reason for having two versions. Name
encoding makes it more visible.
But if people feels relying only on LICENSE because otherwise the
namespace becomes too cluttered, that is also fine with me.

Best regards, Frans


