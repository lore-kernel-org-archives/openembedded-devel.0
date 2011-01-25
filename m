Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PhkE2-0006ny-DV
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 15:50:30 +0100
Received: by iwn8 with SMTP id 8so5750001iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 06:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=4ywzb6jhWY1kMalrn/QkT27hHKoz5lRkDBZwlGa6FoA=;
	b=Obv8Qg4wal2iJiKO4Li1fZpPjtNayiDOSJrSxIm8V109HjlraT7MJQ+3Jk8TI+wMz5
	bZ1mM8fZsoJVnAANR/QHAiqNn2EC8AN0KIFpNqLn6hL5pzw7LH+N4M4v9yMOPm6PP8Z+
	bHOlofHf+SEYHtnRNjBvt1SNVec/aiIVSUjGM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cWHFgK0pV/kvGejnAbuyAHzQFlgJ1h/I3hM8lyl7ya882RpY+s84pRBycvCzfevnva
	8dKuGUWJ28dOkzcgMrE15B8jcsTqtpdHaquZJTe0BlFq1UtuhePU+gHnmjwWxrKPG+B1
	iSMneILwlZusY6Ei0h3WAxhBscl7OIVPW0hHA=
MIME-Version: 1.0
Received: by 10.231.37.12 with SMTP id v12mr6676658ibd.83.1295966982156; Tue,
	25 Jan 2011 06:49:42 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Tue, 25 Jan 2011 06:49:41 -0800 (PST)
In-Reply-To: <ihmaqm$eho$1@dough.gmane.org>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
	<AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
	<ihmaqm$eho$1@dough.gmane.org>
Date: Tue, 25 Jan 2011 15:49:41 +0100
Message-ID: <AANLkTi=hWbJ_Y_m6kxMfCMdQti+xvAZZ-snK1UuqKLxY@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Tue, 25 Jan 2011 14:50:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/25 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 24-01-11 18:48, Khem Raj wrote:
>> On Mon, Jan 24, 2011 at 8:39 AM, Philip Balister <philip@balister.org> w=
rote:
>>> On 01/19/2011 06:48 AM, Graeme Gregory wrote:
>>>>
>>>> Hi, this email is sent as an ordinary member of OE.
>>>>
>>>> It seems to be on a technical level we are agreed that we should split
>>>> parts of OE out into the so called openembedded-core which will have a
>>>> stricter commit access and higher QA requirements on changes.
>>>>
>>>> I therefore think it is time to actually create the repository and let
>>>> the people who are interested in merging the good stuff from poky with
>>>> the good stuff from openembedded to create our "core". I don't think
>>>> there is any need to wait on the political part of the Yocto/OE
>>>> collaboration as its something we have agreed in principal to do anywa=
y.
>>>>
>>>> I would request then that the TSC drive this forward with the server
>>>> admins and create this repo so work can happen.
>>>
>>>
>>> Has anything happened on this email? Has the TSC had a meeting to discu=
ss? I
>>> know it has only been a week, but people are starting to do work based =
on
>>> these ideas and need some support from the TSC.
>>>
>>
>> Yes I think we should start action on it soon. I would suggest to set
>> up the repository
>> as first step. As someone raised question about pull model it could be
>> TSC who decided
>> to appoint one gatekeeper based upon availability interest and
>> capability and it could be
>> rotated.secondly sane Starting point would be importing yocto and then
>> apply the OE improvements
>> on top thirdly breakdown oe into oe-meta repo to glue with the oe-core
>
> Ignoring the timeline a bit, since ideally we would do this around a
> yocto milestone to get them to use this straight after their freeze.
>
> The technical roadmap/todo:
>
> * setup openembedded-core repo on oe.org
> * setup oe-core ml on oe.org
> * add oe-core ml to patchwork
> * import yocto-core in oe-core

Is this yocto core: http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/
Or do you mean this:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-core

> * start an integration branch
> =A0o remove bitbake
Not sure what you mean with that. Which BB do you propose to use?

> =A0o cleanup namespace (s/yocto/OE/, s/poky/OE/)
> =A0o split out superfluous layers (e.g. ememlow)
> * start merging in OE things
> =A0o e.g. OE gcc 4.5, toolchains for avr32, bfin, etc
> * switch meta-oe to build on top of oe-core, fix issues

Isn't some class merging needed?

BTW, good list.
>
> When that is done meta-oe can start to expand.
>
> The non-technical roadmap/todo:
>
> * Assign 2 gatekeepers to oe-core, one from yocto, one from OE
> * sketch out decision tree (RP -> gatekeepers -> maintainers)
> * work out model for meta-oe
> * appoint OE member to yocto SC
> * work out how to marry yocto goals (4 archs, one toolchain) to OE goals
> (zillion archs, as much toolchains as we can manage)
> * Work out OE roadmap and align with yocto

I assume maintenance will use a pull model. Correct?
>
> The above tries to restrict itself to dealing with the new oe-core, not
> with how OE is going to split into layers (meta-oe, meta-graveyard, etc).
> It also ignores the maintainer aspects since we will be dealing with
> yocto metadata at the start. After oe-core reaches a ready enough state
> we can start looking at assigning maintainers, but for the time being
> let's get things done first.
>
> So, let's start fleshing out the above roadmaps and implement them!
>
> regards,
>
> Koen
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNPq6WMkyGM64RGpERAmViAKCYKgJPEcLTCL+G1uugO6wQwEkfAACgrq8C
> zanbxmzVZb4tgNbdwTV/fS0=3D
> =3DtMf8
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


