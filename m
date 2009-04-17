Received: from [213.91.4.211] (helo=bart.wifirst.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jeremy.laine@bolloretelecom.eu>) id 1LuptE-0004ry-Nx
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Apr 2009 17:22:28 +0200
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id A19985FEDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 17:18:02 +0200 (CEST)
Received: from bart.wifirst.net (localhost [127.0.0.1])
	by bart.wifirst.net (Postfix) with ESMTP id 09C615FEEC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 17:18:01 +0200 (CEST)
Received: from blini.bolloretelecom.eu (smtp.bolloretelecom.eu
	[62.210.194.121])
	by bart.wifirst.net (Postfix) with ESMTP id E16EB5FEDC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 17:18:00 +0200 (CEST)
Received: from [192.168.95.73] (unknown [192.168.95.73])
	by blini.bolloretelecom.eu (Postfix) with ESMTPSA id 7D76F23E4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2009 17:18:00 +0200 (CEST)
Message-ID: <49E89DAB.7020409@bolloretelecom.eu>
Date: Fri, 17 Apr 2009 17:18:03 +0200
From: =?UTF-8?B?SmVyZW15IExhaW7DqQ==?= <jeremy.laine@bolloretelecom.eu>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.19) Gecko/20090103 Thunderbird/2.0.0.19 Mnenhy/0.7.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <49E7D1E7.9080604@bolloretelecom.eu> <gs9ag2$2ps$1@ger.gmane.org>
In-Reply-To: <gs9ag2$2ps$1@ger.gmane.org>
X-Enigmail-Version: 0.95.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 213.91.4.211
X-SA-Exim-Mail-From: jeremy.laine@bolloretelecom.eu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=AWL,BAYES_00,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: pick up correct shared libraries on darwin
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Apr 2009 15:22:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi wrote:
> On 17-04-09 02:48, Jeremy Lain=C3=A9 wrote:
>> The attached patch does the following:
>> * define SOLIBS and SOLIBSDEV for darwin9 (identical to darwin8)
>> * make use of SOLIBS and SOLIBSDEV to populate FILE_* instead of
>> hardcoded .so.* and .so
>
> This one looks good to me.
>
Any other comments? Unless anybody raises an objection I will be
applying my two patches shortly.

- --
Jeremy LAINE
Bollor=C3=A9 telecom | 11bis, rue Scribe | F-75009 Paris
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iEYEARECAAYFAknonaoACgkQCL1n3lVB9EbOIgCdEKGYeu4p7DpT9hA+G3ijgXAz
jAgAoJjbcffcK5eIGYhPdW6BlWXG58Zd
=3D9C2J
-----END PGP SIGNATURE-----


