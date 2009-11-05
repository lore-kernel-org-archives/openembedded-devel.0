Received: from [89.151.113.230] (helo=srv02.nortechonline.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Simon.Hodgson@nortechonline.co.uk>)
	id 1N69xM-0005xi-Ti for openembedded-devel@lists.openembedded.org;
	Thu, 05 Nov 2009 22:33:29 +0100
Received: from srv02.nortechonline.net ([89.151.113.230]) by
	srv02.nortechonline.net ([89.151.113.230]) with mapi; Thu, 5 Nov 2009
	21:22:21 +0000
From: "Hodgson, Simon" <Simon.Hodgson@nortechonline.co.uk>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 5 Nov 2009 21:20:43 +0000
Thread-Topic: [oe] Mono
Thread-Index: AcpdrIzOOLNtgTFQQuaBTG9qEgNZfgAsUg7R
Message-ID: <B44D4D5BF344094DABB900C4E0F6E3533945A88B83@srv02.nortechonline.net>
References: <B44D4D5BF344094DABB900C4E0F6E3533945A88B7F@srv02.nortechonline.net>,
	<19c1b8a90911041606w78796323p8077fc6f6752fc90@mail.gmail.com>
In-Reply-To: <19c1b8a90911041606w78796323p8077fc6f6752fc90@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 89.151.113.230
X-SA-Exim-Mail-From: Simon.Hodgson@nortechonline.co.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mono
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
X-List-Received-Date: Thu, 05 Nov 2009 21:33:29 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

_______________________________________
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] On Behalf Of Khem Raj [raj.khem@gmail.com]
Sent: 05 November 2009 00:06
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Mono

On Wed, Nov 4, 2009 at 12:11 PM, Hodgson, Simon
<Simon.Hodgson@nortechonline.co.uk> wrote:
> I've built Mono for OpenEmbedded to run on an arm processor. But when I t=
ry to run just a simple Hello World test I get:
>
> mini-codegen.c:1073:mono_local_regalloc: assertion failed: (ins->dreg !=
=3D -1)
>
> Does anyone have any suggestion as to what I might be doing wrong?
>
> mono -V produces:
> root@at91sam9g20ek:~# mono -V
> Mono JIT compiler version 2.4.2.3 (tarball Tue Nov  3 03:08:58 EST 2009)
> Copyright (C) 2002-2008 Novell, Inc and Contributors. www.mono-project.co=
m
>        TLS:           normal
>        GC:            Included Boehm (with typed GC)
>        SIGSEGV:       normal
>        Notifications: epoll
>        Architecture:  armel,vfp
>        Disabled:      none
>
> Is there anymore info perhaps I can provide?

Can you apply the attached patch then rebuild mono and retry your test.

Thanks

-Khem


Sorry for being a bit dense, but where should I apply this? It appears to p=
atch the receipe and the mono source, is that correct? Do I need to run pat=
ch twice in each directory?

Thanks


Simon=


