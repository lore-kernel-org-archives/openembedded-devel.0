Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <k.kooi@student.utwente.nl>) id 1J6SOG-00017I-OC
	for openembedded-devel@openembedded.org; Sun, 23 Dec 2007 16:05:23 +0100
Received: from Powerbook-2.local (vpn006193.vpn.utwente.nl [130.89.6.193])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	lBNExp0k013127; Sun, 23 Dec 2007 15:59:51 +0100
Message-ID: <476E77E7.2080705@student.utwente.nl>
Date: Sun, 23 Dec 2007 15:59:51 +0100
From: Koen Kooi <k.kooi@student.utwente.nl>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>, Rod Whitby <rod@whitby.id.au>
References: <E1J6Pwj-0006Mu-Pq@linuxtogo.org>
In-Reply-To: <E1J6Pwj-0006Mu-Pq@linuxtogo.org>
X-Enigmail-Version: 0.95.5
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: k.kooi@student.utwente.nl
X-Spam-Status: No
Subject: Re: [oe-commits] org.oe.dev nas-server: New task, meta-package, and image for creating a network attached storage server.
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
X-List-Received-Date: Sun, 23 Dec 2007 15:05:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rwhitby commit schreef:
> nas-server: New task, meta-package, and image for creating a network attached storage server.

> +IMAGE_INSTALL = "task-boot task-base-apex \
> +            ${DISTRO_SSH_DAEMON} \
> +            ${DISTRO_PACKAGE_MANAGER} \
> +            task-base-usbhost task-base-ext2 \
> +            ${IMAGE_INSTALL_TASKS} \

This suffers from bug #3499 like base-image did before Marcin fixed it.
Could you have a look at
http://monotone.openembedded.org/revision/info/4a084d17d8150e500fccc6f78c116ab863359656
and alter bas-server-image and your image templates accordingly?

regards,

Koen

- --
koen@dominion.kabel.utwente.nl will go go away in december 2007, please
use k.kooi@student.utwente.nl instead.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHbneGMkyGM64RGpERArfAAJ9TVPDAC67wQzRl2xObXHAyjBE4cgCfcUVV
ayAVEuJ53XIPLX41mbLTL/k=
=o469
-----END PGP SIGNATURE-----


