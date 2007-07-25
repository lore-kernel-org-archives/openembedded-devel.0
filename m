Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IDe9M-0005jd-18
	for openembedded-devel@openembedded.org; Wed, 25 Jul 2007 12:31:24 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6PAU7j1017614 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2007 12:30:07 +0200
Message-ID: <46A7262F.1080406@dominion.kabel.utwente.nl>
Date: Wed, 25 Jul 2007 12:30:07 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <E1IDL1e-0002ro-9i@linuxtogo.org>	<46A60832.30203@dominion.kabel.utwente.nl>
	<46A7230E.6000707@kernelconcepts.de>
In-Reply-To: <46A7230E.6000707@kernelconcepts.de>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: mtn disapprove d7758e2637918ff4035244d64fb7227f6cf833ad, was Re: [oe-commits] org.oe.dev phoneserver: Add patch for FIC GTA01	support.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2007 10:31:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Florian Boor schreef:
> Hi,
> 
> 
> Koen Kooi schrieb:
>> florian commit schreef:
>>
>>> +PACKAGE_ARCH = "${MACHINE}"
>> This has to stop, OE is usable without setting MACHINE. The correct form is either
>>
>> PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> thanks for the hint.
> 
> For these trivial changes that do not break much I would really like to see if
> people do not disapprove    the whole patch but just go ahead and fix the
> problem - that is way more productive.

You are right that it's more productive to fix small errors than to disapprove, but:
I did that the first few times with PACKAGE_ARCH = "${MACHINE}", and people still keep
adding it, so now I'm doing dissaprove + mail to oe-devel to raise awareness.
Fixing errors afterwards is only productive if people learn from it and stop making the
same error again, which wasn't the case here.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGpyYvMkyGM64RGpERAgw7AJ9tKipgz+vizFvVePbq1/HBWJs+LwCgsu6R
DN165yNkXzUHhUvuzoCmJEE=
=dO8M
-----END PGP SIGNATURE-----


