Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OAHaJ-0006Ik-Lk
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 May 2010 09:02:56 +0200
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 80497491282;
	Fri,  7 May 2010 08:59:08 +0200 (CEST)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 7 May 2010 09:00:13 +0200
Message-ID: <4BE3BA38.1010102@dresearch.de>
Date: Fri, 07 May 2010 08:59:04 +0200
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.1.9) Gecko/20100317 Lightning/1.0b1 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4BE185C7.50305@dresearch.de>	<1273140949-14699-1-git-send-email-sledz@dresearch.de>	<hru6f7$4qk$1@dough.gmane.org>
	<4BE29E46.2000600@dresearch.de>
In-Reply-To: <4BE29E46.2000600@dresearch.de>
X-OriginalArrivalTime: 07 May 2010 07:00:13.0511 (UTC)
	FILETIME=[F0E6F570:01CAEDB2]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <k.kooi@student.utwente.nl>
Subject: Re: [PATCH] angstrom-2008.1: use linux-libc-headers 2.6.24 for hipox machine
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
X-List-Received-Date: Fri, 07 May 2010 07:02:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>>  #This is unrelated to the kernel version, but userspace apps (e.g. HA=
L) require a recent version to build against
>> -PREFERRED_VERSION_linux-libc-headers 	=3D "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers       ?=3D "2.6.31"
>> +PREFERRED_VERSION_linux-libc-headers_hipox ?=3D "2.6.24"
>
> NACK, that creates undefined behaviour for multimachine builds.

-PREFERRED_VERSION_linux-libc-headers 	=3D "2.6.31"
+PREFERRED_VERSION_linux-libc-headers       =3D "2.6.31"
+PREFERRED_VERSION_linux-libc-headers_hipox =3D "2.6.24"

Is this better?

--=20
Steffen Sledz
DResearch Digital Media Systems GmbH
Otto-Schmirgal-Str.3, D-10319 Berlin, Germany
Tel: +49 (30) 515932237 mailto:sledz@DResearch.DE
Fax: +49 (30) 515932299 http://www.DResearch.DE
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 54412;
Ust.-IDNr. DE169013825; WEEE Reg.-Nr. DE 85995642



