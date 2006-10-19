Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GaRyn-0004Sm-BK
	for openembedded-devel@openembedded.org; Thu, 19 Oct 2006 09:06:13 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9J6x7Fh008427 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2006 08:59:07 +0200
Message-ID: <45372259.7070807@dominion.kabel.utwente.nl>
Date: Thu, 19 Oct 2006 08:59:37 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1160999847.1649.32.camel@gandalf.tm.informatik.uni-frankfurt.de>
	<1161209075.5556.253.camel@localhost.localdomain>
In-Reply-To: <1161209075.5556.253.camel@localhost.localdomain>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [Bitbake-dev] bitbake version comparison broken?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Oct 2006 07:06:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Mon, 2006-10-16 at 13:57 +0200, Michael 'Mickey' Lauer wrote:
>> Using bitbake trunk I just saw the following:
>>
>> NOTE: gtk+ (2.10.3-r0) already staged but upgrading to 2.8.9-r4 to
>> satisfy gtk+
>>
>> Can we fix that?
> 
> For the archives we discussed this on irc and the problem is
> gtk_2.10.3.bb sets DEFAULT_PREFERENCE = "-1". This means 2.8.9 is the
> preferred version when no preference is set and it would overwrite the
> previously built version.
> 
> Its a classic example of a message in bitbake that needs at the very
> least rewording.

s/upgrading to/replacing with/ ?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFNyJZMkyGM64RGpERAiX5AJ907PKY2TF8x6frraR6T2BKAHvcxwCfeOyJ
VOEFNr0NOE7VQ5YXl/D/tIE=
=vaxs
-----END PGP SIGNATURE-----


