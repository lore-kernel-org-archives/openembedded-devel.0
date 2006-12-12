Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1Gu6GP-0006gd-Pb
	for openembedded-devel@openembedded.org; Tue, 12 Dec 2006 12:57:37 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBCBu2Lr010443 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 12:56:02 +0100
Message-ID: <457E98D0.3040705@dominion.kabel.utwente.nl>
Date: Tue, 12 Dec 2006 12:56:00 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>	<1165789441.5604.39.camel@localhost.localdomain>	<457D151B.3050405@dominion.kabel.utwente.nl>	<457DE327.2050209@whitby.id.au>
	<c384c5ea0612120351w6582b13eqe857b39e4c995957@mail.gmail.com>
In-Reply-To: <c384c5ea0612120351w6582b13eqe857b39e4c995957@mail.gmail.com>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: {PACKAGE,TARGET_{,PACKAGE_,EXTRA_}}ARCH blues
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
X-List-Received-Date: Tue, 12 Dec 2006 11:57:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
> Hello,
> 
> On 12/12/06, Rod Whitby <rod@whitby.id.au> wrote:
>>>>> Someone familiar with what the ixp builds should be doing should really
>>>>> look at this. I've cc'd rwhitby who should know the right person to deal
>>>>> with this.
>>>>>
>>>>> This machine might not want PACKAGE_ARCHS containing ${MACHINE} so it
>>>>> might want to override that...
>>> I think conf/machine/ixp4xx.conf shouldn't be used, but conf/machine/ixp4xxbe.conf or
>>> ixp4xxle.conf should be used instead. Each of those machines should set PACKAGE_EXTRA_ARCH
>>> independantly.
>> Agreed.
>>
> Then I understand that ixp4xxbe.conf must add armv5teb to this list:
> 
> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"

Nope, ixp4xxbe needs this:

PACKAGE_EXTRA_ARCHS = "armv4eb armv4teb armv5eb armv5teb ixp4xxeb"

> 
> and that ixp4xxle.conf must add armv5tel to this list:
> 
> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"

PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xxle"

I think this should cover all cases.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFfpjQMkyGM64RGpERAlXUAJ9vnJw3Ky/LR5hHpL4EmKfP8HoVJACfR0vj
GXYFu+Jn+tl1xd8PtBrwgHg=
=sAbC
-----END PGP SIGNATURE-----


