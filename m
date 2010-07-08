Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OXG3K-0005qj-Dd for openembedded-devel@lists.openembedded.org;
	Fri, 09 Jul 2010 18:04:08 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OWudd-0002jd-Bq for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 19:11:53 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 19:11:53 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 08 Jul 2010 19:11:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 08 Jul 2010 19:11:44 +0200
Message-ID: <i150sg$mjh$1@dough.gmane.org>
References: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819743@deimsg40.de.net.world>	<4C2A07C5.9060909@freyther.de><0B51A1E7C61D114DAE6FC10B0FD0ABA50181975A@deimsg40.de.net.world>	<4C2C8F31.2050107@freyther.de>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501819D67@deimsg40.de.net.world>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100611 Shredder/3.0.6pre
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501819D67@deimsg40.de.net.world>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Creating a Own Tool chain, some referenced packages are not included into the SDK archive
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
X-List-Received-Date: Fri, 09 Jul 2010 16:04:10 -0000
X-List-Received-Date: Fri, 09 Jul 2010 16:04:10 -0000
X-List-Received-Date: Fri, 09 Jul 2010 16:04:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-07-10 17:22, Hauser, Wolfgang (external) wrote:
> Hello, I have found the problems of creating the toolchain meta-toolchain-qte.bb (and my derived one) !
> 
> First problem:
> 
> There is a conflict in packages "cups" and "libpam-base-files" (same file "cups" in "/etc/pam.d" was deployed by the packages) this results in a bailing out while installing the packages.
> 
> My workaround was: local modified libpam-base-files w/o file "cups" in "libpam-base-files/pam.d"
> (does libpam-base-files really have to install this file and some other package dependent ones ?)

Fixed:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=81467a049f275dde815b000e25b704e9140c2440

> Second problem:
> meta-toolchain-qte.bb contains following line in do_populate_sdk_append():
> 
>   >script = "${SDK_OUTPUT}/${SDKPATH}/environment-setup"<
> 
> this have to be changed to:
> 
>   >script="${SDK_OUTPUT}/${SDKPATH}/environment-setup"<
> 
> because the code is used as shell commands and not as python code !
> 
> The issue above results in a call of "script" with arguments "=" and "${SDK_OUTPUT}/${SDKPATH}/environment-setup".
> "script" opens a "bash -i" and wait for commands. Therefore the processing blocks until this shell exits.

Fixed:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=479ea460e4fbacd00f26a8903427e674a3b7501f

> 
> Is there somebody out there having commit access who will fix that second problem in org.openembedded.dev ?

Sure :) Thanks for finding out these bugs!

> 
> regards
> Wolfgang Hauser
> 
> -----Ursprüngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag von Holger Freyther
> Gesendet: Donnerstag, 1. Juli 2010 14:51
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] Creating a Own Tool chain, some referenced packages are not included into the SDK archive
> 
> On 06/29/2010 11:20 PM, Hauser, Wolfgang (external) wrote:
>> Hello Holger Freyther,
>>
>> here are the diffs for my changes:
>>
>> diff of meta-toolchain-qte.bb <> meta-toolchain-xxx.bb
> 
> sorry, this diff is not readable, please use a unified diff for the changes.
> 
>>
>> The qte toolchain has created properly, my own do not.
> 
> So you say bitbake meta-toolchain-qte is working?
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMNgbQMkyGM64RGpERAuenAJ4r9q5woSg6tZXCB9lPRAHgkGHpogCfZygX
9Ei0MyIj9zB/pNp+F9ik978=
=LLyA
-----END PGP SIGNATURE-----



