Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HTwwv-00046Q-LF
	for openembedded-devel@openembedded.org; Wed, 21 Mar 2007 10:17:41 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l2L9HSLr019643 for <openembedded-devel@openembedded.org>;
	Wed, 21 Mar 2007 10:17:28 +0100
Message-ID: <4600F825.6070505@dominion.kabel.utwente.nl>
Date: Wed, 21 Mar 2007 10:17:25 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HTlXW-0008Tg-CR@linuxtogo.org>	<460053D9.8020008@dominion.kabel.utwente.nl>
	<4600EED5.6020400@kernelconcepts.de>
In-Reply-To: <4600EED5.6020400@kernelconcepts.de>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev angstrom-e: add e-image and tasks for angstrom
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
X-List-Received-Date: Wed, 21 Mar 2007 09:17:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Florian Boor schreef:
> Hi,
> 
> Koen Kooi schrieb:
>> justinp commit schreef:
>>>> angstrom-e: add e-image and tasks for angstrom
>> And we were trying to stop using deprecated stuff (e.g. gpe-bootsplash)

>> and move them out of packages/angstrom/ ....
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> Wouldn't this be a reason to fix these packages instead of deleting them? We
> even have a pile of packages that do not even work and that are not removed.

Having 1:1 copies of tasks is insane. One of the aims of angstrom images is to reuse as
much existing tasks as possible, put since Justin never bothered to ask we now have more
crap in packages/angstrom instead of less. Ah well, easily solved with a local diff.


> But anyway why is gpe-bootsplash deprecated?

It's slow, doesn't support animation, and angstrom uses psplash.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGAPglMkyGM64RGpERAhR5AKCbJzn5xqbyLV5JreHFN/Clexc+kgCgon4T
9MXEjJzVFye8c4KowMJVhCE=
=uGOB
-----END PGP SIGNATURE-----


