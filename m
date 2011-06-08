Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QUHEe-00043P-5Q for openembedded-devel@lists.openembedded.org;
	Wed, 08 Jun 2011 13:47:44 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p58BiQT3002613
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Jun 2011 13:44:27 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 8 Jun 2011 13:44:21 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 8 Jun 2011 13:44:21 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE5183@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Amend recipes which do not contain a (new) target machine in
	COMPATIBLE_MACHINE 
Thread-Index: Acwl0WhgwOjFExfAQTyBi6QdXNqSPQ==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 08 Jun 2011 11:44:21.0311 (UTC)
	FILETIME=[682D8CF0:01CC25D1]
Subject: Amend recipes which do not contain a (new) target machine in COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 08 Jun 2011 11:47:44 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I added a new machine definition for our hardware (hardware is almost
like beagleboard xM) and want to add the specific patches and
configurations by using the amend class in my additional layer.

If I amend the kernel recipe (linux-omap-psp_2.6.32.bb) for machines
contained in COMPATIBLE_MACHINE, the amend.inc is found and my
amendments are done well (for omap3evm and beagleboard).

If I want to build the kernel for my machine, the kernel recipe
linux-omap-psp_2.6.32.bb was skipped in case of not containing my new
machine in COMPATIBLE_MACHINE and the wrong kernel is build.

I need only a view additions to the linux-omap-psp-2.6.32 kernel so I
don't want to copy the original recipe into my layer and change it. I
have to build my system for omap3evm, beagleboard and our specific
hardware.

Is there a possibility to avoid the skipping of the kernel recipe for a
machine not contained in COMPATIBLE_MACHINE ? Or add the machine for
amending somewhere ?

I use the 2011.03 release and bitbake version 1.10.2.

Regards
Wolfgang


