Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UPtdw-0002lo-VM
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 13:57:00 +0200
Received: by mail-vb0-f52.google.com with SMTP id w8so267667vbf.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 04:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=vY2ecUNGRCkN82UoXSN7YJ/39RD9LdlIF2VvWE9AE3M=;
	b=s1kM8+fqFKpa5x808Xv+EaZ+yxwMMReKouKEXN74oj0OXN9tqySq82zyXCHJxIELFw
	WrDSpz2qZPU0jRse52hCVuDHO0z48L2FaUOYDtGPB/0S8Q/2hT42WxGY72csDVbWHAvA
	hvOPvuZ8fOtNZ+UxTplN8A5ToDkbbHXd5DeIwHYfkqPtWwKHnNZotJu+ujBhAX/aDbHg
	M1ZMRx4JXak0Ni9UWHmsuKcjQSI7uVqeJOmefbUiXnQVT9EP6YAPMeW05qaPkspuCEJe
	Y8nqqms5tXFhUNxF27jn6MjB3DpgJW2z17KpBhHvHLmmpsjvM3HoYFEtJ4yC7o7grBK2
	DvaA==
MIME-Version: 1.0
X-Received: by 10.52.65.147 with SMTP id x19mr1001197vds.27.1365593967162;
	Wed, 10 Apr 2013 04:39:27 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 10 Apr 2013 04:39:27 -0700 (PDT)
In-Reply-To: <20130409200127.GF2474@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
Date: Wed, 10 Apr 2013 13:39:27 +0200
Message-ID: <CALbNGRQCDj76uszts=M1R8QSDfmsBRg-OweaiU9aYK51T3gmAA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: enrico.scholz@sigma-chemnitz.de, koen@dominion.thruhere.net,
	openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
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
X-List-Received-Date: Wed, 10 Apr 2013 11:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2013 at 10:01 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Tue, Mar 05, 2013 at 11:59:07PM +0100, Martin Jansa wrote:
>> On Tue, Mar 05, 2013 at 11:50:41PM +0100, Andreas M=C3=BCller wrote:
>> > On Tue, Mar 5, 2013 at 11:18 PM, Martin Jansa <martin.jansa@gmail.com>=
 wrote:
>> > > On Wed, Feb 13, 2013 at 09:25:34AM -0800, Khem Raj wrote:
>> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> > >
>> > > good old meta-systemd should now parse again,
>> > Thanks - will come back to test HEADs soon.
>>
>> But be aware that I've fixed only parsing of avahi and wpa-supplicant.
>>
>> I haven't tested it properly in runtime because my upgrade path is a bit
>> broken (because I was building images with khem's patches for a while to
>> test other stuff) and even clean build with failed to boot with
>> qemux86-64 and I don't have time to debug it now.
>>
>> > > I wont apply this 2 commits
>> > > until systemd discussion in oe-core is finished and future of
>> > > meta-systemd decided.
>> > >
>> > After systemd regression is worked around yocto 1.4 release regression
>> > is knocking at the door...
>>
>> yes :/
>>
>> If we need to maintain meta-systemd bbappends for upgrade path we can
>> also maintain them with PN-systemd packages and good old systemd bbclass=
.
>
> Khem pinged me about this patch, so here are my thoughts:
>
> PN-systemd discussion in oe-core haven't moved a bit since this patch
> was proposed, I think we have 2-3 options, lets vote about meta-systemd f=
uture.
>
> 1) keep PN-systemd separation in meta-systemd and fixup .bbappends to
> resolve issues created by oe-core (I've fixed some issues, but still a
> lot of issues in postinst/postrm/prerm scripts when both inits are
> sharing the same PN)
>
> 2) give up on clean separation of PN-<init> and provide upgrade path
> from PN-systemd to PN (mostly done by these 2 commits from khem).
>
> 3) give up on clean separation of PN-<init> and upgrade path (there are
> many issues in other parts of oe-core, so upgrade path from danny to
> dylan doesn't look usable.
>
> A) migrate existing .bbappends to their recipes to .bb files and
> remove this layer. Any volunteer for that?
>
> My vote: 3) + A) later in 1.5
> I guess we're all too busy to implement 1), upgrade path would be nice,
> but is all-or-nothing, doesn't make much sense to spend a lot of time
> fixing every issue from PN-systemd when there are issues from other
> recipes we're not going to fix by .bbappends in meta-oe.
>
> Vote required from Khem, Koen, Andreas, Enrico, Otavio
> Vote welcome from other meta-systemd contributors
>
tend also to 3) + A) but I would prefer to have it as one transaction.
Otherwise we might face another upgrade path breakage. I know this
will cause questions as who and when...

Andreas


