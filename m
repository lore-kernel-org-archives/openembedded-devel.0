Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkBf6-000059-8V
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 10:00:17 +0200
Received: by yxd39 with SMTP id 39so768226yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 01:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Bon/hQfGjcNlFyBGX5WNgQxRG4KGKWi0SjblfPPB3jI=;
	b=uKbG+JfF9T3lhhmtu6HHHagUacb8HdF0AmpJG2Y2TVAc9CBM1AI3g87H5V9KULn5qR
	/tNdY1rTCZekCgh0jynOWhfhxsLZZ4EzTgVqU33lvWzwhj7mvWKDbvDp2miuq0mpgmtb
	KsjnLo+fbMArfCn9kioO2wbkXpZu9lOyyFcXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hP02szakIXFAuV/yPP4o1UWw/W5HxKgIj/mcMYgx+vLqs8hECgmyTDyaXnNsgW3fV6
	n12lH2/E4jFjvI8EC2KNco6G7U8dcWY1Zd18yuR3GULsne5zfHs/4kSnalXLKMb/rTrz
	G02ktEp20GD7eUrPyHT1sqevKd32/VLA+Wtbc=
MIME-Version: 1.0
Received: by 10.231.39.69 with SMTP id f5mr2831912ibe.53.1281772799432; Sat,
	14 Aug 2010 00:59:59 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 00:59:59 -0700 (PDT)
In-Reply-To: <1281734825.3858.281.camel@mattotaupa>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<alpine.LNX.2.00.1008131040070.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTikQ5qGF4N1N0Ud11cdS7P4+HxfPEXSvWwMvm4YV@mail.gmail.com>
	<alpine.LNX.2.00.1008131154370.11048@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinChtk+VTgQ4H3+sMfyTRUQks+=YQR9Agj8M7a_@mail.gmail.com>
	<alpine.LNX.2.00.1008132255040.11048@asterix.crazy-teaparty.dyndns.org>
	<1281734825.3858.281.camel@mattotaupa>
Date: Sat, 14 Aug 2010 09:59:59 +0200
Message-ID: <AANLkTin28kSQZTgWHd_DsXcqeANKfBcg3+NLaOP74kaD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: patch queue/patchwork: How should states be used? (was: update canutils to current version)
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
X-List-Received-Date: Sat, 14 Aug 2010 08:00:18 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

2010/8/13 Paul Menzel <paulepanter@users.sourceforge.net>:
> Am Freitag, den 13.08.2010, 23:01 +0200 schrieb Vitus Jensen:
>> On Fri, 13 Aug 2010, Khem Raj wrote:
>> > On Fri, Aug 13, 2010 at 2:59 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>
> [=85]
>
>> >> They did. =A0But after you posted you ACKs I changed their state to "=
Accepted"
>> >> and then they are usually filtered by "Action Required". =A0I'm not r=
eally
>> >> sure I did the right thing but I don't believe they shouldn't remain =
in
>> >> "New".
>> >
>> > If they got applied change the state to 'applied'
>>
>> Sure, already did! =A0Do I set the 'archive' bit, too?
>
> I think so. Yes.
>
>> Frans got hit by the fact, that 'accepted' patches don't show up in the
>> list by default.
>>
>> Vitus posts patches
>> Frans acks patches
>> Vitus changes state to 'accepted'
>> Vitus asks Frans to apply
>> Frans: where are those patches in patchwork???
>> Frans forces his googlemail to produce usable mail and applies
>> Vitus changes state to 'applied'
>
> I would also advise to set the commit ID when setting the state to
> applied. Actually this can be done automatically [2], but the
> administrators have not yet had time to address this.
>
> We have the following 11 states.
>
> =A0 =A0 =A0 =A0$ pwclient state
> =A0 =A0 =A0 =A0ID =A0 =A0Name
> =A0 =A0 =A0 =A0-- =A0 =A0----
> =A0 =A0 =A0 =A01 =A0 =A0 New
> =A0 =A0 =A0 =A02 =A0 =A0 Under Review
> =A0 =A0 =A0 =A03 =A0 =A0 Accepted
> =A0 =A0 =A0 =A04 =A0 =A0 Rejected
> =A0 =A0 =A0 =A05 =A0 =A0 RFC
> =A0 =A0 =A0 =A06 =A0 =A0 Not Applicable
> =A0 =A0 =A0 =A07 =A0 =A0 Changes Requested
> =A0 =A0 =A0 =A08 =A0 =A0 Awaiting Upstream
> =A0 =A0 =A0 =A09 =A0 =A0 Superseded
> =A0 =A0 =A0 =A010 =A0 =A0Deferred
> =A0 =A0 =A0 =A011 =A0 =A0Applied
>
> What is the difference between 3 (Accepted) and 8 (Awaiting Upstream)?

I'd say awaiting upstream would be a situation where the patch has
been submitted upstream (e.g. for gcc to the gcc devs) and we're
waiting for their reaction.
But that is just my guess.
>
>> Probably I should update the wiki [1] to document the above procedure, r=
ight?
>
> That would be great. But before there should be reached a little
> consensus to save you some unnecessary work.
>
> I guess the accepted state is too much work and could be skipped?
>
> + Normally people reviewing and acknowledging patches have commit access
> and will do this shortly afterward.
> - People with commit access not searching the list and just looking at
> the patch queue would see that those patches have been reviewed and
> acknowledged and could commit these patches.

Typically if I see something pass by that is straightforward (like the
patches from Vitus) and I have the time and my tree is in a state that
I can easily apply it, I take the patch and push it (after reviewing).
The rule I apply on myself is: if it is something that I woud push
myself without further review (e.g. a single recipe like the canbus
ones), I take it and push it and update patchwork. That is after
testing that the recipe builds.
so the workflow here is:

if it is a patch in an area I do not understand I'll skip it.
otherwise:

review patch. if ok and it is a simple patch
download patch from patchwork in mbox fmt
git am patch
bitbake recipe
if ok, git push.

if the patch is not ok, I inform the poster. I hardly ever repair things my=
self.
I'd rather educate people to do things the proper way.

And if the patch is complicated (e.g. affects the toolchain) I also
review and if possibly try then ack (or nak).

But sometimes I am not in a position to push (e..g because my system
or me is too busy with something else, or because my tree has too much
changes on it or is not up to date and cannot be updated)
In that case I tend to ack (and I might pick it up later) This is what
happened with vitus'  recipe.

>
> I do not know if we already have some people taking care of the patch
> queue. If there are such folks, they should voice their opinion what
> they prefer.

I feel taking in and handling patches is partly an orphaned process.
If a patch is submitted by someone with commit access for reveiw,
typically that person will follow up on it.
If it is e.g. a new recipe or in an area that is not really taken care
of by someone, it is sheer luck if someone picks it up.
I feel recipe maintainers could be useful here.

(btw recipe maintainers could also be useful when it comes to handling
bug reports in bugzilla).


Frans


