Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <k.kooi@student.utwente.nl>) id 1ISyth-0005Dt-S5
	for openembedded-devel@openembedded.org; Wed, 05 Sep 2007 19:42:37 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l85He3gq018215 for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Sep 2007 19:40:03 +0200
Message-ID: <46DEE9E3.4080206@student.utwente.nl>
Date: Wed, 05 Sep 2007 19:39:47 +0200
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20070904202957.GD1429@dodger.lab.datenfreihafen.org>
	<1189011486.7849.35.camel@localhost.localdomain>
In-Reply-To: <1189011486.7849.35.camel@localhost.localdomain>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC] How to handle external kernel patches in oe	the	right way?
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
X-List-Received-Date: Wed, 05 Sep 2007 17:42:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Tue, 2007-09-04 at 22:29 +0200, Stefan Schmidt wrote:
>> Due to my work on OpenEZX (http://www.openezx.org) I'm in touch with
>> external kernel patches used in OE to build working kernels for
>> different Motorola mobile phones.
>>
>> Talking with Koen about the best way to handle this we have some
>> slightly different opinions on this. So we like to get some more
>> opinions on this before pinning to a strategy.
>>
>> Koen like to pull the patches from a known-good rev into oe to have
>> them all at one place for less fragile building and tweaking.
>>
>> I prefer OE to use our svn server with a fixed SRCREV which gets
>> updated once a newer version is known good. I'm not a fan of
>> duplicating the patches in OE if some small tweaking patches can also
>> handle it.
> 
> Personally I agree with this in principle, I've never liked maintaining
> kernel patches in OE directly either.

I'm having issues with crap like do_prepatch. Patches are only applied by patch.bbclass,
not some hand written voodoo <period>.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG3unjMkyGM64RGpERAnXQAJwLwfJkgpwmGwxt8gn3BkiGvCIRKQCfWfEn
uxozGirs/hyk2v6Npas/Kis=
=KLS+
-----END PGP SIGNATURE-----


