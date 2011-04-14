Received: from cluster-a.mailcontrol.com ([85.115.52.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Daniele.Bosi@mta.it>) id 1QAGPk-0006Kb-OI
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Apr 2011 08:52:37 +0200
Received: from mail.mta.it (mail.mta.it [91.143.207.180])
	by rly22a.srv.mailcontrol.com (MailControl) with ESMTP id
	p3E6o2DV024790 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Apr 2011 07:50:10 +0100
Received: from mta-digicas.MTA.INT ([172.26.10.13]) by mail.mta.it with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 14 Apr 2011 08:50:05 +0200
Received: from mta-digimail.MTA.INT ([172.26.10.14]) by mta-digicas.MTA.INT
	([172.26.10.13]) with mapi; Thu, 14 Apr 2011 08:50:05 +0200
From: Bosi Daniele <Daniele.Bosi@mta.it>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Apr 2011 08:50:04 +0200
Thread-Topic: [oe] Fwd: arm-angstrom-linux-gnueabi-gcc: No such file or
	director
Thread-Index: Acv6NY6Q0i6LiqQESi28yedqdIXtEgAOOMqA
Message-ID: <531B6536C9F737458807DF75064873C801CE0CD6351A@mta-digimail.MTA.INT>
In-Reply-To: <BANLkTimufsQ4foAp3Tog17dfRZyizAZRsw@mail.gmail.com>
Accept-Language: it-IT
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: it-IT
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Apr 2011 06:50:05.0386 (UTC)
	FILETIME=[2FB4F2A0:01CBFA70]
X-Scanned-By: MailControl A_10_80_00 (www.mailcontrol.com) on 10.65.0.132
Subject: Re: arm-angstrom-linux-gnueabi-gcc: No such file or director
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
X-List-Received-Date: Thu, 14 Apr 2011 06:52:37 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Alberto,
it seems like your building system can't find your arm-angstrom-linux-gnuea=
bi-gcc compiler.
First of all take a look into your system to see if the arm-angstrom-linux-=
gnueabi-gcc file is present. If the answer is true then check with the comm=
and

which arm-angstrom-linux-gnueabi-gcc

if it is into your environment. If it isn't into the environment try to mak=
e a link to it into a path directory (/usr/local/bin for example) and try a=
gain to build with bitbake.

But if you are into the worst case that is the file is missing try the foll=
owing commands:
bitbake -c clean x11-image
bitbake x11-image

If this doesn't work maybe you have to clean more rules (like task-boot and=
 task-base) or clean the full tmp.1 directory (but I'm not really sure abou=
t that), surely do a backup before that.

Bye Daniele




-----Messaggio originale-----
Da: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-=
devel-bounces@lists.openembedded.org] Per conto di Alberto Carrozzo
Inviato: gioved=EC 14 aprile 2011 1.50
A: openembedded-devel@lists.openembedded.org
Oggetto: [oe] Fwd: arm-angstrom-linux-gnueabi-gcc: No such file or director

hello you all... I'm from Italy so sorry for my english... :) OK... I have =
a
problem: I'm developing a program on Angstrom and I'm using Ubuntu to cross
compile it with bitbake... last week I had to format ubuntu so I had a
backup of my oe folder and have replaced it after... now, all look that
work, if i do bitbake x11-image it work but... if i try to cross compile my
helloworld sample it give me the following error:
______________________________
arm-angstrom-linux-gnueabi-gcc: No such file or directory
ERROR: Function do_compile failed
______________________________

what's happened?
someone can help me?

--
He walks among us, but he is not one of us - JS



--
He walks among us, but he is not one of us - JS
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


