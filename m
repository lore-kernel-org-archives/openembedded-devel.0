Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jbwa0-00021A-R9
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 12:35:42 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbwZw-0001nZ-C8
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 11:35:32 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 11:35:32 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 11:35:32 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 12:35:21 +0100
Message-ID: <frqtpp$gos$1@ger.gmane.org>
References: <3D9ECBB5-7C37-4D62-8D15-F2F0673EB867@student.utwente.nl>
	<47E0F805.4020706@kernelconcepts.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <47E0F805.4020706@kernelconcepts.de>
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
Subject: Re: [RFC] error out on .la files pointing to ${WORKDIR}
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
X-List-Received-Date: Wed, 19 Mar 2008 11:35:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Florian Boor schreef:
| Hi,
|
| Koen Kooi schrieb:
|> Things in stagin (e.g. .la files) point to ${WORKDIR} are broken and
|> should die. If we want packaged-staging and rm_work to function we
|> need to fix them. Since we are all lazy we need some incentive:
|
| I'm not really a fan of enforcing things by breaking builds.

They are already breaking my builds with rm_work enabled.

| I agree that we
| need to fix this soon, but since some of this bugs are harmless and do not
| affect the build at all

There are harmfull and are already breaking builds for everyone using
rm_work.

| I would not want to handle this that strict. If these
| wrong files really break packaged-staging we get errors that force us
to fix the
| critical ones anyway.

No, people went out and bought bigger disks so they could disable rm_work.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4Pp5MkyGM64RGpERAvmoAKCOoE+xLwW0Nzl41jiQq9dTRZp/cACeJwLD
MCGaT9yGV8f5DmJUW+KaxRU=
=FP1S
-----END PGP SIGNATURE-----



