Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RUQ8J-0004Ml-JM
	for openembedded-devel@lists.openembedded.org;
	Sat, 26 Nov 2011 22:50:03 +0100
Received: by qadc10 with SMTP id c10so3409336qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2011 13:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=jXUstCg70W3FjwbzJcPSXeBGHhiajZ4JYYq77k8Rikg=;
	b=h3mWpuHsUWIfR15cao1gYNKEUwVlP86f8MqpRFCflPi92KZIx+IgzXSNbF7fGxTY0c
	6+fO3EtD44XDZLrR5b4/O58r3ErliQZ6OcEyRVnmxFn+/krIzkarngAccFuHZcEsPYWV
	bUGndHTCDHJXD1sI0I25U9bNZ1FPn4gOcr/Q8=
MIME-Version: 1.0
Received: by 10.224.189.129 with SMTP id de1mr17309325qab.18.1322343807386;
	Sat, 26 Nov 2011 13:43:27 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Sat, 26 Nov 2011 13:43:27 -0800 (PST)
In-Reply-To: <CACW_hTbH8Mvh5+mE0kViaXe8Rh9D_La87nZj0pH4RuWxKWM75g@mail.gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org> <jal1pc$2u7$1@dough.gmane.org>
	<CACW_hTZpUU0Zyjv4d+ut1n+Rte55TTh5GT_k1W98KzMY9sjL1w@mail.gmail.com>
	<20111124170654.GA28572@sakrah.homelinux.org>
	<1322166832.13272.2.camel@mattotaupa>
	<CA+M6bXkQUtRu5+JgufshDHnb8suc1sRFiR4ViJ+GoisbYx1JOQ@mail.gmail.com>
	<CACW_hTbH8Mvh5+mE0kViaXe8Rh9D_La87nZj0pH4RuWxKWM75g@mail.gmail.com>
Date: Sat, 26 Nov 2011 14:43:27 -0700
Message-ID: <CA+M6bX=w=LsvOQcd6M7PXFCppS7cLgdtkhWTh2HWfQ2Z1akczw@mail.gmail.com>
From: Tom Rini <tom.rini@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Plans for OE classic future
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
X-List-Received-Date: Sat, 26 Nov 2011 21:50:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 26, 2011 at 9:11 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> 2011/11/25 Tom Rini <tom.rini@gmail.com>
>
>> On Thu, Nov 24, 2011 at 1:33 PM, Paul Menzel
>> <paulepanter@users.sourceforge.net> wrote:
>> > Am Donnerstag, den 24.11.2011, 09:06 -0800 schrieb Khem Raj:
>> >> On (24/11/11 10:31), Frans Meulenbroeks wrote:
>> >> > 2011/11/24 Koen Kooi <koen@dominion.thruhere.net>
>> >> >
>> >> > > OE .dev will go read-only soon, If you need an OE-classic setup,
>> >> > > 2011.03-maintenance is there for you.
>> >> >
>> >> > As stated before there are still people using .dev and committing t=
o
>> it
>> >> > [1], and there are people interested in keeping it that way for a
>> while.
>> >> > So as it stands I suggest to keep it open for a while for those tha=
t
>> still
>> >> > are interested to use it.
>> >>
>> >> I would suggest that people interested in oe classic should use 2011.=
03
>> >> branch since its maintained and tested regularly. Its in their best
>> >> interest too since there are people behind the branch and it gets
>> >> regular bug fixes thats not true for master.
>> >
>> > That statement is not true as far as I can see from the commit log.
>> > Almost all patches to 2011.03-maintenance went through master.
>>
>> Yes, but that's also due, in general to the nature of the branch.
>> Angstrom/TI related stuff was going master->2011.03-maintenance before
>> I clarified that coming from oe-core is also fine. =A0As of yet, no one
>> else has stepped up and said "I need DISTRO=3Dfoo MACHINE=3Dbar working
>> here, and I intend to keep an eye on things". =A0Having angstrom-2008.1
>> in there seems to be good enough for most cases.
>>
>
> Forgot to mention this in my previous email, but I do have an interest in
> minimal and minimal-uclibc for mpc8313. Then again virtually all of my wo=
rk
> is console only, so I'm not really into a position to test lots of things=
.
> I'm keeping an eye on things though and have one or two patches pending
> (e.g. our current netsnmp version and uclibc do not seem to be friends).
> Personally I prefer to commit these patches to master and issue a pull
> request for them and I prefer it if others do the same, so we have a
> centralized location, instead of a gazillion git trees at several places.

Well, today oe.master isn't read-only.  But tomorrow do you want to go
and fix these problems again in oe-core?  Most of us do not and have
already gone through the pain of "oh, I need to bring this change, and
this change, and ...." into oe-core+meta-oe.

But, perhaps we're running into a naming problem.  What I see as the
direction the TSC wants things to go is that development is done
against oe-core+meta-oe+etc, people that need classic OE, for
historical interests (history, reproducing old builds) have somewhere
to pull from.  And that legacy projects have somewhere to work against
until they can migrate to oe-core.  We want to discourage development
in the OE classic tree.  A 'git cherry' showed 250-odd changes in
oe.dev master not in the maintenance branch, which is pretty good.
The issue right now is we have two choices for the legacy projects use
case, master and 2011.03-maintenance.  Some places have chosen the
maintenance branch and some have chosen master, and we'd like to unify
that.

--=20
Tom


