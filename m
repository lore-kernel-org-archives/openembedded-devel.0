Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0yGI-0004T0-1w
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 17:08:04 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 88B0D491278
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Sep 2010 17:07:51 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 29 Sep 2010 17:07:51 +0200
Message-ID: <4CA3563A.9030905@dresearch.de>
Date: Wed, 29 Sep 2010 17:07:38 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285771725-32231-1-git-send-email-t.fromm@dresearch.de>
	<4CA353EE.8040605@freyther.de>
In-Reply-To: <4CA353EE.8040605@freyther.de>
X-OriginalArrivalTime: 29 Sep 2010 15:07:51.0377 (UTC)
	FILETIME=[15D8C410:01CB5FE8]
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
X-List-Received-Date: Wed, 29 Sep 2010 15:08:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello, Holger,

>> QEmu build breaks occassionally because some of the libraries required
>> have not been built at the time qemu is being built. I ran into proble=
ms
>> with the "qemu-native" build which tried to link against host librarie=
s
>> and subsequently failed:
>
>> | /usr/lib/gcc/x86_64-linux-gnu/4.4.3/../../../../lib/libgnutls.so: un=
defined reference to `gcry_cipher_setkey@GCRYPT_1.2'
>> | /usr/lib/gcc/x86_64-linux-gnu/4.4.3/../../../../lib/libgnutls.so: un=
defined reference to `gcry_cipher_setiv@GCRYPT_1.2'
>
> hmm no... the bug is more with libgnutls of your system not linking to =
gcrypt.
> I have this with JHBUILD building GNOME 3.x.

That's the point: qemu is not supposed to link against my host=20
libraries. It should use OpenEmbedded staging libraries for this. Also,=20
the recipe explicitly points the qemu build to the native staging=20
"includes" directory already. After adding gnutls and ncurses to the=20
dependencies qemu linked the native staging libs as expected, and the=20
build is now successful.

Anyway, qemu _does_ link against gnutls and ncurses at some point in its=20
build process. So why not provide these dependencies? I guess it could=20
be important for a target build, too.

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


