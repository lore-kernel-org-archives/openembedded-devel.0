Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OweMb-0004VL-E5
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 19:04:50 +0200
Received: by iwn2 with SMTP id 2so2144116iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 10:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Y8t21xgE1LOXXE88z02/DUYy8jPBTYSISqZ1n8rpeDQ=;
	b=XSBr5Cs/Le9oorlueamLbUx+bAPDc3EKbKJal5DiKKz4irZg7osh/qfSngd4dboSlS
	YZrt4C0UBQaXyAlPsmeooSCob3c5cX2zKwkOJ6bizUB9xAe+CZNDdWt8SpWc0o09ba3S
	Y9N+rp1lnPUBegOeT0V1cNIoEa3uISCmMTPOM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=HhxqS3SfQFLx+H/AbroBlbiTPdaU3oRLYeRXFleMhJfdTuxK+2el2p1Ay7pfzz4LYt
	F/1R3PVdLqwGShqMaNm0b/GNhdMfMnGoHZsefxcp3O2kcdjy+cT/yXlBf4yu1aTTIx+7
	GHBIUue5mlZL22Br/LWgyO95tdgiccBShostE=
MIME-Version: 1.0
Received: by 10.231.171.18 with SMTP id f18mr5469813ibz.9.1284743023124; Fri,
	17 Sep 2010 10:03:43 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Fri, 17 Sep 2010 10:03:43 -0700 (PDT)
In-Reply-To: <4C938713.2000201@mentor.com>
References: <AANLkTimXc3kLFR1m1uXM6OXZQn3idnbiDcEHPU0wpwEC@mail.gmail.com>
	<AANLkTikd-_vDny=kJKeS+NVWeYyfxiE_yXdUE+t1ac48@mail.gmail.com>
	<AANLkTi=s9gHBx_uPgiPGhu9b7D10JGytQaxyd-SZ+sfQ@mail.gmail.com>
	<AANLkTinWXK-HZHOLv2b2ApdPQ+LW22bvwsOO5TGOc1kx@mail.gmail.com>
	<AANLkTim9n1JsDc+bmYN5g20kBtobi5Ti-60Joq1U_rQZ@mail.gmail.com>
	<AANLkTi=r1NxVPeRVSSP24YXJSRDxUBwvLQo4PH6_iRxj@mail.gmail.com>
	<AANLkTimkhhnmDTWH3=Vx5hVN=Hpy5WXpnUX-E5QfRobb@mail.gmail.com>
	<4C8E9653.2020601@balister.org>
	<AANLkTiko_vEXjjW+SUrvb=V+R-Vu0p3AvN7hcdD+Ghjg@mail.gmail.com>
	<4C928DF9.2050405@mentor.com>
	<AANLkTimqMudTsuLKDyQKUBen7H4ZUoOCAxKDXVL7Utcp@mail.gmail.com>
	<4C938713.2000201@mentor.com>
Date: Fri, 17 Sep 2010 19:03:43 +0200
Message-ID: <AANLkTimQ7ZhhhM+9gAbikjfZ-zRA=UE52=qvkf33zqwD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: script to remove orphaned files
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
X-List-Received-Date: Fri, 17 Sep 2010 17:04:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/17 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>>
>> 2010/9/16 Tom Rini <tom_rini@mentor.com>:
>>>
>>> Frans Meulenbroeks wrote:
>>>
>>>> The patches I just pushed are tested using bitbake -c patch for all
>>>> recipes as far as possible).
>>>> (in the recipes I pushed I could not test alsa-scenario_git.bb as it
>>>> didn't fetch for me and alsa-driver_0.9.6-hh4c.bb as it was for h3600
>>>> and h3900 only),
>>>
>>> Not to stop the work here, but is there a reason you couldn't do
>>> MACHINE=3Dh3600 bitbake -c patch -b
>>> openembedded/recipes/alsa/alsa-driver_0.9.6-hh4c.bb ? =A0Yes, the initi=
al
>>> parsing sucks but I think it's important for things like this to go out
>>> and
>>> find the case where a given recipe is supposed to work and make sure it
>>> still works. =A0"It didn't fetch" is a legitimate stopper (and I think
>>> candidate for moving to nonworking) of testing something.
>>
>> I'll try the MACHINE =3D thingie tonight or tomorrow. Actually
>
> OK. =A0Note that doing it on the commandline means having it in
> BB_ENV_EXTRAWHITE. =A0Otherwise it's just short-hand for editing your
> local.conf :) =A0Thanks!

I know.
Just tried it for openembedded/recipes/alsa/alsa-driver_0.9.6-hh4c.bb
This recipe fetches from ftp.handhelds.org which resolves to
h2.handhelds.org, but does not give data.

If I ftp to there from the cmd line I get connected but after a while I get
421 Service not available, remote server timed out. Connection closed

So this one seems dead too.

Frans


