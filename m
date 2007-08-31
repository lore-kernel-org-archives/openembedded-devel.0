Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IR5MK-00041V-HU
	for openembedded-devel@openembedded.org; Fri, 31 Aug 2007 14:12:20 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l7VCAE1R028531 for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2007 14:10:14 +0200
Message-ID: <46D8054F.3060806@dominion.kabel.utwente.nl>
Date: Fri, 31 Aug 2007 14:10:55 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.6 (Macintosh/20070728)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
In-Reply-To: <46D7FBA9.7060104@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.95.3
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [RFC][PATCH] Merging classes with poky
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
X-List-Received-Date: Fri, 31 Aug 2007 12:12:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> After spending some time playing with meld I have some patches to RFC.
> 
> The most important ones are teh package* and rootfs* that have fixes for multithreaded
> bitbake.

The image.bbclass one needs image recipes to be updated like this:

- --- packages/images/angstrom-minimal-image.bb   18997ce3f1ed2ef3216d3518a98aade1078e00de
+++ packages/images/angstrom-minimal-image.bb   8d052fccd8024c3af7a3fafc3cc4a345f868bcb3
@@ -7,7 +7,7 @@ IMAGE_LINGUAS = " "
 DISTRO_SSH_DAEMON ?= "dropbear"
 IMAGE_LINGUAS = " "

- -RDEPENDS = "task-boot \
+export IMAGE_INSTALL = "task-boot \
             util-linux-mount util-linux-umount \
             ${DISTRO_SSH_DAEMON} \
             angstrom-version \
@@ -15,7 +15,6 @@ export IMAGE_LINGUAS = ""

 export IMAGE_BASENAME = "minimalist-image"
 export IMAGE_LINGUAS = ""
- -export PACKAGE_INSTALL = "${RDEPENDS}"

 inherit image
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFG2AVPMkyGM64RGpERAskNAKCcDXl16o6tGrxAhxX2eZzGR90wgACgt010
35Mzm4MlsRE9SR7fpA2QNpU=
=8W0C
-----END PGP SIGNATURE-----


