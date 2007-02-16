Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HI7O8-00006q-AO
	for openembedded-devel@openembedded.org; Fri, 16 Feb 2007 19:01:18 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1GI0lLr020149; Fri, 16 Feb 2007 19:00:47 +0100
Message-ID: <45D5F14F.1050602@dominion.kabel.utwente.nl>
Date: Fri, 16 Feb 2007 19:00:47 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Cc: Harald Welte <laforge@openmoko.org>
Subject: RFC: making uboot safe for multimachine and agree on one spelling
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
X-List-Received-Date: Fri, 16 Feb 2007 18:02:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

After spending some time going trough u-boot recipes trying to make sense of its
buildsystem, I noticed some strange problems and inconsistencies.

First the easy part: we need *one* spelling for u-boot, instead of uboot, u-boot, u-bot,
etc. What is the preferred one nowadays?

Second: it seems that the 'mkimage' tool is at least arch speficic (at worst
board-specific), so uboot recipes should install it to
${STAGING_NATIVE_DIR}/mkimage.u-boot.${MACHINE_ARCH}

what do you think about all this?

regards,

Koen

CC: to Harald because I'm not sure he's on oe-devel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF1fFPMkyGM64RGpERAsM2AKCo48tTjyY1DPoTYDp/41E8sOOMTQCeO8T8
urHBB7VH79uq3fyR/9jBzk4=
=E7Ei
-----END PGP SIGNATURE-----


