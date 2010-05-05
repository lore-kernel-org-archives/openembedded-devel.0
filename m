Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1O9fzJ-000661-2l
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 16:54:31 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 45265491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 May 2010 16:50:27 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 5 May 2010 16:51:27 +0200
Message-ID: <4BE185C7.50305@dresearch.de>
Date: Wed, 05 May 2010 16:50:47 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE13C20.1010902@dresearch.de>	<20100505094242.GF2444@xora-desktop.xora.org.uk>	<4BE141CA.30904@dresearch.de>
	<1273053926.18119.331.camel@mill.internal.reciva.com>
In-Reply-To: <1273053926.18119.331.camel@mill.internal.reciva.com>
X-OriginalArrivalTime: 05 May 2010 14:51:27.0121 (UTC)
	FILETIME=[7075F810:01CAEC62]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux vs. linux-libc-headers?
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
X-List-Received-Date: Wed, 05 May 2010 14:54:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 05.05.2010 12:05, wrote Phil Blundell:
>>> I thought glibc was supposed to gracefully fall back on missing sysca=
lls?
>>
>> May be, but not satisfactorily.
>>
>> E.g. we've seen that g_file_monitor (from glib) falls back to
>> polling each second instead of using inotify_init.
>=20
> That sounds like it's just a bug in glibc.  I guess you should fix it
> there.

As mentioned before that's just one problem and we have some more.
I do not have time and knowledge to hunt and fix them all.

So for the moment i would prefer to work with linux-libc-headers
of version 2.6.24.

But what's the recommended way to select them in OE/Angstrom?

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



