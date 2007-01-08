Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H42pP-00039s-Do
	for openembedded-devel@openembedded.org; Mon, 08 Jan 2007 23:18:51 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l08MH8Lr008793 for <openembedded-devel@openembedded.org>;
	Mon, 8 Jan 2007 23:17:08 +0100
Message-ID: <45A2C2E0.6020309@dominion.kabel.utwente.nl>
Date: Mon, 08 Jan 2007 23:17:04 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <200701082227.08898.openembedded@hrw.one.pl>	<45A2BBB0.4070607@dominion.kabel.utwente.nl>
	<1809961602.20070109000215@gmail.com>
In-Reply-To: <1809961602.20070109000215@gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: RFC: get rid of virtual/libsdl
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
X-List-Received-Date: Mon, 08 Jan 2007 22:18:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Sokolovsky schreef:
> Hello Koen,
> 
> 
>> Marcin Juszkiewicz schreef:
>>> I see more and more reports where people has problems with building SDL 
>>> stuff just because they have 'virtual/libsdl == libsdl-qpe' in build 
> 
> []
> 
>> move libsql-qpe to packages/obsolete/libsdl/, that way people that want it can still build
>> it and innocent bystanders don't get hit by the issues you mentioned.
> 
>   Isn't that too much of action for the original problem of people
> selecting it to build SDL apps and having problems due to this?

People have to select libsdl-x11, otherwise -qpe gets built. Given its current
unmaintained and problematic state it'd rather drop it completely. But since we are
supposed to by nice to OE users, lets move it to obsolete instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFosLgMkyGM64RGpERAsypAJ9W9eA5EgJn9j8fTtzhp8OgtzepLACbBAnW
LwE6pAvEGW0XxhF+Iiz/z6U=
=tJdl
-----END PGP SIGNATURE-----


