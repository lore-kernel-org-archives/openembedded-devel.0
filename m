Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0FsS-0006Nw-D4
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Sep 2010 17:44:29 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id DB2B5491278
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Sep 2010 17:15:13 +0200 (CEST)
Received: from bfg9000.intern.dresearch.de ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 27 Sep 2010 17:15:13 +0200
Message-ID: <4CA0B4FF.3050601@dresearch.de>
Date: Mon, 27 Sep 2010 17:15:11 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100915 Lightning/1.0b1 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 27 Sep 2010 15:15:13.0580 (UTC)
	FILETIME=[C89816C0:01CB5E56]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: falloc.h missing: util-linux-ng-2.17 build fails against 2.6.24
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
X-List-Received-Date: Mon, 27 Sep 2010 15:44:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello *.*,

When building the latest trunk against kernel 2.6.24 the build fails for=20
at least util-linux-ng-2.17 because the kernel header file "falloc.h" is=20
not present:

|
| fallocate.c:40:54: error: linux/falloc.h: No such file or directory
| fallocate.c: In function 'main':
| fallocate.c:132: error: 'FALLOC_FL_KEEP_SIZE' undeclared (first use in=20
this function)
| fallocate.c:132: error: (Each undeclared identifier is reported only on=
ce
| fallocate.c:132: error: for each function it appears in.)
| make[2]: *** [fallocate.o] Error 1
| make[2]: *** Waiting for unfinished jobs....


This happens because linux-libc-headers for 2.6.24 does not provide=20
falloc.h - although it's present in the kernel it is not exported during=20
make headers_install.

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


