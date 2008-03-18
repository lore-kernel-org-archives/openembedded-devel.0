Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbZHT-0005ZP-Of
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 11:42:57 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbZHQ-0007Nw-0Y
	for openembedded-devel@openembedded.org; Tue, 18 Mar 2008 10:42:52 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 10:42:52 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 18 Mar 2008 10:42:52 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 18 Mar 2008 11:42:43 +0100
Message-ID: <fro6b3$4qo$1@ger.gmane.org>
References: <BDAD3E9D-ACB9-433B-81C7-F727545ACCFE@student.utwente.nl>	<200803181056.43273.openembedded@haerwu.biz>
	<fro4dk$tut$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <fro4dk$tut$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] move to opkg
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
X-List-Received-Date: Tue, 18 Mar 2008 10:42:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
| Marcin Juszkiewicz schreef:
|
| | Few things:
| |
| | 1. There is no such thing as 'opkg-utils' - we still use
| ipkg-utils-native
| |    for creating packages.
|
| fixed
|
| | 2. You missed image.bbclass change:
| |
| | --- a/trunk/meta/classes/image.bbclass
| | +++ b/trunk/meta/classes/image.bbclass
| | @@ -85,8 +85,6 @@ fakeroot do_rootfs () {
| |
| |      insert_feed_uris
| |
| | -    rm -f ${IMAGE_ROOTFS}${libdir}/ipkg/lists/*
| | -
| |      ${IMAGE_PREPROCESS_COMMAND}
| |
| |      export TOPDIR=${TOPDIR}
| |
| | 3. Meta/meta-toolchain.bb recipe also use ipkg and this also was changed
| |    in Poky.
| |
| | 4. You did not set SRCREV for opkg-sdk recipe.
|
| attached is a version with a less restricted diff.

And as a bonus:

http://rafb.net/p/mDhfsf98.txt
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH35yjMkyGM64RGpERAuT4AJ9bij15JKWg41sV8D2OE2IBqYKu7ACfd5UT
l9gU6J46yLMrMQ39d0b7n+Q=
=8xzM
-----END PGP SIGNATURE-----



