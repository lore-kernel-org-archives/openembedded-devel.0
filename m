Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JbxJX-0007VE-Qb
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 13:22:55 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JbxJT-0003pW-Fh
	for openembedded-devel@openembedded.org; Wed, 19 Mar 2008 12:22:35 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 12:22:35 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 19 Mar 2008 12:22:35 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 19 Mar 2008 13:22:28 +0100
Message-ID: <frr0i4$poi$1@ger.gmane.org>
References: <200803182311.01445.zecke@selfish.org>
	<frpftj$p9s$1@ger.gmane.org>	<200803191143.05167.zecke@selfish.org>
	<frqri1$9l5$1@ger.gmane.org>
	<d1b08f940803190448r453770f6q611a1c14b7dd59c9@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <d1b08f940803190448r453770f6q611a1c14b7dd59c9@mail.gmail.com>
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
Subject: Re: The tzdata package and a bug with tzdata-dbg
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
X-List-Received-Date: Wed, 19 Mar 2008 12:22:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrea Adami schreef:
| Holger, Koen,
|
| talking about tzdata, the file /etc/localtime is missing.
|
| I'd suggest you to look at the gentoo-ebuild here for some tips
(pkg_config):
|
| http://www.gentoo-portage.com/AJAX/Ebuild/62372/View

It's intentional, since ipkg (which was/is the de-facto standard in OE)
lacks a way to do interactive configure that works well with installer
GUI. So we decided: leave it to the user.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH4QWEMkyGM64RGpERAivyAKCt+CZjFO9SoMDWVJ3ZHz2y5gKHIQCfQkaC
0nlMdWLPZhFeIWGVfCY0px8=
=QJOG
-----END PGP SIGNATURE-----



