Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpS56-0000Jh-OB
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:32:55 +0200
Received: by iwn2 with SMTP id 2so3546864iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=V+1v4ZHpxMgcnJOqDKIf9EtYAr1AToMCTSSgvGnF28k=;
	b=JBdNMjUUd+JKsXAQxOur4TPYEY6TFHuBjseZ3Ddy+pPpjt9ybUYFm0bvp7zXWKajx3
	lnZ1uFsov/iZrvyZtTNopao1vOb9DjdwwGt8G49KZT4EaIE+TBt0yrGFy1xp4HbutYlO
	IMnc0cmovworHJqzKwvD3SjrJrnrv5cB3e5R0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=eYVduNNQMqxEi/+ZbJiVBA+G68M9od9YTIkVT8v0nBlNVuQ1WrkPTmcsc1hojaEwc5
	AlexFzmR3+vbSI+n/tWMZtzk5RWRshHZvE+e15pF7xLqNGq0P4PGEF95MV0VpfLZjlUC
	/9FTxxHpWApNtwav2+NMVB2B7KnzMjtqxzJfg=
Received: by 10.231.161.73 with SMTP id q9mr2976588ibx.70.1283027544162; Sat,
	28 Aug 2010 13:32:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.207.8 with HTTP; Sat, 28 Aug 2010 13:32:04 -0700 (PDT)
In-Reply-To: <i5aoas$sja$2@dough.gmane.org>
References: <1282896714-3167-1-git-send-email-raj.khem@gmail.com>
	<1282896714-3167-3-git-send-email-raj.khem@gmail.com>
	<i586bt$t12$1@dough.gmane.org>
	<AANLkTikWe-88_U7FmV2mi4=J6XV-A3-nYUqJdjDNzOA9@mail.gmail.com>
	<i5aoas$sja$2@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Aug 2010 13:32:04 -0700
Message-ID: <AANLkTiko4EDjuD+EHiC+X5PAsG0zyGjFA=L4PPhvS2EL@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] recipes: Update recipes to get 'bitbake world' parse and calculate runqueue successfully.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:33:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 28, 2010 at 3:27 AM, Koen Kooi <k.kooi@student.utwente.nl> wrot=
e:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Your patch does too many things at once, to recipes I maintain, so
> please split it up per recipe and I'll ack/nack the seperate patches.

makes sense. I divided it up and resent it again. Would be nice if you
can look at them if you get some
time.

> I'm getting suck of such jumbo patches that can't be reverted cleanly.

yes I kind of sense that and particularly if its not from the one who
wants to revert it.

> I'm still dealing with the fallout from the crappy deletions frans did,
> so patches like this aren't helping.

yeah could happen with large scale changes.
We have to do the janitorial work at some point of time. Right now we
have too much cruft.
I am hopeful that all these radical changes will be beneficial in coming ti=
mes
especially when we do some changes like may be some bitbake syntax
change etc that needs to
go into all recipes etc. then we will sure that we are not beating the
dead horses.

>
> On 27-08-10 17:31, Khem Raj wrote:
>> Hi Koen
>>
>> Thanks for your time to look into it and comments. It would help if
>> you could explain a bit more why you think
>> changes are not good. I have individually explained the reasons below
>> your comments. It would really help to
>> improve these if you could shed some light on the reason why you think
>> the changes are not good. If you think
>>
>>
>> On Fri, Aug 27, 2010 at 4:08 AM, Koen Kooi <k.kooi@student.utwente.nl> w=
rote:
>> On 27-08-10 10:11, Khem Raj wrote:
>>>>> * Move recipes to nonwotking which are depending upon other recipes
>>>>> =A0 which are already in nonworking state.
>>>>>
>>>>> * Fix other recipes for renamed dependencies etc.
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> =A0recipes/angstrom/angstrom-bootmanager.bb =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
>>
>> NAK
>>
>>
>>> if you have explained whats wrong that would have helped. I certainly d=
ont
>>> claim to be knowing all the recipes. recipes it depends upon do not exi=
st
>>> so whats the best thing to do ? This same applies to your other NAKs to=
o.
>>
>>
>>>>> =A0recipes/esc/esc-node-demo_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A04 +-
>>
>> NAK
>>
>>> This depends on a recipe which is under review and I have commented the=
 same.
>>> Or do you see something else is wrong?
>>
>>
>>>>> =A0recipes/meta/meta-toolchain-arago-dvsdk.bb =A0 =A0 =A0 =A0 | =A0 =
=A01 +
>>
>> NAK
>>
>>> I wonder if you really looked at this change because all it does is rem=
oves
>>> meta-toolchain-arago-dvsdk from world build. What problem do you see he=
re ?
>>
>>
>>>>> =A0recipes/sugar/sugar-fructose.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
>>
>> NAK
>>
>>> Elena already explained it.
>>
>>
>>>>> =A0recipes/tasks/task-arago-toolchain-target.bb =A0 =A0 =A0 | =A0 =A0=
3 +-
>>
>> NAK
>>
>>> This change is removing libpng12-dev which is not provides. and
>>> e2fsprogs-libs-dev
>>> is now e2fsprogs-dev or am I missing some point here.
>>
>>
>>>>> =A0recipes/tasks/task-demo-x11.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 17 ++---
>>
>> NAK
>>
>>> are libgles-omap3-x11demos different that non existing libgles-omap3-de=
mos
>>> if so then I can change it to just removing libgles-omap3-demos
>>
>>
>>>>> =A0recipes/tasks/task-gmae.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A07 ++
>>
>> NAK
>>
>>> it uses XSERVER what doesnt really define it. What is wrong here.
>>
>>
>>>>> =A0recipes/tasks/task-gpe.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A06 +-
>>
>> NAK
>>
>>> virtual/xserver is a virtual target you can not RDEPEND on it
>>> but you can depend atleast thats what bitbake tells me.
>>
>>
>>>>> =A0recipes/udev/udev-compat141_141.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A06 ++-
>>
>> NAK
>>
>>> if machine is not one of spitz akita c70x poodle then it is not needed
>>> to RDEPEND on it. what is wrong here
>>
>>
>>>>> =A0recipes/vlc/vlc-davinci_0.8.6h.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
>>
>> NAK
>>
>>> is non existing codec-engine different then ti-codec-engine ?
>>> if yes then I guess either these codecs should be committed to OE
>>> or the recipe should be moved into nonworking what would you think.
>>
>>
>>
>>
>>
>>>
>>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMeOScMkyGM64RGpERAg8/AJ0RBUVxDjLuQNTX6xgZ385GhEYvOACbBo7V
> 0aWBiF/l1F2zZDvltA+/aGY=3D
> =3Dne75
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


