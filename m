Received: from [209.85.221.191] (helo=mail-qy0-f191.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjazX-000276-RY
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Sep 2009 17:46:23 +0200
Received: by qyk29 with SMTP id 29so763988qyk.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Sep 2009 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=w4A8q6Pn5ZzeggEvbFe1AJcoMmkQgO8LxBcPGeUEZ+8=;
	b=F9BhF5J0/UZ3lBD7fAN38NI2ilmu+kpQPZXVcA80gq6jEz4jlDjwBOrSn3tktLnNEG
	z8OKx/9yOKvYNy4Lm97BsQdfkW85NwjxefEk+qKPjXsxgLNOgSyP97aXrM/Jrj3JJfNt
	81rzBvH84zqz6+y3UCF1U1NmIRSduQD7vL2p0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HGp7AE0j6hn0r6Bz9teFntJCZzT3A5LXButRFnakICkE14jfwZgUAlhHx0XdSbJOCX
	l4JFJ0p9YHZ1h1CQL3CW5Me6SwMbeUholKNoegtJ/ha+K/NWowXQPtEGSdy0lSDU7MGn
	9p+Z6EmQyCsrxv0AXqG30UQRZ5UilB/dX0VAI=
MIME-Version: 1.0
Received: by 10.229.19.149 with SMTP id a21mr3467783qcb.29.1252078044109; Fri, 
	04 Sep 2009 08:27:24 -0700 (PDT)
In-Reply-To: <1252061507.27780.507.camel@mill.internal.reciva.com>
References: <1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
	<19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
	<20090903043630.GQ23034@smtp.west.cox.net>
	<1251970342.27780.192.camel@mill.internal.reciva.com>
	<19c1b8a90909030811k7f6932e0r93c94fccc43e9b1c@mail.gmail.com>
	<1252061507.27780.507.camel@mill.internal.reciva.com>
Date: Fri, 4 Sep 2009 08:27:24 -0700
Message-ID: <19c1b8a90909040827w70b4dd95mc700ca1ebb01b0f4@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Fri, 04 Sep 2009 15:46:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2009 at 3:51 AM, Phil Blundell<philb@gnu.org> wrote:
> On Thu, 2009-09-03 at 08:11 -0700, Khem Raj wrote:
>> On Thu, Sep 3, 2009 at 2:32 AM, Phil Blundell<philb@gnu.org> wrote:
>> > On Wed, 2009-09-02 at 21:36 -0700, Tom Rini wrote:
>> >> Can we get away with that? =C2=A0'linux-gnu' over 'linux' should be f=
ine I
>> >> think but I'm worried about 'linux-uclibceabi', is that really a norm=
al
>> >> standard and known host? =C2=A0Also, there's some overrides that depe=
nd on
>> >> 'uclibcgnueabi' iirc, which need to be updated for libc-uclibc overri=
de
>> >> instead.
>> >
>> > I think Khem's patch does update most/all of the overrides in question=
,
>> > but if this requires an OELAYOUT_ABI change then it seems like a lot o=
f
>> > disruption to fix what is (if I understand correctly) only a cosmetic
>> > problem in the first place.
>>
>> The documentation around OELAYOUT_ABI says that it should be bumped
>> whenever there is a change in tmp layout structure and this change will =
do
>> rename few directories and binaries in the tmp folder thats why the
>> bump
>>
>> and incremental builds wont work anyway because cross compiler names
>> will be different.
>> thats why I was bumping it up.
>
> Yes, I know what OELAYOUT_ABI is for. =C2=A0The point I was making is tha=
t,
> if changing the TARGET_OS strings is disruptive enough to require an
> OELAYOUT_ABI bump (and hence, effectively, force everybody to delete
> their working trees and rebuild from scratch), that seems like a lot of
> hassle for very little actual gain.
>
> As I understand it, there is no compelling reason why the TARGET_OS
> strings need to be changed: the difference between linux and linux-gnu
> (and between linux-uclibcgnueabi and linux-uclibceabi) is more of a
> cosmetic one than a functional advantage. =C2=A0If that's the case then t=
he
> change doesn't really seem to be important enough to justify the
> upheaval; I would suggest leaving those strings alone for now.
>
> If and when we are obliged to bump OELAYOUT_ABI for some other (more
> important) reason, that would be a good time to fold in this sort of
> thing.
>
> Alternatively, a reasonable compromise might be to arrange for
> OELAYOUT_ABI to be bumped only for folks who are using an affected
> DISTRO (which I guess means micro and minimal in this situation).
>

Other distros also need this change. IMO it will be better
that we enforce a rebuild otherwise users might have issues that
are hard to debug.

> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


