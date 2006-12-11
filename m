Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GtgRc-0007CX-9r
	for openembedded-devel@openembedded.org; Mon, 11 Dec 2006 09:23:28 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	kBB8Lnox015104 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2006 09:21:49 +0100
Message-ID: <457D151B.3050405@dominion.kabel.utwente.nl>
Date: Mon, 11 Dec 2006 09:21:47 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.8 (Macintosh/20061025)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <c384c5ea0612081523k416385a5mf40fc87f9f8a24bc@mail.gmail.com>
	<1165789441.5604.39.camel@localhost.localdomain>
In-Reply-To: <1165789441.5604.39.camel@localhost.localdomain>
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
X-List-Received-Date: Mon, 11 Dec 2006 08:23:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
> On Sat, 2006-12-09 at 00:23 +0100, Leon Woestenberg wrote:
>> In my case, an IXP4xx target, with big-endian ARCH_BYTE_SEX I have this:
>>
>> from conf/machine/ixp4xx.conf sets:
>>
>> TARGET_ARCH = armeb
>> TARGET_PACKAGE_ARCH = armv5teb
>>
>> conf/machine/ixp4xx.conf then sets (overrides):
>> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te ixp4xx${ARCH_BYTE_SEX}"

This is bogus since the first 4 entries are LE while the last one can be BE.

>> conf/bitbake.conf then sets PACKAGE_ARCHS to this:
>>
>> PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS}
>> ${MACHINE}"
> [...]
>> end I end up with a full set of 'armv5teb' packages, which fail to
>> install to my image.
>>
>> I can work around this by twiddling with the variable definitions and
>> settings, but I rather want to discuss what is the proper fix here?
>>
>> Should PACKAGE_EXTRA_ARCH be appended by TARGET_PACKAGE_ARCH?
> 
> conf/machine/include/ixp4xx.conf is the only file in my openembedded
> directory which references this "TARGET_PACKAGE_ARCH" variable so its an
> ixp4xx issue. The name sounds very confused so I'd suggest just getting
> rid of it and set PACKAGE_EXTRA_ARCHS to contain everything you need. An
> example might be:
> 
> PACKAGE_EXTRA_ARCHS = "armv4 armv4t armv5e armv5te{ARCH_BYTE_SEX} ixp4xx{ARCH_BYTE_SEX}"

armv5tele and armv5tebe don't exist in OE.

> which probably isn't right but you get the idea. 
> 
> Someone familiar with what the ixp builds should be doing should really
> look at this. I've cc'd rwhitby who should know the right person to deal
> with this.
> 
> This machine might not want PACKAGE_ARCHS containing ${MACHINE} so it
> might want to override that...

I think conf/machine/ixp4xx.conf shouldn't be used, but conf/machine/ixp4xxbe.conf or
ixp4xxle.conf should be used instead. Each of those machines should set PACKAGE_EXTRA_ARCH
independantly.

regards,

Koen


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFfRUbMkyGM64RGpERAqWmAKCEJbe2xFAPOwtMI0JBsqUu0uZdBgCgi5Nd
Jyb4OTX2iF5H59YyJpFJKKg=
=po3W
-----END PGP SIGNATURE-----


