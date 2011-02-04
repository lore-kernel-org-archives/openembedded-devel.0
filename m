Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PlIR8-0003uU-Uo
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Feb 2011 10:58:43 +0100
Received: by iwn8 with SMTP id 8so2011529iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Feb 2011 01:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=1Y4OsJsAxJELn90NvNgwbF0QGRCuOpjYsTgaGShQI9A=;
	b=xgX9AI3ER/1+kybBlOb1bFdLxy/YkTKPskJW9axJWoHPCPJAwxjeuY14lEmjmZRHoX
	XrbTRYtefkgJhxvTswlv6miGTIZLbsgGkfK79pHfENVRNvHzmlzRAWzbWS9i+0CMG1il
	vfnUHL2dCUW2br2w1nBbmTXmOSYuqa/RVhbd4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=JIC/7toIMjkpVqcwy6VqlCxgA28sjiYHQ9o0RhIYYRZQJF3tj8m13kAcoPHrENq5A0
	gQUgLOHVEXrweGnvfPxBGyavhvxCHkD5GsMf3I6QxUtkDAjTfjAWslJ6XtWY/fxJ7wAf
	Sm23r5SMFD/FGXEq2uN+F5fEWZ3ncASB0uni4=
MIME-Version: 1.0
Received: by 10.42.222.138 with SMTP id ig10mr14137910icb.370.1296813464769;
	Fri, 04 Feb 2011 01:57:44 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 4 Feb 2011 01:57:44 -0800 (PST)
In-Reply-To: <20110204090348.GR4580@excalibur.local>
References: <201101271038.18945.ml@vdm-design.de>
	<AANLkTimy4Q0Y_3Y-=8=QCifqQUYwWmFx4T0DH+dNXPeZ@mail.gmail.com>
	<4D418914.2030703@mentor.com> <20110203070901.GA11867@denix.org>
	<4D4AE93E.2020509@mentor.com> <20110203222035.GA19477@denix.org>
	<4D4B35A7.4040000@mentor.com>
	<AANLkTinO257Uuh8bTQCb2LPXKFF1LtB+qN0KjM8aXZVN@mail.gmail.com>
	<20110204081659.GQ4580@excalibur.local>
	<AANLkTinrcXmdF=P8KUc8_cWfchPEM=q7UaDbCbQknteF@mail.gmail.com>
	<20110204090348.GR4580@excalibur.local>
Date: Fri, 4 Feb 2011 10:57:44 +0100
Message-ID: <AANLkTik5RVEsxh_jtXTjQRM3sKBrmwmOaWbqs2eKKop=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Fri, 04 Feb 2011 09:58:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/4 Stefan Schmidt <stefan@datenfreihafen.org>:
> Hello.
>
> On Fri, 2011-02-04 at 09:37, Frans Meulenbroeks wrote:
>> 2011/2/4 Stefan Schmidt <stefan@datenfreihafen.org>:
>> >
>> > On Fri, 2011-02-04 at 08:54, Frans Meulenbroeks wrote:
>> >> 2011/2/4 Tom Rini <tom_rini@mentor.com>:
>> >> > On 02/03/2011 03:20 PM, Denys Dmytriyenko wrote:
>> >> >>
>> >> >> So, do you ack the patch, should I push it in? It will break the build for
>> >> >> anyone still using libtool-2.2, specifically in gettext package...
>> >> >
>> >> > So, that would break angstrom-2008.1 so I don't think that's a great idea
>> >> > until we fix it..
>> >>
>> >> Then again, if we push it there will be some incentive to fix it.
>> >
>> > So you are going to care care about the not yet ready for libtool 2.4 fallout?
>> > Get warm with openjdk-6 then as it still needs libtool 2.2. :)
>> >
>> > More serious, I think this should at least wait until after the upcoming 2011-03
>> > release. We need to find a balance between waiting forever and not breaking
>> > existing stuff.
>> >
>> Ehm, so if there is an RPATH or GNU_HASH QA error the code is *not* broken?
>> In that case it should not be a QA error but a QA warning.
>> But if it is an error then the existing stuff is already broken.
>
> My comment did target the force of libtool 2.4 to everyone. Reading it again I
> think I made this clear. I don't think that RPATH or GNU_HASH errors are
> invaldid or should be ignored I'm just pointing out that foricing an update to
> libtool 2.4 will break other things. (Which should obviously get fixed as well).
>
> Taking my OE hat off and my BugLabs build guy hat on I can tell what I would do
> with such a change going in now. I would skip the next release I wanted to base
> a product on and just keep a private branch from a known good rev and release
> from there maybe pulling in fixes over time. This is the exact opposite we
> should aim for when doing releases. Instead we should get the metadata in good
> shape for as much customer as possible, release, allow pooling of resources on
> such a release for potential maintenance and get problematic stuff in _early
> after the release_. Call it merge window or whatever.
>
> I'm happy to work on getting openjdk work together with libtool 2.4, but not
> before a upcoming release. Thats more like throwing stave in between peoples
> legs. (Not sure if such a german saying makes much sense translated. :))
>
>> Ignoring the error then is more like ostrich behaviour.
>
> And waht is ignoring my statement about balace such things and wait until after
> the release? :)
>
Hi Stefan,

Actually I did not react on the libtool forcing upon everyone, but on
the QA errors (where this thread was about).
That was also the cause of the ostrich remark (which was definitely
not aimed at you in person, but more a general comment, triggered by
the fact that I have some experience with projects being outsourced to
an unnamed country where a bug report also could be "repaired" by
removing the message or the the symptom instead of tackling the root
cause).

What I see is a lack of interest in fixing the existing QA errors.
I've sent out a few error reports to the list a while ago, (on recipes
that I feel not comfortable with), but unfortunately that did not
result in any action :-(

Best regards, Frans.


