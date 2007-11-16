Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1IsyFX-0004lR-1q
	for openembedded-devel@openembedded.org; Fri, 16 Nov 2007 11:16:35 +0100
Received: from Powerbook-2.local (vpn006187.vpn.utwente.nl [130.89.6.187])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lAGAEmZn026489 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2007 11:14:48 +0100
Message-ID: <473D6D98.9050305@student.utwente.nl>
Date: Fri, 16 Nov 2007 11:14:48 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <472216E5.6060708@student.utwente.nl>	<20071115080222.2c3a597f@cimmeria>
	<20071116011627.GA7192@lenovo> <20071116083222.552a9c30@cimmeria>
In-Reply-To: <20071116083222.552a9c30@cimmeria>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] adding CONFLICTS
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
X-List-Received-Date: Fri, 16 Nov 2007 10:16:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Graeme Gregory schreef:
> On Thu, 15 Nov 2007 19:16:27 -0600
> David Farning <dfarning@gmail.com> wrote:
>> A good way to look at this issue is to study how Seth Vidal sovled the
>> issue in YUM, Fedora's updater.  It is written in python, so easy for
>> BitBake developers to understand.
>>
>> It seems that it would add a good deal of complexity to the current
>> design of bitbake.
>>
>> Although useful this might be an idea for bitbake 2.0
>>
> We already have fully working package Conflicts: working.
> 
> This is talking about staging conflicts. Or in otherwords
> a work around until package staging works fully including
> our already complete package conflicts handling.

It goes even a bit deeper as staging, since you want certain packages to
not get build at all. With packaged staging you can still build a feed
that is internally inconsistant, which is what the CONFLICTS is trying
to solve.

regards,

Koen


- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHPW2YMkyGM64RGpERAm7jAKCQ2M4fjfI/eHU9RPc95RJB04YhSgCfejgP
v4/5OHK/0s0Pu8iwij54GIM=
=fUV2
-----END PGP SIGNATURE-----


