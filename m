Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1Posd8-00068f-Pp
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 08:13:54 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 3CCE0491289
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 08:12:48 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 08:12:48 +0100
Message-ID: <4D58D5EF.6000807@dresearch.de>
Date: Mon, 14 Feb 2011 08:12:47 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 14 Feb 2011 07:12:48.0325 (UTC)
	FILETIME=[95B5AF50:01CBCC16]
Subject: bitbake exit codes?
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
X-List-Received-Date: Mon, 14 Feb 2011 07:13:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

While setting up Jenkins/Hudson jobs for the testing-release-2011.03 bran=
ch based on the testscript.sh from the contrib subdir i hit the following=
 problem.

bitbake (1.10.2) finally reports "NOTE: Task Summary: Attempted 1217 task=
s of which 0 didn't need to be rerun and 0 failed.". So it seems that the=
 build was successful. But bitbake did not return 0 but 1. So Jenkins mar=
ks the build as failed.

I guess the exit code 1 is coming from some QA Issues. How do we handle t=
hat if if my guess is right?

Do we mark such a build run as successful in our test matrix?

Has bitbake a defined set of exit codes that we can evaluate in the tests=
cript.sh?

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



