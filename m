Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IFqtp-0003vM-PH
	for openembedded-devel@openembedded.org; Tue, 31 Jul 2007 14:32:30 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6VCUa1R012742; Tue, 31 Jul 2007 14:30:37 +0200
Message-ID: <46AF2B6C.3040600@dominion.kabel.utwente.nl>
Date: Tue, 31 Jul 2007 14:30:36 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1185839805.7719.103.camel@localhost.localdomain>	<46AF0E33.4000107@dominion.kabel.utwente.nl>
	<1185882248.6173.20.camel@localhost.localdomain>
In-Reply-To: <1185882248.6173.20.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: bitbake-dev <bitbake-dev@lists.berlios.de>
Subject: Re: The future of "svnnow"
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
X-List-Received-Date: Tue, 31 Jul 2007 12:32:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2007-07-31 at 12:25 +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Richard Purdie schreef:
>>> Hi,
>>>
>>> As people know the ability to build the latest head revisions of svn
>>> (for example) repositories in OE with bitbake has been limited and less
>>> than ideal.
>> What happens if I have no internet connection during parsing and do have a huge
>> sourcemirror inside my firewall?
> 
> Two possible solutions:
> 
> 1. You have locked down SRCREVs

bitbake -s | grep svnr  | awk '{print "SRCREV_pn-" $1 "=" $2}' | \
sed -e s:\+:\=:g -e s:svnr::g| awk -F "=" '{print $1 "=\"" $3}' | \
awk -F "-r" '{print $1"\""}'

will spit out a list you can use as a .inc file for your favourite distro.


> 2. You have a valid head revisions cache from the last time you had
> network access and you set the bitbake cache policy not to wipe that
> cache.

Is there a nice way to distribute such a cache, for e.g. evil firewalls?

> I can't see any other ways around that and its probably better than the
> current situation.

It is indeed better, we just need to recreate all the tweaks we have for the current
situation :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGrytsMkyGM64RGpERAoZ7AKCC+2Pue42dUXd6bQ+uhP2oHu6iRQCgjRgo
oJFzPUBbj9v4y/3y5YJ2cC0=
=064g
-----END PGP SIGNATURE-----


