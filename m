Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HnX5A-0007g5-7B
	for openembedded-devel@openembedded.org; Mon, 14 May 2007 11:43:08 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l4E9h1ox029909 for <openembedded-devel@openembedded.org>;
	Mon, 14 May 2007 11:43:01 +0200
Message-ID: <46482F23.9050504@dominion.kabel.utwente.nl>
Date: Mon, 14 May 2007 11:42:59 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <E1HnWn2-0007PS-SW@linuxtogo.org>
In-Reply-To: <E1HnWn2-0007PS-SW@linuxtogo.org>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev ixp4xx-kernel: Dropped support for 2.6.21, we're sticking to 2.6.20 stable and 2.6.22 development
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
X-List-Received-Date: Mon, 14 May 2007 09:43:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rwhitby commit schreef:
> ixp4xx-kernel: Dropped support for 2.6.21, we're sticking to 2.6.20 stable and 2.6.22 development

> # delete "packages/linux/ixp4xx-kernel_2.6.21.bb"

You broke feeds and upgrade paths for users of that recipe, could you next time just add
DEFAULT_PREFERENCE = "-1" or something? Slugos isn't the only user of OE!
 I just got .21 running on my ixp4xx board, and now I have to remove all kernel packages,
packages built against .21 and find a way for angstrom to deal with that in the feeds for
people doing 'ipkg upgrade'.

I will deal with it, but next time a bit of warning on the OE list would be appreciated.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGSC8jMkyGM64RGpERAl+UAJ42rD9nGX4EcbKJRzD0yXAgAjwWDwCfaFjg
NoUOnnEP5xC3YJodBtkjQCI=
=a0fc
-----END PGP SIGNATURE-----


