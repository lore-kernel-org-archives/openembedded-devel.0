Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PovrO-00022D-6w
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 11:40:50 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7B4CD491289;
	Mon, 14 Feb 2011 11:39:43 +0100 (CET)
Received: from [127.0.0.1] ([10.32.10.2]) by exchange.intern.dresearch.de with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Feb 2011 11:39:43 +0100
Message-ID: <4D59066F.1040805@dresearch.de>
Date: Mon, 14 Feb 2011 11:39:43 +0100
From: Steffen Sledz <sledz@dresearch.de>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; de;
	rv:1.9.2.13) Gecko/20101207 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D58D5EF.6000807@dresearch.de>
	<AANLkTi=4i_m8J4qFCwntdo-qb4CHn98UH+kuz4O=zcgT@mail.gmail.com>
In-Reply-To: <AANLkTi=4i_m8J4qFCwntdo-qb4CHn98UH+kuz4O=zcgT@mail.gmail.com>
X-OriginalArrivalTime: 14 Feb 2011 10:39:43.0506 (UTC)
	FILETIME=[7DBBF720:01CBCC33]
Subject: Re: bitbake exit codes? (testing-release-2011.03 build results)
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
X-List-Received-Date: Mon, 14 Feb 2011 10:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am 14.02.2011 09:11, schrieb Frans Meulenbroeks:
> 2011/2/14 Steffen Sledz <sledz@dresearch.de>:
>> While setting up Jenkins/Hudson jobs for the testing-release-2011.03 b=
ranch based on the testscript.sh from the contrib subdir i hit the follow=
ing problem.
>>
>> bitbake (1.10.2) finally reports "NOTE: Task Summary: Attempted 1217 t=
asks of which 0 didn't need to be rerun and 0 failed.". So it seems that =
the build was successful. But bitbake did not return 0 but 1. So Jenkins =
marks the build as failed.
>>
>> I guess the exit code 1 is coming from some QA Issues. How do we handl=
e that if if my guess is right?
>>
>> Do we mark such a build run as successful in our test matrix?
>>
>> Has bitbake a defined set of exit codes that we can evaluate in the te=
stscript.sh?
>>
>> Steffen
>
> There have been a few threads on this in the past.
> One of the ways (and maybe the best one) to get around this is to fix
> the QA errors.

Of course. You are right.

But for the moment the question is: "Do we mark such a builds as successf=
ul in our test matrix or not?"

Steffen

--=20
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@DResearch.de
Fax: +49 30 515932-299
Gesch=E4ftsf=FChrer: Dr. Michael Weber, Werner M=F6gle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058



