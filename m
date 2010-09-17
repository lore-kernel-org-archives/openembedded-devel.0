Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwUDq-0006Kw-Iw
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 08:14:59 +0200
Received: by iwn2 with SMTP id 2so1721977iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Sep 2010 23:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/PD0kuFD8DYuHwgEqw87CCRqg0px0lsuNEk9DnkBPEQ=;
	b=FwzSKYNjNo9Z2085YHfcsgso3kYo131HbKmi8mDxdt10rF4+U6sPP4a95a4aqhtfnW
	Tu2JWgP4Tn2aqwTXReRvGWQYqhmYUeQGbclX2L2lxyJkMhZJT2Vgl51L6p38/UUHlalA
	E6QhrxJHcMVjRN3rlWiDNT4lehkIfFFrdXXfs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=oW7UlzgJAlIjxkGIDjHgl/jkHeX/kLL8hGIztt7P+/joo6KlFplZND5OZjQ0Cw+9fF
	GmFm6yZTsLvqQUI4HHwtidRsp4mFOds+gX799dzGCruyIZMJIrRgsVUWQ4ONgrboIHCf
	Y+XrnfO65sgQhvEuCWPNzPghz+l6qn7E2wmlo=
MIME-Version: 1.0
Received: by 10.231.36.202 with SMTP id u10mr4731553ibd.64.1284704048408; Thu,
	16 Sep 2010 23:14:08 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Thu, 16 Sep 2010 23:14:08 -0700 (PDT)
In-Reply-To: <4C928DF9.2050405@mentor.com>
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
Date: Fri, 17 Sep 2010 08:14:08 +0200
Message-ID: <AANLkTimqMudTsuLKDyQKUBen7H4ZUoOCAxKDXVL7Utcp@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Sep 2010 06:14:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/16 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>
>> The patches I just pushed are tested using bitbake -c patch for all
>> recipes as far as possible).
>> (in the recipes I pushed I could not test alsa-scenario_git.bb as it
>> didn't fetch for me and alsa-driver_0.9.6-hh4c.bb as it was for h3600
>> and h3900 only),
>
> Not to stop the work here, but is there a reason you couldn't do
> MACHINE=3Dh3600 bitbake -c patch -b
> openembedded/recipes/alsa/alsa-driver_0.9.6-hh4c.bb ? =A0Yes, the initial
> parsing sucks but I think it's important for things like this to go out a=
nd
> find the case where a given recipe is supposed to work and make sure it
> still works. =A0"It didn't fetch" is a legitimate stopper (and I think
> candidate for moving to nonworking) of testing something.

I'll try the MACHINE =3D thingie tonight or tomorrow. Actually
originally I skipped this because I thought it will build me a whole
toolchain (which is quite time consuming) but thinking of it -c patch
will probably only require a few native recipes (like patch-native)
that already exists anyway, so it is limited to the parsing.

Wrt alsa-scenario: If it was not a git recipe I would have proposed it
for deletion, but maybe this is just a srcrev that does not exist any
more or so (after a merge).
Actually didn't check yesterday, but did so today, the git does not
clone for me.

frans@frans-desktop:/tmp$ git clone git://slimlogic.co.uk/alsa-scenario
Initialized empty Git repository in /tmp/alsa-scenario/.git/
fatal: The remote end hung up unexpectedly

Will post a separate message about it

Frans


