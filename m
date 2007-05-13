Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HnHMM-0003dT-KU
	for openembedded-devel@openembedded.org; Sun, 13 May 2007 18:55:50 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4DGtlLr024862 for <openembedded-devel@openembedded.org>;
	Sun, 13 May 2007 18:55:47 +0200
Message-ID: <46474315.1070207@dominion.kabel.utwente.nl>
Date: Sun, 13 May 2007 18:55:49 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <464613B3.8090003@dominion.kabel.utwente.nl>	<46461B73.8070900@trolltech.com>	<46461D72.4020206@dominion.kabel.utwente.nl>	<46462BDD.6000302@dominion.kabel.utwente.nl>
	<c384c5ea0705130945k266d8bccw4f890d99d9997e52@mail.gmail.com>
In-Reply-To: <c384c5ea0705130945k266d8bccw4f890d99d9997e52@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: uclibc 0.9.29 recipe
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
X-List-Received-Date: Sun, 13 May 2007 16:55:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> Hello Koen,
> 
> On 5/12/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> Koen Kooi schreef:
>> To add support for your favourite machine: use uClibc.distro as .config,
>> configure uclibc for the target you want, save the top 2 blocks of .config (cpu
>> and arch) to uClibc.distro  in uclibc-0.9.29/<machine/uClibc.machine
>>
>> The recipe is by no means perfect, so any help is welcome.
>>
> As often, you laid the groundworks, which is often more important than
> the make-it-perfect stage.
> 
> My hands are twitching to create a clean 0.9.29 .bb that more smartly
> configures the library matching the OpenEmbedded configuration. But
> let's hack the current setup first.

It would be nice to set archicture using TARGET_ARCH, endiannes with the info from
siteinfo.bbclass and the the FPU with TARGET_FPU. I bet there are some more options that
could be autoconfigured.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGR0MVMkyGM64RGpERAmpLAJ40KalkcxFc1oOFNSfOrMB7dypN7gCZAeg4
4C42BTmMvEcIiALtDpSx/eY=
=yp3m
-----END PGP SIGNATURE-----


