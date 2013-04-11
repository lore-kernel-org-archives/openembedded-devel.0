Received: from mail-ia0-f182.google.com ([209.85.210.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UQ60g-0005p0-Kg
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 03:09:13 +0200
Received: by mail-ia0-f182.google.com with SMTP id u20so951003iag.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 17:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=2rCFKHcZmcRYUDWcNGzyWT1PK6inwKCSiLdOk5o1EYw=;
	b=T7I9ET1zJW+7Zp6N/YMt7cGBJo/Edj/jhDGwxwzocuPEZDMEn1B3Edxhh3r66HE7jF
	1jlICDlGQ51/29525k2MnsxocdVj5MmvJ8CTY8rx6OEdiM1YYp1fOo2U1Zc1RoBp/1kt
	czb4dzOAfRKaTaOBd6egbNi1Tvl5QJuQ45SfMZzGuff1PriyqeW9CT04zBI/BHrV/9Dj
	FEek0sEbRe8hQnG+G7THthlL/BYfLCkfcSR4G5XfYZJRHeIIAhziImMK49H3KooqFO+t
	orrbimOzCs9vRrISYUM+N5llHbL+eLBxDPoTsxRPTehIcBugOpLK7ZK8kB1ZERftkpK7
	6bxg==
MIME-Version: 1.0
X-Received: by 10.50.164.162 with SMTP id yr2mr3063923igb.0.1365641503790;
	Wed, 10 Apr 2013 17:51:43 -0700 (PDT)
Received: by 10.50.191.170 with HTTP; Wed, 10 Apr 2013 17:51:43 -0700 (PDT)
In-Reply-To: <CALbNGRTq3D6XP=wLnMcd-LkFpF6id6AVQtBsHVdMS6GoxUwFYg@mail.gmail.com>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
	<CALbNGRTq3D6XP=wLnMcd-LkFpF6id6AVQtBsHVdMS6GoxUwFYg@mail.gmail.com>
Date: Wed, 10 Apr 2013 17:51:43 -0700
Message-ID: <CAMKF1srFP+kbnqcCfM_z6U0w8wVWpZsqRj+ciHoo=o3t=X+8Rg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: "enrico.scholz@sigma-chemnitz.de" <enrico.scholz@sigma-chemnitz.de>,
	"koen@dominion.thruhere.net" <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-systemd future vote Was: [meta-systemd][PATCH 1/2] Delete systemd class.
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
X-List-Received-Date: Thu, 11 Apr 2013 01:09:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wednesday, April 10, 2013, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
wrote:
> On Tue, Apr 9, 2013 at 10:01 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:
>> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
>>> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=C3=BCller wrote:
>>> > On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.com=
>
wrote:
>>> > > On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
>>> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> > >
>>> > > good old meta-systemd should now parse again,
>>> > Thanks - will come back to test HEADs soon.
>>>
>>> But be aware that I've fixed only parsing of avahi and wpa-supplicant.
>>>
>>> I haven't tested it properly in runtime because my upgrade path is a bi=
t
>>> broken (because I was building images with khem's patches for a while t=
o
>>> test other stuff) and even clean build with failed to boot with
>>> qemux86-64 and I don't have time to debug it now.
>>>
>>> > > I wont apply this 2 commits
>>> > > until systemd discussion in oe-core is finished and future of
>>> > > meta-systemd decided.
>>> > >
>>> > After systemd regression is worked around yocto 1.4 release regressio=
n
>>> > is knocking at the door...
>>>
>>> yes :/
>>>
>>> If we need to maintain meta-systemd bbappends for upgrade path we can
>>> also maintain them with PN-systemd packages and good old systemd
bbclass.
>>
>> Khem pinged me about this patch, so here are my thoughts:
>>
>> PN-systemd discussion in oe-core haven't moved a bit since this patch
>> was proposed, I think we have 2-3 options, lets vote about meta-systemd
future.
>>
>> 1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
>> resolve issues created by oe-core (I've fixed some issues, but still a
>> lot of issues in postinst/postrm/prerm scripts when both inits are
>> sharing the same PN)
>>
>> 2) give up on clean separation of PN-<init> and provide upgrade path
>> from PN-systemd to PN (mostly done by these 2 commits from khem).
>>
>> 3) give up on clean separation of PN-<init> and upgrade path (there are
>> many issues in other parts of oe-core, so upgrade path from danny to
>> dylan doesn't look usable.
>>
>> A) migrate existing .bbappends to their recipes to .bb files and
>> remove this layer. Any volunteer for that?
>>
>> My vote: 3) + A) later in 1.5
> A bit off-topic and mentioned here & there: I am working on
> network-manager(-applet) 0.9.8.0 update and xinput-calibrator. I could
> add 3) + A) for them if agreed. Hope to send them beginning of next
> week.
>

Sure I see no problem
> Anderas
>

