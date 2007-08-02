Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IGaPU-0003Ln-MB
	for openembedded-devel@openembedded.org; Thu, 02 Aug 2007 15:08:12 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l72D65j1006871 for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Aug 2007 15:06:06 +0200
Message-ID: <46B1D6C2.4020101@dominion.kabel.utwente.nl>
Date: Thu, 02 Aug 2007 15:06:10 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D498.5080703@klever.net>
In-Reply-To: <46B1D498.5080703@klever.net>
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
X-List-Received-Date: Thu, 02 Aug 2007 13:08:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael Krelin schreef:
>> Michael Krelin wrote:
>>>> Michael Krelin wrote:
>>>>> I don't know much about gstreamer, but being inventor of
>>>>> OE_LT_RPATH_ALLOW I felt obliged to look into gst-plugins.inc and I'm
>>>>> guessing it should be:
>>>> Maybe it would be better to not break build environment and then work
>>>> around consequent errors by hacks like OE_LT_RPATH_ALLOW,
>>>> never-ever-do-rpath.patch etc.
>>>>
>>>> gcc has --sysroot which can do required linking without any hacks.
>>>>
>>> Generally, I tend to agree, but in practice I'm afraid that would amount
>>> to rewriting the whole OE...
>> No.
>>
>> 1. and 2. and 4. should be change of about 20 lines (change xxxx_CC from
>> e. g. "arm-angstrom-linux-gnueabi-gcc" to e. g.
>> "arm-angstrom-linux-gnueabi-gcc --sysroot=/OE/build/tmp/staging/arm-angstrom-linux-gnueabi").
>> I only could not find correct lines.
> 
> staging doesn't resemble root filesystem, to begin with. So that would
> involve rearranging staging as well. Which is again a good idea, but
> would take longer that it sounds in pure theory.

May I direct everybodies attention to
http://lists.linuxtogo.org/pipermail/openembedded-devel/2007-July/002636.html ?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGsdbCMkyGM64RGpERAqEKAKCtBJWjsmvC1SVtbT1uXAkzyDydxQCgsKoL
zkZowRtburFE4qiXELz5h+Q=
=Ij7y
-----END PGP SIGNATURE-----


