Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@DResearch.DE>) id 1NhHnS-0006SG-5F
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Feb 2010 08:24:41 +0100
Received: from exchange.intern.dresearch.de (unknown [192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id EA2DA49128C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Feb 2010 08:22:01 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.3959); Tue, 16 Feb 2010 08:22:17 +0100
Message-ID: <4B7A47A1.3090803@dresearch.de>
Date: Tue, 16 Feb 2010 08:22:09 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 16 Feb 2010 07:22:17.0580 (UTC)
	FILETIME=[C50FDAC0:01CAAED8]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@DResearch.DE
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: install problem with attr-2.4.44
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
X-List-Received-Date: Tue, 16 Feb 2010 07:24:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Install stage for attr-2.4.44 fails for me with:

| make -C attr install
| make[1]: Entering directory `/home/DRESEARCH/production/METABUILD/20100215190003-hydraip-build-7715/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r1/attr-2.4.44/attr'
| ../include/install-sh -o production -g domain users -m 755 -d /home/DRESEARCH/production/METABUILD/20100215190003-hydraip-build-7715/OE/tmp.5/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r1/image/usr/bin
| cp: cannot stat `users': No such file or directory

The actual problem seems to be the unquoted group name 'domain users'.

But why should be files installed in
tmp.5/work/armv5te-angstrom-linux-gnueabi/attr-2.4.44-r1/image/usr/bin
with host system groups rights?

Steffen



