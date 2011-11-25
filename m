Received: from mail-qw0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RU3ny-0000sD-R6
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 22:59:35 +0100
Received: by qadc10 with SMTP id c10so3148502qad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 13:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=eK7ca3anJbpVNgdU2n5eF31ql19HeIIpq54LEI5HMxo=;
	b=kAbrUDU7cZ5jfmgLXwjmhmbn9cnSWt4NBveel8DHsq8RKb4WkaqYP7pP1FiH73qAb1
	e++mDIWP6Gv6KxNk+ic9sajKnvCmykj7lJQo2vzrevXJiNN1He+0exA6t+8KJpyG27Zn
	3XfaPzLZ4+wYgfZxvHLXWom6NO3aO+J6tXgoM=
MIME-Version: 1.0
Received: by 10.224.189.129 with SMTP id de1mr15973945qab.18.1322257979776;
	Fri, 25 Nov 2011 13:52:59 -0800 (PST)
Received: by 10.229.94.72 with HTTP; Fri, 25 Nov 2011 13:52:59 -0800 (PST)
In-Reply-To: <4ECD76E2.3040001@opendreambox.org>
References: <ED3E0BCACD909541BA94A34C4A164D4C4013DD0E@post.tritech.se>
	<CAMKF1sr6mM0_iYu_1vfEGbUYNqaj2hK2vpdsHqCTkoSdrHyJOA@mail.gmail.com>
	<CACW_hTYcHF6RXuW3prEO2cR+UYCFFvdtoH1d6DetY-6pCmT6qA@mail.gmail.com>
	<CAMKF1srRnHd4C7XsEdZ80HcKuc7ioLC_+2J4NO3=bChoCw2k-Q@mail.gmail.com>
	<4ECD76E2.3040001@opendreambox.org>
Date: Fri, 25 Nov 2011 14:52:59 -0700
Message-ID: <CA+M6bX=Xs+ACNOXYfFafb__vGNVYX3y8g7zvLQvDiHyg=5yjRw@mail.gmail.com>
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
X-List-Received-Date: Fri, 25 Nov 2011 21:59:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2011 at 3:42 PM, Andreas Oberritter
<obi@opendreambox.org> wrote:
> On 23.11.2011 23:25, Khem Raj wrote:
>> On Wed, Nov 23, 2011 at 1:18 PM, Frans Meulenbroeks
>> <fransmeulenbroeks@gmail.com> wrote:
>>> 2011/11/23 Khem Raj <raj.khem@gmail.com>
>>>
>>>> On Thu, Oct 27, 2011 at 3:53 AM, Mats K=E4rrman <Mats.Karrman@tritech.=
se>
>>>> wrote:
>>>>> Hi,
>>>>>
>>>>> Are there any plans for new releases and/or maintenance branches of O=
E
>>>> classic?
>>>>>
>>>>
>>>> 2011.03-maintenance is the last release of OE classic. As long as the
>>>> branch is maintained
>>>>
>>>> _
>>>>
>>>> Related: I noticed TSC plans to discuss on whether or not to make oe
>>> classic read only.
>>>
>>> I'd like to suggest leaving it open for those of us that are still usin=
g
>>> it.
>>
>> 2011.03-maintenance branch is maintained and that would be place to go.
>>
>>
>>> For instance I have still products that are based on OE classic. If the=
re
>>> is a problem that is of a generic nature, I'm more than happy to submit
>>> patches so others in the same situation can benefit from it.
>>> (actually I have one pending with a new version of netsnmp; the current
>>> recipe does not build with uclibc, whereas the latest version of netsnm=
p
>>> does; found/fixed this today, but haven't had time to make a commit)
>>>
>>> And if there is no interest any more it'll eventually die. But as of no=
w I
>>> do see people working on/with it (see the commit log).
>>
>> those fixes are intended for 2011.03-maintenance which go into master an=
d then
>> get cherry-picked
>
> So master needs to stay open in order to get patches there first before
> being cherry-picked into 2011.03-maintenance, right?
>
> I also don't like the idea to make it read-only. Those who already
> switched to oe-core are free to just ignore the classic master branch.
> Others should still be able to push bugfixes etc, if they care enough
> about it.

<Putting on TSC hat>
The problem with this mindset is that we don't want to have
oe-core+meta-oe+etc and oe.dev diverge any more than they had at the
start.  This is why at some point master needs to become read-only.
Everyone and their master based project can still fetch and build and
work.  But if you're going right now and saying "I need to start a new
project and it should be oe.dev+master based", please speak up now
about why you're unable to use oe-core+etc.  We can't solve what we
don't know is a problem and frankly I think the TSC is of the mind
that oe-core+etc is as good as or better than oe.dev.  If we're wrong,
someone needs to tell us what's missing.

<Taking off TSC hat, putting on just my own>
In the beginning it felt like oe-core was missing a lot of handy
little things that oe.dev had gone off and made since the last time
there had been a sync up into poky (but there were its own good ideas
in there!).  We've now finally reached the point where it's really
just mechanical "migrate recipes A/B/C" (and not to trivialize these
efforts!).  I think it would be bad to go back to the point of "well,
now we need to move $concept from oe.dev into oe-core".

--=20
Tom


