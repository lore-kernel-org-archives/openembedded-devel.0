Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1HIU8z-0004XA-FS
	for openembedded-devel@openembedded.org; Sat, 17 Feb 2007 19:18:45 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l1HIIgLr032647 for <openembedded-devel@openembedded.org>;
	Sat, 17 Feb 2007 19:18:42 +0100
Message-ID: <45D74702.1060905@dominion.kabel.utwente.nl>
Date: Sat, 17 Feb 2007 19:18:42 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <20070217181208.GA4616@thegnar.org>
In-Reply-To: <20070217181208.GA4616@thegnar.org>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: getting started with bug reports in OE
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
X-List-Received-Date: Sat, 17 Feb 2007 18:18:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mark Gross schreef:
> I'm moving from nslug to oe .dev branch and I'm trying to ramp up on all
> the bitbake and configuration details.  While bringing up a build of
> slugos-image I had to debug an issue with udev-100.
> 
> udev-100 would fail on the comple because of a link time issue relating
> to extras/volume_id.  I hacked a quick fix into packages/udev/udev_100.bb, where I changed
> 
> UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/volume_id/ extras/run_directory/"
> to
> UDEV_EXTRAS = "extras/firmware/ extras/scsi_id/ extras/run_directory/"
> 
> This is good for my build, but my questions are now
> 1) is this the right way to fix this?
> and if so then 
> 2) how do I share this fix back to the OE community?

On 2: we encourage people to attach patches to bugzilla (http://bugs.openembedded.org)
because mailed patches tend to get lost or forgotten after a while.

regards,

KOen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFF10cCMkyGM64RGpERAkjQAJ4qJuXKTC2uAGs//vPt2mZwICd/qwCfT0tQ
HSwQEXygFDvv5kOi99+ZuKE=
=wFmH
-----END PGP SIGNATURE-----


