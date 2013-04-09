Received: from mail-ee0-f51.google.com ([74.125.83.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPf71-0003om-HW
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 22:25:51 +0200
Received: by mail-ee0-f51.google.com with SMTP id c4so3042907eek.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2013 13:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=JpeMwo3lJHuKoRzCvA18xcL0Wep8EN4ReON6dFigtKY=;
	b=h0eeUPTVODoq+rZozv+zf+ReqNZiZfGYQzC2GGAe5ZmN1lNYYSco+MzcnOx6qZe1HD
	VjIa28/zXxaswiU1NOoa5XbPPuEhXBiwexVrigA5okEkRE3EvYpwJpSYKbmOvUfWQCcr
	z4uBgVxghe6errgDAjfZXzYLCDFIxnS2qBipeuRRBixE4+G8bZzZ/rO0nmIHbhyiL7/h
	Slvoi2x/pHtv3DgRcmn3eh9zs5xpWMvk/Fvqu1sa4yR9VxmVyziLyFJZx5vSmPHJ1w2h
	jgEY/DjKX92iIy4rUmQWZ6JByZ3dYWNhPAvmJSQDU5j9pojJHIunMuOpEoqzmq8DOqPk
	z8lg==
X-Received: by 10.14.216.2 with SMTP id f2mr63485392eep.44.1365538111064;
	Tue, 09 Apr 2013 13:08:31 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id s47sm39928209eeg.8.2013.04.09.13.08.28
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 09 Apr 2013 13:08:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20130409200127.GF2474@jama>
Date: Tue, 9 Apr 2013 22:08:29 +0200
Message-Id: <F52AA45C-FB86-4749-95C0-0DA24BC50DFB@dominion.thruhere.net>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQngM8Bxy0avNQNpAlKLQnXzBEIvTIGXO+em4JwriR7AJ5W2c8F9iOpKLkMOSxPeJYJFxzNP
Cc: otavio@ossystems.com.br, openembedded-devel@lists.openembedded.org,
	enrico.scholz@sigma-chemnitz.de
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
X-List-Received-Date: Tue, 09 Apr 2013 20:25:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 9 apr. 2013, om 22:01 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
>> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=FCller wrote:
>>> On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>>>> On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>=20
>>>> good old meta-systemd should now parse again,
>>> Thanks - will come back to test HEADs soon.
>>=20
>> But be aware that I've fixed only parsing of avahi and =
wpa-supplicant.
>>=20
>> I haven't tested it properly in runtime because my upgrade path is a =
bit
>> broken (because I was building images with khem's patches for a while =
to
>> test other stuff) and even clean build with failed to boot with
>> qemux86-64 and I don't have time to debug it now.
>>=20
>>>> I wont apply this 2 commits
>>>> until systemd discussion in oe-core is finished and future of
>>>> meta-systemd decided.
>>>>=20
>>> After systemd regression is worked around yocto 1.4 release =
regression
>>> is knocking at the door...
>>=20
>> yes :/
>>=20
>> If we need to maintain meta-systemd bbappends for upgrade path we can
>> also maintain them with PN-systemd packages and good old systemd =
bbclass.
>=20
> Khem pinged me about this patch, so here are my thoughts:
>=20
> PN-systemd discussion in oe-core haven't moved a bit since this patch
> was proposed, I think we have 2-3 options, lets vote about =
meta-systemd future.
>=20
> 1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
> resolve issues created by oe-core (I've fixed some issues, but still a
> lot of issues in postinst/postrm/prerm scripts when both inits are
> sharing the same PN)
>=20
> 2) give up on clean separation of PN-<init> and provide upgrade path
> from PN-systemd to PN (mostly done by these 2 commits from khem).
>=20
> 3) give up on clean separation of PN-<init> and upgrade path (there =
are
> many issues in other parts of oe-core, so upgrade path from danny to
> dylan doesn't look usable.
>=20
> A) migrate existing .bbappends to their recipes to .bb files and
> remove this layer. Any volunteer for that?
>=20
> My vote: 3) + A) later in 1.5
> I guess we're all too busy to implement 1), upgrade path would be =
nice,
> but is all-or-nothing, doesn't make much sense to spend a lot of time
> fixing every issue from PN-systemd when there are issues from other
> recipes we're not going to fix by .bbappends in meta-oe.

Upgrade paths are totally broken anyway, so let's go for 3 + A




