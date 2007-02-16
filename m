Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HIATy-0006gL-7m
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 22:19:09 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1GLJ1Lr019212; Fri, 16 Feb 2007 22:19:01 +0100
Message-ID: <45D61FC6.2020802@dominion.kabel.utwente.nl>
Date: Fri, 16 Feb 2007 22:19:02 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: Harald Welte <laforge@openmoko.org>
References: <45D5F14F.1050602@dominion.kabel.utwente.nl>
	<20070216210211.GH10999@prithivi.gnumonks.org>
In-Reply-To: <20070216210211.GH10999@prithivi.gnumonks.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: RFC: making uboot safe for multimachine and agree on one spelling
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
X-List-Received-Date: Fri, 16 Feb 2007 21:19:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Harald Welte schreef:
> On Fri, Feb 16, 2007 at 07:00:47PM +0100, Koen Kooi wrote:
>  
>> After spending some time going trough u-boot recipes trying to make sense of its
>> buildsystem, I noticed some strange problems and inconsistencies.
>>
>> First the easy part: we need *one* spelling for u-boot, instead of uboot, u-boot, u-bot,
>> etc. What is the preferred one nowadays?
> 
> u-boot is the official name, so I would recommend to go for that (even
> though I hate hyphens inside project names)
> 
>> Second: it seems that the 'mkimage' tool is at least arch speficic (at worst
>> board-specific), so uboot recipes should install it to
>> ${STAGING_NATIVE_DIR}/mkimage.u-boot.${MACHINE_ARCH}
> 
> are you sure it's arch specific? 


I'm not sure, but mkimage refuses to build with all kind of missing definitions if you
don't have a board configured. It could be some safeguard to force people to have a board
definition.

> I'm quite surprised about that, since
> the uImage format contains a header indicating the architecture, doesn't
> it?
> 
> If it really uses a different binary format for each arch, yes, we
> should change it.  'mkuimage.${MACHINE_ARCH}' sounds like a more user
> friendly name, though.

And it avoid the hyphens :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF1h/GMkyGM64RGpERAro9AJsGhesMzZ7CV8ooPz9L25+wQVdEJQCfQJ66
KUR4UJy42goEBy1tAkjBtVE=
=bM7g
-----END PGP SIGNATURE-----


