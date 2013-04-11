Received: from mail-vc0-f172.google.com ([209.85.220.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UQ5Oi-0001ee-2O
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 02:29:55 +0200
Received: by mail-vc0-f172.google.com with SMTP id gd11so894444vcb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 17:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=SUmibaLwkG0XtwWf4QLcigaAYsfbEZdfK0lJiqbAUWA=;
	b=q9wWv/az70GC/JoBXIMZhOC8bdbVgdJm1+hDB9OBxzyDRkU+E2c6MWO11WF2/8H7F6
	477uzKgWnHpW6dnKYOJe4uN9lcLLKVhUrKSDof3D/f5VcncuWCfdRfla7ZWKTS/cxbVy
	OfQKF6Hd/uitrKYXH2g0C81El7+eMudThCxGPlNAxsyKKJXrgQfb4Io/PQMaVn159oEc
	6ErXzHV4z+BleXU4xP6ane0Q0PZG3qKIzZ0JXJnIIcYYi1cQmeGqbqZyg9Jgd8X4Kzph
	pbwWDlmK8d4mmkvCt3pIia1lIR4lEzkW9o2ypSLPKlK0qt8PY4RT5ygxxLDnkHi5BgB7
	/bJQ==
MIME-Version: 1.0
X-Received: by 10.58.232.98 with SMTP id tn2mr3248294vec.57.1365639149506;
	Wed, 10 Apr 2013 17:12:29 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 10 Apr 2013 17:12:29 -0700 (PDT)
In-Reply-To: <20130409200127.GF2474@jama>
References: <1360776335-21633-1-git-send-email-raj.khem@gmail.com>
	<20130305221857.GA14869@jama>
	<CALbNGRRZFt3FgMCjyB8JN8Be1w_-Vdgnq=2nZy3tyUM0TxdFpA@mail.gmail.com>
	<20130305225907.GB14869@jama> <20130409200127.GF2474@jama>
Date: Thu, 11 Apr 2013 02:12:29 +0200
Message-ID: <CALbNGRTq3D6XP=wLnMcd-LkFpF6id6AVQtBsHVdMS6GoxUwFYg@mail.gmail.com>
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
X-List-Received-Date: Thu, 11 Apr 2013 00:29:56 -0000
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
A bit off-topic and mentioned here & there: I am working on
network-manager(-applet) 0.9.8.0 update and xinput-calibrator. I could
add 3) + A) for them if agreed. Hope to send them beginning of next
week.

Anderas


