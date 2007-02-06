Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HEO2b-00029d-Bf
	for openembedded-devel@openembedded.org; Tue, 06 Feb 2007 11:59:13 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l16Ax8Lr012541 for <openembedded-devel@openembedded.org>;
	Tue, 6 Feb 2007 11:59:08 +0100
Message-ID: <45C85F79.7040201@dominion.kabel.utwente.nl>
Date: Tue, 06 Feb 2007 11:59:05 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45BB64DC.1080601@dominion.kabel.utwente.nl>	<45C85593.3060603@dominion.kabel.utwente.nl>
	<74d0deb30702060248p7d13b997w6d997f1d9b804721@mail.gmail.com>
In-Reply-To: <74d0deb30702060248p7d13b997w6d997f1d9b804721@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: diet-x11, small-x11 and fat-x11
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
X-List-Received-Date: Tue, 06 Feb 2007 10:59:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

pHilipp Zabel schreef:
> On 2/6/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Koen Kooi schreef:
>>> Hi,
>>>
>>> I'd like to propose to split diet-x11 and libx11 into the following:
>>>
>>> diet-x11: as small as possible, without stuff like cms and xkb
>>> small-x11: small, but with cms and xkb, usefull for highend palmtops and small settop-boxes
>>> fat-x11: biggest version, usefull for big-bad-workstation images.
>>>
>>> what do you think about it?
>> Nobody is thinking something?
> 
> I was thinking I don't like the diet/small/fat naming, you are mixing metaphors.
> small/medium/big I'd understand,
> or diet/light/supersize or
> slender/chubby/fat...
> I thought I'd better keep that to myself :) Oh well...
> 
> One thing I'd like to see would be a different package name for all
> three of them, so we can actually have all versions in the feeds
> (currently both libx11 and diet-x11 build packages with the same
> name).

However annoying, it is a feature which we can exploit. If we take care that PR_small-x11
< PR_medium-x11 < PR_big-x11 we can split those into different feeds containing libx11 +
dependant apps.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFyF95MkyGM64RGpERAvJcAJ9TrmkHuPzCtL24vDhLqCYjKk4qgQCgg5+d
oxkgTyx+D10nfJ3KzZ5pPO8=
=U8Za
-----END PGP SIGNATURE-----


