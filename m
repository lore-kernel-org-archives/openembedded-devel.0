Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1PLGDT-0006vI-7o
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 15:21:00 +0100
Received: by pwi8 with SMTP id 8so2477028pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 06:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type:content-transfer-encoding;
	bh=7ZwxaIWPEEfzF1wcfavyIqu9QY5eKduUEly5p3gyZ+Q=;
	b=eCH6o1hKDugpkWu0vQ4ZWTaz3FSnvH1r3ONc1Mppje7XLJVBXCRAVAUVBnfGgQWp9q
	Doy3kwtXSZJ3OCRMTejVcnbKx6KL2rXz6TrbkHmxzNbDeFZP3z3IS6EQM5kayr3ReSCV
	0eAUULN3yxPfs1Wm6k0guiiXG1djI5IMCJJmM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=aNNhAo94Y0YTqqfeyQL5+Cg1AxD9GieH+5vUK2ueAqwTX+NBsCtvDbAJI2yAc68U/F
	IOTj8CfRFbCv9e+yo/7ILWFYV/g28xI3TAUXSNpr8tlaTk61feZugYvMRDAAyr+aQTTs
	ve4nklZMPbb0FeFt6wZovGcvsRGL1+jg6hWOE=
Received: by 10.216.154.8 with SMTP id g8mr2613158wek.12.1290608382535; Wed,
	24 Nov 2010 06:19:42 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Wed, 24 Nov 2010 06:19:22 -0800 (PST)
In-Reply-To: <AANLkTi=c5NjS+TYVYyzJtdPsnmL34hBTYeN-MgHtvYJx@mail.gmail.com>
References: <AANLkTimVOOQ28E1NfJm5Rim4X+WmvXAtOSJ9W34KH7X-@mail.gmail.com>
	<AANLkTik022J6+49_rQZ5mk2o3x79t6vc5Z6yEiRY8izM@mail.gmail.com>
	<AANLkTineOx1jewpHS_tC=5tBxgqt+z2Mq8EfceZ0zUuD@mail.gmail.com>
	<AANLkTi=c5NjS+TYVYyzJtdPsnmL34hBTYeN-MgHtvYJx@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Nov 2010 07:19:22 -0700
X-Google-Sender-Auth: sTl1OSmUVktmI5zE3g8kwFn82-g
Message-ID: <AANLkTikq8DZGrfXMY8Fr7GNrMe8-oe05JNh_CfEEPzfH@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: openembedded / dpkg-buildpackage hybrid
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
X-List-Received-Date: Wed, 24 Nov 2010 14:21:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2010 at 7:05 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Wed, Nov 24, 2010 at 2:52 AM, Esben Haabendal
> <esbenhaabendal@gmail.com> wrote:
>> Chris Larson <clarson@kergoth.com> writes:
>>
>>> ... =C2=A0Right now the OE sysroot (where files are shared
>>> between dependencies) is global, rather than per-recipe, and if
>>> multiple versions of something get yanked into a build, they'll step
>>> all over one another in that sysroot. =C2=A0We've discussed possibly mo=
ving
>>> to per-recipe sysroots in the past, constructing them on demand based
>>> upon what that recipe requires, but we're not there yet, ...
>>
>> If I may be so bold, why is OE not going in that direction full speed?
>> We seem to (at best) to be on a very long detour...
>
> There are many people using OE, with widely varying priorities, and
> there are *many* things that need to be fixed / improved in both
> bitbake and OE.
>
>> It "just" requires rethinking that way DEPENDS is handled, which will
>> end up being much more like RDEPENDS is done now. =C2=A0A recipe depends=
 on a
>> number of "items". =C2=A0Items are provided by packages, and packages ca=
n
>> (recursively) depend on other items. =C2=A0When constructing the runqueu=
e,
>> the task that sets the stage depends on the task that packages stage
>> packages on all recipes that provides any of the (recursively) needed
>> packages.
>
> I threw together a prototype of per recipe staging areas, with caching
> of the areas for recipes with equivalent dependency trees at one time,
> but it was suboptimal, depended on other branches that no longer
> exist, and it just hasn't been a top priority for anyone to get this
> to happen. =C2=A0It may help if you consider that most people working on =
OE
> just want to *use* it to get their work done. =C2=A0There are very few wh=
o
> delve into the core of OE, much less bitbake.
>
>> Looking at build dependencies just makes so much more sense IMHO, and a
>> lot of issues that OE has/is fighting goes away. =C2=A0No more race
>> situations with a common stage dir, and no more problems with -initial,
>> -intermediate recipes. =C2=A0It even opens up for more flexible build
>> dependency handling, but that is another side of it.
>>
>> For anyone interested, I have something like the above (based on OE) at
>> http://www.gitorious.org/~esben/oe-lite/esbens-core
>>
>> The entire runqueue code is rewritten from scratch, using an in-memory
>> sqlite database, but the concept could just as well be done based on a
>> truckload of Python dicts and lists, if this is more to ones liking ;-)
>> The interesting code with regards to this subject is in lib/oelite
>
> This sounds very interesting to me. =C2=A0Personally, I think our overuse
> of lists/dicts/etc is just one big code smell -- Primitive Obsession
> -- but then, I'm no expert on object oriented design, or design in
> general. =C2=A0My python is improving, but there's still plenty of room t=
o
> go. =C2=A0I'll take a look at your code. =C2=A0I'm always open to seeing =
bitbake
> improvements. =C2=A0As I said above, there's a serious shortage of people
> willing to improve it at this time.
>
>> It uses standard bitbake, but OE classes are heavily modified, and a
>> number of basic OE features are completely missing (but this is not
>> related to the per-receipe style staging).
>>
>> So have a look if you like, or just skip it as it cannot easily be merge=
d into
>> OpenEmbedded as it is now.

Have you taken a look at the work Richard Purdie has done on bitbake
for Poky/Yocto?  It isn't refactoring the way you've done, but it does
rework how packaged staging is used.  It implements per-task metadata
checksumming (based upon my oe signatures code) and task level output
archiving for populate_sysroot, to be used to short-circuit its build
in subsequent runs.  Conceptually its an interesting tactic, and I
think metadata checksumming is going to be critical going forward, to
improving our build reproducibility.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


