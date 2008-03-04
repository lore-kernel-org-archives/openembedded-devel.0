Received: from [130.89.2.13] (helo=mx.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <k.kooi@student.utwente.nl>) id 1JWTAi-0002c5-4R
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 10:11:24 +0100
Received: from Powerbook-2.local (vpn006038.vpn.utwente.nl [130.89.6.38])
	by mx.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id m2496WQp022026
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Mar 2008 10:06:36 +0100
Message-ID: <47CD1118.4090103@student.utwente.nl>
Date: Tue, 04 Mar 2008 10:06:32 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <fpmn1u$53v$1@ger.gmane.org>	<fqhsvd$mdm$1@ger.gmane.org>	<fqi1q5$77t$1@ger.gmane.org>	<fqi970$rdg$1@ger.gmane.org>
	<fqiah1$uja$1@ger.gmane.org>
In-Reply-To: <fqiah1$uja$1@ger.gmane.org>
X-Enigmail-Version: 0.95.6
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	servicedesk@icts.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-SA-Exim-Connect-IP: 130.89.2.13
X-SA-Exim-Mail-From: k.kooi@student.utwente.nl
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: autobuilds and bug tracker
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
X-List-Received-Date: Tue, 04 Mar 2008 09:11:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Rolf Leggewie schreef:
| Rolf Leggewie wrote:
|> Furthermore, I don't see why the changes in question would need any
|> changes to bugzilla itself.
|
| From what I can gather, only seppuku.bbclass would have to be altered.
| http://oz.leggewie.org/wip/seppuku.diff.txt may or may not achieve the
| result I proposed.
|
| So let me ask again why you need an escalation of privileges before you
| can proceed.

Well, that's a failry long list, but let me start with:

* managing default values for bugs (e.g. build/distro, distro, priority,
etc)
* adding extra fields for the autobuilder to fill in
* Fixing charset conversion due to our utf8 migration not being complete

and finally, the most important one: tweaking xmlrpc params so we can
stop screenscraping of bugzilla.

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHzREYMkyGM64RGpERAgZbAJ9aN4g6jn5ZSbLA1atAF3Tzi1GzVACcDGcq
1T6uhSLReq5RyXNIsFz2Pnc=
=brLy
-----END PGP SIGNATURE-----


