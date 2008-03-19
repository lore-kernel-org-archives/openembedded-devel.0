Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbvkX-0004i9-EN
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 11:42:27 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbvkR-0007Ya-VI
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 10:42:19 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 10:42:19 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 10:42:19 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 11:42:11 +0100
Message-ID: <frqqm3$6ae$1@ger.gmane.org>
References: <1205788179.4552.69.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1205788179.4552.69.camel@dax.rpnet.com>
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
Subject: Re: Packaged staging update
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
X-List-Received-Date: Wed, 19 Mar 2008 10:42:27 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:

| I've been testing with some builds and Angstrom in the following way:
|
| bitbake meta-toolchain
| bitbake gpe-image
| mv tmp tmp-orig
| mkdir -p tmp/deploy/glibc/pstage
| cp -pr tmp-orig/deploy/glibc/pstage/* tmp/deploy/glibc/pstage/
| bitbake meta-toolchain
| bitbake gpe-image
| diff -qr tmp-orig/staging/ tmp/staging/
| diff -qr tmp-orig/cross/ tmp/cross/
|
| The idea is if packaged-staging is working properly this will succeed
| and there should be few differences between the staging areas.

This currently doesn't work for a number of packages, since their .la
files point into ${WORKDIR}, biggest offenders are the EFL packages. I,
again, want to propose insane.bbclass to error out on such cases.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4O4DMkyGM64RGpERAp+ZAKCC8+EnWyu4O/ueq/CaFdXPE9VMOACaA588
Jb7Cdysf4S5Y2zobyrLluIQ=
=iqy0
-----END PGP SIGNATURE-----



