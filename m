Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0yi8-0004ho-3h
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 17:36:48 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id C4C04491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 17:36:37 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 17:36:37 +0200
Message-ID: <4CA35CF8.3050508@dresearch.de>
Date: Wed, 29 Sep 2010 17:36:24 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285771725-32231-1-git-send-email-t.fromm@dresearch.de>	<4CA353EE.8040605@freyther.de>	<4CA3563A.9030905@dresearch.de>
	<4CA3594D.4090403@freyther.de>
In-Reply-To: <4CA3594D.4090403@freyther.de>
X-OriginalArrivalTime: 29 Sep 2010 15:36:37.0605 (UTC)
	FILETIME=[1AC24150:01CB5FEC]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qemu-0.12.5: add ncurses, gnutls dependencies
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
X-List-Received-Date: Wed, 29 Sep 2010 15:36:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello Holger,

>> Anyway, qemu _does_ link against gnutls and ncurses at some point in i=
ts build
>> process. So why not provide these dependencies? I guess it could be im=
portant
>> for a target build, too.
>
> true, we tend to add circular deps though (e.g. when I tried to enable =
SDL
> mode), so it would be nice if you could test with a clean rebuild.

I did. I wouldn't submit a patch without testing it in advance. We run=20
our own platform - hipox - and we use Angstrom 2008.1 on that.=20
Everything built nicely from scratch.

I'd be happy for some pointers / info if there's a special platform /=20
target / distribution I should build for a clean "from scratch" test buil=
d.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Developer
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228   mailto:t.fromm@dresearch.de
Fax: +49 (30) 515 932 77    http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB:54412
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642
Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle


