Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Hh81k-00006X-C8
	for openembedded-devel@openembedded.org; Thu, 26 Apr 2007 19:45:08 +0200
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l3QHaFLr014575 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Apr 2007 19:36:15 +0200
Message-ID: <4630E310.5000008@dominion.kabel.utwente.nl>
Date: Thu, 26 Apr 2007 19:36:16 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.10 (Macintosh/20070221)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0704261001x7756fd58yc637a6b1aec12440@mail.gmail.com>
	<432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
In-Reply-To: <432beae0704261022u16ba644dqb4781ac046a0a215@mail.gmail.com>
X-Enigmail-Version: 0.94.2.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: HEADS UP: insane.bbclass will now detect and stop the	build on wrong RPATHs.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Apr 2007 17:45:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Justin Patrin schreef:
> On 4/26/07, Leon Woestenberg <leon.woestenberg@gmail.com> wrote:
>> Hello all,
>>
>> for those of you using insane.bbclass, it will now correctly detect
>> wrong RPATH's in shared libraries and fail on them.
>>
>> Unfortunately, as we have not fixed wrong RPATH's yet in our shared
>> library handling, this will cause builds using insane.bbclass to fail.
>>
>> See bug #2140.
>>
>> I hope to be able to fix the .so RPATH stuff as well, but any help is welcomed.
>>
> 
> So what you're saying is that angstrom won't build until the RPATH
> problems are fixed? Kind of sucks for those users who don't know how
> to fix the problem. I'd suggest that this be made a warning instead of
> a failure (or have a conf entry that makes it one or the other).

It is a huge gaping security hole, so it is indeed an error.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGMOMQMkyGM64RGpERAqoYAKCHCwKJaUuL+1REjY/CRBYMxa7afACfTbs3
4ErvVInAL06DjxXwHDTtLb0=
=sa1b
-----END PGP SIGNATURE-----


