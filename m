Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GcfUd-0006xS-E0
	for openembedded-devel@openembedded.org; Wed, 25 Oct 2006 11:56:15 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9P9u5vD004898 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2006 11:56:06 +0200
Message-ID: <453F34B5.2070000@dominion.kabel.utwente.nl>
Date: Wed, 25 Oct 2006 11:56:05 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <453EAEE0.8020704@dominion.kabel.utwente.nl>	<200610250859.19316.openembedded@hrw.one.pl>
	<2110BC65-EBCC-4FFB-B029-B5ED4B62DD08@inf.fu-berlin.de>
In-Reply-To: <2110BC65-EBCC-4FFB-B029-B5ED4B62DD08@inf.fu-berlin.de>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Report of QA issues with 'bitbake angstrom-image'
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
X-List-Received-Date: Wed, 25 Oct 2006 09:56:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Holger Freyther schreef:
> Am 25.10.2006 um 08:59 schrieb Marcin Juszkiewicz:
> 
>> We also need to change insane.bbclass to print PN/PV on each line  
>> as many
>> packages are renamed by debian.bbclass. Not duplicating info would be
>> also usefull.
> 
> Actually this sounds more like you want to have ${FILE} printed.  
> Actually all these scanners are stateless at the momemnt and for now  
> I would like to keep it, until the results are a bit better and we  
> have some more tests. Then I will improve reporting.

The errors are printed in the context of a build, so you know which recipe to fix. On a
related note, can we have a 'therapist.bbclass' that automagically moved debug dirs to the
debug package, removes bogus rpaths, etc? I know it's better to fix the metadata itself,
but it would be a nice stop-gap measure.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFPzS1MkyGM64RGpERAoFHAJ9J2qXS+p9mqgSJbKMuYFU4ri042QCgmIZ+
fyEwANB1sy1X3MO/c6o8Rno=
=dADZ
-----END PGP SIGNATURE-----


