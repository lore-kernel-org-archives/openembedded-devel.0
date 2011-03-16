Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PzkM4-0005WQ-OP
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 07:37:12 +0100
Received: by iwn10 with SMTP id 10so1387882iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 23:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=1Aha+aHkGj5eofxdqz76oIZmOxBYtKieZjYwBC9Gw2g=;
	b=tsnFcqwiv1yePp2ybI39eQr+gP38SwOlALAY7hlhpv3IQyjL7qchHJ7OVL+h886+ar
	Tfi7UkhxJaXZHntrmMDu/XwH8Q3HQqbVgK0QRvUnpjn5PqhQnQWH44XJH+CkMwaw2GHd
	3T4ldyJt10/x5Gc3xY1k7CGsGNoIFHel4kMvA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=leY2sl9/HgrtPtSqVaHODWOARAjYOeASLfZO/Hvnipx9IzN61VJ1aqhR9In2BRiHOk
	xR6sYJ4VU0rgK4ZjL9bos6sSriRxH1Xae4N61fpcsm1covALgvgB8xWlHZv9xEB6S0iK
	VN4PCX1wMTMj3Enqe6pM9z0rOFbYVxKJOsBO0=
MIME-Version: 1.0
Received: by 10.231.61.65 with SMTP id s1mr347263ibh.120.1300257328008; Tue,
	15 Mar 2011 23:35:28 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Tue, 15 Mar 2011 23:35:27 -0700 (PDT)
In-Reply-To: <1300254477.2818.5.camel@eha>
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha> <20110315220301.GC3042@denix.org>
	<1300254477.2818.5.camel@eha>
Date: Wed, 16 Mar 2011 07:35:27 +0100
Message-ID: <AANLkTinaWtnMFNLRUqC3CLJxoPmVeWw1KtW5qmDKbE+7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Eliminating dependency race-conditions
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
X-List-Received-Date: Wed, 16 Mar 2011 06:37:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/3/16 Esben Haabendal <eha@doredevelopment.dk>:
> On Tue, 2011-03-15 at 18:03 -0400, Denys Dmytriyenko wrote:
>> On Tue, Mar 15, 2011 at 10:08:37AM +0100, Esben Haabendal wrote:
>> > On Fri, 2011-03-11 at 12:04 +0100, Steffen Sledz wrote:
>> > > which occurred sometimes depending on build order (not in clean
>> > > package only builds).
>> >
>> > I would like to raise awareness of the underlying problem here.
>> >
>> > The current dependency/staging model of OE basically has this feature
>> > that a build can be influenced not only by it's own dependencies, but
>> > also what has been build before it (or not).
>> >
>> > I strongly believe that this has to be fixed on the architectural leve=
l,
>> > and not just on a case-by-case level as is currently needed.
>> >
>> > I haven't received much feedback on the preivous posting about the
>> > per-recipe staging principle implemented in OE-lite, but I decided to
>> > take this opportunity to re-iterate the fact that the OE-lite
>> > implementation of staging and build dependencies eliminates this
>> > problem.
>> >
>> > I am still very much interested in discussing how to move this
>> > technology from OE-lite to OE, but as it impacts all recipe metadata
>> > (build dependencies has to be redefined), OE community at a large real=
ly
>> > needs to value the benefits of solving this problem.
>>
>> Esben,
>>
>> Thanks for raising this issue and making people aware of it!
>>
>> This has previously been discussed several times, including last time du=
ring
>> the Yocto Summit in December, where I brought up the question of per-pac=
kage
>> staging/dependency to Richard's attention, when he introduced the new Sh=
ared
>> State (sstate). While per-package dependency wasn't considered a critica=
l
>> must-have feature right away, it was acknowledged as something worthwhil=
e
>> looking at and, according to Richard, should be easy to accomplish with =
the
>> new sstate functionality...
>
> There is two different objectives in this.
>
> Per-recipe staging and per-package build-time dependencies. =A0While I
> assume per-recipe staging will be doable to build on top of sstate,
> per-package build-time dependencies is not really related to sstate, but
> is mostly a meta-data issue (man-hours wise), while also requiring
> changes to tbe BitBake cooker.
>
> The final thing that I have found while solving the above issues, is how
> simple (KISS!) all this can be addressed when going from per-recipe
> build-time dependencies to per-package. =A0And I really think that we nee=
d
> more KISS in OE ;-)
>
> /Esben

From a consistency point of view per package build-time dependencies
are highly desirable to get a consistent and reproducible system as
you are always getting the same output irrespective of build order.
Currently this is not the case because configure might pick up
whatever package is build first.
So for (deeply) embedded product development this is a very desirable
feature, QA wise, if not a must have.

Frans


