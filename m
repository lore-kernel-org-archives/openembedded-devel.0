Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PzQjR-0004Fz-4J
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Mar 2011 10:40:01 +0100
Received: by iyb26 with SMTP id 26so407154iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 02:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=Mji2PHur54arlNX/Tqb/2RmI+ocrXeyc3Zm7EHymi8k=;
	b=sNpxE71M45m+XKr2oMmbdtTaMjSVJk2CEUIo8CbA2QdEIfouUtH5RzHPA/2Oam4Y5s
	X0xtNlJLA6PHpL9gPD1pH4dhWpm5gg/V7Rj16lzAQB0y10+Et6aIts/Uqpd20ShfbfbY
	3INMpvJJRZZnIAVWIO47K3fI69CXhLbknENcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=CNsQdjCj/yz9LEt2NHfqDKOAfzBJw9CcU0rkwFXl8t7KUVtDfwpbWeQg8HVKf61hlA
	NzXrFP/hgJ27W/ovabc4u+VGgFYF+4vLmClQ7dwGdFx3EEkcBLgrdlz5AAQr6HpDDu+A
	LalzYvq3yln3ibUkp78RWn7Tv+J/uOV1Rf5xg=
MIME-Version: 1.0
Received: by 10.42.153.3 with SMTP id k3mr2496361icw.457.1300181898672; Tue,
	15 Mar 2011 02:38:18 -0700 (PDT)
Received: by 10.231.13.69 with HTTP; Tue, 15 Mar 2011 02:38:18 -0700 (PDT)
In-Reply-To: <4D7EA326.2000902@mentor.com>
References: <4D7E3B34.5050100@mentor.com>
	<AANLkTikqSLJd90dhRx8NwoEb37B-ZSQ4NcfKe_vVXpm2@mail.gmail.com>
	<20110314163639.GA3375@jama.jama.net>
	<AANLkTi=VL3kWZwKnzEao5iDUEA_F_-fMkx=m0astpSG3@mail.gmail.com>
	<4D7EA326.2000902@mentor.com>
Date: Tue, 15 Mar 2011 10:38:18 +0100
Message-ID: <AANLkTimjL1ohV7vMkG=2WMVZqC-vH+NNndjGi+K49k4P@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Discussion: Version retention policy in oe-core
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
X-List-Received-Date: Tue, 15 Mar 2011 09:40:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Tom, thanks for the reply.

2011/3/15 Tom Rini <tom_rini@mentor.com>:
> On 03/14/2011 11:52 AM, Frans Meulenbroeks wrote:
>>

[cut out large part of text]

>> Overall this seems like a fine proposal to me. Thanks a lot for drafting
>> it.
>>
>> There are a few minor suggestions I would like to make.
>>
>> First is to define which components are considered to be critical, as
>> for what is non-critical for one person might be critical for someone
>> else.
>> Leaving this open is bound to lead to discussion and disagreement
>> later on, perhaps better be clear about it upfront.
>
> We see that as outside of the scope of this policy but I agree it needs t=
o
> be settled up, at least as a starting point sooner rather than later. =A0=
So
> that we don't forget, please ask us to put this on the agenda.

I agree that that is outside the policy (but within the TSC domain).
I'll bring it up when I see the agenda.
Note that I am quite busy tomorrow so it might be (my) thursday
morning before I get to that.
>
>> Second is the location of deprecated recipes.
>> As far as I know we haven't clearly defined what goes into meta-oe.
>
> Well, that's up to OE at large, including how it's run. =A0We're just set=
ting
> out how the core should work right now.

I understand, but as said before this is also a topic for the TSC
>
>> I have assumed that this is one layer that will (also) contain recipes
>> that are not part of oe-core.For example a recipe for a UPnP server or
>> a CD recording program.
>
> Correct. =A0We expect meta-oe to continue to hold things that are not
> essential but are useful and not distribution specific.
>
>> Mixing deprecated oe-core and mainline non-core recipes in the same
>> tree will probably lead to confusion and perhaps even to people trying
>> to upgrade deprecated recipes in meta-oe.
>
> Why? =A0If meta-oe doesn't need something that's deprecated in the core i=
t
> shouldn't take it on. =A0If it does need something deprecated, we should =
try
> and figure out what can be done about that in order to fix that, or live
> with it (which is to say, if package A depends on package B no newer than
> version 2.0 and package B is now up to 3.2, is package A something that's
> really worth keeping? =A0Or should it perhaps go away?

Well there are two things I like to avoid.
First one is someone seeing a deprecated OE-core recipe in meta-oe.
Say this recipe is at 1.X. The person seeing this knows that upstream
is at 1.Y (Y > X), but is not aware that this recipe (and maybe 1.Y)
is in oe-core and starts to work at it.
Only later (e.g. when submitting changes) (s)he learns that actually
the newer version is in OE-core, and that all the work is wasted
timel. This is not an encouraging experience).
I think it would help if people are alerted that a newer version
exists in oe-core)

The second one is that we have many versions of the same recipe and no
one really cares or maintains these old versions. (if they are
maintained and used I have no objections against multiple versions,
but I am somewhat allergic to recipes that are kinda orphaned and
sometimes do not even build).

Btw that raises the following question: if a distro wants to pin (for
whatever reason) a certain recipe, but that version is not really
needed by other packages or so, does it still live in meta-oe? or
should it then eventually move into a distro specific overlay? I'm
especially thinking about distro's that are not too active in updating
their pinnings
>
>> In order to avoid that confusion is is probably better to give the
>> deprecated oe-core recipes their own layer (e.g. old-oe-core).
>
> If something isn't needed, we don't want to have to carry it anywhere oth=
er
> than in the scm history. =A0If it's needed, it should be somewhere active=
 so
> it can be used. =A0We can re-evaluate this at a later point in time if it=
's
> not working, but we discussed this and that was our conclusion (that's my
> recollection at least, the log can be checked over if needed).

I'm not sure if I saw the last log.
Key in your remark is what defines "needed".
Also what I often see is that things are needed, but after a while
become unneeded and become somewhat orphaned.
>
>> Apart from the above I feel it would be good if the TSC would discuss
>> the location of OE recipes that are non-core, and also draft a
>> retention policy for that location.
>
>> This might of course be similar or identical to the oe-core one.
>
> So that we don't forget, please reply to the next TSC meeting agenda (whi=
ch
> should be sent out sometime Wednesday, iirc) and it'll get put on the lis=
t.

will do.

Thanks for your reply.
Frans


