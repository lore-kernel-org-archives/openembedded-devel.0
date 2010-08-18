Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OlmFQ-00026F-69
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 19:16:21 +0200
Received: by gxk2 with SMTP id 2so304616gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 10:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=OT2FMzHKnTeGJVoDZzcv0BHg/mQC3qNakqoPFPuYOuA=;
	b=dkdGZ3AEXh08ybbWOoohe+22E+2+fpaPQh3is1pwbuKri8Ofu0XsZkK8IfoWgbitaz
	A9IvxtRsWXn2EH7xBTzlE3B1TCrc+TZZ+sNcdZk//D8Lkw7Avj4KIkgk5AnI87sl13NI
	8lvF1VFvXYWkIDkDz0gAR1u6rDCVDGXoZDl4Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=XJqCjnKwO3qdkbg8rrYnPNzogiViADZ7iuTYEVgHzRRqgWzV3cJzMWqs/ImnZJJtE6
	19SbvkPdEgaTtVSCoG8v72CazwUdHVgUtH1HQIVRYVHoQgjxWhlgdZAKIMG5ajuz5vIz
	e8q0KBr2YBiBqqq5BWuGg4LqCCfCkWy6rSMiY=
Received: by 10.151.1.4 with SMTP id d4mr506824ybi.433.1282151757340; Wed, 18
	Aug 2010 10:15:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.205 with HTTP; Wed, 18 Aug 2010 10:15:20 -0700 (PDT)
In-Reply-To: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
References: <AANLkTiknntyGcs6gdHDx84J8m7QufqZ8CPVs4nF5urD7@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Aug 2010 10:15:20 -0700
Message-ID: <AANLkTikHNKEcVW31AAodWaoN5K+L1F-oGSV-+A+YStLb@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE stable, testing, dev (was Re: What to do about the poor bitbake Quality Control?)
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
X-List-Received-Date: Wed, 18 Aug 2010 17:16:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 18, 2010 at 8:07 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Wed, Aug 18, 2010 at 4:30 AM, Martyn Welch <martyn.welch@ge.com> wrote=
:
>> On 17/08/10 16:02, Cliff Brake wrote:
>>>
>>> I think it would be very useful to have a "stable" branch that is only
>>> synchronised with dev when X number of targets build from a clean
>>> build. =A0It seems like this would be high value, with little effort.
>>> Of course there will be corner things that break, but at least a new
>>> beagleboard user can check out something and have reasonable
>>> confidence that it will build images.
>>>
>>> Does anyone have suggestions for the branch name and a reasonable
>>> subset of machines and build targets? =A0Perhaps someone is already
>>> running these clean builds? =A0At one point we had a machine at OSUOSL
>>> dedicated to this purpose, but no one ever set it up.
>>>
>>
>> So something like Debian's stable, testing and unstable[1]?
>
> That sounds good to me -- so how about org.openembedded.dev and
> org.openembedded.testing branches?


simply 'testing' is good (we were to rename org.openembedded.dev to master)

>
> I'll plan to start doing a clean build of dev every Monday for the
> Beagleboard, and then merge to testing once it builds. =A0Initial
> targets:
>
> Angstrom Distro
> beagleboard/beagleboard-linuxtag2010-demo-image
> x86/minimal-image
>

All qemu targets build and run too. So adding some of (qemuarm
qemumips qemumipsel qemuppc qemux86
qemush4) will be good too.



> My workstation runs a 64-bit OS, so that is probably worst case
> (compared to i686).
>
> Getting started
> (http://wiki.openembedded.net/index.php/Getting_started) points to a
> tarball for bitbake 1.8.18. =A0Is this still the recommended
> version/mechanism for new users? =A0I much prefer simply pulling bitbake
> from git.

yes git would be better. You can also checkout 1.10 branch and use it if ne=
eded.

>
> Thanks,
> Cliff
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> http://bec-systems.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


