Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HlkJi-0001he-P1
	for openembedded-devel@openembedded.org; Wed, 09 May 2007 13:26:49 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l49BQ8Lr017632 for <openembedded-devel@openembedded.org>;
	Wed, 9 May 2007 13:26:08 +0200
Message-ID: <4641AFCB.6080203@dominion.kabel.utwente.nl>
Date: Wed, 09 May 2007 13:26:03 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <464130FC.7030008@gmail.com>	<02827798.20070509123821@gmail.com>	<4641A311.4030907@klever.net>	<4641A5A2.8050108@dominion.kabel.utwente.nl>
	<4641A902.6020506@gmail.com>
In-Reply-To: <4641A902.6020506@gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: QA for intentionally unpackaged files
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
X-List-Received-Date: Wed, 09 May 2007 11:27:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Junqian Gordon Xu schreef:
> Koen Kooi wrote:
>> Or we could patch package.bbclass[1] to do:
>>
>> PACKAGES += "${PN}-leftovers"
>> FILES_${PN}-leftovers = "/"
>>
>> I'm not sure if that works, but if it does, we would be able to spot leftovers more easily
>> by looking at deploy.
> 
> Again, how do you know which one is "intentionally" left-over vs. which 
> one is not?

I can't think of a valid reason for not packaging files.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGQa/LMkyGM64RGpERAjF7AJkBFh9SE86gjvybHZ7PRwc0+Cl2qwCcDV1h
tStk9ih9NSv558uCHvxA4G8=
=caUf
-----END PGP SIGNATURE-----


