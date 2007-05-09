Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hljdp-0004cL-Rd
	for openembedded-devel@openembedded.org; Wed, 09 May 2007 12:43:30 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l49AglLr009711 for <openembedded-devel@openembedded.org>;
	Wed, 9 May 2007 12:42:47 +0200
Message-ID: <4641A5A2.8050108@dominion.kabel.utwente.nl>
Date: Wed, 09 May 2007 12:42:42 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <464130FC.7030008@gmail.com> <02827798.20070509123821@gmail.com>
	<4641A311.4030907@klever.net>
In-Reply-To: <4641A311.4030907@klever.net>
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
X-List-Received-Date: Wed, 09 May 2007 10:43:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael Krelin schreef:
>>> UNSHIPPED = "${libdir}/libpython2.4.so ${bindir}/smtpd.py"  #reason why
>>> not package/ship it
>>         Who exactly will go over all recipes and add such lines?
> 
> I take it the proposal was that package maintainers should take care of
> it. Indeed, it would be better if intentionally unpackaged files invoked
> no QA notice. But I think the solution is either not install them or rm
> them after installation, depending on installation procedure nature.

Or we could patch package.bbclass[1] to do:

PACKAGES += "${PN}-leftovers"
FILES_${PN}-leftovers = "/"

I'm not sure if that works, but if it does, we would be able to spot leftovers more easily
by looking at deploy.

regards,

Koen

[1] this wouldn't work in bitbake.conf
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGQaWiMkyGM64RGpERAuTXAKCD+n1gXwbL7dyqru7UySv82J/CXQCgmTUM
7dYtDM79sAYQSnyDtwKmcfM=
=hEE+
-----END PGP SIGNATURE-----


