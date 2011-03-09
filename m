Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PxGsJ-00016X-Si
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Mar 2011 11:44:15 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id B432B27C403;
	Wed,  9 Mar 2011 11:42:41 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 9 Mar 2011 11:42:41 +0100
Message-ID: <4D7759A1.4060802@dresearch.de>
Date: Wed, 09 Mar 2011 11:42:41 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 09 Mar 2011 10:42:41.0801 (UTC)
	FILETIME=[B781DF90:01CBDE46]
Subject: u-boot-utils and UBOOT_MACHINE?
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
X-List-Received-Date: Wed, 09 Mar 2011 10:44:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The current recipe for the u-boot-utils (u-boot-utils_1.2.0.bb) contains =
this:

------------------->snip<--------------------
do_configure() {
        oe_runmake Sandpoint8240_config
}
------------------->snip<--------------------

This seems to be very machine specific.

I'm not a u-boot-tools specialist. If the tools are not machine specific =
and the above line is just a placeholder, this should be documented.

But if the tools itself are machine specific i believe there should be so=
mething like

------------------->snip<--------------------
do_configure() {
        oe_runmake ${UBOOT_MACHINE}
}
------------------->snip<--------------------

and package build should go into machine specific workdir. Right?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



