Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IGe41-0003wb-IK
	for openembedded-devel@openembedded.org; Thu, 02 Aug 2007 19:02:17 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l72H0Bj1014789 for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2007 19:00:11 +0200
Message-ID: <46B20D9F.70704@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 19:00:15 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>	<46B1E063.7010407@dominion.kabel.utwente.nl>	<1186064138.5972.259.camel@hammer.suse.cz>	<46B1E812.8020706@dominion.kabel.utwente.nl>	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>	<46B1FC60.6030908@dominion.kabel.utwente.nl>
	<46B1FDD8.8000404@klever.net>
In-Reply-To: <46B1FDD8.8000404@klever.net>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: Gstreamer and rpath
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
X-List-Received-Date: Thu, 02 Aug 2007 17:02:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael Krelin schreef:
>> Michael Krelin schreef:
>>
>>> I'm not taking the symlink workaround seriously, because inventing one
>>> workaround to get rid of the other isn't going to get us anywhere.
>> Packaged-staging v1 is using that symlink approach and it doesn't help a lot. Hence the
>> need for v2 :)
> 
> Just about time ;-)
> 
> No matter how soon we can move to sysroot approach, I think making
> staging resemble filesystem is the right thing to do, anyway...

Indeed. I suspect most of our packages could handle that (autotools, qmake and distutils
based ones) easily. The big question is:

  How are we going to do it?

Are we going to declare another ".dev is broken" period, a branch, a branch with a small
amount of packages like org.oe.packaged-staging?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGsg2fMkyGM64RGpERAmKeAJwImUaWvpL8sXSgVOPoIeZ+NQ3wSQCfZjJX
Th2kgW3NxO8jQhjtryyD0z8=
=jaw3
-----END PGP SIGNATURE-----


