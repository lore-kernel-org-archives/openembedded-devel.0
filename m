Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UPwhN-0007ZA-26
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 17:12:33 +0200
Received: by mail-pb0-f50.google.com with SMTP id jt11so310313pbb.37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 07:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=H1K0PtPlmxcOVQR2lgRwpcsaFYPuLi+KzhMdEMT5hoo=;
	b=0/kzZASQtFAoOmuzySK9A6e1CZDr2SO99cAQBOvcpnkTjbXGPjGobuiZBeZE0fLXLK
	BV7iQNtZmz9H0Uz7+XdAnQWc+lkyHWo08PwitR3tdpgPF+fKOdPeOufiCDWt4PiE/zTJ
	/KlnwkOxAawp6bf9Hwd1MFYHbQbLBjP2wudd21obkiLMjgbzVHbHksL9eD5ns3tQVJjd
	BsVITL4JWojKj5CiXB/+9nZzHhnbVESIvAh3+gl9Sm0R4nSiApagD1iINYclazRfITGI
	Eeg4SAeRBy3uauXie+BEOAjEfZm3BJMF/rSi66lHIaCL45Cr3K3CUNel/22iGyIkPJmo
	IMww==
X-Received: by 10.68.178.165 with SMTP id cz5mr3188135pbc.214.1365605710845;
	Wed, 10 Apr 2013 07:55:10 -0700 (PDT)
Received: from jchheda-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id to7sm798585pab.0.2013.04.10.07.55.08
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 07:55:10 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRQCDj76uszts=M1R8QSDfmsBRg-OweaiU9aYK51T3gmAA@mail.gmail.com>
Date: Wed, 10 Apr 2013 07:55:08 -0700
Message-Id: <9AB146E7-AEB9-4366-9A5C-01AFB5BE24D5@gmail.com>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
	<CALbNGRQCDj76uszts=M1R8QSDfmsBRg-OweaiU9aYK51T3gmAA@mail.gmail.com>
To: =?windows-1252?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.1503)
Cc: enrico.scholz@sigma-chemnitz.de, koen@dominion.thruhere.net,
	Martin Jansa <martin.jansa@gmail.com>, otavio@ossystems.com.br,
	openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 10 Apr 2013 15:12:43 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


On Apr 10, 2013, at 4:39 AM, Andreas M=FCller =
<schnitzeltony@googlemail.com> wrote:

> On Tue, Apr 9, 2013 at 10:01 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
>>> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=FCller wrote:
>>>> On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>>>>> On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>=20
>>>>> good old meta-systemd should now parse again,
>>>> Thanks - will come back to test HEADs soon.
>>>=20
>>> But be aware that I've fixed only parsing of avahi and =
wpa-supplicant.
>>>=20
>>> I haven't tested it properly in runtime because my upgrade path is a =
bit
>>> broken (because I was building images with khem's patches for a =
while to
>>> test other stuff) and even clean build with failed to boot with
>>> qemux86-64 and I don't have time to debug it now.
>>>=20
>>>>> I wont apply this 2 commits
>>>>> until systemd discussion in oe-core is finished and future of
>>>>> meta-systemd decided.
>>>>>=20
>>>> After systemd regression is worked around yocto 1.4 release =
regression
>>>> is knocking at the door...
>>>=20
>>> yes :/
>>>=20
>>> If we need to maintain meta-systemd bbappends for upgrade path we =
can
>>> also maintain them with PN-systemd packages and good old systemd =
bbclass.
>>=20
>> Khem pinged me about this patch, so here are my thoughts:
>>=20
>> PN-systemd discussion in oe-core haven't moved a bit since this patch
>> was proposed, I think we have 2-3 options, lets vote about =
meta-systemd future.
>>=20
>> 1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
>> resolve issues created by oe-core (I've fixed some issues, but still =
a
>> lot of issues in postinst/postrm/prerm scripts when both inits are
>> sharing the same PN)
>>=20
>> 2) give up on clean separation of PN-<init> and provide upgrade path
>> from PN-systemd to PN (mostly done by these 2 commits from khem).
>>=20
>> 3) give up on clean separation of PN-<init> and upgrade path (there =
are
>> many issues in other parts of oe-core, so upgrade path from danny to
>> dylan doesn't look usable.
>>=20
>> A) migrate existing .bbappends to their recipes to .bb files and
>> remove this layer. Any volunteer for that?
>>=20
>> My vote: 3) + A) later in 1.5
>> I guess we're all too busy to implement 1), upgrade path would be =
nice,
>> but is all-or-nothing, doesn't make much sense to spend a lot of time
>> fixing every issue from PN-systemd when there are issues from other
>> recipes we're not going to fix by .bbappends in meta-oe.
>>=20
>> Vote required from Khem, Koen, Andreas, Enrico, Otavio
>> Vote welcome from other meta-systemd contributors
>>=20
> tend also to 3) + A) but I would prefer to have it as one transaction.
> Otherwise we might face another upgrade path breakage. I know this
> will cause questions as who and when=85


actually, 3+A is going to take some time I feel first 2 (without upgrade =
path) and then eventually 3+A would get us there


>=20
> Andreas



