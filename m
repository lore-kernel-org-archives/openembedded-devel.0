Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PpINE-0004hi-Ho
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Feb 2011 11:43:12 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 30FC1491283
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Feb 2011 11:41:58 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 15 Feb 2011 11:41:58 +0100
Message-ID: <4D5A5871.7000005@dresearch.de>
Date: Tue, 15 Feb 2011 11:41:53 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 15 Feb 2011 10:41:58.0186 (UTC)
	FILETIME=[F86C40A0:01CBCCFC]
Subject: linux-libc-headers version (reloaded)
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
X-List-Received-Date: Tue, 15 Feb 2011 10:43:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

While doing some maintenance for our hipox machine i hit a problem which =
was discussed controversially a few months before on this ML[1] but was n=
ot solved completely in my opinion.

The basic question was if it is valid to use PREFERRED_VERSION_linux-libc=
-headers higher than the kernel version (like e.g angstrom-2008.1 does).

After some research on that topic i really believe this is not allowed. M=
y strongest argument is the kernel docu itself:

"Kernel headers are backwards compatible, but not forwards compatible.  T=
his
means that a program built against a C library using older kernel headers
should run on a newer kernel (although it may not have access to new
features), but a program built against newer kernel headers may not work =
on an
older kernel."[2]

Also i did not found a linux distribution providing kernel headers newer =
than the kernel (whilst there are some with kernel headers older than the=
 used kernel, e.g. openSUSE 11.3 with latest updates).

So i think the way the =C3=85ngstr=C3=B6m distribution handles this is wr=
ong. If PREFERRED_VERSION_linux-libc-headers is set to 2.6.31 no kernel o=
lder than 2.6.31 should be allowed to guarantee the full functionality of=
 all programs!

[1] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/32375>
[2] Documentation/make/headers_install.txt

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



