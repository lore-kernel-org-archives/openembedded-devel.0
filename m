Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PnUCB-0000sP-Pu
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 11:56:19 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 655A4491292
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 11:55:14 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 10 Feb 2011 11:55:14 +0100
Message-ID: <4D53C412.9090804@dresearch.de>
Date: Thu, 10 Feb 2011 11:55:14 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 10 Feb 2011 10:55:14.0375 (UTC)
	FILETIME=[FEEC4D70:01CBC910]
Subject: base-files vs. FHS-2.3
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
X-List-Received-Date: Thu, 10 Feb 2011 10:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

While dealing with the /var subdirs i hit some differences between Filesy=
stem Hierarchy Standard (current FHS-2.3) and the base-files package.

One point is that /var/tmp is symlinked to volatile/tmp but according to =
the standard this dir contains "Temporary files *preserved between system=
 reboots* ".

Also /var/cache is symlinked to volatile/cache but the standard describes=
 "The data must remain valid between invocations of the application *and =
rebooting the system.* " what i would read in the way that /var/cache sho=
uld be persistent too.

May be there are other differences.

In my opinion the symlinking in base-files is buggy and should be fixed. =
Or am i wrong here?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



