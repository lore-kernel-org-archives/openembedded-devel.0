Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P09MC-0003X5-U4
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 10:46:45 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 230EE491278;
	Mon, 27 Sep 2010 10:46:37 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 27 Sep 2010 10:46:36 +0200
Message-ID: <4CA059F2.5090509@dresearch.de>
Date: Mon, 27 Sep 2010 10:46:42 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.9) Gecko/20100915 Lightning/1.0b2 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285230784-16893-1-git-send-email-sledz@dresearch.de>	<4CA04557.5070207@dresearch.de>
	<AANLkTimNJWJz5cbMSWd+ChNxTtB9OZw_vAeoHVqNbeBq@mail.gmail.com>
In-Reply-To: <AANLkTimNJWJz5cbMSWd+ChNxTtB9OZw_vAeoHVqNbeBq@mail.gmail.com>
X-OriginalArrivalTime: 27 Sep 2010 08:46:36.0994 (UTC)
	FILETIME=[7ED36A20:01CB5E20]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] linux-2.6.24: avoid kernel error if ubifs superblock read fails
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
X-List-Received-Date: Mon, 27 Sep 2010 08:46:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 27.09.2010 09:40, schrieb Frans Meulenbroeks:
>>> * .get_sb is called on mounts with automatic fs detection too, so thi=
s
>>>   function should not print an error if it cannot read the superblock
>>>   (new behaviour conforms the other fs types)
>>> ...
>
> Hm, I have some concerns:
>=20
> the first concern is that mainline 2.6.34 still has the code you have d=
eleted.
> I'd expect that others would have bumped into this too and that it
> would have been fixed this upstream.
> Since it isn't, chances are that upstream might have fixed the autofs
> detection in a different way.  If they do this differently maybe we
> should backport that solution.

I've suggested the same patch at the LKML and informed the UBIFS authors.=
 But i do believe because of it's "low prio" it will need some time to go=
 into the mainline.

> the second concern is that you fix it for a single version. If we feel
> this patch is needed, I would suggest applying the patch to all linux
> recipes.

Yes, that's true. I'll try to create a new patch.

> and the 3rd concern is that I am not too sure whether you do not
> remove a message that in other cases would be useful.

I did not found any other filesystem printing out such a message at this =
level.

Steffen

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



